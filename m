Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20BA7606A31B
	for <buildroot@archiver.kernel.org>; Mon, 26 Oct 2026 08:10:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=lxgmlI8V
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5E5C680DA4;
	Mon, 26 Oct 2026 08:10:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OglcA1BKdFYc; Mon, 26 Oct 2026 08:10:08 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 5C01F80D82
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793002208;
	b=Vjy8YlZiUp91XhUoAT0eHVIwytdJm0mmiJjT02AkTzXZtZVseT0puipfcWn4PSRnzib4
	 F/Ie+fvtvk7l3rspjVVSpebXhNFm/fRbcA83C5CEKvHDcBjFvKhA4LPCf8XEtvaNQUuX4
	 T4wXL6Z9R/DdREtyRkR8MjLSVFB1bMVIJ6dmEH0KeWpE0AsyAzPlDemZtTcoA1s5scg+m
	 51ukSkcATJxrAGoam1zZ0hZ+KClNImrX57Wp5KRA8XB7grdIS4QidkZxyCDId86U27fb9
	 FAVNz2RhgP/V1NrbOPCidrXrISPN8xhJ+XazDWLI3pOhkJEKAaoE+pOMtWzaLEDF4RA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793002208;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=E4Uoo9rzh1GVTQ7RpwTvsLraVk9s1SfeBCm65g5ddYQ=;
	b=CWGg9tD7ucUmfx7vLRYVaMXEq0YFxS0QN5iVIjwga8WE8ZYmAb1M0bsPimpK9xxwcbx3
	 r9L9/37rwJgxD66WdienH3iyN3SMHS8hxN4F0UTcdMlHMMVk0NGpha1j1qXiOmmKUNAXB
	 DDhQ3izd85h1pH5j1Cl2BZCHnOoW/zHybUwcnYw6yU7nSOv5esPgrmDZ+p+AwplAZuEum
	 f8rEFS1a/XesW1TIwPX/HGqpzdTSACykAo5W+2tk0GzGzEBKPBp7nWqiZBNQ8wDVpoH3k
	 c6cLueYHojG/0+Z9Wn0unIhiw6v8TUTVXMgfWoxld2nJvioFiCRg2ag/k2hxOkpOKlQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793002208;
	bh=E4Uoo9rzh1GVTQ7RpwTvsLraVk9s1SfeBCm65g5ddYQ=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=lxgmlI8VQNKBk4Kls7eJmkKs2hDJnuT9bDVkNIhTUjHbiFSR2W8YOzK4s7eumGG0s
	 LiUP3+NHE7ua7ka0ISVteK8vpUODl0Se/DM4v5aChSkipWDnnqQ/xKMQGo/Ny5TnI/
	 JL4c/gjnLr1dwK86IL1+9h5JaJIjp4Ij//i9we8sqJBi+uh80QpGhgzcykUJkePMKU
	 JJtQOviT1+u2DQnHXpIMiQgvbuqv10gH43w1G3CRUlYar6kL4CKuIoLfxTcoTspFBs
	 MFI2Y6varGqh/yHFtZDszg2mVEaG6LLjliEgYjjt+dVi3GGkvM0ItXE88YN4HFyknz
	 kwv7KwjNl+Nyg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5C01F80D82;
	Mon, 26 Oct 2026 08:10:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id DDC86334
 for <buildroot@buildroot.org>; Mon, 26 Oct 2026 08:10:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D9F4780D87
 for <buildroot@buildroot.org>; Mon, 26 Oct 2026 08:10:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aAJx6o6bhL_l for <buildroot@buildroot.org>;
 Mon, 26 Oct 2026 08:10:06 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 2133380D82
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793002206;
 b=hG6exb1k6eACj0dsr91E7zLxzwq6ZNQLXLpcLE+ePiy2GCvMnxX3AjYkHMfxUgDnEYRK
 23UoEypMJ7Hvz8+2EB9qD39mzy6G1Xck1hBM/x/XxFGloO7kHtHZ1WmGMXY0LwwB4+xQu
 9fmNxp3vxjiG7EVpAqOTpovsvSNY/ic5oTfQJynGIOYzgd8/NlO4LKs8LvwQ4E0tm09dp
 XAN7GJecV576GHvHOmG6BVaK94j1R0V+LiO1uqzVsYLf1CGc+ONT49aTpue9aN55gg3NB
 bgLA/N2Whw2mGysLygTzgEzduTLM0IZOw+JO6LyAGNsrQudyiSD2Cdb9sG97dbt97Cw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793002206;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=W5JMeWxK+2batvu/ZdVy9zbg6yuKepUhBu2AgSFLCio=;
 b=QBj926OPnXhf3vK8Nz6h5RHsCqL2dtA2aem81ZFMg+gFyOIRsT3ZvKD9QWYUfagnSqD5
 nHNZUg5N+ajhScnHRCEggMPpCJLSig68lFbBXAUcJ94C+yPkZl/tGJnMzow7ACxSTgvcU
 Uvbt7HF+9T05fpayNqKNcpSXZIXIa/UUmqJvacJqUaX35sAEl25Nb9raYkdjHzuWBDcy3
 0RjzySCGHMzNqDpIOBUIaLcG+RvjcUSKbufNMCZ5RMbQt5tGxomA9UvpP7HMJ9wixuaoU
 PuUM9HJf8pN3vPi3+X+M+u5EMODbtAqLLM7FwWlAXrnPiHlj4714d233UVV024S0GgA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2133380D82
 for <buildroot@buildroot.org>; Mon, 26 Oct 2026 08:10:06 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3EF339CF62; Mon, 26 Oct 2026 08:08:40 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 26 Oct 2026 09:09:42 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7c1c82a04545eb880d03f7e2badc3feef451f06c
