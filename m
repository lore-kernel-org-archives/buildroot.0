Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24C6B606A31A
	for <buildroot@archiver.kernel.org>; Sun, 25 Oct 2026 21:18:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=eKAQt2cv
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F3D6D60635;
	Sun, 25 Oct 2026 21:18:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3oL5Z-aEdidv; Sun, 25 Oct 2026 21:18:28 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org BFC7B6060B
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792963107;
	b=pk0izYXyMC4VTxZcBvIUGV9/C9nHTWoBW6ygoWZrNzUq31p9ZLnH4jZiNJeB2GI4AgpM
	 Sml8Wm8HQmJLUXcOdgILW/+UjtqYNcSMtLKXO68J9GmEEU82cvZGw/1mgqJsuQv1D+Kyz
	 RixSdKBUlzdRhtxi60IFmsyZKWbKvNRE4OzNe7laS82v9+vA2PCVYFP2f4pvaSKWrgf+6
	 a/g/6BAJIPTXiTuLO3p2DUMQAlzxMrsy5Gl792qWMLW4Jc9XQ/2tjtWhhn2N62vZXbCRJ
	 MyInzNr7dOMmvAaCOf9aZIwqh4kSl6+t0BWwPwBWa9DGiGS3sCYB83Tix9oUxeBwlvw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792963107;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=lDLuUCIlcgMAOPLhtV6fYnVJvk69XzDFk3jnWawYIFk=;
	b=Ulby6I3wms+lLX6gaSfE+hU09hUcVBFHUG7+7GrSao8KAR+KG/FPm6Pcc+V6c3BLOzHn
	 XlQpNPrS0KLfRwd8MySajPmRlVPxz2j9l9MEcRb8nT8QESSWrk/8V9zNkw5Gu/HjA5f4R
	 Pro7xx+TLA7s1KREgd0nfcQsuVRpcIObgMIzV++jeOrpo0mGmPGKnneqojpEwddR2OcU/
	 UTb7cfOhX3oz2D7XkZGvgFnjb1Cjqo7Ulb9uTrOCAOTqz4ybVzT7MS70oeBo0v+nh16VL
	 VitQs/N5vRHXaauc8HMbveKnyIiirTsCCAFAvoc68tAe6T8vUI/iVm8IyOs6rYbf/DA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792963107;
	bh=lDLuUCIlcgMAOPLhtV6fYnVJvk69XzDFk3jnWawYIFk=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=eKAQt2cvYNPr8PVkLydrNGf59S9i6w8ZKkx/3WlxsMxdTPQU7NPO675Tp6rjM6Vkw
	 K0OrlfN4BYilBpM7VLL9qu55s8k/5KvQy7y5++lRy8cDGBr0mVux1yPV8Yi6EtMVR0
	 XN2GyyWwMerKgj5HbiIPZZu76mZXWQpSwatK4XcoKfSq8vqdQ1x4Rx8o/mHIvdaltz
	 NI0T9dmHFmlndyX7NHekHXCW5C43GI+djKA99xMT5GNYQ3ieRGcXhAzfdEdIhQDsfE
	 eJKwwla7ThfmkIts73kHDH/Q5lO1GPsHUy9CH5ah4Z/RyUeTNcnGLPIz2LcuYtphxw
	 mP1iGVul+J2Ew==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id BFC7B6060B;
	Sun, 25 Oct 2026 21:18:27 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 168D0279
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 21:18:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 08513405F5
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 21:18:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uGyED-_KYWiP for <buildroot@buildroot.org>;
 Sun, 25 Oct 2026 21:18:24 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 8618F405F4
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792963104;
 b=J4wyvcNzZJ2epqKeGA+pZBs2JS3SmBAvn5VW1KqHcVV/A1fR/nFhWGO6SJJGypEJ/NFe
 OghBpS6cZsoqBcH7iP36774b7Kzny25QsrVWlBo2Yol9I+vCTWxFAbuSomsPxHoXFE06c
 mvMeiZrTGutW0Myh4peH1dntalvV+V1u0JWW8xp8cROnRgwcu6e9nNCp4c0GyJxxWP2VM
 BtlTjPKDmX4LfDX2nDmQKmaVrcd48X4hapsPK305HwS9RqB0+Ul3LB9yWdmJKAgCbagxb
 DcWjKLFzLjxByDYtHeUnfBXLKoQLOXgVz2RIseMGEa0GaYISodgqjlhBjASg/YDLLxQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792963104;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=j/FnmZcp8rjIhIIP/LlYJz1rSXGJVWKnIvS3uys2R60=;
 b=g2fMXSFfDHw3UrTCX7i7e/hTMWC4EDxgMNO0Nr1/mqM1GSleeLSvmMq0MsglUksnKaWC
 1CsgJ29/2cTkOTusCsnjZ/Ig+swLL+UnsnV22fz135I5K27YZV8zbh+3gcTebmy2gvur6
 ALFBu8LU95B2rkkxBs6w5lz9sQ3ZUtmHNs7PG4voqT5Tj+gfoQA+B8cMTKXsuvdPHUBNB
 x7rGwouonboHc2xIUF+2SjywwdGS2PV7OQwhIzjPpV9PQDX3cg29W6nU5E3IDjOB2JW4F
 WgC5d81s8eqQb4t8RpSZmpxlRrFGTM/tD0gNg3kDQ66KpzVIsQ7nUk9RUfSk0f3DGqQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=Mnp2qGRC; 
 arc=none smtp.remote-ip=185.171.202.116
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8618F405F4
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 21:18:23 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id DCCABC51478
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 21:19:21 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 0E57260740;
 Sun, 25 Oct 2026 21:18:21 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 401C610328E76; Sun, 25 Oct 2026 22:18:19 +0100 (CET)
