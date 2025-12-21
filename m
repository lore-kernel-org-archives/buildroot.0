Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34CC8E66886
	for <buildroot@archiver.kernel.org>; Sun, 21 Dec 2025 22:12:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 03B9881780;
	Sun, 21 Dec 2025 22:12:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QvGKx40wKeS8; Sun, 21 Dec 2025 22:12:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1C0418179C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766355158;
	bh=tsQiA5wlbSmH+MRW+o3oqeQkzwCzO4ueLkp3shKQcsU=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=XXACHMgoS1G0N2tI6vCXVHoE33ixnL7/JwYepiOYsv6dUsI6zDkEWb3nZ6GYdUgmO
	 yBXiZuukJbJEvxhSJLsqaTLQHlAvzGnuABH0H4rIkdqg7ssELOaxUsAMOIpUt0rFrg
	 0QN1nU2zT5KIg6jUFzVqATYtQsSoHktWhZXkYsvY+yu/62/AWStSY1xcURGgRQ/th7
	 8+EkFm72ggFkXagyzk3XxoVThI/DMFnmyy4X11tKJ7VQdQAIj8fkysZ5rvTea3To+h
	 VQJKbcTYuCWOu2aJiEOA9QXDx79m18hpuFQ+a+SqkpCk2S0FSn7bkD5hhTAPhU+Iya
	 LZ5jvLiCY5HCQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1C0418179C;
	Sun, 21 Dec 2025 22:12:38 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id AA8A1195
 for <buildroot@buildroot.org>; Sun, 21 Dec 2025 22:12:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9CB108156F
 for <buildroot@buildroot.org>; Sun, 21 Dec 2025 22:12:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id buqj3GeBtwtN for <buildroot@buildroot.org>;
 Sun, 21 Dec 2025 22:12:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 43AF18156D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 43AF18156D
 for <buildroot@buildroot.org>; Sun, 21 Dec 2025 22:12:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 34524870DC; Sun, 21 Dec 2025 22:12:27 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 21 Dec 2025 22:58:35 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b7505ca7625dc3ea4f5a26424c41978e3f03a56d
X-Git-Newrev: dede411c7efd31afc0f8e0cbd37781eaade38f36
X-Patchwork-Hint: ignore
Message-Id: <20251221221227.34524870DC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-cachetools: bump version to
 6.2.4
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

commit: https://git.buildroot.net/buildroot/commit/?id=dede411c7efd31afc0f8e0cbd37781eaade38f36
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://github.com/tkem/cachetools/blob/v6.2.4/CHANGELOG.rst

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-cachetools/python-cachetools.hash | 4 ++--
 package/python-cachetools/python-cachetools.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-cachetools/python-cachetools.hash b/package/python-cachetools/python-cachetools.hash
index 2a11fa1afb..aa44ad61ba 100644
--- a/package/python-cachetools/python-cachetools.hash
+++ b/package/python-cachetools/python-cachetools.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/cachetools/json
-md5  f6a09127cf6d315ef12138b20a22f69e  cachetools-6.2.2.tar.gz
-sha256  8e6d266b25e539df852251cfd6f990b4bc3a141db73b939058d809ebd2590fc6  cachetools-6.2.2.tar.gz
+md5  1501ed3542a4ea9212d74e3bf5974bdc  cachetools-6.2.4.tar.gz
+sha256  82c5c05585e70b6ba2d3ae09ea60b79548872185d2f24ae1f2709d37299fd607  cachetools-6.2.4.tar.gz
 # Locally computed sha256 checksums
 sha256  23c4eff7a1c027a977a0b79c4497e17582c334c5f17ef6ac8ca0b52d1e7d8417  LICENSE
diff --git a/package/python-cachetools/python-cachetools.mk b/package/python-cachetools/python-cachetools.mk
index 3e3100067d..0804e0f2a5 100644
--- a/package/python-cachetools/python-cachetools.mk
+++ b/package/python-cachetools/python-cachetools.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_CACHETOOLS_VERSION = 6.2.2
+PYTHON_CACHETOOLS_VERSION = 6.2.4
 PYTHON_CACHETOOLS_SOURCE = cachetools-$(PYTHON_CACHETOOLS_VERSION).tar.gz
-PYTHON_CACHETOOLS_SITE = https://files.pythonhosted.org/packages/fb/44/ca1675be2a83aeee1886ab745b28cda92093066590233cc501890eb8417a
+PYTHON_CACHETOOLS_SITE = https://files.pythonhosted.org/packages/bc/1d/ede8680603f6016887c062a2cf4fc8fdba905866a3ab8831aa8aa651320c
 PYTHON_CACHETOOLS_SETUP_TYPE = setuptools
 PYTHON_CACHETOOLS_LICENSE = MIT
 PYTHON_CACHETOOLS_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
