Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A8F3C47073
	for <buildroot@archiver.kernel.org>; Mon,  1 Jan 2024 21:19:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7781A4368F;
	Mon,  1 Jan 2024 21:19:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7781A4368F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HQOOLXq8JpEm; Mon,  1 Jan 2024 21:19:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4E3224168A;
	Mon,  1 Jan 2024 21:19:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4E3224168A
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 252A41BF3D5
 for <buildroot@lists.busybox.net>; Mon,  1 Jan 2024 21:18:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 90A80835D9
 for <buildroot@lists.busybox.net>; Mon,  1 Jan 2024 21:08:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 90A80835D9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Re8TUzv1RiVZ for <buildroot@lists.busybox.net>;
 Mon,  1 Jan 2024 21:08:12 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 30D9B813B9
 for <buildroot@buildroot.org>; Mon,  1 Jan 2024 21:06:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 30D9B813B9
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 066F483B1D; Mon,  1 Jan 2024 21:06:33 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 1 Jan 2024 22:05:42 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: bd3c51a295dca94d781dced8cacfbd0ca51ecba5
X-Git-Newrev: 53630c2026fa8540bdee64ebf39352171adb5c77
X-Patchwork-Hint: ignore
Message-Id: <20240101210633.066F483B1D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libxml2: bump to version 2.12.3
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=53630c2026fa8540bdee64ebf39352171adb5c77
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This bump will fix the following build failure with libmodsecurity (and
a lot of other packages) raised since bump of libxml2 to version 2.12.1
in commit d8ac52108c12f0fcc9641b63e7922009270f96c6:

modsecurity.cc: In constructor 'modsecurity::ModSecurity::ModSecurity()':
modsecurity.cc:89:5: error: 'xmlInitParser' was not declared in this scope
   89 |     xmlInitParser();
      |     ^~~~~~~~~~~~~

https://gitlab.gnome.org/GNOME/libxml2/-/blob/v2.12.3/NEWS

Fixes:
 - http://autobuild.buildroot.org/results/d6749bacf6c7c04a74e136585d36bc731716f6fd

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libxml2/libxml2.hash | 4 ++--
 package/libxml2/libxml2.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libxml2/libxml2.hash b/package/libxml2/libxml2.hash
index a3b2230b8a..670ff80a41 100644
--- a/package/libxml2/libxml2.hash
+++ b/package/libxml2/libxml2.hash
@@ -1,4 +1,4 @@
-# From https://download.gnome.org/sources/libxml2/2.12/libxml2-2.12.1.sha256sum
-sha256  8982b9ccdf7f456e30d8f7012d50858c6623e495333b6191def455c7e95427eb  libxml2-2.12.1.tar.xz
+# From https://download.gnome.org/sources/libxml2/2.12/libxml2-2.12.3.sha256sum
+sha256  8c8f1092340a89ff32bc44ad5c9693aff9bc8a7a3e161bb239666e5d15ac9aaa  libxml2-2.12.3.tar.xz
 # License files, locally calculated
 sha256  7fb0a66f3989f9bd5c7e5438a3de02cd4a7a47dde0aea2f7ea2ba2ff454ee6a4  Copyright
diff --git a/package/libxml2/libxml2.mk b/package/libxml2/libxml2.mk
index 5606532b62..1893206ccb 100644
--- a/package/libxml2/libxml2.mk
+++ b/package/libxml2/libxml2.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBXML2_VERSION_MAJOR = 2.12
-LIBXML2_VERSION = $(LIBXML2_VERSION_MAJOR).1
+LIBXML2_VERSION = $(LIBXML2_VERSION_MAJOR).3
 LIBXML2_SOURCE = libxml2-$(LIBXML2_VERSION).tar.xz
 LIBXML2_SITE = \
 	https://download.gnome.org/sources/libxml2/$(LIBXML2_VERSION_MAJOR)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
