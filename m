Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FEAFC433F5
	for <buildroot@archiver.kernel.org>; Thu, 17 Feb 2022 23:21:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D2F0B84030;
	Thu, 17 Feb 2022 23:21:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RdNqy7ufaayS; Thu, 17 Feb 2022 23:21:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 13B5F84026;
	Thu, 17 Feb 2022 23:21:30 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E1AB81BF4DB
 for <buildroot@lists.busybox.net>; Thu, 17 Feb 2022 23:21:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DE4AC6F6FE
 for <buildroot@lists.busybox.net>; Thu, 17 Feb 2022 23:21:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=igalia.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mney3ynLYeD9 for <buildroot@lists.busybox.net>;
 Thu, 17 Feb 2022 23:21:28 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E576760B97
 for <buildroot@buildroot.org>; Thu, 17 Feb 2022 23:21:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:
 Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=K3nmHf5tZomj3SyXQFUqXXb9YP8r3fFWnQP3PrZqP3I=; b=ZH/bJ0NXyis6vU4nOX4flu6aRL
 KHyToloRiKiESKIbEUFBgefmkXhxbFmV55m7iW72BaQzmvmHRSxntFMy5rQ+MhI/t7Ps/il/QXSWX
 H789YBp2p7e559pXbU5r77NQf7u2LLQHy+IZjJVUxFOV2/v3EhGM6m8+6Q/kFsmOIb7tQ1p37RI44
 g+zGzsh53APZkklUZn/Cj8vRPDNOSEa60k+zJzlKU3pkF8EUo1b5POub0XUhZM3hjpK3K59xAaDxe
 O4Cm8QsvgtOrXjinmDNJCaBTA1D0MYBTB2O+O/4RzND33FhRJYt1E32w/f7k/c079JJbhAWONrhRN
 59GFYq+w==;
Received: from 91-153-34-133.elisa-laajakaista.fi ([91.153.34.133] helo=kodama)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA512__AES_256_GCM:256) (Exim)
 id 1nKq5S-0004CP-VT; Fri, 18 Feb 2022 00:21:23 +0100
Received: from localhost (kodama [local])
 by kodama (OpenSMTPD) with ESMTPA id 1f26b6ef;
 Thu, 17 Feb 2022 23:21:13 +0000 (UTC)
From: Adrian Perez de Castro <aperez@igalia.com>
To: buildroot@buildroot.org
Date: Fri, 18 Feb 2022 01:21:13 +0200
Message-Id: <20220217232113.1598433-1-aperez@igalia.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/wpewebkit: security bump to version
 2.34.6
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
Cc: Adrian Perez de Castro <aperez@igalia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This brings the package two minor releases forward, which provides fixes
for CVE-2022-22589, CVE-2022-22590, CVE-2022-22592, and CVE-2022-22620.
Release notes can be found at:

  https://wpewebkit.org/release/wpewebkit-2.34.5.html
  https://wpewebkit.org/release/wpewebkit-2.34.6.html

The security advisories covering this update are available at:

  https://wpewebkit.org/security/WSA-2022-0002.html
  https://wpewebkit.org/security/WSA-2022-0003.html

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
---
 package/wpewebkit/wpewebkit.hash | 8 ++++----
 package/wpewebkit/wpewebkit.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/wpewebkit/wpewebkit.hash b/package/wpewebkit/wpewebkit.hash
index b863a0d705..231bbc447d 100644
--- a/package/wpewebkit/wpewebkit.hash
+++ b/package/wpewebkit/wpewebkit.hash
@@ -1,7 +1,7 @@
-# From https://wpewebkit.org/releases/wpewebkit-2.34.4.tar.xz.sums
-md5  b0f7dcb18acfa94cfb42fea0fe10fb0d  wpewebkit-2.34.4.tar.xz
-sha1  de58481b43a6dba054097f619ee486f7889d7a56  wpewebkit-2.34.4.tar.xz
-sha256  3653ba42dbe22a4e6751b3f7cab8d2ebb2db5b7654c5d135a2f9bedf94778cee  wpewebkit-2.34.4.tar.xz
+# From https://wpewebkit.org/releases/wpewebkit-2.34.6.tar.xz.sums
+md5  c9705270b342474cca28cf51632ccbbe  wpewebkit-2.34.6.tar.xz
+sha1  44ae95de1b5ebf0a2b0ea3630b3677153c597402  wpewebkit-2.34.6.tar.xz
+sha256  301e895c8ed08ce7dccef3192b972f2ccfc2020463244c64069a636f2b05265f  wpewebkit-2.34.6.tar.xz
 
 # Hashes for license files:
 sha256  0b5d3a7cc325942567373b0ecd757d07c132e0ebd7c97bfc63f7e1a76094edb4  Source/WebCore/LICENSE-APPLE
diff --git a/package/wpewebkit/wpewebkit.mk b/package/wpewebkit/wpewebkit.mk
index 8d564d8223..aa04e78623 100644
--- a/package/wpewebkit/wpewebkit.mk
+++ b/package/wpewebkit/wpewebkit.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WPEWEBKIT_VERSION = 2.34.4
+WPEWEBKIT_VERSION = 2.34.6
 WPEWEBKIT_SITE = http://www.wpewebkit.org/releases
 WPEWEBKIT_SOURCE = wpewebkit-$(WPEWEBKIT_VERSION).tar.xz
 WPEWEBKIT_INSTALL_STAGING = YES
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
