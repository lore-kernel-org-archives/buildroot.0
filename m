Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB271CD8CBF
	for <buildroot@archiver.kernel.org>; Tue,  9 Jun 2026 13:01:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CC7158559F;
	Tue,  9 Jun 2026 13:01:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0hz2kKALuISa; Tue,  9 Jun 2026 13:01:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C028485527
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781010087;
	bh=maU3tKZy2WL60w2JhxjiDL6j0d1IDR76BlGjiD4xiz0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=an6fJmYsIHs5NcEyFfJDtHgrYriMeJh/e7ZTejO4UUQFjylqj5Ja6+99/UpYGCH7a
	 1muD4KLtxYgNyNNg1ScYHYyfevHUeCyA40RZqGrx71ySFACo2vJDZGQtRMGZUHt1LP
	 SVM84Mklz+W+9k5OLg7Uo5P/FeR52O3uZtuYJ3vuFHIKTqqtUy7m+tI25UdcaKjZyc
	 RtuDEgf8Vu+CRUJae+BQurUObhtvze6sg02QnwsDt4I7hv9GZmn2Gh9QPJ7fSnsr1B
	 ToJ8JG1oM6upwB7ta4JsVce0tX7vX3y/ITR21AQ7zBqBhloMKcEt8W4d/9/sJgXRCN
	 cSDU3XHB731Qg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C028485527;
	Tue,  9 Jun 2026 13:01:27 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id AA23F196
 for <buildroot@buildroot.org>; Tue,  9 Jun 2026 13:01:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9BE2042552
 for <buildroot@buildroot.org>; Tue,  9 Jun 2026 13:01:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zHobI6MulVNC for <buildroot@buildroot.org>;
 Tue,  9 Jun 2026 13:01:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E3011423C1
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id E3011423C1
 for <buildroot@buildroot.org>; Tue,  9 Jun 2026 13:01:18 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1F1DD87E7E; Tue,  9 Jun 2026 13:01:01 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 14 May 2026 15:44:48 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 54ddc1e991df300f71ec059d7f04e6818f3f7856
X-Git-Newrev: ec210e7c87ef7b631d1dc1438cf9c9547ae1480b
X-Patchwork-Hint: ignore
Message-Id: <20260609130101.1F1DD87E7E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/policycoreutils: bump version to
 3.10
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/ec210e7c87ef7b631d1dc1438cf9c9547ae1480b
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/SELinuxProject/selinux/releases/tag/3.10

Added comment for license hash.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/policycoreutils/policycoreutils.hash | 4 +++-
 package/policycoreutils/policycoreutils.mk   | 2 +-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/policycoreutils/policycoreutils.hash b/package/policycoreutils/policycoreutils.hash
index 7664be0b35..d3d6ee3399 100644
--- a/package/policycoreutils/policycoreutils.hash
+++ b/package/policycoreutils/policycoreutils.hash
@@ -1,3 +1,5 @@
 # https://github.com/SELinuxProject/selinux/wiki/Releases
-sha256  44a294139876cf4c7969cb6a75d1932cb42543d74a7661760ded44a20bf7ebe8  policycoreutils-3.9.tar.gz
+sha256  8dbd50d868acbfae9d1a972f6bbb2587f06c9ec73308d11af6acb3a401de9832  policycoreutils-3.10.tar.gz
+
+# Hash for license file
 sha256  204d8eff92f95aac4df6c8122bc1505f468f3a901e5a4cc08940e0ede1938994  LICENSE
diff --git a/package/policycoreutils/policycoreutils.mk b/package/policycoreutils/policycoreutils.mk
index d0e1aae312..952bf5fade 100644
--- a/package/policycoreutils/policycoreutils.mk
+++ b/package/policycoreutils/policycoreutils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-POLICYCOREUTILS_VERSION = 3.9
+POLICYCOREUTILS_VERSION = 3.10
 POLICYCOREUTILS_SITE = https://github.com/SELinuxProject/selinux/releases/download/$(POLICYCOREUTILS_VERSION)
 POLICYCOREUTILS_LICENSE = GPL-2.0
 POLICYCOREUTILS_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
