Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21898CF45BD
	for <buildroot@archiver.kernel.org>; Mon, 12 Jan 2026 17:47:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9903683EF4;
	Mon, 12 Jan 2026 17:47:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 07S5nBanFveZ; Mon, 12 Jan 2026 17:47:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9D20F83EF7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768240026;
	bh=8DyoNx4poXX3DooUEtW4tBK7I0Xym7A4lDsxZFy0ejg=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=otLJXwwmeNr7ejV4fadW5jTnDulf12HWcnhsDUoJbpZ5qTshiPGDbionnl43W0UCw
	 mzU2br1W8xLKps9np/A6BcIDTaLnwxdqqmm6DV3f0S+bsVr9w6VwN+qRf3dBZTtIft
	 cUsCax9unrbFVIXvj2Iby+9iUsTK4IuMA6bB30d4CEHfEVZJZZat/SxY5P2xzaVxhV
	 sXrVrvDBjjjMw/JDV/FsTAFbHTxRHa+E+7JKWJBVqQ0Ja9ywMsm2A7IF6l9m7NybJq
	 4UhNh3Il5B+D9CdTqfC22q2TCCLrxBg6rFwfBVV0BTF8b4bsoWzB9OPZsuwfap6fhI
	 M5KhagV8ZCDxA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9D20F83EF7;
	Mon, 12 Jan 2026 17:47:06 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 74FB918D
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 17:47:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 664A983EF7
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 17:47:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Qw0AZYds5TMo for <buildroot@buildroot.org>;
 Mon, 12 Jan 2026 17:47:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0E10583EF4
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0E10583EF4
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 17:47:03 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id F015F884BC; Mon, 12 Jan 2026 17:47:02 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 12 Jan 2026 18:23:40 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d3e863987140487135316cb1187c7fd3c0c289d5
X-Git-Newrev: 706038833a37f9a54fa4a0227d19056df2a6ac11
X-Patchwork-Hint: ignore
Message-Id: <20260112174702.F015F884BC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/uqmi: bump version to git
 7914da43cd
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
Content-Type: multipart/mixed; boundary="===============7348088875189294178=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============7348088875189294178==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=706038833a37f9a54fa4a0227d19056df2a6ac11
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Removed patch 0001, not needed anymore due to upstream commit
https://git.openwrt.org/?p=project/uqmi.git;a=commitdiff;h=ebfe8b47b366092457df7a7f631c8f746e8455fd

Updated license file name due to upstream rename:
https://git.openwrt.org/?p=project/uqmi.git;a=commitdiff;h=a043a7407bf602cac66c9e7bb2b81aa2e50a6993

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
[Julien:
 - remove .checkpackageignore to fix check-package error
 - add git commit id in title
]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 .checkpackageignore                                |  1 -
 ...gcc-12.x-false-error-reporting-storing-th.patch | 57 ----------------------
 package/uqmi/uqmi.hash                             |  4 +-
 package/uqmi/uqmi.mk                               |  4 +-
 4 files changed, 4 insertions(+), 62 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 2a09961f74..e5706e2afa 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -977,7 +977,6 @@ package/unifdef/0001-Makefile-fix-error-on-install.patch lib_patch.Upstream
 package/unscd/S46unscd Shellcheck lib_sysv.Indent lib_sysv.Variables
 package/unzip/0001-Add-a-CMakeFile.txt-to-ease-cross-compilation.patch lib_patch.Upstream
 package/upmpdcli/S99upmpdcli Shellcheck lib_sysv.Indent lib_sysv.Variables
-package/uqmi/0001-uqmi-avoid-gcc-12.x-false-error-reporting-storing-th.patch lib_patch.Upstream
 package/urg/0001-select-h.patch lib_patch.Upstream
 package/urg/0002-urg-gcc6-fix-narrowing-conversion.patch lib_patch.Upstream
 package/usb_modeswitch/0001-fix-systemd-detection.patch lib_patch.Upstream
