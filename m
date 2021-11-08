Return-Path: <SRS0=Mf7g=P3=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1267C433F5
	for <buildroot@archiver.kernel.org>; Mon,  8 Nov 2021 18:53:13 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2C56461361
	for <buildroot@archiver.kernel.org>; Mon,  8 Nov 2021 18:53:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2C56461361
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=buildroot.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C0A07400B5;
	Mon,  8 Nov 2021 18:53:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id V_uEB75-PUpw; Mon,  8 Nov 2021 18:53:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9703C400C5;
	Mon,  8 Nov 2021 18:53:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 257371BF3F3
 for <buildroot@lists.busybox.net>; Mon,  8 Nov 2021 18:53:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2190180E24
 for <buildroot@lists.busybox.net>; Mon,  8 Nov 2021 18:53:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=tkos.co.il
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OsziTMZ4yi25 for <buildroot@lists.busybox.net>;
 Mon,  8 Nov 2021 18:53:07 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mx.tkos.co.il (guitar.tcltek.co.il [192.115.133.116])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3028980E1E
 for <buildroot@busybox.net>; Mon,  8 Nov 2021 18:53:07 +0000 (UTC)
Received: from tarshish.tkos.co.il (unknown [10.0.8.4])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx.tkos.co.il (Postfix) with ESMTPS id AD1AA4408FE;
 Mon,  8 Nov 2021 20:52:52 +0200 (IST)
Authentication-Results: mx.tkos.co.il; dmarc=fail header.from=tkos.co.il
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tkos.co.il;
 s=default; t=1636397572;
 bh=47QlCALGTgz13urCoOg7t1cbUnuZNT5W5LBsW3tZ2Xc=;
 h=From:To:Cc:Subject:Date:From;
 b=bgY0q/8/XcAvNQ+krvclCB4rTUJ3ZoflNU0TbG4CY3+03Iauf26zsUIWH9H5m29kr
 tXCNAfHeZnkjyahsZjFWtLE8vfj0wiThNYm658n3RhHt2b5ruTnIRFgV9EM8DS0KA5
 LUIh6jpuHcpuyq5kXJxn3eNEtz47dpkFZM6I8wofBX99uCrFEYVkVwhtG3eO/cKK0i
 giay12va+RbB+rAaki/czs5Z8YuLI4nqLEQ1MsNG4uoUw7vXK51xblTCAR0JJrfiVj
 zFu2L746nmyLpwPCL/PO7OmyLigshb0ZoGn/eua6Eghz/2ztp2fs8T5hGLPIR11ERm
 VQYQUHCTnJANA==
To: buildroot@busybox.net
Date: Mon,  8 Nov 2021 20:51:36 +0200
Message-Id: <5b186b86fcb09362595194f266ca1fe33a8f0f59.1636397496.git.baruch@tkos.co.il>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/socat: bump to version 1.7.4.2
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
From: Baruch Siach via buildroot <buildroot@buildroot.org>
Reply-To: Baruch Siach <baruch@tkos.co.il>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Bug fixes release.

Update README hash for version update.

Update comment; we do not patch configure.in.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/socat/socat.hash | 6 +++---
 package/socat/socat.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/socat/socat.hash b/package/socat/socat.hash
index 5a4c5204555a..0d9d0ba76c9d 100644
--- a/package/socat/socat.hash
+++ b/package/socat/socat.hash
@@ -1,8 +1,8 @@
 # From http://www.dest-unreach.org/socat/download.md5sum
-md5  36cad050ecf4981ab044c3fbd75c643f  socat-1.7.4.1.tar.bz2
+md5  003686f80d820072649660b85f80c58f  socat-1.7.4.2.tar.bz2
 # From http://www.dest-unreach.org/socat/download.sha256sum
-sha256  3faca25614e89123dff5045680549ecef519d02e331aaf3c4f5a8f6837c675e9  socat-1.7.4.1.tar.bz2
+sha256  6690a9f9990457b505097a272bbf2cbf4cc35576176f76646e3524b0e91c1763  socat-1.7.4.2.tar.bz2
 # Locally calculated
-sha256  b1ebebbce145027f4268211f36d121b083aeeabdc1736eb144b8afd8e86ce8da  README
+sha256  062e425b43da6b3df6d8657639b5e2c781781572b5d8867444fd6d2487ac7644  README
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
 sha256  fd9e48ca316a5032069b9521f4f4b4d9b1c60365012bae1e62286bcd5bd2e761  COPYING.OpenSSL
diff --git a/package/socat/socat.mk b/package/socat/socat.mk
index 61c985256541..cf2a31b0969c 100644
--- a/package/socat/socat.mk
+++ b/package/socat/socat.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SOCAT_VERSION = 1.7.4.1
+SOCAT_VERSION = 1.7.4.2
 SOCAT_SOURCE = socat-$(SOCAT_VERSION).tar.bz2
 SOCAT_SITE = http://www.dest-unreach.org/socat/download
 SOCAT_LICENSE = GPL-2.0 with OpenSSL exception
@@ -24,7 +24,7 @@ SOCAT_CONF_ENV += \
 endif
 
 # We need to run autoconf to regenerate the configure script, since we patch
-# configure.in and Makefile.in. However, the package only uses autoconf and not
+# Makefile.in. However, the package only uses autoconf and not
 # automake, so we can't use the normal autoreconf logic.
 
 SOCAT_DEPENDENCIES = host-autoconf
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
