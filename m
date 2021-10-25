Return-Path: <SRS0=F6DF=PN=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9D42C433EF
	for <buildroot@archiver.kernel.org>; Mon, 25 Oct 2021 02:32:03 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 00EFD61029
	for <buildroot@archiver.kernel.org>; Mon, 25 Oct 2021 02:32:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 00EFD61029
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=buildroot.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9B3F640144;
	Mon, 25 Oct 2021 02:32:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id afGCK2G3WrOM; Mon, 25 Oct 2021 02:32:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id BAF724010A;
	Mon, 25 Oct 2021 02:32:00 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2B09B1BF378
 for <buildroot@lists.busybox.net>; Mon, 25 Oct 2021 02:31:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 12F4D4010A
 for <buildroot@lists.busybox.net>; Mon, 25 Oct 2021 02:31:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SDp2R8Tqh0PT for <buildroot@lists.busybox.net>;
 Mon, 25 Oct 2021 02:31:58 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from sonic301-30.consmr.mail.ne1.yahoo.com
 (sonic301-30.consmr.mail.ne1.yahoo.com [66.163.184.199])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DBC38400F1
 for <buildroot@buildroot.org>; Mon, 25 Oct 2021 02:31:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aol.com; s=a2048;
 t=1635129116; bh=nFFAJ7g37Ww5UDo02ASzPy4foxGN/oq0CxvokWZzztk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From:Subject:Reply-To;
 b=dDQjihFuRE6LRoiV4fYHM3/gpIuGu0MXF8eTZlWIVR42lmTpsOjErZ4fqmoB5WkV7mJpgVVP293qTSpxf10fURUSTY4sGLUVRnMxlwBMJEoNF+BVOvcEoYXV5z9uFnwIGXp7CMJZXdkh+ZlcLCdJZLix8H1tMLO2rg2pbsUYLRcutF7KvlW93kMo1JkrMPsyotUjQG6IGaJjzJ1TYrdGECY0/9Jit3ppbeMEIFCK2XnRf7aRmf2dkUX4ilBLwdxhTVhN+KLCPx52r5LHXhWP+WkyGdVE1gT3f8gwcN5U+71/l6WhZHQ42gQKzPLs3kzMib/u19d0bSn/aGG+rjupNQ==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1635129116; bh=mMvgp0engl0dANmHv8vHKDixP7GBUgw/HYXP9X/KIZ9=;
 h=X-Sonic-MF:From:To:Subject:Date:From:Subject;
 b=nCx89NOka5xy7evwVTZHqSoSp3KkPbP2kD8JLjQxCDeP9uPDXYsNxe0MCEjd6dabLYJpl4hLd4YcQMeTWYMTn+O8sMsbf0VLcw6POSLcECAONFtEro6wwKKTgEZo2R6EsaDivIddMuXd8onSePAHmVlwBH9eCjnP6J4zFls/S0mphhpYwyvA1YdArDZT7Zuq/Q+Bxt1ufvHeKF4an2lki2WheUFYtyYELzxU1i/OYgx7Q87wJUJLWVhNz746T7TW7pAzpdtNLK28xaiQqgWFXkur3meafkA5+zehZyzeac+RdzbyFTrbVXMpHcHZi7U73ejXQjRwESfsKyt6/vNcWA==
