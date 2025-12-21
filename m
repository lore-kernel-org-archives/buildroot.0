Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AE34E66886
	for <buildroot@archiver.kernel.org>; Sun, 21 Dec 2025 22:12:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E5A9440789;
	Sun, 21 Dec 2025 22:12:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Nptwbm_fcA0m; Sun, 21 Dec 2025 22:12:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 163784087A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766355169;
	bh=/MJbgklybRUum5GHeaYU2HXeSJHSGTU6T67GiTx7Hgo=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=sDm+WKt/c+9uCJHT1GdcG/cHqyunFEso1Tc0IIWAlWFk0HCrNuPjRV602vlRu1iBw
	 r/MZ1SDQmj28EuX2GjsLDoqU4YCRZ58n8hZDS11G4ZZL4Ybs3Nq0j+o0Cv/oboO6Wg
	 DU3qzKV1xcu8Vl76IfdzCatpUSxyT+bl0FYQWCIk3yPD6Tju8e2Ho7Uac1W0EQNUIY
	 Cp9jFPmSuAMzNWmu3WmdfKs+dg7Epw3JKP6S92w5GmMdvNKcSdw2C9sajK26jzsFJ5
	 mDCRbtN1jFvB0TweqNmis7M+BSrTtBJ23ji/+oxy9LW1/TujMmpkLS1nRkrTSgdYME
	 C1MEVQfWJ5dHQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 163784087A;
	Sun, 21 Dec 2025 22:12:49 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id A3B52119
 for <buildroot@buildroot.org>; Sun, 21 Dec 2025 22:12:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 66AE1400E3
 for <buildroot@buildroot.org>; Sun, 21 Dec 2025 22:12:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3eJXpdR2iHtD for <buildroot@buildroot.org>;
 Sun, 21 Dec 2025 22:12:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8507A400C5
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8507A400C5
 for <buildroot@buildroot.org>; Sun, 21 Dec 2025 22:12:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 84615870DC; Sun, 21 Dec 2025 22:12:27 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 21 Dec 2025 22:58:36 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5e9d79ac897242823aa6330a71bb3be5afce14d7
X-Git-Newrev: b5957f9e85730b56902c12fb1fa8e3281569be61
X-Patchwork-Hint: ignore
Message-Id: <20251221221227.84615870DC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-incremental: bump version
 to 24.11.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=b5957f9e85730b56902c12fb1fa8e3281569be61
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://github.com/twisted/incremental/blob/incremental-24.11.0/NEWS.rst

Switched setup type to hatch:
https://github.com/twisted/incremental/commit/c7104f892616fa37f99c6620cc85016d2f86df88

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-incremental/python-incremental.hash | 4 ++--
 package/python-incremental/python-incremental.mk   | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-incremental/python-incremental.hash b/package/python-incremental/python-incremental.hash
index 7707495a0a..02f6690b90 100644
--- a/package/python-incremental/python-incremental.hash
+++ b/package/python-incremental/python-incremental.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/incremental/json
-md5  d946fb1a369c77693b4dab8ac9b13596  incremental-24.7.2.tar.gz
-sha256  fb4f1d47ee60efe87d4f6f0ebb5f70b9760db2b2574c59c8e8912be4ebd464c9  incremental-24.7.2.tar.gz
+md5  5d7524d053b182d713981ea20079ed76  incremental-24.11.0.tar.gz
+sha256  87d3480dbb083c1d736222511a8cf380012a8176c2456d01ef483242abbbcf8c  incremental-24.11.0.tar.gz
 # Locally computed sha256 checksums
 sha256  d043bc8899b4695de1f4511d8f507b927e11723b981ce600fa3ef7b73954afa5  LICENSE
diff --git a/package/python-incremental/python-incremental.mk b/package/python-incremental/python-incremental.mk
index 9a1432ebd2..e8717db294 100644
--- a/package/python-incremental/python-incremental.mk
+++ b/package/python-incremental/python-incremental.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-PYTHON_INCREMENTAL_VERSION = 24.7.2
+PYTHON_INCREMENTAL_VERSION = 24.11.0
 PYTHON_INCREMENTAL_SOURCE = incremental-$(PYTHON_INCREMENTAL_VERSION).tar.gz
-PYTHON_INCREMENTAL_SITE = https://files.pythonhosted.org/packages/27/87/156b374ff6578062965afe30cc57627d35234369b3336cf244b240c8d8e6
-PYTHON_INCREMENTAL_SETUP_TYPE = setuptools
+PYTHON_INCREMENTAL_SITE = https://files.pythonhosted.org/packages/ef/3c/82e84109e02c492f382c711c58a3dd91badda6d746def81a1465f74dc9f5
+PYTHON_INCREMENTAL_SETUP_TYPE = hatch
 PYTHON_INCREMENTAL_LICENSE = MIT
 PYTHON_INCREMENTAL_LICENSE_FILES = LICENSE
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
