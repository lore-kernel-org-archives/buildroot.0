Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9736EC54E67
	for <buildroot@archiver.kernel.org>; Wed, 27 Mar 2024 22:06:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 66868820D0;
	Wed, 27 Mar 2024 22:06:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id f1ryLSDFWzYN; Wed, 27 Mar 2024 22:06:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 64C98820CB
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 64C98820CB;
	Wed, 27 Mar 2024 22:06:54 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4DDE31BF33B
 for <buildroot@lists.busybox.net>; Wed, 27 Mar 2024 22:06:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4640E40517
 for <buildroot@lists.busybox.net>; Wed, 27 Mar 2024 22:06:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HY6qTAjELzY3 for <buildroot@lists.busybox.net>;
 Wed, 27 Mar 2024 22:06:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CCE0941633
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id CCE0941633
 for <buildroot@buildroot.org>; Wed, 27 Mar 2024 22:06:48 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B614D843AA; Wed, 27 Mar 2024 22:06:48 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 27 Mar 2024 23:02:00 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6b6975a87e842c1a56677bb981f516b4797f56f1
X-Git-Newrev: 9ff9d5f8861aac2521e2ab72188bc85e1668def9
X-Patchwork-Hint: ignore
Message-Id: <20240327220648.B614D843AA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/domoticz: bump to version 2024.4
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=9ff9d5f8861aac2521e2ab72188bc85e1668def9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

openzwave dependency is back since
https://github.com/domoticz/domoticz/commit/b0eadaa2ec6d6340df7eeba0e6e373b71ba393fc

https://github.com/domoticz/domoticz/blob/2024.4/History.txt

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
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
