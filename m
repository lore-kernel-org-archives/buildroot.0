Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE04FC4706F
	for <buildroot@archiver.kernel.org>; Mon,  1 Jan 2024 21:23:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 623AD40A9B;
	Mon,  1 Jan 2024 21:23:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 623AD40A9B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Zpwz7TkMZN9b; Mon,  1 Jan 2024 21:23:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6AF28436A0;
	Mon,  1 Jan 2024 21:23:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6AF28436A0
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 12D9A1BF37C
 for <buildroot@lists.busybox.net>; Mon,  1 Jan 2024 21:20:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D7C9E435C3
 for <buildroot@lists.busybox.net>; Mon,  1 Jan 2024 21:15:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D7C9E435C3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hMqqfhZzJE1U for <buildroot@lists.busybox.net>;
 Mon,  1 Jan 2024 21:14:59 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id B2F20435C5
 for <buildroot@buildroot.org>; Mon,  1 Jan 2024 21:14:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B2F20435C5
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9B61983B15; Mon,  1 Jan 2024 21:14:59 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 1 Jan 2024 22:07:58 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e619785d79880a5ae24c6cf4db4c642a555facf6
X-Git-Newrev: 4b2e01cc492b05383ce4be12240e47ab3e9009d4
X-Patchwork-Hint: ignore
Message-Id: <20240101211459.9B61983B15@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/log4cpp: bump to version 1.1.4
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

commit: https://git.buildroot.net/buildroot/commit/?id=4b2e01cc492b05383ce4be12240e47ab3e9009d4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

configure script has been fixed and so autoreconf can be dropped

https://log4cpp.sourceforge.net/#releases

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/log4cpp/log4cpp.hash | 6 +++---
 package/log4cpp/log4cpp.mk   | 5 +----
 2 files changed, 4 insertions(+), 7 deletions(-)

diff --git a/package/log4cpp/log4cpp.hash b/package/log4cpp/log4cpp.hash
index f4084c8112..20b5ade32d 100644
--- a/package/log4cpp/log4cpp.hash
+++ b/package/log4cpp/log4cpp.hash
@@ -1,6 +1,6 @@
 # From http://sourceforge.net/projects/log4cpp/files/log4cpp-1.1.x%20%28new%29/log4cpp-1.1/
-md5  b9e2cee932da987212f2c74b767b4d8b  log4cpp-1.1.3.tar.gz
-sha1  74f0fea7931dc1bc4e5cd34a6318cd2a51322041  log4cpp-1.1.3.tar.gz
+md5  d56ef8240014528c354da5b7e93015ca  log4cpp-1.1.4.tar.gz
+sha1  b32e6ec981a5d75864e1097525e1f502cc242d17  log4cpp-1.1.4.tar.gz
 # Locally computed
-sha256  2cbbea55a5d6895c9f0116a9a9ce3afb86df383cd05c9d6c1a4238e5e5c8f51d  log4cpp-1.1.3.tar.gz
+sha256  696113659e426540625274a8b251052cc04306d8ee5c42a0c7639f39ca90c9d6  log4cpp-1.1.4.tar.gz
 sha256  a190dc9c8043755d90f8b0a75fa66b9e42d4af4c980bf5ddc633f0124db3cee7  log4cpp/COPYING
diff --git a/package/log4cpp/log4cpp.mk b/package/log4cpp/log4cpp.mk
index 8664a54385..53c97e554d 100644
--- a/package/log4cpp/log4cpp.mk
+++ b/package/log4cpp/log4cpp.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LOG4CPP_VERSION_MAJOR = 1.1
-LOG4CPP_VERSION = $(LOG4CPP_VERSION_MAJOR).3
+LOG4CPP_VERSION = $(LOG4CPP_VERSION_MAJOR).4
 LOG4CPP_SITE = http://downloads.sourceforge.net/project/log4cpp/log4cpp-1.1.x%20%28new%29/log4cpp-$(LOG4CPP_VERSION_MAJOR)
 LOG4CPP_SUBDIR = log4cpp
 # The "or later" is indicated in the HTML documentation
@@ -13,9 +13,6 @@ LOG4CPP_LICENSE = LGPL-2.1+
 LOG4CPP_LICENSE_FILES = log4cpp/COPYING
 LOG4CPP_INSTALL_STAGING = YES
 LOG4CPP_CONF_OPTS = --enable-doxygen=no --enable-dot=no
-# needed to fix broken configure script
-LOG4CPP_AUTORECONF = YES
-LOG4CPP_AUTORECONF_OPTS = -I m4
 
 # The default <pkg>_CONFIG_SCRIPTS handling does not apply
 define LOG4CPP_STAGING_CONFIG_SCRIPT_FIXUP
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
