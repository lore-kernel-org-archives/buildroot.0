Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E81D96083621
	for <buildroot@archiver.kernel.org>; Wed,  4 Nov 2026 21:26:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=d0/fqTI7
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C5AB040467;
	Wed,  4 Nov 2026 21:26:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id m1krHlbTll6i; Wed,  4 Nov 2026 21:26:12 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org E5821403B3
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793827572;
	b=efU5Nyo2wScbz5D2Y2DTHEzEphB9gHUqkRLE697bmSh0t1ZE8FDmoJEfQdjxyPK2nuiR
	 3IgLDUMd0Tu+F803PisCHqYV0vTAc7KamKYkWm32cS6N597AC8ICiK6w6DKaZoSs1rvqv
	 mwu3klUd16BSK4jV0fl4zZjm2fxDpq3Mp6XnBc4JjjaSqTMcVC8kmttKj9xQHRAE8Bzg8
	 B7RIOuMEscN23GkxEiC/ZW5U2BHgzq4U5725lqKz6HIFAS8KkIl1DjLtRSnw5NP1fWmKI
	 L7aekaHqtyiPFc7e4PHEekdAddSbk4zGeGdcB0iblBxWHyi8JzBWfAKYTU+f6gvTECg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793827572;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=ZOtsNIm6L3UsMPGJuQPDNw8AMOtKEmrEbFo/wos4gn0=;
	b=JRt9UpBcGIetoXYz/SvEzUXdsULPgKgBrZypNCh85/iafbx3BiXfR3yDWgumGD1F4Iw2
	 OYcUeJIl2MXtrE+qbViozkmbxocrptvnshSkpbNlXYlP8FBqgYLVKXm2FD2r1stfm0bB5
	 L/Em9uXeDL/nf9pZPTBnKcNcJppP6yWPwcFpOUfLkKJH6wOjU+yFhNLsO5AzbaeROXIjV
	 VFRzaebmm//JV+OE6/IJqWUeFCOVlMcJBF0jHzv/fbBXaL0mYqJV6Jd+xLTjRQ2boCLHr
	 vEcqTLvqsLbRRLKG5jq6q2tl0N3zX3bO2q3ewtexQsrrraKDoy1xLU+8HN2Rk9dA67Q==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793827572;
	bh=ZOtsNIm6L3UsMPGJuQPDNw8AMOtKEmrEbFo/wos4gn0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=d0/fqTI7Qs8PsQlUb+q3eCvW1CN5Fd94Na2CxDym3pLnKavXTeshUnGo44pwr45Wx
	 g9xWmygWLhqqB5ahY6QP7zUQiqsCnYMn1jUbKc44XIZW+fv1bl1rhOa2pj2tOSocfj
	 QYP5eGlcD6bpcn2udW0Qk8TdGO9SaObKVpTb71kh7fCgBOrPIJbb9akcRrV2a8P9LG
	 HQHzu46bf5zjMwb4yxekD0ZYBY89Ga5epoYfu/MvFxDAVhnvN9d5qkftGINsYqNlxt
	 qZuHEgS7J8tBmVfljwPqXAAMEKAnMwQOpn2d0H4g0fEcU/gmG9N3mLDfbvphDJpJLy
	 j1fUs3c/yrs6Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E5821403B3;
	Wed,  4 Nov 2026 21:26:11 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 3DB94177B
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 21:26:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 23A08812D9
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 21:26:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8sMOtmCHO_ip for <buildroot@buildroot.org>;
 Wed,  4 Nov 2026 21:26:10 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 8039781271
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8039781271
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 21:26:10 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 922B09DEA7; Wed,  4 Nov 2026 21:24:39 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 4 Nov 2026 22:25:42 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 746840c419ed7ec473a1581132425edb4a8b8d3d
X-Git-Newrev: ffe8a5ff4dc7c0e77bc4c25cfe167755b993f9ea
X-Patchwork-Hint: ignore
Message-Id: <20261104212439.922B09DEA7@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/imlib2: bump to version 1.12.7
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/ffe8a5ff4dc7c0e77bc4c25cfe167755b993f9ea
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Changes since 1.12.5 include input validation fixes in several loaders
(APNG, ICO, ID3, j2k, y4m), a limit on decompressed temporary output,
16-bit PNM support and bicubic scaling via the bundled uscaler, which
is enabled by default and needs no extra dependency:

https://sourceforge.net/projects/enlightenment/files/imlib2-src/1.12.6/
https://sourceforge.net/projects/enlightenment/files/imlib2-src/1.12.7/

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/imlib2/imlib2.hash | 10 +++++-----
 package/imlib2/imlib2.mk   |  2 +-
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/imlib2/imlib2.hash b/package/imlib2/imlib2.hash
index 6c316b5d0b..6623098e64 100644
--- a/package/imlib2/imlib2.hash
+++ b/package/imlib2/imlib2.hash
@@ -1,9 +1,9 @@
-# From https://sourceforge.net/projects/enlightenment/files/imlib2-src/1.12.5/
-md5  c81c9f91d92ecbd87cf652f867ec5d74  imlib2-1.12.5.tar.xz
-sha1  055778fca4639962290426c37d909c1a6a4c8e1c  imlib2-1.12.5.tar.xz
+# From https://sourceforge.net/projects/enlightenment/files/imlib2-src/1.12.7/
+md5  b19079314bdb3948b464203f81383060  imlib2-1.12.7.tar.xz
+sha1  dbe0d336c02644875e0c64bc67bf87fa85ec1d55  imlib2-1.12.7.tar.xz
 
-# From https://sourceforge.net/projects/enlightenment/files/imlib2-src/1.12.5/imlib2-1.12.5.sha256
-sha256  fa2315f28379b430a6e6605b4284b07be06a3ef422d4f5e1c9bb24714c4cf6dd  imlib2-1.12.5.tar.xz
+# From https://sourceforge.net/projects/enlightenment/files/imlib2-src/1.12.7/imlib2-1.12.7.sha256
+sha256  d71ee5351cc1914fb01968123d0dcf276740e5af5662943ac47ae60cafa4d13b  imlib2-1.12.7.tar.xz
 
 # Locally computed
 sha256  fb70339dd33a77b6213c7ae067fccf93d04af44ff3f937c61f8863f7970e73f6  COPYING
diff --git a/package/imlib2/imlib2.mk b/package/imlib2/imlib2.mk
index c650981501..5ca4322d71 100644
--- a/package/imlib2/imlib2.mk
+++ b/package/imlib2/imlib2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IMLIB2_VERSION = 1.12.5
+IMLIB2_VERSION = 1.12.7
 IMLIB2_SOURCE = imlib2-$(IMLIB2_VERSION).tar.xz
 IMLIB2_SITE = http://downloads.sourceforge.net/project/enlightenment/imlib2-src/$(IMLIB2_VERSION)
 IMLIB2_LICENSE = Imlib2
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
