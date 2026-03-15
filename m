Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39046F3027F
	for <buildroot@archiver.kernel.org>; Sun, 15 Mar 2026 22:19:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F340461389;
	Sun, 15 Mar 2026 22:19:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4uv_W655x-X8; Sun, 15 Mar 2026 22:19:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B438361395
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773613162;
	bh=yRns0L+JQTe9gDbMVowa9lK2PYfELbKxYvx1PrkdrCA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=dbA0d1Oq0i4aP+/u7BnUwdO6Ih1yaOb893+j5ljT94CTgTu2NwJhaMryaxDR5RKAw
	 JhjpNwmu2ykNGG2d8/LLEOdqTnDiJRvzuDDfaurIsFHnfZOLB7b7rQLfJoHi63nBXR
	 lFu6fVnO5doorlQA7qdv8SajvA9uM7ydi1u5yFsJh27n3sjpindn7dPXpFFRGS4rXW
	 BLdA9FnVyhAA5zE6TCU7ZT8qBq/29N46xDGFBEimzzCxm8MQIQwhIlNe6r6LF+GR+k
	 Ww9fWz6zBaL1YDRx3wDNMbLdOSjQXJMzX/T3a7DorXWR1bpgTmfHTewDJtzPo6SqYL
	 8R0zafKwuaRRw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B438361395;
	Sun, 15 Mar 2026 22:19:22 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0DF4C1B4
 for <buildroot@buildroot.org>; Sun, 15 Mar 2026 22:18:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4146940B60
 for <buildroot@buildroot.org>; Sun, 15 Mar 2026 22:18:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9X5yFCQC42bi for <buildroot@buildroot.org>;
 Sun, 15 Mar 2026 22:18:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 560BF40891
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 560BF40891
 for <buildroot@buildroot.org>; Sun, 15 Mar 2026 22:18:03 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 982CB80FBC; Sun, 15 Mar 2026 22:18:03 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 15 Mar 2026 21:34:39 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 219bec157532539ed3a0b11a131d9eb17752483f
X-Git-Newrev: 0d0fdd3358c1ddcc73bab5f8de08ab0d5dfa112f
X-Patchwork-Hint: ignore
Message-Id: <20260315221803.982CB80FBC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-pyqt5-sip: bump version to
 12.18.0
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/0d0fdd3358c1ddcc73bab5f8de08ab0d5dfa112f
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Package was updated using an updated version of scanpypi:
https://patchwork.ozlabs.org/project/buildroot/patch/20251001002004.3178942-1-james.hilliard1@gmail.com/

Updated license hash due to copyright year bump:
https://github.com/Python-SIP/sip/commit/394e97272bc7d0b7a350e722ad2b748e07556fb1

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-pyqt5-sip/python-pyqt5-sip.hash | 11 +++++------
 package/python-pyqt5-sip/python-pyqt5-sip.mk   |  6 +++---
 2 files changed, 8 insertions(+), 9 deletions(-)

diff --git a/package/python-pyqt5-sip/python-pyqt5-sip.hash b/package/python-pyqt5-sip/python-pyqt5-sip.hash
index 909ee2ef33..bf5560dab1 100644
--- a/package/python-pyqt5-sip/python-pyqt5-sip.hash
+++ b/package/python-pyqt5-sip/python-pyqt5-sip.hash
@@ -1,6 +1,5 @@
-# From https://pypi.org/pypi/PyQt5-sip/json
-md5  9e0909e79f40619b0f2d3d3c33b4d4f7  PyQt5_sip-12.15.0.tar.gz
-sha256  d23fdfcf363b5cedd9d39f8a9c5710e7d52804f5b08a58e91c638b36eafcb702  PyQt5_sip-12.15.0.tar.gz
-
-# Locally calculated
-sha256  3859cfca971e429d6b79bdfeb1dc9e43aa9592f7295bf28fdd62824097909383  LICENSE
+# md5, sha256 from https://pypi.org/pypi/pyqt5-sip/json
+md5  739bb540472188851f15aac80bf8e715  pyqt5_sip-12.18.0.tar.gz
+sha256  71c37db75a0664325de149f43e2a712ec5fa1f90429a21dafbca005cb6767f94  pyqt5_sip-12.18.0.tar.gz
+# Locally computed sha256 checksums
+sha256  3e6f5b427c36f94ecf86bc01698af7030a1ed6eb3748110d5dbb8d142d804611  LICENSE
diff --git a/package/python-pyqt5-sip/python-pyqt5-sip.mk b/package/python-pyqt5-sip/python-pyqt5-sip.mk
index 49762ec58c..7360e6dd48 100644
--- a/package/python-pyqt5-sip/python-pyqt5-sip.mk
+++ b/package/python-pyqt5-sip/python-pyqt5-sip.mk
@@ -14,9 +14,9 @@
 # recorded in the PyPI source file "sip.h", in the SIP_VERSION_STR
 # macro. For example, PyQt5-sip 12.15.0 was generated with Python-SIP
 # 6.8.6.
-PYTHON_PYQT5_SIP_VERSION = 12.15.0
-PYTHON_PYQT5_SIP_SITE = https://files.pythonhosted.org/packages/1b/15/78318d50f10062c428e97e7ce387e772616a4673c356018b905f247a6a85
-PYTHON_PYQT5_SIP_SOURCE = PyQt5_sip-$(PYTHON_PYQT5_SIP_VERSION).tar.gz
+PYTHON_PYQT5_SIP_VERSION = 12.18.0
+PYTHON_PYQT5_SIP_SITE = https://files.pythonhosted.org/packages/f3/31/5ef342de9faee0f3801088946ae103db9b9eaeba3d6a64fefd5ce74df244
+PYTHON_PYQT5_SIP_SOURCE = pyqt5_sip-$(PYTHON_PYQT5_SIP_VERSION).tar.gz
 PYTHON_PYQT5_SIP_LICENSE = BSD-2-Clause
 PYTHON_PYQT5_SIP_LICENSE_FILES = LICENSE
 PYTHON_PYQT5_SIP_SETUP_TYPE = setuptools
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
