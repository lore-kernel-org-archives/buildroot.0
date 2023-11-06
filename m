Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 769A3C4332F
	for <buildroot@archiver.kernel.org>; Mon,  6 Nov 2023 22:02:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 246304177E;
	Mon,  6 Nov 2023 22:02:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 246304177E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pvPny3tbuhZS; Mon,  6 Nov 2023 22:02:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 12FAB4159D;
	Mon,  6 Nov 2023 22:02:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 12FAB4159D
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1F6A51BF947
 for <buildroot@lists.busybox.net>; Mon,  6 Nov 2023 22:02:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id ECD1382376
 for <buildroot@lists.busybox.net>; Mon,  6 Nov 2023 22:02:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ECD1382376
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id L0gSQX7xE-Xw for <buildroot@lists.busybox.net>;
 Mon,  6 Nov 2023 22:02:04 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 65F0582219
 for <buildroot@buildroot.org>; Mon,  6 Nov 2023 22:02:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 65F0582219
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 466A586B2D; Mon,  6 Nov 2023 22:02:04 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 6 Nov 2023 22:52:18 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: cd24016907771836592f5edd87aa93d4c5d6da1d
X-Git-Newrev: 7b507f22e409d3a22e6f5b9ba38ce406f3a71598
X-Patchwork-Hint: ignore
Message-Id: <20231106220204.466A586B2D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-types-python-dateutil: new
 package
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

commit: https://git.buildroot.net/buildroot/commit/?id=7b507f22e409d3a22e6f5b9ba38ce406f3a71598
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/Config.in                                           |  1 +
 package/python-types-python-dateutil/Config.in              |  6 ++++++
 .../python-types-python-dateutil.hash                       |  3 +++
 .../python-types-python-dateutil.mk                         | 13 +++++++++++++
 4 files changed, 23 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index cd687a682b..ce46d30fed 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1357,6 +1357,7 @@ menu "External python modules"
 	source "package/python-txtorcon/Config.in"
 	source "package/python-typeguard/Config.in"
 	source "package/python-typepy/Config.in"
+	source "package/python-types-python-dateutil/Config.in"
 	source "package/python-typing-extensions/Config.in"
 	source "package/python-typing-inspect/Config.in"
 	source "package/python-u-msgpack/Config.in"
diff --git a/package/python-types-python-dateutil/Config.in b/package/python-types-python-dateutil/Config.in
new file mode 100644
index 0000000000..e2a8bb6341
--- /dev/null
+++ b/package/python-types-python-dateutil/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_PYTHON_TYPES_PYTHON_DATEUTIL
+	bool "python-types-python-dateutil"
+	help
+	  Typing stubs for python-dateutil.
+
+	  https://github.com/python/typeshed
diff --git a/package/python-types-python-dateutil/python-types-python-dateutil.hash b/package/python-types-python-dateutil/python-types-python-dateutil.hash
new file mode 100644
index 0000000000..ef5e9380cf
--- /dev/null
+++ b/package/python-types-python-dateutil/python-types-python-dateutil.hash
@@ -0,0 +1,3 @@
+# md5, sha256 from https://pypi.org/pypi/types-python-dateutil/json
+md5  58072922ac0c740121e311e970f003bf  types-python-dateutil-2.8.19.14.tar.gz
+sha256  1f4f10ac98bb8b16ade9dbee3518d9ace017821d94b057a425b069f834737f4b  types-python-dateutil-2.8.19.14.tar.gz
diff --git a/package/python-types-python-dateutil/python-types-python-dateutil.mk b/package/python-types-python-dateutil/python-types-python-dateutil.mk
new file mode 100644
index 0000000000..b230394120
--- /dev/null
+++ b/package/python-types-python-dateutil/python-types-python-dateutil.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# python-types-python-dateutil
+#
+################################################################################
+
+PYTHON_TYPES_PYTHON_DATEUTIL_VERSION = 2.8.19.14
+PYTHON_TYPES_PYTHON_DATEUTIL_SOURCE = types-python-dateutil-$(PYTHON_TYPES_PYTHON_DATEUTIL_VERSION).tar.gz
+PYTHON_TYPES_PYTHON_DATEUTIL_SITE = https://files.pythonhosted.org/packages/1b/2d/f189e5c03c22700c4ce5aece4b51bb73fa8adcfd7848629de0fb78af5f6f
+PYTHON_TYPES_PYTHON_DATEUTIL_SETUP_TYPE = setuptools
+PYTHON_TYPES_PYTHON_DATEUTIL_LICENSE = Apache-2.0
+
+$(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
