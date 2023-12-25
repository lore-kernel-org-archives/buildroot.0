Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4435C3DA6E
	for <buildroot@archiver.kernel.org>; Mon, 25 Dec 2023 10:14:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8FC4440151;
	Mon, 25 Dec 2023 10:14:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8FC4440151
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wcDHIPNoDNeG; Mon, 25 Dec 2023 10:14:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B86EA40129;
	Mon, 25 Dec 2023 10:14:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B86EA40129
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8C9711BF2BE
 for <buildroot@lists.busybox.net>; Mon, 25 Dec 2023 10:13:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 65BF740129
 for <buildroot@lists.busybox.net>; Mon, 25 Dec 2023 10:13:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 65BF740129
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XToWeamzRx0A for <buildroot@lists.busybox.net>;
 Mon, 25 Dec 2023 10:13:57 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 80768400BA
 for <buildroot@buildroot.org>; Mon, 25 Dec 2023 10:13:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 80768400BA
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6CD9781843; Mon, 25 Dec 2023 10:13:57 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 25 Dec 2023 11:12:20 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8dc5506c76a555bd7eb2455407022b1287b9a821
X-Git-Newrev: b48a1955099085b68df1bdee99bb18848fc2e2cc
X-Patchwork-Hint: ignore
Message-Id: <20231225101357.6CD9781843@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-multipart: new package
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

commit: https://git.buildroot.net/buildroot/commit/?id=b48a1955099085b68df1bdee99bb18848fc2e2cc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/Config.in                              |  1 +
 package/python-multipart/Config.in             |  6 ++++++
 package/python-multipart/python-multipart.hash |  5 +++++
 package/python-multipart/python-multipart.mk   | 15 +++++++++++++++
 4 files changed, 27 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index c3aeb87f08..67713e9209 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1179,6 +1179,7 @@ menu "External python modules"
 	source "package/python-msgfy/Config.in"
 	source "package/python-msgpack/Config.in"
 	source "package/python-multidict/Config.in"
+	source "package/python-multipart/Config.in"
 	source "package/python-munch/Config.in"
 	source "package/python-mutagen/Config.in"
 	source "package/python-mwclient/Config.in"
diff --git a/package/python-multipart/Config.in b/package/python-multipart/Config.in
new file mode 100644
index 0000000000..07002e1018
--- /dev/null
+++ b/package/python-multipart/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_PYTHON_MULTIPART
+	bool "python-multipart"
+	help
+	  A streaming multipart parser for Python.
+
+	  https://github.com/andrew-d/python-multipart
diff --git a/package/python-multipart/python-multipart.hash b/package/python-multipart/python-multipart.hash
new file mode 100644
index 0000000000..9b2b6d3d82
--- /dev/null
+++ b/package/python-multipart/python-multipart.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/python-multipart/json
+md5  a61a045b7f5e64d44dc53c73522ac4d2  python_multipart-0.0.6.tar.gz
+sha256  e9925a80bb668529f1b67c7fdb0a5dacdd7cbfc6fb0bff3ea443fe22bdd62132  python_multipart-0.0.6.tar.gz
+# Locally computed sha256 checksums
+sha256  a8e833176cd617daf00b9d6d39fa15ca8edebc6d1643079cd2f4893c0c289be2  LICENSE.txt
diff --git a/package/python-multipart/python-multipart.mk b/package/python-multipart/python-multipart.mk
new file mode 100644
index 0000000000..7ffb05fa92
--- /dev/null
+++ b/package/python-multipart/python-multipart.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# python-multipart
+#
+################################################################################
+
+PYTHON_MULTIPART_VERSION = 0.0.6
+PYTHON_MULTIPART_SOURCE = python_multipart-$(PYTHON_MULTIPART_VERSION).tar.gz
+PYTHON_MULTIPART_SITE = https://files.pythonhosted.org/packages/2d/23/abcfad10c3348cb6358400f8adbc21b523bbc6c954494fd0974428068672
+PYTHON_MULTIPART_SETUP_TYPE = pep517
+PYTHON_MULTIPART_LICENSE = Apache-2.0
+PYTHON_MULTIPART_LICENSE_FILES = LICENSE.txt
+PYTHON_MULTIPART_DEPENDENCIES = host-python-hatchling
+
+$(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
