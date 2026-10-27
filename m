Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1646C606A31D
	for <buildroot@archiver.kernel.org>; Tue, 27 Oct 2026 19:55:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=DMlD6YtL
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E2D85406C4;
	Tue, 27 Oct 2026 19:55:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EG4hjqdfHJrJ; Tue, 27 Oct 2026 19:55:37 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 253D940595
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793130937;
	b=mMaZrnJcZAIybjCp+VmUmdjHzNzTHy9oOXcJq/6/Td7d0c21d4y2Pk6qVwvlX0TSq6i3
	 fvElOnZJH1PMBmYc+/rvXPq/aJ1bJXBzLvwfIFZy9ompXNp2emY+ZsmV4+MLmRaYG7lEI
	 mUXLWP1dzw9rksAPeAdxPtLB2jiOIS8tGZ+NiiyRc4R2yoGCJ/jeUijhWaFUJDrOTleeG
	 f3hBc4mYXFpYgSD2D9egYxsmW9QWLe8abCgzV+mzhGddSHlrkMzR8ssMoj929YG3E4Or6
	 NSOI+XvdIQpsuS27q7nFj76i9QuwRWxyzgthzCf7jAUwtxjVH7TzpzyZ3urRAKxdVDQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793130937;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=nXTD1HLQ5w48zrLmnSZE1XlJzhmc+Ek2AVKikAcSl3c=;
	b=iYMg/viTKq9MWgZ7DH2z/6SWQwULh98X2q9oD6DUO9MsBytEQs8f07tZsbS71cG1Sb0s
	 TWoqt3sJ7k9EdF8SveWKbjvST9cBDqJyKvYL2hFftJcwrMTadF3Z32o8zpVzaoXmFLEat
	 jXlKk6NwDBKZ8uPy/MT8dYRf/6DMEFOleYuI5gLW+jpI0L6YdCwlL7c2UTG3LKBNHDESr
	 s7ZHQ+tl6PJG4kSEIcwrbOA+/rASSoooCedmrUz156YZ9dsXOOG7xVDQqskn8oeGlhsOM
	 ww2+aMIhiRbEI7YuyEulUHC+LUVSc4cl1wuIrN2DBj4r0i/iRg70JtpXd1W9MtUvF/A==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793130937;
	bh=nXTD1HLQ5w48zrLmnSZE1XlJzhmc+Ek2AVKikAcSl3c=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=DMlD6YtLg1svV+F7HceZCicCLhOuAM2UTDykuGZFUHUAjORf3/J+xjfVs+ym6ms0K
	 ZSzsSGXe6O6IrjrzP1fCAQwvNHitIwXm4SFWfcSLS36l3R6i5tQKdqHf6anBsNnXR5
	 kXfP2B5MvULfPk5Wzk+b5OUpwMrkgh0U3pE05M7qBsf5czvbtqWdgOLS85dJ3YIDqQ
	 FLk2qvN5aK1bIOwLGzObt74UMFjnABWzti7+UJ02jzZT2S1sGTyo6e1LnExy2pFXrB
	 aWGAiK5I8OL51Tv4/+nffALVEUVXJEnh62JBuGyElien2PgQeanTBS44r6SgoPyhRe
	 HucdHEjYQZyIg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 253D940595;
	Tue, 27 Oct 2026 19:55:37 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 74E8B529
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 19:55:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7254F606A8
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 19:55:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NImgqW3D5IWd for <buildroot@buildroot.org>;
 Tue, 27 Oct 2026 19:55:34 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org C0ACF60653
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793130934;
 b=oJmtiYMQYHrkoW2eAfblw+jERWbWkR1S4HQJPn6kqJHaqPFlqASBqBOLrCjin2xG5/vQ
 E+74bVYzZz51LagVKw5207zvCZDnPab9uRmUySUVlGnIWEdNvy3oiz+eq6yMzJ9Bt8ZBX
 umqjxgOJB0EZCCgyn0PBhFdVL84FN5VRBknRipC691rL36jch5Rtq419nHkSzNpBje4Fz
 SvgYPiKwt/gDMi8XF9/zj00ieVJvl8NIXzTfpQDtkmAwRBewfOg20MB4QqMUdgiGAg/60
 5xn8+VaxCBf9svGLhU+wXZuqTwHafZWaGoP0shJsKZZ1XfoRLXG3r9R/Cluhjxu9M6Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793130934;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=bdApelaP9QwU52wC4fNrs7nwyGMO2FBjaJeSKLuWHN0=;
 b=RJuKgyHenG9wY3d8b/8f84ik74c02jbyDJP30BiM3SuSyFcBryjaSuQ2YXR6L2N7rjaI
 6uFFnCnBH8dosjthDo/urrYNB17KN+CZ0e5jZDAI76Y1p+KgvgopRfUUc+A8hpqdwZIR9
 dH1p0st5d+hPvwlMfuT4leUg/0/Wzt9U9EVLFcZKJteKYnb9XUsttbH4kc1cC8bAaIcnN
 wC7gB5LX8RE5WhU6UVpTWb+m/D+zh65Bl4svYWjItcW+LnGY4M0d6HiM23tdX5FBEsrSr
 TEgwCsnWy4WNHYFZP5pOVyZWZz+usbUSRLEnziCoozx/XC4lQDtjGM+HC8Qbb2R7+Ng==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id C0ACF60653
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 19:55:34 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 36BC59D142; Tue, 27 Oct 2026 19:54:08 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 27 Oct 2026 20:54:30 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6979e8d3db3870dbd5aba1c8e6633f0a5f3b7554
X-Git-Newrev: d779f9d69940704090da7edc03ad0598b1ac5d1d
X-Patchwork-Hint: ignore
Message-Id: <20261027195408.36BC59D142@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mender-grubenv: bump to version
 32e10c0b
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/d779f9d69940704090da7edc03ad0598b1ac5d1d
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/mender-grubenv/mender-grubenv.hash | 2 +-
 package/mender-grubenv/mender-grubenv.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/mender-grubenv/mender-grubenv.hash b/package/mender-grubenv/mender-grubenv.hash
index 06456f6818..1780c8a180 100644
--- a/package/mender-grubenv/mender-grubenv.hash
+++ b/package/mender-grubenv/mender-grubenv.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  9200dfc8ce8d9e5fae13947857fec44961df87c5bee92f90e37049279a94fb6f  mender-grubenv-ddbc5cb054c7a8245c2d6c79eb4cb60ed0ec27e4.tar.gz
+sha256  88c9cc9ea375b8391e6a2ab716e758c3ef1d10145496d7abcea0f1a7a6867a97  mender-grubenv-32e10c0b33b26277099b5ce7047896202cd18781.tar.gz
 sha256  d7e8fd4ad05371007d60285c309ba7a7ce3e61029b843f949fbb9ec79dc9eb47  LICENSE
diff --git a/package/mender-grubenv/mender-grubenv.mk b/package/mender-grubenv/mender-grubenv.mk
index d93159802d..9604958fbf 100644
--- a/package/mender-grubenv/mender-grubenv.mk
+++ b/package/mender-grubenv/mender-grubenv.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MENDER_GRUBENV_VERSION = ddbc5cb054c7a8245c2d6c79eb4cb60ed0ec27e4
+MENDER_GRUBENV_VERSION = 32e10c0b33b26277099b5ce7047896202cd18781
 MENDER_GRUBENV_SITE = $(call github,mendersoftware,grub-mender-grubenv,$(MENDER_GRUBENV_VERSION))
 MENDER_GRUBENV_LICENSE = Apache-2.0
 MENDER_GRUBENV_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