X-YMail-OSG: u.lSX50VM1loaE0iBVmRhSK9qzDisTF6upmJnIrnjjOS4PU7oKWoz_OOlE14V07
 1e8RAimsPi3HIAyQsgxAWZVYJBLhbmjx8xb5Vwsx5zzsZGjNkkjhMlp9DvjwmSUPtn5i0hNTKqav
 GIyrMlJfp8FmMI1CFknl9.TtK2nZ.4SELfH_Z8tpdwwhu5KZI44xRLdL6BQijGxnwyiRs.iQIPzC
 cGgTmE9yw4s_PfDmPMv7IfPPdJLsFUPBxLjpdpYqhJH2TZ28VCqESNGsNSM8dWIubWrvWvj3ziYR
 2SN_471OlHLksdJf1EMBPlc3bv3IX4ZMfVnvGqt.X8PYDGBlQIF9ZTqlYlszXD1KB8FHseFg6uui
 zQhH8Nz8RpKUZJ1G3JR7R5o3HHsDJeO6RNLY0J7gIuA9rBQnFDBAyRQuIhAvj3ZjwB3amaxca_OI
 qCrHvjam2836.9AfeSWrr5lSSU9Hh_fE5zcA1FUqefm.VLLBoMWmepzPqNqf3uoQMuxdW8cODlPs
 UTnbnbuWoL3O1EE2_N.50JEic8Ubn2Wp.pv857uYH1J.X6bpO.F4XE56MbTcA06EAXafXQ4fjRc5
 Y8C9oPNWDcRZHbVviQzuXHcGL_Kcin9Shd96xq0vLzfFwSAYHuIQmm6NNEWtltIYL_D82e_aIy_m
 NUH0Fyh7cYzveZTiQ2qQ1qP1FdjisxgKTtCAxzfvNXV6xRayj_cSI4yKtlKM.6ji.YbDhmWkjVdi
 2GVtPca2C6S85.jhUzzGoY2b7PiBm9NCmDxl83TFPqfjpzo9sgfBKcpySiqlTeiaa1m0gxjXVY2j
 bwlfqCyUflzD7aiqF_ZLDCxrcP11fWlcpDFJthgXcTg.hPS.28X04mUNChRrccotmesy6cnhkLjk
 VLD1_tcURSkd3Z0tk.5bSekYMAQGnye9QDeT6gj3.PNKGjaIgka051NkCpkY5S3V6KzZfZiesnJ0
 0h8F9luuIeNj9oQDLFB7W8pv_S3eyaGzl_5vdSPCUFecB4eA5FZZmVLMGCmFqrHeXJ6Yxa0rHixM
 G27k14QRZBl5_6tiajUaoGZJCVLSMzM7esC9cvf0wRQo1hEut0Yl3ptTQ8ko7CjdPSyG6SQ5LSYt
 56e_Ubr_jD1nLEnJiZpAaFVnn2xRQb5Pp.H.hti5TPnb_JBlGNnwslUTHoSHTxiElsi9i_4h.xsA
 EAuNiJWgTD2v3feZrF4CwGK.UmTQ3NvGa5l7CErIoW.KkPQox0Xx5khpNPxBRViXu.nvW64xItxF
 TKWrB5FDdbOsEbFzdesMs.2XO0HvE1wBvTkkGkvVD6qViRDRnVwIVcGOk8O3YVZXxQ8dOT9Yj3a1
 WpsXgnNfYicwvYMdwNwUr1gknlMS3OkIdIxqmx4QFAcgd5l0qh4yXxQ9jrE16U4KxZDbW7knzwxb
 RFDmrnZLKBrQARBlfnwmUR6Fa_gTmwzW2aiMLjC0BFWVNbmX6Ot2vR3qY5EgXHFe3AVQL1gpuBmp
 9PrzXVMHUDsZE9oNEr2MV2cw2sWTIYf_uexJgEj3qJzvhZcz2T_uA7yYADQ6juw_UEWerEaj8emw
 IayUD_LB3jkRUXlCzA93wmbGsNXvDj0mU7z2iFMyooR99v54sRU6h0rG_y4.PL5bhxJpqPrhO_XW
 UzoVy0rlCSI7ytjObyeOdzTP5GruIPDFYKRRxU1DRSyMmyn8m4liYeEpMh8FlKR6Px2a_UrE435g
 aT3C2IUEUb2h1NJKO202D9GyFwk8i9sxgd4DBmyZZNvNi7h7Xr8bYv0sNgpLP6WezuIj8uChOZEj
 ioU8qGfSDgWjf7TnwXQ2f6d14.1GDQ75Q3kSDTl2GSf4wc6a6xvkdgi9LbsJ0ZLC.I8GP_mnhRcQ
 Vl1CB44WQwDI8dYq6Zqy8AyRtRN10XKA9gpCgRHSJN1hY_aIZ0.vV8nCh2RyPCFHfuDOYxBXVlAg
 lDW5pSxAz.IvV9LPre6Da9t0bxgGnV1BhCcpSKzwtk.5Mv4QMFOvDVM_vY4RZGmTER13qersuP5B
 4fBrdOU5ORbvBjVBwDqGUhIAE.7Ya753IVskowfYZ6qE.Mm3TlvjEeNsIVMJfduF9Fww1nEtveX.
 sQhAFTn4QV7hTA.fF_dfSUANi71cdE4LuXnS.n18bOBgMooPjFcT7LyebBig48LIlxKkFOVQPI08
 UBktXQ5aYsMgXoVIIaE.qi0N_zWI87MXyhLzZTXG.aY1HV6VumDGOtwN4qmWgTgvqDoW7qxLZk4r
 pC.O25e9vvmBE24jrzA6n9RJGttJShOc7YvgCxHoG5I0YezdrVbFYh_V_TJp4Ug0PzSz9otqEIuS
 ugR1.khSJi.x4PGG5kxhQSH0-
