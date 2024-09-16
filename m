Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B22A0C3ABB2
	for <buildroot@archiver.kernel.org>; Mon, 16 Sep 2024 10:11:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 63D8060A93;
	Mon, 16 Sep 2024 10:11:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pwMV5rZ8TuFR; Mon, 16 Sep 2024 10:11:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E49CF60AB2
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E49CF60AB2;
	Mon, 16 Sep 2024 10:11:43 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 65E9A1BF5A4
 for <buildroot@lists.busybox.net>; Mon, 16 Sep 2024 10:11:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A4F8840B1E
 for <buildroot@lists.busybox.net>; Mon, 16 Sep 2024 10:11:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mCjbqoUD7tqn for <buildroot@lists.busybox.net>;
 Mon, 16 Sep 2024 10:11:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7E77640B0B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7E77640B0B
 for <buildroot@buildroot.org>; Mon, 16 Sep 2024 10:11:35 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6A6878379F; Mon, 16 Sep 2024 10:11:35 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Mon, 16 Sep 2024 12:08:44 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 763c2e052ae9ef5a5a618cf5e2b59b1c29de8277
X-Git-Newrev: a84b7ef68b8551df3e7ba93d4d33e77ca9d40f4c
X-Patchwork-Hint: ignore
Message-Id: <20240916101135.6A6878379F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-zipstream-ng: new package
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

commit: https://git.buildroot.net/buildroot/commit/?id=a84b7ef68b8551df3e7ba93d4d33e77ca9d40f4c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/Config.in                                    |  1 +
 package/python-zipstream-ng/Config.in                |  6 ++++++
 package/python-zipstream-ng/python-zipstream-ng.hash |  5 +++++
 package/python-zipstream-ng/python-zipstream-ng.mk   | 14 ++++++++++++++
 4 files changed, 26 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index a0d2f329b7..b48f9819df 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1477,6 +1477,7 @@ menu "External python modules"
 	source "package/python-yatl/Config.in"
 	source "package/python-zc-lockfile/Config.in"
 	source "package/python-zeroconf/Config.in"
+	source "package/python-zipstream-ng/Config.in"
 	source "package/python-zlmdb/Config.in"
 	source "package/python-zope-interface/Config.in"
 	source "package/python-zopfli/Config.in"
diff --git a/package/python-zipstream-ng/Config.in b/package/python-zipstream-ng/Config.in
new file mode 100644
index 0000000000..2de36dd861
--- /dev/null
+++ b/package/python-zipstream-ng/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_PYTHON_ZIPSTREAM_NG
+	bool "python-zipstream-ng"
+	help
+	  A modern and easy to use streamable zip file generator.
+
+	  https://github.com/pR0Ps/zipstream-ng
diff --git a/package/python-zipstream-ng/python-zipstream-ng.hash b/package/python-zipstream-ng/python-zipstream-ng.hash
new file mode 100644
index 0000000000..dd714389b2
--- /dev/null
+++ b/package/python-zipstream-ng/python-zipstream-ng.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/zipstream-ng/json
+md5  2b7cd8d72a047dd23363415d47096d6a  zipstream-ng-1.7.1.tar.gz
+sha256  f92023b9ca578cd7fdd94ec733c65664ecf7ee32493e38cdf8e365a1316e9ffc  zipstream-ng-1.7.1.tar.gz
+# Locally computed sha256 checksums
+sha256  e3a994d82e644b03a792a930f574002658412f62407f5fee083f2555c5f23118  LICENSE
diff --git a/package/python-zipstream-ng/python-zipstream-ng.mk b/package/python-zipstream-ng/python-zipstream-ng.mk
new file mode 100644
index 0000000000..5e26c9303f
--- /dev/null
+++ b/package/python-zipstream-ng/python-zipstream-ng.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-zipstream-ng
+#
+################################################################################
+
+PYTHON_ZIPSTREAM_NG_VERSION = 1.7.1
+PYTHON_ZIPSTREAM_NG_SOURCE = zipstream-ng-$(PYTHON_ZIPSTREAM_NG_VERSION).tar.gz
+PYTHON_ZIPSTREAM_NG_SITE = https://files.pythonhosted.org/packages/74/8c/682c8bb3085d2089e09c0b9393a12721d059dc0009da4e0b6faff6370679
+PYTHON_ZIPSTREAM_NG_SETUP_TYPE = setuptools
+PYTHON_ZIPSTREAM_NG_LICENSE = LGPL-3.0
+PYTHON_ZIPSTREAM_NG_LICENSE_FILES = LICENSE
+
+$(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
