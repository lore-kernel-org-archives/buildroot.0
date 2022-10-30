Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF44FECAAA1
	for <buildroot@archiver.kernel.org>; Sun, 30 Oct 2022 20:26:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5E12881260;
	Sun, 30 Oct 2022 20:26:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5E12881260
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Zbde12GZiUoN; Sun, 30 Oct 2022 20:26:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 828AE8105C;
	Sun, 30 Oct 2022 20:26:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 828AE8105C
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E44021BF387
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 20:25:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AFD968124B
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 20:25:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AFD968124B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hpP38RoMx8v7 for <buildroot@lists.busybox.net>;
 Sun, 30 Oct 2022 20:25:16 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id EEC5F80FB9
 for <buildroot@buildroot.org>; Sun, 30 Oct 2022 20:25:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EEC5F80FB9
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DFC6E8764D; Sun, 30 Oct 2022 20:25:15 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 30 Oct 2022 21:22:48 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 31e5453c06146233453d35121089d26606c25341
X-Git-Newrev: 7c488ef830655c6084ac59e75ff1a3b046a5e1c2
X-Patchwork-Hint: ignore
Message-Id: <20221030202515.DFC6E8764D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-hatch-vcs: new package
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

commit: https://git.buildroot.net/buildroot/commit/?id=7c488ef830655c6084ac59e75ff1a3b046a5e1c2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 DEVELOPERS                                     |  1 +
 package/python-hatch-vcs/python-hatch-vcs.hash |  5 +++++
 package/python-hatch-vcs/python-hatch-vcs.mk   | 17 +++++++++++++++++
 3 files changed, 23 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 02211b7bf4..f82a23b83e 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1387,6 +1387,7 @@ F:	package/python-frozenlist/
 F:	package/python-greenlet/
 F:	package/python-hatchling/
 F:	package/python-hatch-fancy-pypi-readme/
+F:	package/python-hatch-vcs/
 F:	package/python-installer/
 F:	package/python-janus/
 F:	package/python-logstash/
diff --git a/package/python-hatch-vcs/python-hatch-vcs.hash b/package/python-hatch-vcs/python-hatch-vcs.hash
new file mode 100644
index 0000000000..e57eeddd2f
--- /dev/null
+++ b/package/python-hatch-vcs/python-hatch-vcs.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/hatch_vcs/json
+md5  e56b6d0c05cfb9b59d493c67f94d6e48  hatch_vcs-0.2.0.tar.gz
+sha256  9913d733b34eec9bb0345d0626ca32165a4ad2de15d1ce643c36d09ca908abff  hatch_vcs-0.2.0.tar.gz
+# Locally computed sha256 checksums
+sha256  117aa5006d8475562f04442ab06dd2a4c501af3a77255eae0deef1f0c2499a1a  LICENSE.txt
diff --git a/package/python-hatch-vcs/python-hatch-vcs.mk b/package/python-hatch-vcs/python-hatch-vcs.mk
new file mode 100644
index 0000000000..55c6461751
--- /dev/null
+++ b/package/python-hatch-vcs/python-hatch-vcs.mk
@@ -0,0 +1,17 @@
+################################################################################
+#
+# python-hatch-vcs
+#
+################################################################################
+
+PYTHON_HATCH_VCS_VERSION = 0.2.0
+PYTHON_HATCH_VCS_SOURCE = hatch_vcs-$(PYTHON_HATCH_VCS_VERSION).tar.gz
+PYTHON_HATCH_VCS_SITE = https://files.pythonhosted.org/packages/ac/13/b3d83564c0cc0f1d45b4ea2a78b87b383a8165797613fedf11f1a7e49b48
+PYTHON_HATCH_VCS_LICENSE = MIT
+PYTHON_HATCH_VCS_LICENSE_FILES = LICENSE.txt
+PYTHON_HATCH_VCS_SETUP_TYPE = pep517
+HOST_PYTHON_HATCH_VCS_DEPENDENCIES = \
+	host-python-hatchling \
+	host-python-setuptools-scm
+
+$(eval $(host-python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