X-Sonic-MF: <xiangyu.chen@aol.com>
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic301.consmr.mail.ne1.yahoo.com with HTTP; Mon, 25 Oct 2021 02:31:56 +0000
Received: by kubenode538.mail-prod1.omega.gq1.yahoo.com (VZM Hermes SMTP
 Server) with ESMTPA ID 8431685fae607a09bfd078d560945454; 
 Mon, 25 Oct 2021 02:21:53 +0000 (UTC)
To: buildroot@buildroot.org,
	thomas.petazzoni@bootlin.com
Date: Mon, 25 Oct 2021 10:21:45 +0800
Message-Id: <20211025022146.2556-1-xiangyu.chen@aol.com>
X-Mailer: git-send-email 2.13.1
In-Reply-To: <[Buildroot] [PATCH] boot/at91bootstrap3: add svn repository
 method>
References: <[Buildroot] [PATCH] boot/at91bootstrap3: add svn repository
 method>
Subject: [Buildroot] [PATCH 1/1] [PATCH v2 1/1] boot/at91bootstrap3: add svn
 repository
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: CHEN Xiangyu via buildroot <buildroot@buildroot.org>
Reply-To: CHEN Xiangyu <xiangyu.chen@aol.com>
Cc: spdawson@gmail.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Thomas and all,
	Sorry for the stupid mistake in before thread's patch, I copied the changes from a svn branch to git branch and missing the "AT91BOOTSTRAP3_SITE" config.
	Now I re-submitted a v2 patch, the changes as below:

	v0 --> v1 : applied Thomas's comment, fix the AT91BOOTSTRAM3_SITE missing.

	Testing done in my local setup with private SVN server, log as below:
	chenxy@linux-0qql:/raw/swap/buildroot-master> make at91bootstrap3-rebuild
	rm -f /raw/swap/buildroot-master/output/build/at91bootstrap3-r1193/.stamp_installed
	....
	rm -f /raw/swap/buildroot-master/output/build/at91bootstrap3-r1193/.stamp_built
	>>> at91bootstrap3 r1193 Downloading
	svn --non-interactive export --ignore-keywords 'https://myprivate.svn.com/at91bootstrap-3.10.0@r1193' 'at91bootstrap3-r1193'
	A    at91bootstrap3-r1193
	A    at91bootstrap3-r1193/.dir-locals.el
	.....
	A    at91bootstrap3-r1193/toplevel_cpp.mk
	r1193 done.
	>>> at91bootstrap3 r1193 Extracting
	gzip -d -c /raw/buildroot-at91/dl/at91bootstrap3/at91bootstrap3-r1193-br2.tar.gz | tar --strip-components=1 -C /raw/swap/buildroot-master/output/build/at91bootstrap3-r1193   -xf -
	>>> at91bootstrap3 r1193 Patching
	make[1]: Entering directory '/raw/swap/buildroot-master/output/build/at91bootstrap3-r1193'
	......
	Size of sam9x60ek-nandflashboot-uboot-3.10.0.bin is 17316 bytes
	[Succeeded] It's OK to fit into SRAM area
	[Attention] The space left for stack is 48220 bytes
	make[1]: Leaving directory '/raw/swap/buildroot-master/output/build/at91bootstrap3-r1193'
	>>> at91bootstrap3 r1193 Installing to images directory

	The final could be found under ouput/images directory, everything looks ok

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
