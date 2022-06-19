Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 594DBC43334
	for <buildroot@archiver.kernel.org>; Sun, 19 Jun 2022 16:50:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9B4D3410B6;
	Sun, 19 Jun 2022 16:50:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9B4D3410B6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id c1-40xYbvS2Q; Sun, 19 Jun 2022 16:50:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3F5BB40943;
	Sun, 19 Jun 2022 16:50:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3F5BB40943
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 66A1E1BF4E7
 for <buildroot@lists.busybox.net>; Sun, 19 Jun 2022 16:50:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 423FF81C38
 for <buildroot@lists.busybox.net>; Sun, 19 Jun 2022 16:50:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 423FF81C38
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yIX5UIdicCgZ for <buildroot@lists.busybox.net>;
 Sun, 19 Jun 2022 16:50:29 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5786781337
 for <buildroot@buildroot.org>; Sun, 19 Jun 2022 16:50:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5786781337
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 08D1B8742D; Sun, 19 Jun 2022 16:38:10 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sun, 19 Jun 2022 18:48:57 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 83adec71b9380c91a34df992157b7a25ee46d7ca
X-Git-Newrev: 147e7b3c31dcd34ab71d7a8c0ed828cb4601a841
X-Patchwork-Hint: ignore
Message-Id: <20220619163810.08D1B8742D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-alembic: new package
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
Content-Type: multipart/mixed; boundary="===============7407909156323908026=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============7407909156323908026==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=147e7b3c31dcd34ab71d7a8c0ed828cb4601a841
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: José Pekkarinen <jose.pekkarinen@unikie.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 DEVELOPERS                                 |  1 +
 package/Config.in                          |  1 +
 package/python-alembic/Config.in           |  7 +++++++
 package/python-alembic/python-alembic.hash |  5 +++++
 package/python-alembic/python-alembic.mk   | 14 ++++++++++++++
 5 files changed, 28 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index c7a4b73ba7..44b56ec88a 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1542,6 +1542,7 @@ N:	José Pekkarinen <jose.pekkarinen@unikie.com>
 F:	package/alfred/
 F:	package/bmx7/
 F:	package/python-aexpect/
+F:	package/python-alembic/
 F:	package/softhsm2/
 F:	support/testing/tests/package/sample_python_aexpect.py
 F:	support/testing/tests/package/test_python_aexpect.py
diff --git a/package/Config.in b/package/Config.in
index 3b089166da..8b4f5570c4 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -929,6 +929,7 @@ menu "External python modules"
 	source "package/python-aiorwlock/Config.in"
 	source "package/python-aiosignal/Config.in"
 	source "package/python-aiozipkin/Config.in"
+	source "package/python-alembic/Config.in"
 	source "package/python-alsaaudio/Config.in"
 	source "package/python-ansicolors/Config.in"
 	source "package/python-argh/Config.in"
diff --git a/package/python-alembic/Config.in b/package/python-alembic/Config.in
new file mode 100644
index 0000000000..a53dde7f7f
--- /dev/null
+++ b/package/python-alembic/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_PYTHON_ALEMBIC
+	bool "python-alembic"
+	help
+	  Alembic is a database migrations tool written by the author
+	  of SQLAlchemy.
+
+	  https://alembic.sqlalchemy.org
diff --git a/package/python-alembic/python-alembic.hash b/package/python-alembic/python-alembic.hash
new file mode 100644
index 0000000000..8f5cbb6fa3
--- /dev/null
+++ b/package/python-alembic/python-alembic.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/alembic/json
+md5  44e82341a6ee0a42f63dc1f51caf91e6  alembic-1.7.7.tar.gz
+sha256  4961248173ead7ce8a21efb3de378f13b8398e6630fab0eb258dc74a8af24c58  alembic-1.7.7.tar.gz
+# Locally computed sha256 checksums
+sha256  f0e3f7a5080879ccae798882d9bee3d48fe335d0bad84ca8eec86fa594375ea0  LICENSE
diff --git a/package/python-alembic/python-alembic.mk b/package/python-alembic/python-alembic.mk
new file mode 100644
index 0000000000..8ba32647ab
--- /dev/null
+++ b/package/python-alembic/python-alembic.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-alembic
+#
+################################################################################
+
+PYTHON_ALEMBIC_VERSION = 1.7.7
+PYTHON_ALEMBIC_SOURCE = alembic-$(PYTHON_ALEMBIC_VERSION).tar.gz
+PYTHON_ALEMBIC_SITE = https://files.pythonhosted.org/packages/30/b9/5526b43a4c54d177ab14af0af4b5c31d73db33d1ad3e30976d3b023e0594
+PYTHON_ALEMBIC_SETUP_TYPE = setuptools
+PYTHON_ALEMBIC_LICENSE = MIT
+PYTHON_ALEMBIC_LICENSE_FILES = LICENSE
+
+$(eval $(python-package))

--===============7407909156323908026==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7407909156323908026==--
