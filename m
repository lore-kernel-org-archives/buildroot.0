Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EE72CCD1AB
	for <buildroot@archiver.kernel.org>; Wed, 22 Oct 2025 20:09:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C39626143B;
	Wed, 22 Oct 2025 20:09:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mZ448pf9QUKc; Wed, 22 Oct 2025 20:09:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CC34F6140A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id CC34F6140A;
	Wed, 22 Oct 2025 20:09:04 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id BC866DE
 for <buildroot@buildroot.org>; Wed, 22 Oct 2025 20:09:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A245E613E3
 for <buildroot@buildroot.org>; Wed, 22 Oct 2025 20:09:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id THGgBevePKZE for <buildroot@buildroot.org>;
 Wed, 22 Oct 2025 20:09:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E85EA612B1
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id E85EA612B1
 for <buildroot@buildroot.org>; Wed, 22 Oct 2025 20:09:02 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D7CEF8775A; Wed, 22 Oct 2025 20:09:02 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 22 Oct 2025 22:08:15 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 54c6c0125ac024bf5e99fc33e13d01bf58116a0a
X-Git-Newrev: b0773a84f973d020d21f94f814c886c4899d4ba2
X-Patchwork-Hint: ignore
Message-Id: <20251022200902.D7CEF8775A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-sqliteschema: add missing
 dependency
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

commit: https://git.buildroot.net/buildroot/commit/?id=b0773a84f973d020d21f94f814c886c4899d4ba2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

python-sqliteschema introduced a dependency to setuptools-scm in the
following commit:

b84056b Modify to use `setuptools_scm` for package build
https://github.com/thombashi/sqliteschema/commit/b84056b8d98a305369a1f949b5462059c914e65f

Fixes:
https://autobuild.buildroot.org/results/ddfb25489c17d54cdb44f199c7a8d1646e605a32/

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
[Julien: add link to upstream commit]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-sqliteschema/python-sqliteschema.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/python-sqliteschema/python-sqliteschema.mk b/package/python-sqliteschema/python-sqliteschema.mk
index 93d50d1aea..a55ae8a0e0 100644
--- a/package/python-sqliteschema/python-sqliteschema.mk
+++ b/package/python-sqliteschema/python-sqliteschema.mk
@@ -10,5 +10,6 @@ PYTHON_SQLITESCHEMA_SITE = https://files.pythonhosted.org/packages/90/ad/0d7010b
 PYTHON_SQLITESCHEMA_SETUP_TYPE = setuptools
 PYTHON_SQLITESCHEMA_LICENSE = MIT
 PYTHON_SQLITESCHEMA_LICENSE_FILES = LICENSE
+PYTHON_SQLITESCHEMA_DEPENDENCIES = host-python-setuptools-scm
 
 $(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
