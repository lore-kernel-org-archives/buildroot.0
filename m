Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7AD8C3DA61
	for <buildroot@archiver.kernel.org>; Thu, 18 Jul 2024 20:56:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 873A66062E;
	Thu, 18 Jul 2024 20:56:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OcRDGCQd7BO0; Thu, 18 Jul 2024 20:55:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7059E60767
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7059E60767;
	Thu, 18 Jul 2024 20:55:59 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1C6C01BF3F9
 for <buildroot@lists.busybox.net>; Thu, 18 Jul 2024 20:55:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0A56360E93
 for <buildroot@lists.busybox.net>; Thu, 18 Jul 2024 20:55:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FjQBeqsZ3tw1 for <buildroot@lists.busybox.net>;
 Thu, 18 Jul 2024 20:55:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3795E60767
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3795E60767
 for <buildroot@buildroot.org>; Thu, 18 Jul 2024 20:55:57 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3391086E19; Thu, 18 Jul 2024 20:55:57 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 18 Jul 2024 22:54:47 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c3faf4f71623562480629d550f89cf7bf454e680
X-Git-Newrev: c1d3b7f97a080a0a278fdaab7f28f9fbbc82a743
X-Patchwork-Hint: ignore
Message-Id: <20240718205557.3391086E19@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-betterproto: new package
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=c1d3b7f97a080a0a278fdaab7f28f9fbbc82a743
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/Config.in                                  |  1 +
 package/python-betterproto/Config.in               |  8 ++++++++
 package/python-betterproto/python-betterproto.hash |  5 +++++
 package/python-betterproto/python-betterproto.mk   | 15 +++++++++++++++
 4 files changed, 29 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index acdc72c441..3b66ee2900 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1015,6 +1015,7 @@ menu "External python modules"
 	source "package/python-backcall/Config.in"
 	source "package/python-bcrypt/Config.in"
 	source "package/python-beautifulsoup4/Config.in"
+	source "package/python-betterproto/Config.in"
 	source "package/python-bidict/Config.in"
 	source "package/python-bitarray/Config.in"
 	source "package/python-bitstring/Config.in"
diff --git a/package/python-betterproto/Config.in b/package/python-betterproto/Config.in
new file mode 100644
index 0000000000..8548fd43ba
--- /dev/null
+++ b/package/python-betterproto/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_PYTHON_BETTERPROTO
+	bool "python-betterproto"
+	select BR2_PACKAGE_PYTHON_DATEUTIL # runtime
+	select BR2_PACKAGE_PYTHON_GRPCLIB # runtime
+	help
+	  A better Protobuf / gRPC generator & library.
+
+	  http://github.com/danielgtaylor/python-betterproto
diff --git a/package/python-betterproto/python-betterproto.hash b/package/python-betterproto/python-betterproto.hash
new file mode 100644
index 0000000000..8d23d2ae56
--- /dev/null
+++ b/package/python-betterproto/python-betterproto.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/betterproto/json
+md5  bd4192c2997959100097479c34ff87e6  betterproto-2.0.0b6.tar.gz
+sha256  720ae92697000f6fcf049c69267d957f0871654c8b0d7458906607685daee784  betterproto-2.0.0b6.tar.gz
+# Locally computed sha256 checksums
+sha256  a5b8df75467e4b57a308a94cce5fdae84808a83ee6cd5af7e175c6b9784a753f  LICENSE.md
diff --git a/package/python-betterproto/python-betterproto.mk b/package/python-betterproto/python-betterproto.mk
new file mode 100644
index 0000000000..37f72f8166
--- /dev/null
+++ b/package/python-betterproto/python-betterproto.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# python-betterproto
+#
+################################################################################
+
+PYTHON_BETTERPROTO_VERSION = 2.0.0b6
+PYTHON_BETTERPROTO_SOURCE = betterproto-$(PYTHON_BETTERPROTO_VERSION).tar.gz
+PYTHON_BETTERPROTO_SITE = https://files.pythonhosted.org/packages/45/43/4c44efd75f2ef48a16b458c2fe2cff7aa74bab8fcadf2653bb5110a87f97
+PYTHON_BETTERPROTO_SETUP_TYPE = pep517
+PYTHON_BETTERPROTO_LICENSE = MIT
+PYTHON_BETTERPROTO_LICENSE_FILES = LICENSE.md
+PYTHON_BETTERPROTO_DEPENDENCIES = host-python-poetry-core
+
+$(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
