Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEB30C47073
	for <buildroot@archiver.kernel.org>; Tue,  2 Jan 2024 08:55:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A73D640905;
	Tue,  2 Jan 2024 08:55:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A73D640905
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id R72Gsgx0nkOu; Tue,  2 Jan 2024 08:55:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CF3DF4091B;
	Tue,  2 Jan 2024 08:55:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CF3DF4091B
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 438C51BF5A6
 for <buildroot@lists.busybox.net>; Tue,  2 Jan 2024 08:55:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1CA01408F1
 for <buildroot@lists.busybox.net>; Tue,  2 Jan 2024 08:55:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1CA01408F1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Wc7tbpT793Xc for <buildroot@lists.busybox.net>;
 Tue,  2 Jan 2024 08:55:18 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 44BF140876
 for <buildroot@buildroot.org>; Tue,  2 Jan 2024 08:55:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 44BF140876
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2BCA283C28; Tue,  2 Jan 2024 08:55:18 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 2 Jan 2024 09:52:53 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 391a442cc350cec07c7e056bf498c8d03e9396ae
X-Git-Newrev: 6febe37bacf87b56f9f0330ed01dc800232199cf
X-Patchwork-Hint: ignore
Message-Id: <20240102085518.2BCA283C28@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-paramiko: security bump to
 version 3.4.0
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
Content-Type: multipart/mixed; boundary="===============5783406797612274218=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============5783406797612274218==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=6febe37bacf87b56f9f0330ed01dc800232199cf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Address CVE 2023-48795 (aka the “Terrapin Attack”), a vulnerability
found in the SSH protocol.

https://github.com/paramiko/paramiko/blob/3.4.0/sites/www/changelog.rst

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-paramiko/python-paramiko.hash | 4 ++--
 package/python-paramiko/python-paramiko.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-paramiko/python-paramiko.hash b/package/python-paramiko/python-paramiko.hash
index abc62fc8c2..893aac074e 100644
--- a/package/python-paramiko/python-paramiko.hash
+++ b/package/python-paramiko/python-paramiko.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/paramiko/json
-md5  08b1610e3ba9fa89e13973710cd48e35  paramiko-3.3.1.tar.gz
-sha256  6a3777a961ac86dbef375c5f5b8d50014a1a96d0fd7f054a43bc880134b0ff77  paramiko-3.3.1.tar.gz
+md5  be485ba66b576d8bc7e1c0ad96e87108  paramiko-3.4.0.tar.gz
+sha256  aac08f26a31dc4dffd92821527d1682d99d52f9ef6851968114a8728f3c274d3  paramiko-3.4.0.tar.gz
 # Locally computed sha256 checksums
 sha256  5fa25bf5f395fd26e701c2e1de4ca7d162816986dc791c22f8f4226857ad1bb2  LICENSE
diff --git a/package/python-paramiko/python-paramiko.mk b/package/python-paramiko/python-paramiko.mk
index 512a4630f5..8d921486c7 100644
--- a/package/python-paramiko/python-paramiko.mk
+++ b/package/python-paramiko/python-paramiko.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PARAMIKO_VERSION = 3.3.1
+PYTHON_PARAMIKO_VERSION = 3.4.0
 PYTHON_PARAMIKO_SOURCE = paramiko-$(PYTHON_PARAMIKO_VERSION).tar.gz
-PYTHON_PARAMIKO_SITE = https://files.pythonhosted.org/packages/44/03/158ae1dcb950bd96f04038502238159e116fafb27addf5df1ba35068f2d6
+PYTHON_PARAMIKO_SITE = https://files.pythonhosted.org/packages/cc/af/11996c4df4f9caff87997ad2d3fd8825078c277d6a928446d2b6cf249889
 PYTHON_PARAMIKO_SETUP_TYPE = setuptools
 PYTHON_PARAMIKO_LICENSE = LGPL-2.1+
 PYTHON_PARAMIKO_LICENSE_FILES = LICENSE

--===============5783406797612274218==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5783406797612274218==--
