Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7930CD3426
	for <buildroot@archiver.kernel.org>; Sun,  3 May 2026 14:50:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7D44884259;
	Sun,  3 May 2026 14:50:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kLBLZoZ87xYb; Sun,  3 May 2026 14:50:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C0DA784243
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777819839;
	bh=D2epovA31BYm+veQzY6WT/ukgBjQ8Ph3iSQH7X3SA7I=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Lx2BMTvyIIEW388hU8oANE+cwLT+M6c+cGdEXX20I/zVjPivmHAdPjIIWbplnO466
	 rMpJGnqAnB8VrHuja+s5FJqSZUUmL5MvOaY9Eh97zMeYXWXkYdww8/7M45F3Zv/Dk1
	 By6po7EfoQ/+OeLDNfuPmxqtZFVO1+M5E/xiOwl998DfPPUDRWxWTIHE5U/v1WT6JV
	 HxDm5RZunQXmw8tO1THmScIeYbuXm1oJgrxs3RbRHurmtP6nCFGkZcRliNs34to5Ui
	 F5oKoNerfzVqkSIAQ7G99Yocy/7i+Y/IslfcvDl2sDu0eaGyzRSBBNlj0GbIWweKF5
	 zmoMBJr789zWQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C0DA784243;
	Sun,  3 May 2026 14:50:39 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1D5FD392
 for <buildroot@buildroot.org>; Sun,  3 May 2026 14:50:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 78FF961274
 for <buildroot@buildroot.org>; Sun,  3 May 2026 14:50:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id b6mLTV3RqPba for <buildroot@buildroot.org>;
 Sun,  3 May 2026 14:50:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3DE1D6126B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3DE1D6126B
 for <buildroot@buildroot.org>; Sun,  3 May 2026 14:50:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0690483FC1; Sun,  3 May 2026 14:50:25 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 3 May 2026 16:48:23 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: cd15955792e0792f2acf85f7e2354922175e1db7
X-Git-Newrev: c2a90f9621d7350bc1f457d40c097ea5e27b46a8
X-Patchwork-Hint: ignore
Message-Id: <20260503145025.0690483FC1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-editables: bump version to
 0.6
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/c2a90f9621d7350bc1f457d40c097ea5e27b46a8
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/pfmoore/editables/blob/0.6/CHANGELOG.md

Updated license hash due to removal of DOS line endings.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-editables/python-editables.hash | 6 +++---
 package/python-editables/python-editables.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-editables/python-editables.hash b/package/python-editables/python-editables.hash
index a34c7ad20e..e8736170d6 100644
--- a/package/python-editables/python-editables.hash
+++ b/package/python-editables/python-editables.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/editables/json
-md5  520de8c3a9dc5dfb2b365d104541c9de  editables-0.5.tar.gz
-sha256  309627d9b5c4adc0e668d8c6fa7bac1ba7c8c5d415c2d27f60f081f8e80d1de2  editables-0.5.tar.gz
+md5  658e28eab5b342442d8edc42ff4fa3bd  editables-0.6.tar.gz
+sha256  1163834902381c4613787951c5914800fdf155ae08848a373b8ea5006780977c  editables-0.6.tar.gz
 # Locally computed sha256 checksums
-sha256  c73e08a04e1557fdb49525fb7a579f73bcab84a254910b9350ee56daf143932d  LICENSE.txt
+sha256  65f80d840245883efab92f8c70b60cb483d3b734fc95f208364ff69811d602c4  LICENSE.txt
diff --git a/package/python-editables/python-editables.mk b/package/python-editables/python-editables.mk
index e60d50f9d6..116aa228d5 100644
--- a/package/python-editables/python-editables.mk
+++ b/package/python-editables/python-editables.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_EDITABLES_VERSION = 0.5
+PYTHON_EDITABLES_VERSION = 0.6
 PYTHON_EDITABLES_SOURCE = editables-$(PYTHON_EDITABLES_VERSION).tar.gz
-PYTHON_EDITABLES_SITE = https://files.pythonhosted.org/packages/37/4a/986d35164e2033ddfb44515168a281a7986e260d344cf369c3f52d4c3275
+PYTHON_EDITABLES_SITE = https://files.pythonhosted.org/packages/82/f8/02a4e9a0cb961b0feeb431ac96b231c157ecdcbbeacafe9e2fdb4b1dde39
 PYTHON_EDITABLES_LICENSE = MIT
 PYTHON_EDITABLES_LICENSE_FILES = LICENSE.txt
 PYTHON_EDITABLES_SETUP_TYPE = setuptools
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