X-Git-Newrev: 7a8b2d699f4194eab06b1e26f67b4c94a39423f5
X-Patchwork-Hint: ignore
Message-Id: <20261026080840.3EF339CF62@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/ccid: bump to version 1.8.4
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/7a8b2d699f4194eab06b1e26f67b4c94a39423f5
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Upstream removed the older releases from https://ccid.apdu.fr/files/,
only keeping the 1.8.x ones, so downloading ccid 1.5.2 fails:

  ERROR 404: Not Found.

The GitHub releases don't provide tarballs, so bump to the latest
version, 1.8.4.

Since 1.6.0, ccid uses meson instead of autotools:
- zlib is now a mandatory dependency, and flex is used to generate the
  tokenparser;
- the driver directory is taken from pcsc-lite's usbdropdir pkg-config
  variable, which is /usr/lib/pcsc/drivers, so --enable-usbdropdir is
  no longer needed;
- the udev rules are installed by meson (in /lib/udev/rules.d) when
  -Dudev-rules=true, instead of being copied to /etc/udev/rules.d by a
  hook.

The tarball is now xz-compressed. COPYING changed only in formatting and
the FSF address.

Release notes:
https://ccid.apdu.fr/

This is not caused by a Buildroot change: upstream removed the files.
All maintained branches use ccid 1.5.2 and are therefore affected as
well when the backup site is not used.

Fixes:
https://autobuild.buildroot.org/results/f12f2765606f8dff01e64a32fd38baaf65d6115c

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/ccid/Config.in |  1 +
 package/ccid/ccid.hash |  6 +++---
 package/ccid/ccid.mk   | 20 ++++++++------------
 3 files changed, 12 insertions(+), 15 deletions(-)

diff --git a/package/ccid/Config.in b/package/ccid/Config.in
index c12733375b..5c3d754d46 100644
--- a/package/ccid/Config.in
+++ b/package/ccid/Config.in
@@ -6,6 +6,7 @@ config BR2_PACKAGE_CCID
 	depends on !BR2_STATIC_LIBS # pcsc-lite
 	select BR2_PACKAGE_PCSC_LITE
 	select BR2_PACKAGE_LIBUSB
+	select BR2_PACKAGE_ZLIB
 	help
 	  PC/SC driver for USB CCID smart card readers
 
diff --git a/package/ccid/ccid.hash b/package/ccid/ccid.hash
index fcd8d10ed9..97383f7f26 100644
--- a/package/ccid/ccid.hash
+++ b/package/ccid/ccid.hash
@@ -1,3 +1,3 @@
-# Locally computed
-sha256  13934487e6f8b48f699a16d367cc7a1af7a3ca874de721ac6e9633beb86e7219  ccid-1.5.2.tar.bz2
-sha256  a9bdde5616ecdd1e980b44f360600ee8783b1f99b8cc83a2beb163a0a390e861  COPYING
+# Locally computed after checking pgp signature
+sha256  4ff98151a7feb828a711e2f9d68c6b6065a97c597a81c2cbbd11d7f7edcfe743  ccid-1.8.4.tar.xz
+sha256  20e50fe7aae3e56378ebf0417d9de904f55a0e61e4df315333e632a4d3555d95  COPYING
diff --git a/package/ccid/ccid.mk b/package/ccid/ccid.mk
index 0510b4c9ad..3bb4c19a7b 100644
--- a/package/ccid/ccid.mk
+++ b/package/ccid/ccid.mk
@@ -4,23 +4,19 @@
 #
 ################################################################################
 
-CCID_VERSION = 1.5.2
-CCID_SOURCE = ccid-$(CCID_VERSION).tar.bz2
+CCID_VERSION = 1.8.4
+CCID_SOURCE = ccid-$(CCID_VERSION).tar.xz
 CCID_SITE = https://ccid.apdu.fr/files
 CCID_LICENSE = LGPL-2.1+
 CCID_LICENSE_FILES = COPYING
 CCID_INSTALL_STAGING = YES
-CCID_DEPENDENCIES = pcsc-lite host-pkgconf libusb
-CCID_CONF_OPTS = --enable-usbdropdir=/usr/lib/pcsc/drivers
+CCID_DEPENDENCIES = pcsc-lite host-flex host-pkgconf libusb zlib
 
 ifeq ($(BR2_PACKAGE_HAS_UDEV),y)
-define CCID_INSTALL_UDEV_RULES
-	if test -d $(TARGET_DIR)/etc/udev/rules.d ; then \
-		cp $(@D)/src/92_pcscd_ccid.rules $(TARGET_DIR)/etc/udev/rules.d/ ; \
-	fi;
-endef
-
-CCID_POST_INSTALL_TARGET_HOOKS += CCID_INSTALL_UDEV_RULES
+CCID_DEPENDENCIES += udev
+CCID_CONF_OPTS += -Dudev-rules=true
+else
+CCID_CONF_OPTS += -Dudev-rules=false
 endif
 
-$(eval $(autotools-package))
+$(eval $(meson-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
