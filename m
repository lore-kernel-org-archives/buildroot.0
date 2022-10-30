Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81AC3C38A02
	for <buildroot@archiver.kernel.org>; Sun, 30 Oct 2022 20:25:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1A2DE60A70;
	Sun, 30 Oct 2022 20:25:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1A2DE60A70
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oeRsJ8XeJITc; Sun, 30 Oct 2022 20:25:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9682060AE5;
	Sun, 30 Oct 2022 20:25:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9682060AE5
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id AE9331BF956
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 20:25:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 97BAA400EC
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 20:25:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 97BAA400EC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bDE0MQZLGts6 for <buildroot@lists.busybox.net>;
 Sun, 30 Oct 2022 20:25:15 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id D991C400DC
 for <buildroot@buildroot.org>; Sun, 30 Oct 2022 20:25:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D991C400DC
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C856A8764F; Sun, 30 Oct 2022 20:25:15 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 30 Oct 2022 21:22:44 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: eb9906b1290b11cd9f159f493b199c0d4e0d1102
X-Git-Newrev: 626c5bedaa7e1461dd3747562b9c04dd40713c83
X-Patchwork-Hint: ignore
Message-Id: <20221030202515.C856A8764F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-hatchling: new package
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

commit: https://git.buildroot.net/buildroot/commit/?id=626c5bedaa7e1461dd3747562b9c04dd40713c83
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This is a new pep517 based build backend.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 DEVELOPERS                                     |  1 +
 package/python-hatchling/python-hatchling.hash |  5 +++++
 package/python-hatchling/python-hatchling.mk   | 19 +++++++++++++++++++
 3 files changed, 25 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 2c33726c77..1a38b329c3 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1385,6 +1385,7 @@ F:	package/python-flatbuffers/
 F:	package/python-fonttools/
 F:	package/python-frozenlist/
 F:	package/python-greenlet/
+F:	package/python-hatchling/
 F:	package/python-installer/
 F:	package/python-janus/
 F:	package/python-logstash/
diff --git a/package/python-hatchling/python-hatchling.hash b/package/python-hatchling/python-hatchling.hash
new file mode 100644
index 0000000000..41d7be977e
--- /dev/null
+++ b/package/python-hatchling/python-hatchling.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/hatchling/json
+md5  e06cc65ac646f9b01df5406aa1f97022  hatchling-1.11.1.tar.gz
+sha256  9f84361f70cf3a7ab9543b0c3ecc64211ed2ba8a606a71eb6a473c1c9b08e1d0  hatchling-1.11.1.tar.gz
+# Locally computed sha256 checksums
+sha256  7f143a8127ad4873862d70854b5bd2abd0085aa73e64fd2b08704a3b9f5c07fc  LICENSE.txt
diff --git a/package/python-hatchling/python-hatchling.mk b/package/python-hatchling/python-hatchling.mk
new file mode 100644
index 0000000000..13155a20a4
--- /dev/null
+++ b/package/python-hatchling/python-hatchling.mk
@@ -0,0 +1,19 @@
+################################################################################
+#
+# python-hatchling
+#
+################################################################################
+
+PYTHON_HATCHLING_VERSION = 1.11.1
+PYTHON_HATCHLING_SOURCE = hatchling-$(PYTHON_HATCHLING_VERSION).tar.gz
+PYTHON_HATCHLING_SITE = https://files.pythonhosted.org/packages/24/20/3e21d2bc57229822ac9fb9b314d7892c16f829f34a0eb247c55fc11e09a8
+PYTHON_HATCHLING_LICENSE = MIT
+PYTHON_HATCHLING_LICENSE_FILES = LICENSE.txt
+PYTHON_HATCHLING_SETUP_TYPE = pep517
+HOST_PYTHON_HATCHLING_DEPENDENCIES = \
+	host-python-editables \
+	host-python-packaging \
+	host-python-pathspec \
+	host-python-pluggy
+
+$(eval $(host-python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
