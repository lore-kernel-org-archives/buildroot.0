Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9209C36008
	for <buildroot@archiver.kernel.org>; Fri, 21 Mar 2025 21:20:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6400141E03;
	Fri, 21 Mar 2025 21:20:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qUfGa0Ba9ke8; Fri, 21 Mar 2025 21:20:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 74E7E41E35
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 74E7E41E35;
	Fri, 21 Mar 2025 21:20:07 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id B9FD1E2
 for <buildroot@buildroot.org>; Fri, 21 Mar 2025 21:20:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A0C1341E35
 for <buildroot@buildroot.org>; Fri, 21 Mar 2025 21:20:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RAONP7pgNU8y for <buildroot@buildroot.org>;
 Fri, 21 Mar 2025 21:20:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D04C341DE3
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id D04C341DE3
 for <buildroot@buildroot.org>; Fri, 21 Mar 2025 21:20:02 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9BDA488274; Fri, 21 Mar 2025 21:20:02 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Fri, 21 Mar 2025 22:13:01 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f9a02e7b80b24c3f71e69f149169fac556c6a63e
X-Git-Newrev: 486672da0243f5f397d91ff50bc0ed23cec96348
X-Patchwork-Hint: ignore
Message-Id: <20250321212002.9BDA488274@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-emailproxy: new package
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=486672da0243f5f397d91ff50bc0ed23cec96348
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
[Julien: fix Config.in order found by "make check-package"]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 DEVELOPERS                                       |  1 +
 package/Config.in                                |  1 +
 package/python-emailproxy/Config.in              | 12 ++++++++++++
 package/python-emailproxy/python-emailproxy.hash |  5 +++++
 package/python-emailproxy/python-emailproxy.mk   | 14 ++++++++++++++
 5 files changed, 33 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index c1bcceda9b..026670cece 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -494,6 +494,7 @@ F:	package/privoxy/
 F:	package/pure-ftpd/
 F:	package/python-couchdb/
 F:	package/python-cssutils/
+F:	package/python-emailproxy/
 F:	package/python-glslang/
 F:	package/python-mako/
 F:	package/python-mwclient/
diff --git a/package/Config.in b/package/Config.in
index 5c6e334a75..120a71dd2d 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1100,6 +1100,7 @@ menu "External python modules"
 	source "package/python-dtschema/Config.in"
 	source "package/python-ecdsa/Config.in"
 	source "package/python-email-validator/Config.in"
+	source "package/python-emailproxy/Config.in"
 	source "package/python-engineio/Config.in"
 	source "package/python-entrypoints/Config.in"
 	source "package/python-esptool/Config.in"
diff --git a/package/python-emailproxy/Config.in b/package/python-emailproxy/Config.in
new file mode 100644
index 0000000000..f1a349ce94
--- /dev/null
+++ b/package/python-emailproxy/Config.in
@@ -0,0 +1,12 @@
+config BR2_PACKAGE_PYTHON_EMAILPROXY
+	bool "python-emailproxy"
+	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS # python-cryptography
+	select BR2_PACKAGE_PYTHON_CRYPTOGRAPHY # runtime
+	select BR2_PACKAGE_PYTHON_PROMPT_TOOLKIT # runtime
+	select BR2_PACKAGE_PYTHON_PYASYNCORE # runtime
+	help
+	  An IMAP/POP/SMTP proxy that transparently adds OAuth 2.0
+	  authentication for email clients that don't support this
+	  method.
+
+	  https://github.com/simonrob/email-oauth2-proxy
diff --git a/package/python-emailproxy/python-emailproxy.hash b/package/python-emailproxy/python-emailproxy.hash
new file mode 100644
index 0000000000..886173234b
--- /dev/null
+++ b/package/python-emailproxy/python-emailproxy.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/emailproxy/json
+md5  f216dea4437131103b1d658cfa1a9bc0  emailproxy-2025.3.14.tar.gz
+sha256  e406478ed86eca2005ed1e17221358a0c37ddaeccfd991d42d2df93febb279a0  emailproxy-2025.3.14.tar.gz
+# Locally computed sha256 checksums
+sha256  c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  LICENSE
diff --git a/package/python-emailproxy/python-emailproxy.mk b/package/python-emailproxy/python-emailproxy.mk
new file mode 100644
index 0000000000..fd73110597
--- /dev/null
+++ b/package/python-emailproxy/python-emailproxy.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-emailproxy
+#
+################################################################################
+
+PYTHON_EMAILPROXY_VERSION = 2025.3.14
+PYTHON_EMAILPROXY_SOURCE = emailproxy-$(PYTHON_EMAILPROXY_VERSION).tar.gz
+PYTHON_EMAILPROXY_SITE = https://files.pythonhosted.org/packages/15/b9/b2864ab1da9fdf7409589de99501b227352c9a6b8fa1178660debf0a2ad6
+PYTHON_EMAILPROXY_SETUP_TYPE = setuptools
+PYTHON_EMAILPROXY_LICENSE = Apache-2.0
+PYTHON_EMAILPROXY_LICENSE_FILES = LICENSE
+
+$(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
