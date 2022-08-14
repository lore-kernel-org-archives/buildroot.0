Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95AB2C6FA83
	for <buildroot@archiver.kernel.org>; Sun, 11 Sep 2022 08:48:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 25E9C80B24;
	Sun, 11 Sep 2022 08:48:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 25E9C80B24
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xrRkutS8h3br; Sun, 11 Sep 2022 08:48:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1F50E83E68;
	Sun, 11 Sep 2022 08:48:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1F50E83E68
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4A3EB1BF990
 for <buildroot@lists.busybox.net>; Sun, 11 Sep 2022 08:48:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 22EE183EC0
 for <buildroot@lists.busybox.net>; Sun, 11 Sep 2022 08:48:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 22EE183EC0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UUt6uu0cNJdM for <buildroot@lists.busybox.net>;
 Sun, 11 Sep 2022 08:48:23 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 58E1183EAF
 for <buildroot@buildroot.org>; Sun, 11 Sep 2022 08:48:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 58E1183EAF
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 47885835E4; Sun, 11 Sep 2022 08:48:23 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 14 Aug 2022 12:04:39 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7ff21f8d4b94e859ce95aa24ad361f2c5df9e284
X-Git-Newrev: d9fcbb28ef62e9a3bf947cad7443b46c056bac29
X-Patchwork-Hint: ignore
Message-Id: <20220911084823.47885835E4@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/dbus-broker: bump to release 32
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

commit: https://git.buildroot.net/buildroot/commit/?id=d9fcbb28ef62e9a3bf947cad7443b46c056bac29
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The new releases mostly contain bug fixes. The build system has been
prepared to use AppArmor library, but since actual support is still
missing it is not worth yet to enable build infrastructure in
Buildroot.

Signed-off-by: Stefan Agner <stefan@agner.ch>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/dbus-broker/dbus-broker.hash | 16 +++++++++++++++-
 package/dbus-broker/dbus-broker.mk   | 16 ++++++++--------
 2 files changed, 23 insertions(+), 9 deletions(-)

diff --git a/package/dbus-broker/dbus-broker.hash b/package/dbus-broker/dbus-broker.hash
index 26ebab7ac1..f6c2cbe160 100644
--- a/package/dbus-broker/dbus-broker.hash
+++ b/package/dbus-broker/dbus-broker.hash
@@ -1,3 +1,17 @@
 # Locally calculated
-sha256  4eca425db52b7ab1027153e93fea9b3f11759db9e93ffbf88759b73ddfb8026a  dbus-broker-29.tar.xz
+sha256  bea7f653e7251063c5f427e9e3f93562d38a0d8667ae6d49fb56f113605985de  dbus-broker-32.tar.xz
 sha256  3cda3630283eda0eab825abe5ac84d191248c6b3fe1c232a118124959b96c6a4  LICENSE
+sha256  20ea1f96abc15553695c6725bb3dcabff4b43b85b7ca7d675a2b8860e3b01f87  subprojects/libcdvar-1/AUTHORS
+sha256  8153c478102dc209b30dd4627cf5bb3596263f99692bf3eec174b1e17bbf8a3b  subprojects/libcdvar-1/README.md
+sha256  6d63b1fb794d4c02622595ad30357c90398aa883864e5a275479139c8f03208f  subprojects/libcini-1/AUTHORS
+sha256  fc92d49d69aa9aa91919bac79242abee3eda27a567b4573ed3690b5cef0cf2fd  subprojects/libcini-1/README.md
+sha256  a30deb6dde90366bfaf054bc689a209b974f80c1cceac950c4378c14abaa243a  subprojects/libclist-3/AUTHORS
+sha256  75f4c76441ac69ba9474bb7ad0958389ca0f1f2fc90c5f7b033be3461652f5a6  subprojects/libclist-3/README.md
+sha256  23f24eeaaded5fedd6e7840b6f7b73838f9a4e2112ad6a12fe1ef958f73d0214  subprojects/libcrbtree-3/AUTHORS
+sha256  05113a24aca4c537819dd0d91b95b13edb85bea4b6a77a6d9269becb397ed374  subprojects/libcrbtree-3/README.md
+sha256  6d63b1fb794d4c02622595ad30357c90398aa883864e5a275479139c8f03208f  subprojects/libcshquote-1/AUTHORS
+sha256  cad109dd33062518a437ebee145ba863fe0e047d4e3db9c28b0bf3c6148f10c2  subprojects/libcshquote-1/README.md
+sha256  32913ba08dc041f3f4ca361fc0d68014120e1c612772aabbcc901556df499ce5  subprojects/libcstdaux-1/AUTHORS
+sha256  7c4b6c325b0bc02150089112f65132ee999b0f44500b73d1fc06d96c93161037  subprojects/libcstdaux-1/README.md
+sha256  7e660796fea0400a1a9a539226c345b3c656a745a334e323e33258de7864e985  subprojects/libcutf8-1/AUTHORS
+sha256  106099cc1c488cbf8911f56da7977a955f6b27a7bb5b815985e59d9fae0e6fe7  subprojects/libcutf8-1/README.md
diff --git a/package/dbus-broker/dbus-broker.mk b/package/dbus-broker/dbus-broker.mk
index 22c5e8d8b7..9b8bf361b5 100644
--- a/package/dbus-broker/dbus-broker.mk
+++ b/package/dbus-broker/dbus-broker.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DBUS_BROKER_VERSION = 29
+DBUS_BROKER_VERSION = 32
 DBUS_BROKER_SOURCE = dbus-broker-$(DBUS_BROKER_VERSION).tar.xz
 DBUS_BROKER_SITE = https://github.com/bus1/dbus-broker/releases/download/v$(DBUS_BROKER_VERSION)
 
@@ -15,13 +15,13 @@ DBUS_BROKER_LICENSE = \
 # the AUTHORS and README, so keep both
 DBUS_BROKER_LICENSE_FILES = \
 	LICENSE \
-	subprojects/c-dvar/AUTHORS subprojects/c-dvar/README.md \
-	subprojects/c-ini/AUTHORS subprojects/c-ini/README.md \
-	subprojects/c-list/AUTHORS subprojects/c-list/README.md \
-	subprojects/c-rbtree/AUTHORS subprojects/c-rbtree/README.md \
-	subprojects/c-shquote/AUTHORS subprojects/c-shquote/README.md \
-	subprojects/c-stdaux/AUTHORS subprojects/c-stdaux/README.md \
-	subprojects/c-utf8/AUTHORS subprojects/c-utf8/README.md
+	subprojects/libcdvar-1/AUTHORS subprojects/libcdvar-1/README.md \
+	subprojects/libcini-1/AUTHORS subprojects/libcini-1/README.md \
+	subprojects/libclist-3/AUTHORS subprojects/libclist-3/README.md \
+	subprojects/libcrbtree-3/AUTHORS subprojects/libcrbtree-3/README.md \
+	subprojects/libcshquote-1/AUTHORS subprojects/libcshquote-1/README.md \
+	subprojects/libcstdaux-1/AUTHORS subprojects/libcstdaux-1/README.md \
+	subprojects/libcutf8-1/AUTHORS subprojects/libcutf8-1/README.md
 
 DBUS_BROKER_DEPENDENCIES = expat systemd
 DBUS_BROKER_CONF_OPTS = -Dlauncher=true
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
