Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9FAFFC9EE3
	for <buildroot@archiver.kernel.org>; Sat,  7 Mar 2026 10:07:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 91BC5614E6;
	Sat,  7 Mar 2026 10:07:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XeNO8HfqgNBj; Sat,  7 Mar 2026 10:07:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AE648614E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772878059;
	bh=rCLA9WqR2pKjw/X4X3QN83cUap12iyPjRHHEIdqziCA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=SARRw+Mxctel+0G2OYylcf8Wg0DuC40e6/RLje07ZLWRkyxyCgioVE9gs2QXHIbHC
	 Pk4xzyQnfSw9z2uVfrZybGQuWFgRvP8x6HoZwvzCxYJSTisUJ8KzQVUEWahoBVEnRp
	 vbQVdUPhVzOCumipIRAWH7rbA03bL3eqzuolvTixOpI8A73kqzss9dz+kclqJLUX3C
	 LjByU/0VH8qtNYNL4gvrfes4r2el+Im0ogENk+kaFM8ZFyWxbKw/5Re6N29froxtkB
	 LLvKLcXiq77NJ87xKBcTgvEzwKhP0sJQY5DilC4eyWpZPVRQAd7uYUKZ9AfxJ+1Q89
	 buADTLd1+HFmg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id AE648614E7;
	Sat,  7 Mar 2026 10:07:39 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 45539169
 for <buildroot@buildroot.org>; Sat,  7 Mar 2026 10:07:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2B445614E0
 for <buildroot@buildroot.org>; Sat,  7 Mar 2026 10:07:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eUPqeC5Yzjmv for <buildroot@buildroot.org>;
 Sat,  7 Mar 2026 10:07:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E36EC614E3
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id E36EC614E3
 for <buildroot@buildroot.org>; Sat,  7 Mar 2026 10:07:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EDBAF86208; Sat,  7 Mar 2026 10:07:29 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 7 Mar 2026 11:00:35 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 170445994a4c5be8f766cda74ebd32acb78dd898
X-Git-Newrev: 10037a3cd541e1c46d6303ec02006ff5f6ad0df7
X-Patchwork-Hint: ignore
Message-Id: <20260307100729.EDBAF86208@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-tortoise-orm: bump to
 version 1.1.5
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/10037a3cd541e1c46d6303ec02006ff5f6ad0df7
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Drop no longer required python-pytz runtime dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-tortoise-orm/Config.in                | 1 -
 package/python-tortoise-orm/python-tortoise-orm.hash | 4 ++--
 package/python-tortoise-orm/python-tortoise-orm.mk   | 4 ++--
 3 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/package/python-tortoise-orm/Config.in b/package/python-tortoise-orm/Config.in
index 57cebc6489..a05bfeab50 100644
--- a/package/python-tortoise-orm/Config.in
+++ b/package/python-tortoise-orm/Config.in
@@ -4,7 +4,6 @@ config BR2_PACKAGE_PYTHON_TORTOISE_ORM
 	select BR2_PACKAGE_PYTHON_ANYIO # runtime
 	select BR2_PACKAGE_PYTHON_ISO8601 # runtime
 	select BR2_PACKAGE_PYTHON_PYPIKA_TORTOISE # runtime
-	select BR2_PACKAGE_PYTHON_PYTZ # runtime
 	help
 	  Easy async ORM for python, built with relations in mind.
 
diff --git a/package/python-tortoise-orm/python-tortoise-orm.hash b/package/python-tortoise-orm/python-tortoise-orm.hash
index 6e1f46dd6f..0bb4224a9e 100644
--- a/package/python-tortoise-orm/python-tortoise-orm.hash
+++ b/package/python-tortoise-orm/python-tortoise-orm.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/tortoise-orm/json
-md5  b3dab10562c6574232334e954666f3eb  tortoise_orm-0.25.3.tar.gz
-sha256  b6dedd388393624628ec46228c93df361533ceb3925986fa2d1d22debc838a7d  tortoise_orm-0.25.3.tar.gz
+md5  5c143e93e4c35dfd8cd19dfdbc064d6d  tortoise_orm-1.1.5.tar.gz
+sha256  d4074a7c34a8445fcca19ec865189d80ea7a00b29e4b12778460fcab67a5ce74  tortoise_orm-1.1.5.tar.gz
 # Locally computed sha256 checksums
 sha256  f955d347b975d5867ee364f978476b3012878a706d468571b9758cac74de6041  LICENSE.txt
diff --git a/package/python-tortoise-orm/python-tortoise-orm.mk b/package/python-tortoise-orm/python-tortoise-orm.mk
index 3a380710a0..18ad37d5d9 100644
--- a/package/python-tortoise-orm/python-tortoise-orm.mk
+++ b/package/python-tortoise-orm/python-tortoise-orm.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_TORTOISE_ORM_VERSION = 0.25.3
+PYTHON_TORTOISE_ORM_VERSION = 1.1.5
 PYTHON_TORTOISE_ORM_SOURCE = tortoise_orm-$(PYTHON_TORTOISE_ORM_VERSION).tar.gz
-PYTHON_TORTOISE_ORM_SITE = https://files.pythonhosted.org/packages/dd/be/0fdfcd8295f4f02a280f33bdda99c3edba450f9a212149232f2fbb6afa96
+PYTHON_TORTOISE_ORM_SITE = https://files.pythonhosted.org/packages/f3/b0/2b3962847aad793d32646c6e43e7fab6f845f34a5502da5722fe704ec847
 PYTHON_TORTOISE_ORM_SETUP_TYPE = pep517
 PYTHON_TORTOISE_ORM_LICENSE = Apache-2.0
 PYTHON_TORTOISE_ORM_LICENSE_FILES = LICENSE.txt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
