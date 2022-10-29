Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D8CEC433FE
	for <buildroot@archiver.kernel.org>; Sat, 29 Oct 2022 16:23:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E11EF4032E;
	Sat, 29 Oct 2022 16:23:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E11EF4032E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BLLObGAGkfKa; Sat, 29 Oct 2022 16:23:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D35524024E;
	Sat, 29 Oct 2022 16:23:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D35524024E
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8B0051BF954
 for <buildroot@lists.busybox.net>; Sat, 29 Oct 2022 16:23:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6689660640
 for <buildroot@lists.busybox.net>; Sat, 29 Oct 2022 16:23:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6689660640
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LlXZTKM4w8Te for <buildroot@lists.busybox.net>;
 Sat, 29 Oct 2022 16:23:15 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 835DD60601
 for <buildroot@buildroot.org>; Sat, 29 Oct 2022 16:23:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 835DD60601
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6F1F48742D; Sat, 29 Oct 2022 16:23:15 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 29 Oct 2022 18:18:37 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5f779a2071509dbb11e9bb8662e9ae4b33d39ce3
X-Git-Newrev: 8acac82278fe3899fdaeff324e405baa4390e951
X-Patchwork-Hint: ignore
Message-Id: <20221029162315.6F1F48742D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/atftp: bump to version 0.8.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=8acac82278fe3899fdaeff324e405baa4390e951
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- No configure script in official tarball
- pcre has been replaced by pcre2 since
  https://github.com/madmartin/atftp/commit/5739ed9507e441dd4f699bfe19401544d393b5ef
  https://github.com/madmartin/atftp/commit/fdf479c31bc626013bc673e2493348b4993bcbae

https://github.com/madmartin/atftp/blob/v0.8.0/Changelog

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/atftp/atftp.hash | 2 +-
 package/atftp/atftp.mk   | 8 +++++---
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/package/atftp/atftp.hash b/package/atftp/atftp.hash
index 6b0d9a5879..b335456f33 100644
--- a/package/atftp/atftp.hash
+++ b/package/atftp/atftp.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  93c87a4fb18218414e008e01c995dadd231ba4c752d0f894b34416d1e6d3038a  atftp-0.7.5.tar.gz
+sha256  df2aa089c7670f9eab40e5598e5d2cb6a582dc5182926ea50b4d690e4e37f316  atftp-0.8.0.tar.gz
 sha256  86dc744860e6dfacfeba2f33fea908db03fe67c7e37a878285b7aae8e4596735  LICENSE
diff --git a/package/atftp/atftp.mk b/package/atftp/atftp.mk
index 70ef4c0fae..288501bc11 100644
--- a/package/atftp/atftp.mk
+++ b/package/atftp/atftp.mk
@@ -4,12 +4,14 @@
 #
 ################################################################################
 
-ATFTP_VERSION = 0.7.5
+ATFTP_VERSION = 0.8.0
 ATFTP_SITE = http://sourceforge.net/projects/atftp/files
 ATFTP_LICENSE = GPL-2.0+
 ATFTP_LICENSE_FILES = LICENSE
 ATFTP_CPE_ID_VENDOR = atftp_project
 ATFTP_SELINUX_MODULES = tftp
+# No configure in tarball
+ATFTP_AUTORECONF = YES
 ATFTP_CONF_OPTS = --disable-libwrap --disable-mtftp
 # For static we need to explicitly link against libpthread
 ATFTP_LIBS = -lpthread
@@ -27,8 +29,8 @@ else
 ATFTP_CONF_OPTS += --disable-libreadline
 endif
 
-ifeq ($(BR2_PACKAGE_PCRE),y)
-ATFTP_DEPENDENCIES += pcre
+ifeq ($(BR2_PACKAGE_PCRE2),y)
+ATFTP_DEPENDENCIES += pcre2
 ATFTP_CONF_OPTS += --enable-libpcre
 else
 ATFTP_CONF_OPTS += --disable-libpcre
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
