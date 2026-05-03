Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 047B0CD3426
	for <buildroot@archiver.kernel.org>; Sun,  3 May 2026 14:51:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CE2208424B;
	Sun,  3 May 2026 14:51:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0o35pQSrWQWu; Sun,  3 May 2026 14:51:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ED807842E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777819898;
	bh=wh8LtbsbyqrwY19imf3ScSoU9DWaXUej84wwZxgnyac=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Oadao2opyp2jOWRm+M9YaE/tNH0Ld4GE4r1AQ13wDS9ulHQe4mQHpi/oMPzwvIGc5
	 6BOExf8HMlW+esg9C+tmRihaeydEO3Re6HllWqjNmUMY9/KFt7BnJPrC9it0btFnBp
	 HGkbO4cWuxNoUYDim6L5MFyzfW/U3Zv0ShnwaizxDdPc85Q/l3pFe1CiEwqAtJeqH5
	 neemmwFE6Gs9Wib5Ip3i+1CgzZy96vsm7yQxiyWBRK/KDJFNyMo1IQrSCDsvaVtYr2
	 sNGVuBmEij4WYNe/qMPaFsB1X6rteectOF7GaIxttJsmEH9jD/gonUT+GWRD03XxrX
	 QCnjMCMNvJm8Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id ED807842E7;
	Sun,  3 May 2026 14:51:37 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 03213127
 for <buildroot@buildroot.org>; Sun,  3 May 2026 14:50:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 988EA8427A
 for <buildroot@buildroot.org>; Sun,  3 May 2026 14:50:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sqzDOIlWMhEO for <buildroot@buildroot.org>;
 Sun,  3 May 2026 14:50:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C781184264
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id C781184264
 for <buildroot@buildroot.org>; Sun,  3 May 2026 14:50:50 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 84EC183FC0; Sun,  3 May 2026 14:50:50 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 3 May 2026 16:48:24 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 59464fc57b588471ef7eff6eb61382879b99d372
X-Git-Newrev: 9212b466bc633222354630efa8f2b8ecdfed479b
X-Patchwork-Hint: ignore
Message-Id: <20260503145050.84EC183FC0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-tortoise-orm: bump version
 to 1.1.7
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/9212b466bc633222354630efa8f2b8ecdfed479b
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/tortoise/tortoise-orm/blob/1.1.7/CHANGELOG.rst

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-tortoise-orm/python-tortoise-orm.hash | 4 ++--
 package/python-tortoise-orm/python-tortoise-orm.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-tortoise-orm/python-tortoise-orm.hash b/package/python-tortoise-orm/python-tortoise-orm.hash
index 77144495f8..ca76cc9219 100644
--- a/package/python-tortoise-orm/python-tortoise-orm.hash
+++ b/package/python-tortoise-orm/python-tortoise-orm.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/tortoise-orm/json
-md5  c3278bf834e12f7bcfef071ba52c0dbd  tortoise_orm-1.1.6.tar.gz
-sha256  30095a77aa7c3eb3ede1baf4b390a66b994dc7c4d0d06a609d23a16c50e55d0c  tortoise_orm-1.1.6.tar.gz
+md5  0c980e5e003b197f22c271da5fd72875  tortoise_orm-1.1.7.tar.gz
+sha256  a0f0f27f9c92547739f0a3f0862c257ab64d8baadbc0e548cbcfa2d70bcbe275  tortoise_orm-1.1.7.tar.gz
 # Locally computed sha256 checksums
 sha256  f955d347b975d5867ee364f978476b3012878a706d468571b9758cac74de6041  LICENSE.txt
diff --git a/package/python-tortoise-orm/python-tortoise-orm.mk b/package/python-tortoise-orm/python-tortoise-orm.mk
index e0190eb9ff..48a7e84e6d 100644
--- a/package/python-tortoise-orm/python-tortoise-orm.mk
+++ b/package/python-tortoise-orm/python-tortoise-orm.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_TORTOISE_ORM_VERSION = 1.1.6
+PYTHON_TORTOISE_ORM_VERSION = 1.1.7
 PYTHON_TORTOISE_ORM_SOURCE = tortoise_orm-$(PYTHON_TORTOISE_ORM_VERSION).tar.gz
-PYTHON_TORTOISE_ORM_SITE = https://files.pythonhosted.org/packages/40/76/629a5d69c170605dbdc10f3f3416d124fae05836860686ccd9e06726810c
+PYTHON_TORTOISE_ORM_SITE = https://files.pythonhosted.org/packages/1d/55/e75d3ae0dd2c96cf961bf068f465fb62ec481d802beb65f406620bfd40a0
 PYTHON_TORTOISE_ORM_SETUP_TYPE = pep517
 PYTHON_TORTOISE_ORM_LICENSE = Apache-2.0
 PYTHON_TORTOISE_ORM_LICENSE_FILES = LICENSE.txt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
