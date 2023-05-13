Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E298BC77B7D
	for <buildroot@archiver.kernel.org>; Sat, 13 May 2023 19:49:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8A42361505;
	Sat, 13 May 2023 19:49:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8A42361505
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 465twnrLodvS; Sat, 13 May 2023 19:49:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 81A0B60B3D;
	Sat, 13 May 2023 19:49:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 81A0B60B3D
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2CC401BF86C
 for <buildroot@lists.busybox.net>; Sat, 13 May 2023 19:48:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0502D60A94
 for <buildroot@lists.busybox.net>; Sat, 13 May 2023 19:48:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0502D60A94
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id D6oPzk1aW7NV for <buildroot@lists.busybox.net>;
 Sat, 13 May 2023 19:48:49 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 19F7260A63
 for <buildroot@buildroot.org>; Sat, 13 May 2023 19:48:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 19F7260A63
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 08983865C1; Sat, 13 May 2023 19:48:49 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 13 May 2023 21:48:19 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 952fdd8fb1561f123480c781a60f7f4c597f331f
X-Git-Newrev: fe547366ef9c92da537e762b8a22e17c9badcaae
X-Patchwork-Hint: ignore
Message-Id: <20230513194849.08983865C1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package: {, python-py}mupdf: bump to 1.22.0
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
Content-Type: multipart/mixed; boundary="===============6634908191181787267=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6634908191181787267==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=fe547366ef9c92da537e762b8a22e17c9badcaae
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Also remove the last two '*_IGNORE_CVES', since the corresponding
patches have been removed (they are now part of upstream) in
1fb64680bffbda1e5fb952150652f73205322707.

Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
[yann.morin.1998@free.fr: move dropping CVE ignores into its own patch]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/mupdf/mupdf.hash                   | 4 ++--
 package/mupdf/mupdf.mk                     | 2 +-
 package/python-pymupdf/python-pymupdf.hash | 4 ++--
 package/python-pymupdf/python-pymupdf.mk   | 4 ++--
 4 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/package/mupdf/mupdf.hash b/package/mupdf/mupdf.hash
index ef91abee18..1f636097ed 100644
--- a/package/mupdf/mupdf.hash
+++ b/package/mupdf/mupdf.hash
@@ -1,8 +1,8 @@
 # From https://mupdf.com/downloads/index.html:
-sha1  f759d914ec6ad6a3b96f994630ff70b75823831b  mupdf-1.21.1-source.tar.lz
+sha1  b9907729d604f0bf3846b45cd5891e10d7a66e24  mupdf-1.22.0-source.tar.lz
 
 # Locally computed:
-sha256  66a43490676c7f7c2ff74067328ef13285506fcc758d365ae27ea3668bd5e620  mupdf-1.21.1-source.tar.lz
+sha256  bed78a0abf8496b30c523497292de979db633eca57e02f6cd0f3c7c042551c3e  mupdf-1.22.0-source.tar.lz
 
 # Hash for license files:
 sha256  57c8ff33c9c0cfc3ef00e650a1cc910d7ee479a8bc509f6c9209a7c2a11399d6  COPYING
diff --git a/package/mupdf/mupdf.mk b/package/mupdf/mupdf.mk
index 4c35ba500e..08894d7980 100644
--- a/package/mupdf/mupdf.mk
+++ b/package/mupdf/mupdf.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # python-pymupdf's version must match mupdf's version
-MUPDF_VERSION = 1.21.1
+MUPDF_VERSION = 1.22.0
 MUPDF_SOURCE = mupdf-$(MUPDF_VERSION)-source.tar.lz
 MUPDF_SITE = https://mupdf.com/downloads/archive
 MUPDF_LICENSE = AGPL-3.0+
diff --git a/package/python-pymupdf/python-pymupdf.hash b/package/python-pymupdf/python-pymupdf.hash
index bda356d905..9fd8150088 100644
--- a/package/python-pymupdf/python-pymupdf.hash
+++ b/package/python-pymupdf/python-pymupdf.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pymupdf/json
-md5  be10963679ac6d52b7aed2311ca7e3c5  PyMuPDF-1.21.1.tar.gz
-sha256  f815741a435c62a0036bbcbf5fa6c533567bd69c5338d413714fc57b22db93e0  PyMuPDF-1.21.1.tar.gz
+md5  468fe56375a1fca99e83fe0aa0b9f8bd  PyMuPDF-1.22.0.tar.gz
+sha256  6e1694e5c0cd8b92d503a506ee8e4ba1bed768528de586889d3ec90e9dc4a7d3  PyMuPDF-1.22.0.tar.gz
 # Locally computed sha256 checksums
 sha256  57c8ff33c9c0cfc3ef00e650a1cc910d7ee479a8bc509f6c9209a7c2a11399d6  COPYING
diff --git a/package/python-pymupdf/python-pymupdf.mk b/package/python-pymupdf/python-pymupdf.mk
index 03fc8bc4fb..639ce0e00e 100644
--- a/package/python-pymupdf/python-pymupdf.mk
+++ b/package/python-pymupdf/python-pymupdf.mk
@@ -5,9 +5,9 @@
 ################################################################################
 
 # python-pymupdf's version must match mupdf's version
-PYTHON_PYMUPDF_VERSION = 1.21.1
+PYTHON_PYMUPDF_VERSION = 1.22.0
 PYTHON_PYMUPDF_SOURCE = PyMuPDF-$(PYTHON_PYMUPDF_VERSION).tar.gz
-PYTHON_PYMUPDF_SITE = https://files.pythonhosted.org/packages/30/44/9fce79689e5df7deebe2d17cb2b9b2a6b888439c241e71296e732aefa649
+PYTHON_PYMUPDF_SITE = https://files.pythonhosted.org/packages/28/ba/d6bb6fd678e8396d7b944870286fb25fd6f499b8cb599b5436c8f725adbf
 PYTHON_PYMUPDF_SETUP_TYPE = setuptools
 PYTHON_PYMUPDF_LICENSE = AGPL-3.0+
 PYTHON_PYMUPDF_LICENSE_FILES = COPYING

--===============6634908191181787267==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6634908191181787267==--
