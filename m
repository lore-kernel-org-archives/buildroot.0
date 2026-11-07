Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21326606A326
	for <buildroot@archiver.kernel.org>; Sat,  7 Nov 2026 18:07:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=E3J6itHZ
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E9EA980FA1;
	Sat,  7 Nov 2026 18:07:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iaZRdGeugaGA; Sat,  7 Nov 2026 18:07:45 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org A8F1280FAF
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794074865;
	b=T2ZklUt5VwfEgTxW00NbEdbFs/PMcv5uKxuQ7S5WDnvxNfDODZ4XZEn7yJcxJRvQrvyx
	 rDdAsAl2S9PFVAvLSyS7bfkmhh3RGhgRbSAkqXyqBXPdmjJbg/ve4QUZbF+ADQouBKTnp
	 mWRoQxiDybJX8kgXf2YHCpaoxp7Hw3JAKgsD1SpQJu9TAvA7aq7SwazbczMBSfhrLR1VT
	 CjSdR4/iegyKOqiCnTneBXqiVTIcNiU9/x0kRZFTiRrZ3nZEPy2xO8w61wf9YsTIiFHZs
	 wjfwbY/Z7U7gv/Rg1eTZ2zyvY6ja83ys2dI2Ncc59NaWE5iZTkEukqodOnvvMORZy+w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794074865;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=3QJewl5RsKqJH/pxlssTQ56iN9zxd02FF4pwa6vdJVw=;
	b=GP6CGxwqIEVcC+lPEHEO9blm1hcCzrVj88sYOgl2C3MDq+aSNih1J7f9WFgO2QAPGJ1S
	 Hvwg3tGBMy7HriFZnNrcMtZ9Ni42ABStGQvOqn2AJN3BlEtg+1+eVEwl++9enxmnrJRhA
	 +412Uu4d16WoNfY1Vkkxr/3ldd4kG59uiRdQaCbOD3YJ0GsoJ78AmbW9sBYS0lO9EBOhQ
	 Vxre0UNc9wOpc42Ce87eoyn2nd1INDSPuLG0Zk5t1MMhLsPvExz4ieRui7OrZPOEvyaQq
	 iTGk0wgfVr9ZP0hvYqVC0Zn05lbBsdahNhlOO8uthS/p+CrYOJ1UFBVJJR6ZlYWKhzQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794074865;
	bh=3QJewl5RsKqJH/pxlssTQ56iN9zxd02FF4pwa6vdJVw=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=E3J6itHZ8eaF9VAkV71/WoCpndOpOGwKXoEyfIo4xjMG2o2YFVUks5q/N1boo2zlZ
	 9Typ6eQm0FcN2hKu8EjGZfbbSN9ZaEAFceXQIEHP9EqiIv8Jq2e+mihcuYMPk/ij5L
	 gAAh1NnhlHKMr/gTPBQuS46O0JOlorBLnN3qfozuS6HqEL1Qx4kFCId+6ZcFyxUzkc
	 OJuo5Zssza/P/ETWNjos1C2ueveVy28VRhdJZ9jl46fAH4fKFIW9/CPLyCo0Gzt3W0
	 7N/EWz1N2oxt9DwljYfpVtt3TADGaXiwksKOtgQUme6G2SXccx7vTZypVlFA9p85MF
	 o/ILr8HzIOwuQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A8F1280FAF;
	Sat,  7 Nov 2026 18:07:45 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id D8C86A64
 for <buildroot@buildroot.org>; Sat,  7 Nov 2026 18:07:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CA25C400A9
 for <buildroot@buildroot.org>; Sat,  7 Nov 2026 18:07:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VqUGJrr8I2yc for <buildroot@buildroot.org>;
 Sat,  7 Nov 2026 18:07:41 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org AB7894009B
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id AB7894009B
 for <buildroot@buildroot.org>; Sat,  7 Nov 2026 18:07:41 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 45B2188711; Sat,  7 Nov 2026 18:06:09 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 7 Nov 2026 18:57:17 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 31057104dbc52ec0b30c9cc0632214a75eb7bcd8
X-Git-Newrev: b5b3054633e276d5d7e5fed19206a8d17c11e234
X-Patchwork-Hint: ignore
Message-Id: <20261107180609.45B2188711@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/x265: fix build on i386
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-21.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/b5b3054633e276d5d7e5fed19206a8d17c11e234
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Fixes build error:

[100%] Linking CXX shared library libx265.so
/home/autobuild/autobuild/instance-2/output-1/per-package/x265/host/i686-buildroot-linux-musl/bin/ld:
common/CMakeFiles/common.dir/x86/pixel-a.asm.o: warning:
 relocation in read-only section `.text'
/home/autobuild/autobuild/instance-2/output-1/per-package/x265/host/i686-buildroot-linux-musl/bin/ld:
read-only segment has dynamic relocations
collect2: error: ld returned 1 exit status

For details see:
https://bugzilla.redhat.com/show_bug.cgi?id=2428281
https://github.com/rpmfusion/x265/commit/acff0da237beea2c1229d743a2eaa16c839e00b3

Fixes:
https://autobuild.buildroot.net/results/6ab/6ab6ce2e82a4ccd9ca58b2233a3d496eff697cdc/

The oldest build error of this kind dates back to 2024:
https://autobuild.buildroot.net/results/5a0/5a0040e1a5e352fdc7a37ac268083466ad80404b/
so a backport to LTS branches should be considered.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/x265/x265.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/x265/x265.mk b/package/x265/x265.mk
index ad4285fb16..fdbdfc2cfd 100644
--- a/package/x265/x265.mk
+++ b/package/x265/x265.mk
@@ -33,6 +33,10 @@ ifeq ($(BR2_i386)$(BR2_x86_64),y)
 X265_DEPENDENCIES += host-nasm
 endif
 
+ifeq ($(BR2_i386),y)
+X265_CONF_OPTS += -DEXTRA_LINK_FLAGS=-Wl,-z,notext
+endif
+
 # disable altivec, it has build issues
 # https://bitbucket.org/multicoreware/x265/issues/320/
 ifeq ($(BR2_powerpc64)$(BR2_powerpc64le),y)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
