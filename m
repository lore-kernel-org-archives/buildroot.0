Return-Path: <SRS0=x9kH=PP=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B704C433F5
	for <buildroot@archiver.kernel.org>; Wed, 27 Oct 2021 20:30:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 21CA560F39
	for <buildroot@archiver.kernel.org>; Wed, 27 Oct 2021 20:30:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 21CA560F39
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F1CC781D7D;
	Wed, 27 Oct 2021 20:30:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ly3or3ihXz8f; Wed, 27 Oct 2021 20:30:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 49CB881D70;
	Wed, 27 Oct 2021 20:30:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0FC741BF9C8
 for <buildroot@lists.busybox.net>; Wed, 27 Oct 2021 20:30:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F3E3481D7C
 for <buildroot@lists.busybox.net>; Wed, 27 Oct 2021 20:30:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id O14VxLKBxQge for <buildroot@lists.busybox.net>;
 Wed, 27 Oct 2021 20:30:29 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 31A2881D65
 for <buildroot@buildroot.org>; Wed, 27 Oct 2021 20:30:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id D0DDE8903F; Wed, 27 Oct 2021 20:27:03 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Wed, 27 Oct 2021 22:28:03 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7f9ad0ed7fd87435cc5aaf58ae23ff7a5dc40b1d
X-Git-Newrev: 88a8565de08c2bd7d19034b063401a5d69c538e3
X-Patchwork-Hint: ignore
Message-Id: <20211027202703.D0DDE8903F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-charset-normalizer: new
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=88a8565de08c2bd7d19034b063401a5d69c538e3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 DEVELOPERS                                                 |  1 +
 package/Config.in                                          |  1 +
 package/python-charset-normalizer/Config.in                |  8 ++++++++
 .../python-charset-normalizer.hash                         |  5 +++++
 .../python-charset-normalizer/python-charset-normalizer.mk | 14 ++++++++++++++
 5 files changed, 29 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index d2320bc184..65240615b0 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1254,6 +1254,7 @@ F:	package/python-bidict/
 F:	package/python-brotli/
 F:	package/python-cbor2/
 F:	package/python-cchardet/
+F:	package/python-charset-normalizer/
 F:	package/python-flatbuffers/
 F:	package/python-frozenlist/
 F:	package/python-greenlet/
diff --git a/package/Config.in b/package/Config.in
index 5dd654a140..c23755a421 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -951,6 +951,7 @@ menu "External python modules"
 	source "package/python-channels-redis/Config.in"
 	source "package/python-characteristic/Config.in"
 	source "package/python-chardet/Config.in"
+	source "package/python-charset-normalizer/Config.in"
 	source "package/python-cheetah/Config.in"
 	source "package/python-cheroot/Config.in"
 	source "package/python-cherrypy/Config.in"
diff --git a/package/python-charset-normalizer/Config.in b/package/python-charset-normalizer/Config.in
new file mode 100644
index 0000000000..c4c40fc99b
--- /dev/null
+++ b/package/python-charset-normalizer/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_PYTHON_CHARSET_NORMALIZER
+	bool "python-charset-normalizer"
+	depends on BR2_PACKAGE_PYTHON3
+	help
+	  The Real First Universal Charset Detector. Open, modern and
+	  actively maintained alternative to Chardet.
+
+	  https://github.com/ousret/charset_normalizer
diff --git a/package/python-charset-normalizer/python-charset-normalizer.hash b/package/python-charset-normalizer/python-charset-normalizer.hash
new file mode 100644
index 0000000000..f506fa85ed
--- /dev/null
+++ b/package/python-charset-normalizer/python-charset-normalizer.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/charset-normalizer/json
+md5  b28e4463613ff3911d5a2dc62b96233f  charset-normalizer-2.0.7.tar.gz
+sha256  e019de665e2bcf9c2b64e2e5aa025fa991da8720daa3c1138cadd2fd1856aed0  charset-normalizer-2.0.7.tar.gz
+# Locally computed sha256 checksums
+sha256  eb31a0c5a4fb09b8a4e32055d25c1e5f9c358a2752fef3cd720213d1ccfee241  LICENSE
diff --git a/package/python-charset-normalizer/python-charset-normalizer.mk b/package/python-charset-normalizer/python-charset-normalizer.mk
new file mode 100644
index 0000000000..e1b805fbfb
--- /dev/null
+++ b/package/python-charset-normalizer/python-charset-normalizer.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-charset-normalizer
+#
+################################################################################
+
+PYTHON_CHARSET_NORMALIZER_VERSION = 2.0.7
+PYTHON_CHARSET_NORMALIZER_SOURCE = charset-normalizer-$(PYTHON_CHARSET_NORMALIZER_VERSION).tar.gz
+PYTHON_CHARSET_NORMALIZER_SITE = https://files.pythonhosted.org/packages/9f/c5/334c019f92c26e59637bb42bd14a190428874b2b2de75a355da394cf16c1
+PYTHON_CHARSET_NORMALIZER_SETUP_TYPE = setuptools
+PYTHON_CHARSET_NORMALIZER_LICENSE = MIT
+PYTHON_CHARSET_NORMALIZER_LICENSE_FILES = LICENSE
+
+$(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
