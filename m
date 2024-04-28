Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06413C10F1A
	for <buildroot@archiver.kernel.org>; Sun, 28 Apr 2024 11:20:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C0325407E0;
	Sun, 28 Apr 2024 11:20:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KJ_tpf3B_BaL; Sun, 28 Apr 2024 11:20:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DE1A84082C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id DE1A84082C;
	Sun, 28 Apr 2024 11:20:17 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 27CA71BF5DF
 for <buildroot@lists.busybox.net>; Sun, 28 Apr 2024 11:20:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5C2B34018B
 for <buildroot@lists.busybox.net>; Sun, 28 Apr 2024 11:20:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MdGf66AU9uPk for <buildroot@lists.busybox.net>;
 Sun, 28 Apr 2024 11:20:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 94FBE40378
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 94FBE40378
 for <buildroot@buildroot.org>; Sun, 28 Apr 2024 11:20:05 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8125A86131; Sun, 28 Apr 2024 11:20:05 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 28 Apr 2024 13:16:28 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 848c672254e1fb95669dcb48c82ed94ed1048280
X-Git-Newrev: 8a9ca36ec6246742931ec3fffc84b069c0113e90
X-Patchwork-Hint: ignore
Message-Id: <20240428112005.8125A86131@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/domoticz: bump to
 version 2024.4
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=8a9ca36ec6246742931ec3fffc84b069c0113e90
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

openzwave dependency is back since
https://github.com/domoticz/domoticz/commit/b0eadaa2ec6d6340df7eeba0e6e373b71ba393fc

https://github.com/domoticz/domoticz/blob/2024.4/History.txt

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
(cherry picked from commit 9ff9d5f8861aac2521e2ab72188bc85e1668def9)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/domoticz/domoticz.hash |  2 +-
 package/domoticz/domoticz.mk   | 12 +++++++++++-
 2 files changed, 12 insertions(+), 2 deletions(-)

diff --git a/package/domoticz/domoticz.hash b/package/domoticz/domoticz.hash
index 546177332e..ae86a67b79 100644
--- a/package/domoticz/domoticz.hash
+++ b/package/domoticz/domoticz.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  9effa792f856d8d9036c53b9ae500ee3bffa1488addf9d6f1fe4bf960f73f740  domoticz-2024.1.tar.gz
+sha256  d87113d7cacd0b52b9126fcc1ef24e140a4f7042d5bc6262e86e4b4752f5cf38  domoticz-2024.4.tar.gz
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  License.txt
diff --git a/package/domoticz/domoticz.mk b/package/domoticz/domoticz.mk
index 88bad15427..95d3335adb 100644
--- a/package/domoticz/domoticz.mk
+++ b/package/domoticz/domoticz.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DOMOTICZ_VERSION = 2024.1
+DOMOTICZ_VERSION = 2024.4
 DOMOTICZ_SITE = $(call github,domoticz,domoticz,$(DOMOTICZ_VERSION))
 DOMOTICZ_LICENSE = GPL-3.0
 DOMOTICZ_LICENSE_FILES = License.txt
@@ -51,6 +51,16 @@ else
 DOMOTICZ_CONF_OPTS += -DWITH_LIBUSB=OFF
 endif
 
+ifeq ($(BR2_PACKAGE_OPENZWAVE),y)
+DOMOTICZ_DEPENDENCIES += openzwave
+
+# Due to the dependency on mosquitto, domoticz depends on
+# !BR2_STATIC_LIBS so set USE_STATIC_OPENZWAVE to OFF otherwise
+# domoticz will not find the openzwave library as it searches by
+# default a static library.
+DOMOTICZ_CONF_OPTS += -DUSE_STATIC_OPENZWAVE=OFF
+endif
+
 ifeq ($(BR2_PACKAGE_PYTHON3),y)
 DOMOTICZ_DEPENDENCIES += python3
 DOMOTICZ_CONF_OPTS += -DUSE_PYTHON=ON
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
