Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7495CD3424
	for <buildroot@archiver.kernel.org>; Sun,  3 May 2026 14:50:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8E54884233;
	Sun,  3 May 2026 14:50:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UCKGuAzvAtFE; Sun,  3 May 2026 14:50:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B6136840A4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777819824;
	bh=xb2PuK4RaWBNj91MMbRYGz75EBjfiHNQFko6Dl/r6qw=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=AAGAI+03mhwQA0e87NsTgklVLg84/NplO0yaQmAbQDBSWZMMtceUvZ1dektQ91412
	 4WGEihAVQ8bf1oyezgO2bgXzcTEhQUL5ea499kLovGuXXXU/iga4LSKApGdRbZ8Dzy
	 NLwMllaxVVh84g6ezIiIJfO+IMwEX5rZ5C6KZ3NIfDgLDN4+QV0h+0emwz/RFzXGlg
	 Ne7yF/n/K6S1IoQZCcCToAUPmx9m5TLcVg7cHe//smE3u0y4AL8iBwkuBdn3Q1qmRk
	 Q+kVU6F5STqHfWVxr7WnlsWEHR44mAqVPtU1EG7upC9mtSruZ3U69ArRvHUb1Zr9Rp
	 byMlFBpIA9BVw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B6136840A4;
	Sun,  3 May 2026 14:50:24 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 69C56127
 for <buildroot@buildroot.org>; Sun,  3 May 2026 14:50:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 67F6D40BF1
 for <buildroot@buildroot.org>; Sun,  3 May 2026 14:50:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id b61scAQzughl for <buildroot@buildroot.org>;
 Sun,  3 May 2026 14:50:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 81E9D40A95
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 81E9D40A95
 for <buildroot@buildroot.org>; Sun,  3 May 2026 14:50:22 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4AB6283FC0; Sun,  3 May 2026 14:50:22 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 3 May 2026 16:48:23 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e2db3fda4c6ad481cf4d0f31aef24e0b969d2358
X-Git-Newrev: 6b2e8baf2e14217292f485c6db40046a53bd1eca
X-Patchwork-Hint: ignore
Message-Id: <20260503145022.4AB6283FC0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-bitarray: bump version to
 3.8.1
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/6b2e8baf2e14217292f485c6db40046a53bd1eca
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/ilanschnell/bitarray/blob/3.8.1/CHANGE_LOG

Updated license hash due to copyright year bump:
https://github.com/ilanschnell/bitarray/commit/730c524980371b6f6ff2a455d9a39f8272eb9c3f

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-bitarray/python-bitarray.hash | 6 +++---
 package/python-bitarray/python-bitarray.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-bitarray/python-bitarray.hash b/package/python-bitarray/python-bitarray.hash
index dee6613e69..990dda1348 100644
--- a/package/python-bitarray/python-bitarray.hash
+++ b/package/python-bitarray/python-bitarray.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/bitarray/json
-md5  eedc882e4497c9b281f95af354f728d9  bitarray-3.8.0.tar.gz
-sha256  3eae38daffd77c9621ae80c16932eea3fb3a4af141fb7cc724d4ad93eff9210d  bitarray-3.8.0.tar.gz
+md5  7199aad3582d77d568cd673a3477a6f6  bitarray-3.8.1.tar.gz
+sha256  f90bb3c680804ec9630bcf8c0965e54b4de84d33b17d7da57c87c30f0c64c6f5  bitarray-3.8.1.tar.gz
 # Locally computed sha256 checksums
-sha256  a554c25090ad5a5ea8ad35629dacffbb4d887234b011550218a5a1f9090e5274  LICENSE
+sha256  e19b1180b6ee73307a8545716be9b36318cf4f926aaf3eb43f7fde3396a102dd  LICENSE
diff --git a/package/python-bitarray/python-bitarray.mk b/package/python-bitarray/python-bitarray.mk
index 00b9a98d4b..bdfe0494ee 100644
--- a/package/python-bitarray/python-bitarray.mk
+++ b/package/python-bitarray/python-bitarray.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_BITARRAY_VERSION = 3.8.0
+PYTHON_BITARRAY_VERSION = 3.8.1
 PYTHON_BITARRAY_SOURCE = bitarray-$(PYTHON_BITARRAY_VERSION).tar.gz
-PYTHON_BITARRAY_SITE = https://files.pythonhosted.org/packages/95/06/92fdc84448d324ab8434b78e65caf4fb4c6c90b4f8ad9bdd4c8021bfaf1e
+PYTHON_BITARRAY_SITE = https://files.pythonhosted.org/packages/fc/47/b5da717e7bbe97a6dc4c986f053ca55fd3276078d78f68f9e8b417d1425a
 PYTHON_BITARRAY_SETUP_TYPE = setuptools
 PYTHON_BITARRAY_LICENSE = Python-2.0
 PYTHON_BITARRAY_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
