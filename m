Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D30AFC3064D
	for <buildroot@archiver.kernel.org>; Tue,  2 Jul 2024 07:05:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 97E0F82073;
	Tue,  2 Jul 2024 07:05:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uki9-AMtZKt6; Tue,  2 Jul 2024 07:05:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CAF768206B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id CAF768206B;
	Tue,  2 Jul 2024 07:05:45 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 65E3C1BF313
 for <buildroot@lists.busybox.net>; Tue,  2 Jul 2024 07:05:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 43EDD40CFB
 for <buildroot@lists.busybox.net>; Tue,  2 Jul 2024 07:05:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xwelBCU7K235 for <buildroot@lists.busybox.net>;
 Tue,  2 Jul 2024 07:05:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3B58140D07
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3B58140D07
 for <buildroot@buildroot.org>; Tue,  2 Jul 2024 07:05:31 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 338B78397C; Tue,  2 Jul 2024 07:05:31 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 2 Jul 2024 08:59:31 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 07a53340a7ad10d39b9e818501777e140f9e0772
X-Git-Newrev: 1016cba17dce9fb05beb8894b47b2e97f14a2e76
X-Patchwork-Hint: ignore
Message-Id: <20240702070531.338B78397C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-pdm-backend: new host
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=1016cba17dce9fb05beb8894b47b2e97f14a2e76
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/python-pdm-backend/python-pdm-backend.hash |  5 +++++
 package/python-pdm-backend/python-pdm-backend.mk   | 14 ++++++++++++++
 2 files changed, 19 insertions(+)

diff --git a/package/python-pdm-backend/python-pdm-backend.hash b/package/python-pdm-backend/python-pdm-backend.hash
new file mode 100644
index 0000000000..cc26e58462
--- /dev/null
+++ b/package/python-pdm-backend/python-pdm-backend.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/pdm-backend/json
+md5  b2805090bbe41c86eb051b1311c7ba34  pdm_backend-2.3.1.tar.gz
+sha256  c03cfb3a803325c049b57ba2502b409479ebb22b6a4ee3746c1f688b939764e8  pdm_backend-2.3.1.tar.gz
+# Locally computed sha256 checksums
+sha256  1da058ed0440fea5df1765b19a1418800439b18fd6f1c13c7d429cb81e9c6d47  LICENSE
diff --git a/package/python-pdm-backend/python-pdm-backend.mk b/package/python-pdm-backend/python-pdm-backend.mk
new file mode 100644
index 0000000000..a95024ec9b
--- /dev/null
+++ b/package/python-pdm-backend/python-pdm-backend.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-pdm-backend
+#
+################################################################################
+
+PYTHON_PDM_BACKEND_VERSION = 2.3.1
+PYTHON_PDM_BACKEND_SOURCE = pdm_backend-$(PYTHON_PDM_BACKEND_VERSION).tar.gz
+PYTHON_PDM_BACKEND_SITE = https://files.pythonhosted.org/packages/70/f4/eaa4da6e3eaa32d902177e0b81563bb5526b2c387aa312d0dfbecf3c7109
+PYTHON_PDM_BACKEND_SETUP_TYPE = pep517
+PYTHON_PDM_BACKEND_LICENSE = MIT
+PYTHON_PDM_BACKEND_LICENSE_FILES = LICENSE
+
+$(eval $(host-python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
