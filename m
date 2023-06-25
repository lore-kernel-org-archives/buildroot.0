Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 825A9EB64DC
	for <buildroot@archiver.kernel.org>; Sun, 25 Jun 2023 14:09:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 28425812FA;
	Sun, 25 Jun 2023 14:09:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 28425812FA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XeSIB-AF6BjU; Sun, 25 Jun 2023 14:09:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 498AF80EEC;
	Sun, 25 Jun 2023 14:09:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 498AF80EEC
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2D8C01BF3BD
 for <buildroot@lists.busybox.net>; Sun, 25 Jun 2023 14:09:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 197A240F4E
 for <buildroot@lists.busybox.net>; Sun, 25 Jun 2023 14:08:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 197A240F4E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qFcRchiZ8nrh for <buildroot@lists.busybox.net>;
 Sun, 25 Jun 2023 14:08:58 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id D62074109B
 for <buildroot@buildroot.org>; Sun, 25 Jun 2023 14:08:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D62074109B
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BF8BF84AC1; Sun, 25 Jun 2023 14:08:57 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 25 Jun 2023 15:57:30 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 01aa39247c239f0dfdee13b0861e0a98bb1f2547
X-Git-Newrev: e0ae89957ecdb262eb4928a8a86c218436f61406
X-Patchwork-Hint: ignore
Message-Id: <20230625140857.BF8BF84AC1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-wheel: new host package
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

commit: https://git.buildroot.net/buildroot/commit/?id=e0ae89957ecdb262eb4928a8a86c218436f61406
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This will be required for upcoming setuptools pep517 support.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/python-wheel/python-wheel.hash |  5 +++++
 package/python-wheel/python-wheel.mk   | 14 ++++++++++++++
 2 files changed, 19 insertions(+)

diff --git a/package/python-wheel/python-wheel.hash b/package/python-wheel/python-wheel.hash
new file mode 100644
index 0000000000..377a85c8fd
--- /dev/null
+++ b/package/python-wheel/python-wheel.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/wheel/json
+md5  ec5004c46d1905da98bb5bc1a10ddd21  wheel-0.40.0.tar.gz
+sha256  cd1196f3faee2b31968d626e1731c94f99cbdb67cf5a46e4f5656cbee7738873  wheel-0.40.0.tar.gz
+# Locally computed sha256 checksums
+sha256  30c23618679108f3e8ea1d2a658c7ca417bdfc891c98ef1a89fa4ff0c9828654  LICENSE.txt
diff --git a/package/python-wheel/python-wheel.mk b/package/python-wheel/python-wheel.mk
new file mode 100644
index 0000000000..159598fd1e
--- /dev/null
+++ b/package/python-wheel/python-wheel.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-wheel
+#
+################################################################################
+
+PYTHON_WHEEL_VERSION = 0.40.0
+PYTHON_WHEEL_SOURCE = wheel-$(PYTHON_WHEEL_VERSION).tar.gz
+PYTHON_WHEEL_SITE = https://files.pythonhosted.org/packages/fc/ef/0335f7217dd1e8096a9e8383e1d472aa14717878ffe07c4772e68b6e8735
+PYTHON_WHEEL_SETUP_TYPE = flit
+PYTHON_WHEEL_LICENSE = MIT
+PYTHON_WHEEL_LICENSE_FILES = LICENSE.txt
+
+$(eval $(host-python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
