Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FF1DD59D99
	for <buildroot@archiver.kernel.org>; Sun, 14 Dec 2025 17:47:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1B6B340537;
	Sun, 14 Dec 2025 17:47:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OG6DaoRJrgd8; Sun, 14 Dec 2025 17:47:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3D1D840501
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765734466;
	bh=kXambPP6YKDjVDmQdoUYsQcbDZn+haOEZ+juDXuzUz4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=ccPeD4m4Nt+5j8Krl4gS48Z4kjFwb5qqBFfYfpOnQo5famnIuGPJzy1pp/WTyK4aW
	 7pzt5gLCWO8xlB08siVGc+uXuH3E5Zlpz9Tcsu/2qvVmZUpX/4juQVAE/5sVD2f54w
	 oq/G3Dc2qBNsi10p5qZTP3bMwVMprz/ez5bFfJ4zJ4N/ArdLEYcfFtDL3V3GtACigZ
	 Oa303X5HODBaUiMyt5MUI/BlKhAUaFIfzxTl0sDFCdrEd/m9iC+pYeCcJsZUq+T8Gi
	 TmL+fGf1dcuzrwAo9/jidFRTCE6H/J4mGJlYlpf0NHYZLv3a9SAQZ5w6vMF6738kDk
	 uP0QSmiu6dY2A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3D1D840501;
	Sun, 14 Dec 2025 17:47:46 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 73080117
 for <buildroot@buildroot.org>; Sun, 14 Dec 2025 17:47:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 59F57404FE
 for <buildroot@buildroot.org>; Sun, 14 Dec 2025 17:47:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hOyVIb2bfy2l for <buildroot@buildroot.org>;
 Sun, 14 Dec 2025 17:47:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 88118404E8
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 88118404E8
 for <buildroot@buildroot.org>; Sun, 14 Dec 2025 17:47:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 83D3F86E95; Sun, 14 Dec 2025 17:47:42 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 14 Dec 2025 18:47:24 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6636c30dd2e8a13083179560283df14a9fef217f
X-Git-Newrev: 00108540f78b073db67cb11dc2b7160c9e381bde
X-Patchwork-Hint: ignore
Message-Id: <20251214174742.83D3F86E95@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-aiodns: bump version to
 3.6.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=00108540f78b073db67cb11dc2b7160c9e381bde
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://github.com/aio-libs/aiodns/releases/tag/v3.6.0

Updated URL in help text.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-aiodns/Config.in          | 2 +-
 package/python-aiodns/python-aiodns.hash | 4 ++--
 package/python-aiodns/python-aiodns.mk   | 4 ++--
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-aiodns/Config.in b/package/python-aiodns/Config.in
index 63c2429390..dd6ec84640 100644
--- a/package/python-aiodns/Config.in
+++ b/package/python-aiodns/Config.in
@@ -4,4 +4,4 @@ config BR2_PACKAGE_PYTHON_AIODNS
 	help
 	  Simple DNS resolver for asyncio.
 
-	  http://github.com/saghul/aiodns
+	  https://github.com/saghul/aiodns
diff --git a/package/python-aiodns/python-aiodns.hash b/package/python-aiodns/python-aiodns.hash
index e0c73c2039..8e3e66d0f1 100644
--- a/package/python-aiodns/python-aiodns.hash
+++ b/package/python-aiodns/python-aiodns.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/aiodns/json
-md5  30623b233a06bd318478e39828a771d2  aiodns-3.5.0.tar.gz
-sha256  11264edbab51896ecf546c18eb0dd56dff0428c6aa6d2cd87e643e07300eb310  aiodns-3.5.0.tar.gz
+md5  dd1c76c0b2897589ae9787530cc0e468  aiodns-3.6.0.tar.gz
+sha256  9b0ef54339e6687cdbd39a7d73d7de2467cb5c115281da28f2598f058633dac8  aiodns-3.6.0.tar.gz
 # Locally computed sha256 checksums
 sha256  3e91cfa76821ab70d22998136d674d20ae888463a7e8a7f377166cfe1ee64feb  LICENSE
diff --git a/package/python-aiodns/python-aiodns.mk b/package/python-aiodns/python-aiodns.mk
index 87aa8830aa..d0a1ed6e1e 100644
--- a/package/python-aiodns/python-aiodns.mk
+++ b/package/python-aiodns/python-aiodns.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_AIODNS_VERSION = 3.5.0
+PYTHON_AIODNS_VERSION = 3.6.0
 PYTHON_AIODNS_SOURCE = aiodns-$(PYTHON_AIODNS_VERSION).tar.gz
-PYTHON_AIODNS_SITE = https://files.pythonhosted.org/packages/17/0a/163e5260cecc12de6abc259d158d9da3b8ec062ab863107dcdb1166cdcef
+PYTHON_AIODNS_SITE = https://files.pythonhosted.org/packages/e6/11/238e97cbf5c1c0f725d590a092e0618dcdc50f44dbd1e2a926fae27e6f06
 PYTHON_AIODNS_SETUP_TYPE = setuptools
 PYTHON_AIODNS_LICENSE = MIT
 PYTHON_AIODNS_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