Date: Sun, 25 Oct 2026 22:18:18 +0100
To: Markus Mayer <markus.mayer@broadcom.com>
Cc: Buildroot Mailing List <buildroot@buildroot.org>
Message-ID: <at5yE5coeOp6SzBZ@windsurf>
References: <20261015222908.760160-1-markus.mayer@broadcom.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261015222908.760160-1-markus.mayer@broadcom.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH v2]
 package/linux-tools/linux-tool-perf.mk.in: fix doc build issue
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-11.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_PASS autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Oct 15, 2026 at 03:29:05PM -0700, Markus Mayer via buildroot wrote:
> Address potential document build issue when BR2_PER_PACKAGE_DIRECTORIES
> is enabled.
> 
> The perf package wants to prevent the documentation from being built,
> since it won't be installed anyway. The trick is to create an empty
> GNUmakefile in the proper place. It did this by using a POST_PATCH hook.
> 
> The reason this approach works when BR2_PER_PACKAGE_DIRECTORIES is off
> is that the build system ensures only one package builds at a time, so
> Linux's "extract" stage and Linux Tool's "patch" stage can never execute
> in parallel.
> 
> However, with per-package builds enabled, there is no guarantee that
> Linux has finished extracting by the time the linux-tool's POST_PATCH
> hook runs. This means the creation of GNUmakefile could silently be
> skipped if that portion of the source code hadn't been extracted yet.
> If, in addition to this, asciidoc happened to be installed on the build
> host (/usr/bin/asciidoc), perf would detect this and enable the doc
> build stage. At actual build time, it would use host-python3 (not the
> host's system Python), which does NOT have asciidoc, and the build would
> fail.
> 
>   INSTALL libperf_headers
>   SYSHDR  /local/users/jenkins/workspace/[...]/libperf/arch/[...]/unistd_64.h
>   INSTALL libbpf_headers
> fatal: not a git repository: '.'
>   ASCIIDOC /local/users/jenkins/workspace/[...]/tools/perf/perf-amd-ibs.xml
> fatal: not a git repository: '.'
> [...]
>   ASCIIDOC /local/users/jenkins/workspace/[...]/tools/perf/perf-data.xml
> /local/users/jenkins/workspace/buildroot/[...]/host/bin/python3:
> No module named asciidoc
> make[5]: *** [Makefile:275: [...]/perf-data.xml] Error 1
> 
> Turning the POST_PATCH hook into a PRE_CONFIGURE hook solves this timing
> problem and guarantees that the "fake" GNUmakefile can be injected into
> $(LINUX_DIR)/tools/perf/Documentation as intended.
> 
> Signed-off-by: Markus Mayer <markus.mayer@broadcom.com>

Applied to master, thanks!

Best regards,

Thomas Petazzoni
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
