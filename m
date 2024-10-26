Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CDD2D10BFF
	for <buildroot@archiver.kernel.org>; Sat, 26 Oct 2024 16:36:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 29D4D404D2;
	Sat, 26 Oct 2024 16:36:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aCUTKjdkpI1f; Sat, 26 Oct 2024 16:36:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E0973403AF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E0973403AF;
	Sat, 26 Oct 2024 16:36:48 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id A9B065C52
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 16:36:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 97E8C40198
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 16:36:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zfgtnOYawQAz for <buildroot@buildroot.org>;
 Sat, 26 Oct 2024 16:36:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7CC54400D7
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7CC54400D7
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 16:36:43 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 68B2283F7D; Sat, 26 Oct 2024 16:36:43 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 26 Oct 2024 18:28:31 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a404cbbe0bccfa3cc9129a9cb858dc90eca0f3a8
X-Git-Newrev: e5d64511562fa90b2e481abce4ee950d3e42871e
X-Patchwork-Hint: ignore
Message-Id: <20241026163643.68B2283F7D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-dunamai: new host package
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=e5d64511562fa90b2e481abce4ee950d3e42871e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Host-only package as dependency of poetry-dynamic-versioning.

Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                 |  1 +
 package/python-dunamai/python-dunamai.hash |  5 +++++
 package/python-dunamai/python-dunamai.mk   | 16 ++++++++++++++++
 3 files changed, 22 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 409642f96f..9b4ae68ebf 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1098,6 +1098,7 @@ N:	Falco Hyfing <hyfinglists@gmail.com>
 F:	package/python-pymodbus/
 
 N:	Fiona Klute <fiona.klute@gmx.de>
+F:	package/python-dunamai/
 F:	package/python-pyasynchat/
 F:	package/python-pyasyncore/
 
diff --git a/package/python-dunamai/python-dunamai.hash b/package/python-dunamai/python-dunamai.hash
new file mode 100644
index 0000000000..a2a92b8699
--- /dev/null
+++ b/package/python-dunamai/python-dunamai.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/dunamai/json
+md5  1b3ca932416961ea6953dbbc21e6d42c  dunamai-1.22.0.tar.gz
+sha256  375a0b21309336f0d8b6bbaea3e038c36f462318c68795166e31f9873fdad676  dunamai-1.22.0.tar.gz
+# Locally computed sha256 checksums
+sha256  cd75c5564078e3aadf662a9df3d23430f4705dfeedebbd0ebbeef53998ad94a8  LICENSE
diff --git a/package/python-dunamai/python-dunamai.mk b/package/python-dunamai/python-dunamai.mk
new file mode 100644
index 0000000000..c3ab45fd6e
--- /dev/null
+++ b/package/python-dunamai/python-dunamai.mk
@@ -0,0 +1,16 @@
+################################################################################
+#
+# python-dunamai
+#
+################################################################################
+
+PYTHON_DUNAMAI_VERSION = 1.22.0
+PYTHON_DUNAMAI_SOURCE = dunamai-$(PYTHON_DUNAMAI_VERSION).tar.gz
+PYTHON_DUNAMAI_SITE = https://files.pythonhosted.org/packages/a0/fe/aee602f08765de4dd753d2e5d6cbd480857182e345f161f7a19ad1979e4d
+PYTHON_DUNAMAI_SETUP_TYPE = pep517
+PYTHON_DUNAMAI_LICENSE = MIT
+PYTHON_DUNAMAI_LICENSE_FILES = LICENSE
+HOST_PYTHON_DUNAMAI_DEPENDENCIES = host-python-poetry-core \
+	host-python-packaging
+
+$(eval $(host-python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
