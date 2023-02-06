Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6500C636D6
	for <buildroot@archiver.kernel.org>; Tue, 21 Feb 2023 01:32:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 684C47003C;
	Tue, 21 Feb 2023 01:32:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 684C47003C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hVgRn4_6QgE3; Tue, 21 Feb 2023 01:32:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A2DDE7003F;
	Tue, 21 Feb 2023 01:32:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A2DDE7003F
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D01111BF2E3
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 21:03:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6CC3F6FBF9
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6CC3F6FBF9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BHBm2mo4mcRI for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:52:48 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9361D6FC0F
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:52:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9361D6FC0F
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 90DE8828C8; Mon, 20 Feb 2023 20:52:48 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Mon, 6 Feb 2023 12:00:14 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 101b05a37479c31e397cdabad06e346665c93eba
X-Git-Newrev: 87af250c0e136bf8751e1fc8a6196f9b25a0b64e
X-Patchwork-Hint: ignore
Message-Id: <20230220205248.90DE8828C8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/python-iniparse: add
 host-python-iniparse
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

commit: https://git.buildroot.net/buildroot/commit/?id=87af250c0e136bf8751e1fc8a6196f9b25a0b64e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Make the host variant of python-iniparse as host-crudini dependency.

Note: usually, we would not have needed to add a Config.in.host,
because it is jsut a library, but since there is an Config.in.host
for python-six, we need to select it, so we need an host entry.

Signed-off-by: Konstantin Menyaev <KAMenyaev@sberdevices.ru>
Reviewed-by: Heiko Thiery <heiko.thiery@gmail.com>
[yann.morin.1998@free.fr:
  - add the note
  - reorder alphabetically
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/Config.in.host                     |  1 +
 package/python-iniparse/Config.in.host     | 11 +++++++++++
 package/python-iniparse/python-iniparse.mk |  1 +
 3 files changed, 13 insertions(+)

diff --git a/package/Config.in.host b/package/Config.in.host
index b76bea60d0..0f612d7872 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -77,6 +77,7 @@ menu "Host utilities"
 	source "package/pwgen/Config.in.host"
 	source "package/python-cython/Config.in.host"
 	source "package/python-greenlet/Config.in.host"
+	source "package/python-iniparse/Config.in.host
 	source "package/python-kflash/Config.in.host"
 	source "package/python-lxml/Config.in.host"
 	source "package/python-pyyaml/Config.in.host"
diff --git a/package/python-iniparse/Config.in.host b/package/python-iniparse/Config.in.host
new file mode 100644
index 0000000000..e93022e815
--- /dev/null
+++ b/package/python-iniparse/Config.in.host
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_HOST_PYTHON_INIPARSE
+	bool "host python-iniparse"
+	select BR2_PACKAGE_HOST_PYTHON_SIX # runtime
+	help
+	  iniparse is an INI parser for Python which is API compatible
+	  with the standard library's ConfigParser, preserves
+	  structure of INI files (order of sections & options,
+	  indentation, comments, and blank lines are preserved when
+	  data is updated), and is more convenient to use.
+
+	  https://pypi.python.org/pypi/iniparse
diff --git a/package/python-iniparse/python-iniparse.mk b/package/python-iniparse/python-iniparse.mk
index d31a490bd8..e76987d1e9 100644
--- a/package/python-iniparse/python-iniparse.mk
+++ b/package/python-iniparse/python-iniparse.mk
@@ -12,3 +12,4 @@ PYTHON_INIPARSE_LICENSE_FILES = LICENSE-PSF LICENSE
 PYTHON_INIPARSE_SETUP_TYPE = setuptools
 
 $(eval $(python-package))
+$(eval $(host-python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
