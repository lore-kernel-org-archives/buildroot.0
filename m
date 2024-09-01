Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE857C54FC6
	for <buildroot@archiver.kernel.org>; Sun,  1 Sep 2024 14:58:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id BC2CB405B1;
	Sun,  1 Sep 2024 14:58:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GAPaWTgy3mIG; Sun,  1 Sep 2024 14:58:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5E66E40538
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5E66E40538;
	Sun,  1 Sep 2024 14:58:13 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 962CB1BF2B6
 for <buildroot@lists.busybox.net>; Sun,  1 Sep 2024 14:57:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7BA544033B
 for <buildroot@lists.busybox.net>; Sun,  1 Sep 2024 14:57:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VGW7u7z8XH2F for <buildroot@lists.busybox.net>;
 Sun,  1 Sep 2024 14:57:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 62C8740340
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 62C8740340
 for <buildroot@buildroot.org>; Sun,  1 Sep 2024 14:57:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5131D8691B; Sun,  1 Sep 2024 14:57:54 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 1 Sep 2024 16:52:38 +0200
X-Git-Refname: refs/heads/2024.05.x
X-Git-Oldrev: 14db9f6fc9b033d7cbfe8b526ee1adabb9122055
X-Git-Newrev: 0cd5f986c3550d425369fe0061ea9dc0cbf25b4d
X-Patchwork-Hint: ignore
Message-Id: <20240901145754.5131D8691B@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.05.x] package/open-iscsi:
 open-isns is optional, not mandatory
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

commit: https://git.buildroot.net/buildroot/commit/?id=0cd5f986c3550d425369fe0061ea9dc0cbf25b4d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.05.x

open-isns is optional, not mandatory, since bump to version 2.1.9 in
commit 2314928cf828ff02939b9c0041964c3ee2dd907d and
https://github.com/open-iscsi/open-iscsi/commit/713524df809396e11f42d7691bd8ead2ffc1ca6b

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 948b1830423421e087f6aa4923a37ce077ed5904)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/open-iscsi/Config.in     | 1 -
 package/open-iscsi/open-iscsi.mk | 9 ++++++++-
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/package/open-iscsi/Config.in b/package/open-iscsi/Config.in
index e55bbfd867..01d83615c9 100644
--- a/package/open-iscsi/Config.in
+++ b/package/open-iscsi/Config.in
@@ -5,7 +5,6 @@ config BR2_PACKAGE_OPEN_ISCSI
 	depends on !BR2_STATIC_LIBS # kmod
 	select BR2_PACKAGE_KMOD
 	select BR2_PACKAGE_OPENSSL
-	select BR2_PACKAGE_OPEN_ISNS
 	select BR2_PACKAGE_UTIL_LINUX
 	select BR2_PACKAGE_UTIL_LINUX_LIBMOUNT
 	help
diff --git a/package/open-iscsi/open-iscsi.mk b/package/open-iscsi/open-iscsi.mk
index d1f40d3e20..1266db3d3f 100644
--- a/package/open-iscsi/open-iscsi.mk
+++ b/package/open-iscsi/open-iscsi.mk
@@ -9,10 +9,17 @@ OPEN_ISCSI_SITE = $(call github,open-iscsi,open-iscsi,$(OPEN_ISCSI_VERSION))
 OPEN_ISCSI_LICENSE = GPL-2.0+, GPL-3.0+, LGPL-3.0+
 OPEN_ISCSI_LICENSE_FILES = COPYING README libopeniscsiusr/COPYING
 OPEN_ISCSI_CPE_ID_VALID = YES
-OPEN_ISCSI_DEPENDENCIES = kmod open-isns openssl util-linux
+OPEN_ISCSI_DEPENDENCIES = kmod openssl util-linux
 
 OPEN_ISCSI_CONF_OPTS = -Ddbroot=/var/lib/iscsi
 
+ifeq ($(BR2_PACKAGE_OPEN_ISNS),y)
+OPEN_ISCSI_DEPENDENCIES += open-isns
+OPEN_ISCSI_CONF_OPTS += -Disns=enabled
+else
+OPEN_ISCSI_CONF_OPTS += -Disns=disabled
+endif
+
 ifeq ($(BR2_PACKAGE_SYSTEMD),y)
 OPEN_ISCSI_DEPENDENCIES += systemd
 OPEN_ISCSI_CONF_OPTS += -Dno_systemd=false
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
