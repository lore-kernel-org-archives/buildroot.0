Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A95D2C49EA1
	for <buildroot@archiver.kernel.org>; Sat,  3 Aug 2024 18:29:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7B1CC403A5;
	Sat,  3 Aug 2024 18:29:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0F3-GfDhbbCO; Sat,  3 Aug 2024 18:29:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1266B403B1
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1266B403B1;
	Sat,  3 Aug 2024 18:29:26 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 81A291BF364
 for <buildroot@lists.busybox.net>; Sat,  3 Aug 2024 18:29:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 78CB460618
 for <buildroot@lists.busybox.net>; Sat,  3 Aug 2024 18:29:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Yv31JhI1eF-t for <buildroot@lists.busybox.net>;
 Sat,  3 Aug 2024 18:29:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 95A196060D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 95A196060D
 for <buildroot@buildroot.org>; Sat,  3 Aug 2024 18:29:13 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 24DAC83C64; Sat,  3 Aug 2024 18:29:13 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 3 Aug 2024 20:26:31 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 45651cdb851bcd5af06bb94d824b078b03d4f187
X-Git-Newrev: 7165533a3f0e2f3c4bcdcd481a844f5a86a46a40
X-Patchwork-Hint: ignore
Message-Id: <20240803182913.24DAC83C64@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/samba4: bump version to 4.20.3
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

commit: https://git.buildroot.net/buildroot/commit/?id=7165533a3f0e2f3c4bcdcd481a844f5a86a46a40
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Rebased patch 0001.

Release notes:
https://www.samba.org/samba/history/samba-4.20.3.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...uild-find-pre-built-heimdal-build-tools-in-case-of-.patch | 12 ++++++------
 package/samba4/samba4.hash                                   |  4 ++--
 package/samba4/samba4.mk                                     |  2 +-
 3 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/package/samba4/0001-build-find-pre-built-heimdal-build-tools-in-case-of-.patch b/package/samba4/0001-build-find-pre-built-heimdal-build-tools-in-case-of-.patch
index 1c4de6a02e..eb0ea099b7 100644
--- a/package/samba4/0001-build-find-pre-built-heimdal-build-tools-in-case-of-.patch
+++ b/package/samba4/0001-build-find-pre-built-heimdal-build-tools-in-case-of-.patch
@@ -32,8 +32,8 @@ and hence the check, in bundled mode.
 BUG: https://bugzilla.samba.org/show_bug.cgi?id=14164
 
 Signed-off-by: Uri Simchoni <uri@samba.org>
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
-[Bernd: rebased for version 4.11.13 & 4.17.7]
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+[Bernd: rebased for version 4.11.13, 4.17.7 & 4.20.3]
 ---
  wscript_configure_embedded_heimdal | 11 +++++++++++
  wscript_configure_system_heimdal   | 11 -----------
@@ -43,10 +43,10 @@ diff --git a/wscript_configure_embedded_heimdal b/wscript_configure_embedded_hei
 index 8c55ae2..4fdae80 100644
 --- a/wscript_configure_embedded_heimdal
 +++ b/wscript_configure_embedded_heimdal
-@@ -6,3 +6,14 @@
- 
- conf.define('USING_EMBEDDED_HEIMDAL', 1)
- conf.RECURSE('third_party/heimdal_build')
+@@ -13,3 +13,14 @@
+ # when this will be available also in
+ # system libraries...
+ conf.define('HAVE_CLIENT_GSS_C_CHANNEL_BOUND_FLAG', 1)
 +
 +def check_system_heimdal_binary(name):
 +    if conf.LIB_MAY_BE_BUNDLED(name):
diff --git a/package/samba4/samba4.hash b/package/samba4/samba4.hash
index 353736f3b2..d2512f2e0a 100644
--- a/package/samba4/samba4.hash
+++ b/package/samba4/samba4.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-# https://download.samba.org/pub/samba/stable/samba-4.20.2.tar.asc
-sha256  f969ffed58ccf3e85cbbcc0e33a1726d025c2b40f42a653b1125b82b92d2e0e5  samba-4.20.2.tar.gz
+# https://download.samba.org/pub/samba/stable/samba-4.20.3.tar.asc
+sha256  afd5a9bb03e5c921c4c1d4e4b4fa6ea16cf798d94e5e5bffb9fd61716641cf30  samba-4.20.3.tar.gz
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/samba4/samba4.mk b/package/samba4/samba4.mk
index ec0ffd70bf..d48a02140f 100644
--- a/package/samba4/samba4.mk
+++ b/package/samba4/samba4.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SAMBA4_VERSION = 4.20.2
+SAMBA4_VERSION = 4.20.3
 SAMBA4_SITE = https://download.samba.org/pub/samba/stable
 SAMBA4_SOURCE = samba-$(SAMBA4_VERSION).tar.gz
 SAMBA4_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
