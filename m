Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08CD7CD128A
	for <buildroot@archiver.kernel.org>; Mon,  1 Apr 2024 20:18:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C95DB81E7F;
	Mon,  1 Apr 2024 20:18:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id C3ANbgt29WqD; Mon,  1 Apr 2024 20:18:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 61D0B81EB2
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 61D0B81EB2;
	Mon,  1 Apr 2024 20:18:36 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2B8421BF3BF
 for <buildroot@lists.busybox.net>; Mon,  1 Apr 2024 20:18:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 46D2A81E86
 for <buildroot@lists.busybox.net>; Mon,  1 Apr 2024 20:18:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Hp8MhloBT1nQ for <buildroot@lists.busybox.net>;
 Mon,  1 Apr 2024 20:18:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 81D6381E64
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 81D6381E64
 for <buildroot@buildroot.org>; Mon,  1 Apr 2024 20:18:22 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6CE8B845E6; Mon,  1 Apr 2024 20:18:22 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 1 Apr 2024 22:12:43 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 367104d837f84bb73e8db6b45ce96ee11b378ea3
X-Git-Newrev: 96e848c9701d23f172a75f900e9dcf7aa8e6faa3
X-Patchwork-Hint: ignore
Message-Id: <20240401201822.6CE8B845E6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-expandvars: new host package
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

commit: https://git.buildroot.net/buildroot/commit/?id=96e848c9701d23f172a75f900e9dcf7aa8e6faa3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/python-expandvars/python-expandvars.hash |  5 +++++
 package/python-expandvars/python-expandvars.mk   | 15 +++++++++++++++
 2 files changed, 20 insertions(+)

diff --git a/package/python-expandvars/python-expandvars.hash b/package/python-expandvars/python-expandvars.hash
new file mode 100644
index 0000000000..0123ed5420
--- /dev/null
+++ b/package/python-expandvars/python-expandvars.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/expandvars/json
+md5  8091f578a547e2b4b9df59100a179266  expandvars-0.12.0.tar.gz
+sha256  7d1adfa55728cf4b5d812ece3d087703faea953e0c0a1a78415de9df5024d844  expandvars-0.12.0.tar.gz
+# Locally computed sha256 checksums
+sha256  b8a43c35080fc5855e4f8171e4d0d002f6ff1633d8cfc0b5dee0ac4ced2deac7  LICENSE
diff --git a/package/python-expandvars/python-expandvars.mk b/package/python-expandvars/python-expandvars.mk
new file mode 100644
index 0000000000..5c9a7249b3
--- /dev/null
+++ b/package/python-expandvars/python-expandvars.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# python-expandvars
+#
+################################################################################
+
+PYTHON_EXPANDVARS_VERSION = 0.12.0
+PYTHON_EXPANDVARS_SOURCE = expandvars-$(PYTHON_EXPANDVARS_VERSION).tar.gz
+PYTHON_EXPANDVARS_SITE = https://files.pythonhosted.org/packages/2b/a5/46d1f58edcae1d632fafdfee313e378240e002ae45d26502bac938bd8751
+PYTHON_EXPANDVARS_SETUP_TYPE = pep517
+PYTHON_EXPANDVARS_LICENSE = MIT
+PYTHON_EXPANDVARS_LICENSE_FILES = LICENSE
+HOST_PYTHON_EXPANDVARS_DEPENDENCIES = host-python-hatchling
+
+$(eval $(host-python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
