Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E58B5CF9C64
	for <buildroot@archiver.kernel.org>; Sat, 21 Sep 2024 21:07:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6883F6082C;
	Sat, 21 Sep 2024 21:07:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id thJyE3-v-MKb; Sat, 21 Sep 2024 21:07:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 43B6B60802
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 43B6B60802;
	Sat, 21 Sep 2024 21:07:44 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6A92D1BF473
 for <buildroot@lists.busybox.net>; Sat, 21 Sep 2024 21:07:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 59E3981589
 for <buildroot@lists.busybox.net>; Sat, 21 Sep 2024 21:07:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CG2UdPUaMQSu for <buildroot@lists.busybox.net>;
 Sat, 21 Sep 2024 21:07:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 696B38146B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 696B38146B
 for <buildroot@buildroot.org>; Sat, 21 Sep 2024 21:07:41 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 53D9F8415D; Sat, 21 Sep 2024 21:07:41 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 21 Sep 2024 22:22:26 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d8f336c7ad263af82fc5359d120569c4a50d4fe9
X-Git-Newrev: 11559c71b3da6f2eebda6e56e4c92d98c6764861
X-Patchwork-Hint: ignore
Message-Id: <20240921210741.53D9F8415D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-mwclient: bump to version
 0.11.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=11559c71b3da6f2eebda6e56e4c92d98c6764861
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop no longer required python-six runtime dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/python-mwclient/Config.in            | 1 -
 package/python-mwclient/python-mwclient.hash | 6 +++---
 package/python-mwclient/python-mwclient.mk   | 4 ++--
 3 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/package/python-mwclient/Config.in b/package/python-mwclient/Config.in
index dc93e6c0df..1473793ec9 100644
--- a/package/python-mwclient/Config.in
+++ b/package/python-mwclient/Config.in
@@ -1,7 +1,6 @@
 config BR2_PACKAGE_PYTHON_MWCLIENT
 	bool "python-mwclient"
 	select BR2_PACKAGE_PYTHON_REQUESTS_OAUTHLIB # runtime
-	select BR2_PACKAGE_PYTHON_SIX # runtime
 	help
 	  Python client library to interface with the MediaWiki API
 
diff --git a/package/python-mwclient/python-mwclient.hash b/package/python-mwclient/python-mwclient.hash
index 354bd685e4..5f870bb55f 100644
--- a/package/python-mwclient/python-mwclient.hash
+++ b/package/python-mwclient/python-mwclient.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/mwclient/json
-md5  148bd36bfaaf591bd9c0076cbf1ed888  mwclient-0.10.1.tar.gz
-sha256  79363dd8d12f5e3b91b92b63152bf9dfef27da786c076a244e1f148c8dd67139  mwclient-0.10.1.tar.gz
-# Locally computed
+md5  791213fdc5d071c8652d81986da9ae6a  mwclient-0.11.0.tar.gz
+sha256  2bb7696f3703243eb33514ab162d7f6076dcedd011be90682936046c5e34fd06  mwclient-0.11.0.tar.gz
+# Locally computed sha256 checksums
 sha256  67689d1fd48a5adba31272eed653c12160dd3abbfe92ab056ac42a155e12e523  LICENSE.md
diff --git a/package/python-mwclient/python-mwclient.mk b/package/python-mwclient/python-mwclient.mk
index 07aa877ed9..60154f6eeb 100644
--- a/package/python-mwclient/python-mwclient.mk
+++ b/package/python-mwclient/python-mwclient.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_MWCLIENT_VERSION = 0.10.1
+PYTHON_MWCLIENT_VERSION = 0.11.0
 PYTHON_MWCLIENT_SOURCE = mwclient-$(PYTHON_MWCLIENT_VERSION).tar.gz
-PYTHON_MWCLIENT_SITE = https://files.pythonhosted.org/packages/97/b4/5fc70ad3286a8d8ec4b9ac01acad0f6b00c5a48d4a16b9d3be6519b7eb21
+PYTHON_MWCLIENT_SITE = https://files.pythonhosted.org/packages/5e/b3/0f77b8838a22e99b9cb64aef15fb96a4a8315fe890dbe3bff6f8364e8940
 PYTHON_MWCLIENT_LICENSE = MIT
 PYTHON_MWCLIENT_LICENSE_FILES = LICENSE.md
 PYTHON_MWCLIENT_SETUP_TYPE = setuptools
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
