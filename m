Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB319C3DA5D
	for <buildroot@archiver.kernel.org>; Sun, 21 Jul 2024 16:30:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A4EE2606B4;
	Sun, 21 Jul 2024 16:30:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fGZC2JKyfO5M; Sun, 21 Jul 2024 16:30:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 76B7060638
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 76B7060638;
	Sun, 21 Jul 2024 16:30:50 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D14721BF321
 for <buildroot@lists.busybox.net>; Sun, 21 Jul 2024 16:30:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CB7DA40120
 for <buildroot@lists.busybox.net>; Sun, 21 Jul 2024 16:30:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EUZqnHHS8sAx for <buildroot@lists.busybox.net>;
 Sun, 21 Jul 2024 16:30:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5B6CD400F3
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5B6CD400F3
 for <buildroot@buildroot.org>; Sun, 21 Jul 2024 16:30:47 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 481B486F3E; Sun, 21 Jul 2024 16:30:47 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 21 Jul 2024 18:30:18 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 75ec656c36ba2b5bf617acc6e946ef7aa97f948e
X-Git-Newrev: 13c0b7cd08c8300d288409ab88907f97b1a95687
X-Patchwork-Hint: ignore
Message-Id: <20240721163047.481B486F3E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/rabbitmq-c: bump to version 0.14.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=13c0b7cd08c8300d288409ab88907f97b1a95687
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Drop patch (already in version)
- Update hash of README.md (updates unrelated to license:
  https://github.com/alanxz/rabbitmq-c/commit/ea9acb88814a9240327bd27a30cdc06e5b69735c
  https://github.com/alanxz/rabbitmq-c/commit/7dab48f03419661133abdf12d53733a4d4369b76
  https://github.com/alanxz/rabbitmq-c/commit/8f8a320c5a9a58647f2f39d66107e7f116f4bc4a)
- This bump will fix the following build failure without the deprecated
  libopenssl engines raised since commit
  623d3bbe43e9193aa8e3395367d01af59071b859:

  /home/autobuild/autobuild/instance-1/output-1/build/rabbitmq-c-0.13.0/librabbitmq/amqp_openssl.c:602:42: error: 'ENGINE_METHOD_ALL' undeclared (first use in this function)
    602 |   if (ENGINE_set_default(openssl_engine, ENGINE_METHOD_ALL) == 0) {
        |                                          ^~~~~~~~~~~~~~~~~

https://github.com/alanxz/rabbitmq-c/releases/tag/v0.14.0

Fixes: 623d3bbe43e9193aa8e3395367d01af59071b859
 - http://autobuild.buildroot.org/results/b95d080a0de635baaea2f08a888746cddcd1f26e

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...ption-to-read-username-password-from-file.patch | 130 ---------------------
 package/rabbitmq-c/rabbitmq-c.hash                 |   4 +-
 package/rabbitmq-c/rabbitmq-c.mk                   |   5 +-
 3 files changed, 3 insertions(+), 136 deletions(-)

diff --git a/package/rabbitmq-c/0001-Add-option-to-read-username-password-from-file.patch b/package/rabbitmq-c/0001-Add-option-to-read-username-password-from-file.patch
deleted file mode 100644
index 347063cfb3..0000000000
--- a/package/rabbitmq-c/0001-Add-option-to-read-username-password-from-file.patch
+++ /dev/null
@@ -1,130 +0,0 @@
-From 463054383fbeef889b409a7f843df5365288e2a0 Mon Sep 17 00:00:00 2001
-From: Christian Kastner <ckk@kvr.at>
-Date: Tue, 13 Jun 2023 14:21:52 +0200
-Subject: [PATCH] Add option to read username/password from file (#781)
-
-* Add option to read username/password from file
-
-Upstream: https://github.com/alanxz/rabbitmq-c/commit/463054383fbeef889b409a7f843df5365288e2a0
-Signed-off-by: Fabrice Fontaine <fontaine.fabrce@gmail.com>
----
- tools/common.c | 66 ++++++++++++++++++++++++++++++++++++++++++++++++++
- 1 file changed, 66 insertions(+)
-
-diff --git a/tools/common.c b/tools/common.c
-index 73b47e25..7efe557b 100644
---- a/tools/common.c
-+++ b/tools/common.c
-@@ -18,6 +18,11 @@
- #include "compat.h"
- #endif
- 
-+/* For when reading auth data from a file */
-+#define MAXAUTHTOKENLEN 128
-+#define USERNAMEPREFIX "username:"
-+#define PASSWORDPREFIX "password:"
-+
- void die(const char *fmt, ...) {
-   va_list ap;
-   va_start(ap, fmt);
-@@ -125,6 +130,7 @@ static char *amqp_vhost;
- static char *amqp_username;
- static char *amqp_password;
- static int amqp_heartbeat = 0;
-+static char *amqp_authfile;
- #ifdef WITH_SSL
- static int amqp_ssl = 0;
- static char *amqp_cacert = "/etc/ssl/certs/cacert.pem";
-@@ -147,6 +153,8 @@ struct poptOption connect_options[] = {
-      "the password to login with", "password"},
-     {"heartbeat", 0, POPT_ARG_INT, &amqp_heartbeat, 0,
-      "heartbeat interval, set to 0 to disable", "heartbeat"},
-+    {"authfile", 0, POPT_ARG_STRING, &amqp_authfile, 0,
-+     "path to file containing username/password for authentication", "file"},
- #ifdef WITH_SSL
-     {"ssl", 0, POPT_ARG_NONE, &amqp_ssl, 0, "connect over SSL/TLS", NULL},
-     {"cacert", 0, POPT_ARG_STRING, &amqp_cacert, 0,
-@@ -158,6 +166,50 @@ struct poptOption connect_options[] = {
- #endif /* WITH_SSL */
-     {NULL, '\0', 0, NULL, 0, NULL, NULL}};
- 
-+void read_authfile(const char *path) {
-+  size_t n;
-+  FILE *fp = NULL;
-+  char token[MAXAUTHTOKENLEN];
-+
-+  if ((amqp_username = malloc(MAXAUTHTOKENLEN)) == NULL ||
-+      (amqp_password = malloc(MAXAUTHTOKENLEN)) == NULL) {
-+    die("Out of memory");
-+  } else if ((fp = fopen(path, "r")) == NULL) {
-+    die("Could not read auth data file %s", path);
-+  }
-+
-+  if (fgets(token, MAXAUTHTOKENLEN, fp) == NULL ||
-+      strncmp(token, USERNAMEPREFIX, strlen(USERNAMEPREFIX))) {
-+    die("Malformed auth file (missing username)");
-+  }
-+  strncpy(amqp_username, &token[strlen(USERNAMEPREFIX)], MAXAUTHTOKENLEN);
-+  /* Missing newline means token was cut off */
-+  n = strlen(amqp_username);
-+  if (amqp_username[n - 1] != '\n') {
-+    die("Username too long");
-+  } else {
-+    amqp_username[n - 1] = '\0';
-+  }
-+
-+  if (fgets(token, MAXAUTHTOKENLEN, fp) == NULL ||
-+      strncmp(token, PASSWORDPREFIX, strlen(PASSWORDPREFIX))) {
-+    die("Malformed auth file (missing password)");
-+  }
-+  strncpy(amqp_password, &token[strlen(PASSWORDPREFIX)], MAXAUTHTOKENLEN);
-+  /* Missing newline means token was cut off */
-+  n = strlen(amqp_password);
-+  if (amqp_password[n - 1] != '\n') {
-+    die("Password too long");
-+  } else {
-+    amqp_password[n - 1] = '\0';
-+  }
-+
-+  (void)fgetc(fp);
-+  if (!feof(fp)) {
-+    die("Malformed auth file (trailing data)");
-+  }
-+}
-+
- static void init_connection_info(struct amqp_connection_info *ci) {
-   ci->user = NULL;
-   ci->password = NULL;
-@@ -237,6 +289,8 @@ static void init_connection_info(struct amqp_connection_info *ci) {
-   if (amqp_username) {
-     if (amqp_url) {
-       die("--username and --url options cannot be used at the same time");
-+    } else if (amqp_authfile) {
-+      die("--username and --authfile options cannot be used at the same time");
-     }
- 
-     ci->user = amqp_username;
-@@ -245,11 +299,23 @@ static void init_connection_info(struct amqp_connection_info *ci) {
-   if (amqp_password) {
-     if (amqp_url) {
-       die("--password and --url options cannot be used at the same time");
-+    } else if (amqp_authfile) {
-+      die("--password and --authfile options cannot be used at the same time");
-     }
- 
-     ci->password = amqp_password;
-   }
- 
-+  if (amqp_authfile) {
-+    if (amqp_url) {
-+      die("--authfile and --url options cannot be used at the same time");
-+    }
-+
-+    read_authfile(amqp_authfile);
-+    ci->user = amqp_username;
-+    ci->password = amqp_password;
-+  }
-+
-   if (amqp_vhost) {
-     if (amqp_url) {
-       die("--vhost and --url options cannot be used at the same time");
diff --git a/package/rabbitmq-c/rabbitmq-c.hash b/package/rabbitmq-c/rabbitmq-c.hash
index 66768ef34f..3eed467826 100644
--- a/package/rabbitmq-c/rabbitmq-c.hash
+++ b/package/rabbitmq-c/rabbitmq-c.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  8b224e41bba504fc52b02f918d8df7e4bf5359d493cbbff36c06078655c676e6  rabbitmq-c-0.13.0.tar.gz
+sha256  839b28eae20075ac58f45925fe991d16a3138cbde015db0ee11df1acb1c493df  rabbitmq-c-0.14.0.tar.gz
 sha256  3111fdaa26e86dd844d7c6cbb2723d0ed31702a840978ef116c86963c2429b0f  LICENSE
-sha256  defee723621ff1c556539af42780f449f258e47e3dcc8254bcbc095863f02b7c  README.md
+sha256  8d661859c72634a4f9315f134ba00d193e1b7308940bc44e82be9a376a490a06  README.md
diff --git a/package/rabbitmq-c/rabbitmq-c.mk b/package/rabbitmq-c/rabbitmq-c.mk
index 5a0775f353..4545a43a13 100644
--- a/package/rabbitmq-c/rabbitmq-c.mk
+++ b/package/rabbitmq-c/rabbitmq-c.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RABBITMQ_C_VERSION = 0.13.0
+RABBITMQ_C_VERSION = 0.14.0
 RABBITMQ_C_SITE = $(call github,alanxz,rabbitmq-c,v$(RABBITMQ_C_VERSION))
 RABBITMQ_C_LICENSE = MIT
 RABBITMQ_C_LICENSE_FILES = LICENSE README.md
@@ -14,9 +14,6 @@ RABBITMQ_C_CONF_OPTS = \
 	-DBUILD_API_DOCS=OFF \
 	-DBUILD_TOOLS_DOCS=OFF
 
-# 0001-Add-option-to-read-username-password-from-file.patch
-RABBITMQ_C_IGNORE_CVES += CVE-2023-35789
-
 # BUILD_SHARED_LIBS is handled in pkg-cmake.mk as it is a generic cmake variable
 ifeq ($(BR2_SHARED_STATIC_LIBS),y)
 RABBITMQ_C_CONF_OPTS += -DBUILD_STATIC_LIBS=ON
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
