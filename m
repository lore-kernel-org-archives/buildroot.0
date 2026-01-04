Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63A5EC2A074
	for <buildroot@archiver.kernel.org>; Sun,  4 Jan 2026 10:31:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E7947607D4;
	Sun,  4 Jan 2026 10:31:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5vI-6btVTFZ4; Sun,  4 Jan 2026 10:31:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E16FD608CC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767522694;
	bh=3hJOQ9wyxCSEdr00h00AZ3ZN80B/eimd07zwMjs0+9s=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=EXVjw5AfGmOHT6PHfVwGYRj13Zu24AMxl5SwovfXrLB43ziRW4bHf8516dSzgPc4L
	 8l2jU0sMXJqZN/vQnv3qhQZKA9vx111AwfxRgbEQluM4LB2tc1UoZ3kdMzJoqczW/H
	 Mpii59DZzJ3HKrRva5tbcRupu0TuoYIe0RzijhZANYg7KQwkY0rJoE9B5txl/cgTyP
	 7bBPA+JC9C5IPlCsC4iras04UUJ94NAtZLXHr1XMF+O4iRwwFFtY5HIHagHgyj79J7
	 yv8HChrUnSz8IYfdErUEPgEn9eh7uHH32U2xMiDa/rDjg9aWN3VVSRoklLez8L5zfm
	 js7haWHeQCcZg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E16FD608CC;
	Sun,  4 Jan 2026 10:31:33 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id C3A842DF
 for <buildroot@buildroot.org>; Sun,  4 Jan 2026 10:31:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B6040606A2
 for <buildroot@buildroot.org>; Sun,  4 Jan 2026 10:31:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id w0f6l9k1m9v3 for <buildroot@buildroot.org>;
 Sun,  4 Jan 2026 10:31:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 02C39606DC
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 02C39606DC
 for <buildroot@buildroot.org>; Sun,  4 Jan 2026 10:31:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D83D58818B; Sun,  4 Jan 2026 10:31:26 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 4 Jan 2026 11:21:42 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b216322fc637d16dd77e7495da056081433d97f7
X-Git-Newrev: 6a9e45fd540358d1491ec02ef8e47e91ac5f46aa
X-Patchwork-Hint: ignore
Message-Id: <20260104103126.D83D58818B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-platformdirs: bump to
 version 4.5.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=6a9e45fd540358d1491ec02ef8e47e91ac5f46aa
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-platformdirs/python-platformdirs.hash | 4 ++--
 package/python-platformdirs/python-platformdirs.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-platformdirs/python-platformdirs.hash b/package/python-platformdirs/python-platformdirs.hash
index b35d10dba1..bbf94f6b6f 100644
--- a/package/python-platformdirs/python-platformdirs.hash
+++ b/package/python-platformdirs/python-platformdirs.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/platformdirs/json
-md5  90aef8202386996ce2e4b560a9f1d3e6  platformdirs-4.3.8.tar.gz
-sha256  3d512d96e16bcb959a814c9f348431070822a6496326a4be0911c40b5a74c2bc  platformdirs-4.3.8.tar.gz
+md5  e1000e5728e36717b1832e77dc3590c9  platformdirs-4.5.1.tar.gz
+sha256  61d5cdcc6065745cdd94f0f878977f8de9437be93de97c1c12f853c9c0cdcbda  platformdirs-4.5.1.tar.gz
 # Locally computed sha256 checksums
 sha256  29e0fd62e929850e86eb28c3fdccf0cefdf4fa94879011cffb3d0d4bed6d4db6  LICENSE
diff --git a/package/python-platformdirs/python-platformdirs.mk b/package/python-platformdirs/python-platformdirs.mk
index b24d6d78d8..e099c486c4 100644
--- a/package/python-platformdirs/python-platformdirs.mk
+++ b/package/python-platformdirs/python-platformdirs.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PLATFORMDIRS_VERSION = 4.3.8
+PYTHON_PLATFORMDIRS_VERSION = 4.5.1
 PYTHON_PLATFORMDIRS_SOURCE = platformdirs-$(PYTHON_PLATFORMDIRS_VERSION).tar.gz
-PYTHON_PLATFORMDIRS_SITE = https://files.pythonhosted.org/packages/fe/8b/3c73abc9c759ecd3f1f7ceff6685840859e8070c4d947c93fae71f6a0bf2
+PYTHON_PLATFORMDIRS_SITE = https://files.pythonhosted.org/packages/cf/86/0248f086a84f01b37aaec0fa567b397df1a119f73c16f6c7a9aac73ea309
 PYTHON_PLATFORMDIRS_SETUP_TYPE = hatch
 PYTHON_PLATFORMDIRS_LICENSE = MIT
 PYTHON_PLATFORMDIRS_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
