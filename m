Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA364FF885C
	for <buildroot@archiver.kernel.org>; Fri, 24 Apr 2026 21:26:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7406C6076B;
	Fri, 24 Apr 2026 21:26:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dqp1jyjWP9Q7; Fri, 24 Apr 2026 21:26:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 90A9460774
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777065978;
	bh=A5MDFce8bKy1j/6GDCdEWijRH85uWk7Kg2vl+QDCf9k=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=HqoglGDIfUdjWbxsyPeCdP0jJ7ZgW3zZPhVrMrUz2jG5KIMGHvxiUl1dIPfX9JpF/
	 Rn4EXC0PgDCgDZ0dWvV7xGd/bBFnnx+RS/yzG3NuT8ng8A+OH/jQ4fSBZkxRBEm0Nr
	 sbEleEEhsyMWgYhlKbIqXaesvcL3N1eNhwbylneD8m70vmx6Rh3mPO3d0pyK8ZmHEf
	 vjzEZD+cOJ70sKOKQOGie8I3cbT2M6s7B08UOAwqIS2PBv3jJ739BVjCwoXeYXXa7g
	 dlEu7x0T3pfdZDYCiT/FkpPRR9/gscLmFn6U0a5EcD0oUTSSIv9l57sQ+2UgMLe+0H
	 Ed89B7nxqsu/Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 90A9460774;
	Fri, 24 Apr 2026 21:26:18 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 98D3F2DF
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 21:26:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 779E8811FE
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 21:26:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aLj4L386eTSm for <buildroot@buildroot.org>;
 Fri, 24 Apr 2026 21:26:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B14B08125B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id B14B08125B
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 21:26:14 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5969D82DF0; Fri, 24 Apr 2026 21:26:14 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 24 Apr 2026 23:24:40 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 210fa8273657593e490357f0e6c20a416f895ba0
X-Git-Newrev: 863b920e6b467733f39647410228f7c62b3daf2e
X-Patchwork-Hint: ignore
Message-Id: <20260424212614.5969D82DF0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-isodate: new package
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/863b920e6b467733f39647410228f7c62b3daf2e
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Alexandre Ondet <hellohacker.dev@gmail.com>
[Julien:
 - add host-python-setuptools-scm dependency
 - add LICENSE hash
 - fix check-package error
]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/Config.in                          |  1 +
 package/python-isodate/Config.in           |  8 ++++++++
 package/python-isodate/python-isodate.hash |  3 +++
 package/python-isodate/python-isodate.mk   | 16 ++++++++++++++++
 4 files changed, 28 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index 7afdcb4a16..9cae377fb5 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1180,6 +1180,7 @@ menu "External python modules"
 	source "package/python-ipython-genutils/Config.in"
 	source "package/python-ipython-pygments-lexers/Config.in"
 	source "package/python-iso8601/Config.in"
+	source "package/python-isodate/Config.in"
 	source "package/python-iterable-io/Config.in"
 	source "package/python-itsdangerous/Config.in"
 	source "package/python-iwlib/Config.in"
diff --git a/package/python-isodate/Config.in b/package/python-isodate/Config.in
new file mode 100644
index 0000000000..219876b9c5
--- /dev/null
+++ b/package/python-isodate/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_PYTHON_ISODATE
+	bool "python-isodate"
+	help
+	  An ISO 8601 date/time/duration parser and formatter for
+	  Python. Useful for parsing and formatting ISO 8601 dates,
+	  times, and durations.
+
+	  https://github.com/gweis/isodate/
diff --git a/package/python-isodate/python-isodate.hash b/package/python-isodate/python-isodate.hash
new file mode 100644
index 0000000000..79d26b4c75
--- /dev/null
+++ b/package/python-isodate/python-isodate.hash
@@ -0,0 +1,3 @@
+# From https://pypi.org/pypi/isodate/0.7.2/json
+sha256  4cd1aa0f43ca76f4a6c6c0292a85f40b35ec2e43e315b59f06e6d32171a953e6  isodate-0.7.2.tar.gz
+sha256  ce5fe4893fb6ab843de77b367bfa9db974d7b00ab9033fcca8d7760a97fe1b43  LICENSE
diff --git a/package/python-isodate/python-isodate.mk b/package/python-isodate/python-isodate.mk
new file mode 100644
index 0000000000..3f61dfd6b4
--- /dev/null
+++ b/package/python-isodate/python-isodate.mk
@@ -0,0 +1,16 @@
+################################################################################
+#
+# python-isodate
+#
+################################################################################
+
+PYTHON_ISODATE_VERSION = 0.7.2
+PYTHON_ISODATE_SOURCE = isodate-$(PYTHON_ISODATE_VERSION).tar.gz
+PYTHON_ISODATE_SITE = https://files.pythonhosted.org/packages/source/i/isodate
+PYTHON_ISODATE_SETUP_TYPE = setuptools
+PYTHON_ISODATE_LICENSE = BSD-3-Clause
+PYTHON_ISODATE_LICENSE_FILES = LICENSE
+
+PYTHON_ISODATE_DEPENDENCIES = host-python-setuptools-scm
+
+$(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