diff --git a/package/uqmi/0001-uqmi-avoid-gcc-12.x-false-error-reporting-storing-th.patch b/package/uqmi/0001-uqmi-avoid-gcc-12.x-false-error-reporting-storing-th.patch
deleted file mode 100644
index e2199228b9..0000000000
--- a/package/uqmi/0001-uqmi-avoid-gcc-12.x-false-error-reporting-storing-th.patch
+++ /dev/null
@@ -1,57 +0,0 @@
-From 63ab887be90c7fe37d537ea75e60eb95d6d87d3f Mon Sep 17 00:00:00 2001
-From: Peter Seiderer <ps.report@gmx.net>
-Date: Sun, 5 Mar 2023 22:08:13 +0100
-Subject: [PATCH] uqmi: avoid gcc-12.x false error reporting (storing the
- address of local variable 'complete' in '*req.complete')
-
-Avoid gcc-12.x false error reporting (req->complete is later reset to NULL
-in case of use of local complete):
-
-  dev.c:217:23: error: storing the address of local variable 'complete' in '*req.complete' [-Werror=dangling-pointer=]
-    217 |         req->complete = &complete;
-        |         ~~~~~~~~~~~~~~^~~~~~~~~~~
-
-Signed-off-by: Peter Seiderer <ps.report@gmx.net>
-[Upstream: http://lists.openwrt.org/pipermail/openwrt-devel/2023-March/040667.html]
-Signed-off-by: Peter Seiderer <ps.report@gmx.net>
----
-Changes v1 -> v2:
-  - apply pragma ignored only for gcc >= 12.x (as the warning
-    '-Wdangling-pointer' was introduced with gcc-12.x)
----
- dev.c | 12 ++++++++++++
- 1 file changed, 12 insertions(+)
-
-diff --git a/dev.c b/dev.c
-index bd10207..dbd42d4 100644
---- a/dev.c
-+++ b/dev.c
-@@ -203,6 +203,15 @@ void qmi_request_cancel(struct qmi_dev *qmi, struct qmi_request *req)
- 	__qmi_request_complete(qmi, req, NULL);
- }
- 
-+/* avoid gcc-12.x false error reporting:
-+ *   dev.c:217:23: error: storing the address of local variable ‘complete’ in ‘*req.complete’ [-Werror=dangling-pointer=]
-+ *     217 |         req->complete = &complete;
-+ *         |         ~~~~~~~~~~~~~~^~~~~~~~~~~
-+ */
-+#if __GNUC__ >= 12
-+#pragma GCC diagnostic push
-+#pragma GCC diagnostic ignored "-Wdangling-pointer"
-+#endif
- int qmi_request_wait(struct qmi_dev *qmi, struct qmi_request *req)
- {
- 	bool complete = false;
-@@ -231,6 +240,9 @@ int qmi_request_wait(struct qmi_dev *qmi, struct qmi_request *req)
- 
- 	return req->ret;
- }
-+#if __GNUC__ >= 12
-+#pragma GCC diagnostic pop
-+#endif
- 
- struct qmi_connect_request {
- 	struct qmi_request req;
--- 
-2.39.2
-
diff --git a/package/uqmi/uqmi.hash b/package/uqmi/uqmi.hash
index 3277b17645..cae2a08b02 100644
--- a/package/uqmi/uqmi.hash
+++ b/package/uqmi/uqmi.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  ecec1ab5a9cf91e54d29496d6793ce5821246261b99c743126899fcf9837af48  uqmi-0a19b5b77140465c29e2afa7d611fe93abc9672f-git4.tar.gz
-sha256  a69bf44dbff15d727578d2069a654d60e9034c5e2cc3e199a012e72afef6c259  main.c
+sha256  ff4850ca3c1517ac79614a39fdb47560c99f1159163e96e1f5037bf5507756c6  uqmi-7914da43cddaaf6cfba116260c81e6e9adffd5ab-git4.tar.gz
+sha256  a69bf44dbff15d727578d2069a654d60e9034c5e2cc3e199a012e72afef6c259  uqmi/uqmi.c
diff --git a/package/uqmi/uqmi.mk b/package/uqmi/uqmi.mk
index f20c3f5141..5cb9ebde43 100644
--- a/package/uqmi/uqmi.mk
+++ b/package/uqmi/uqmi.mk
@@ -4,11 +4,11 @@
 #
 ################################################################################
 
-UQMI_VERSION = 0a19b5b77140465c29e2afa7d611fe93abc9672f
+UQMI_VERSION = 7914da43cddaaf6cfba116260c81e6e9adffd5ab
 UQMI_SITE = https://git.openwrt.org/project/uqmi.git
 UQMI_SITE_METHOD = git
 UQMI_LICENSE = LGPL-2.0+
-UQMI_LICENSE_FILES = main.c
+UQMI_LICENSE_FILES = uqmi/uqmi.c
 UQMI_DEPENDENCIES = json-c libubox
 
 $(eval $(cmake-package))

--===============7348088875189294178==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7348088875189294178==--
