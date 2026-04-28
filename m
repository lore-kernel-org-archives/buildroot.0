Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFF0FFF885A
	for <buildroot@archiver.kernel.org>; Tue, 28 Apr 2026 19:13:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A2A0C6109E;
	Tue, 28 Apr 2026 19:13:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3B--pw9bVDbK; Tue, 28 Apr 2026 19:13:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BC482610B8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777403619;
	bh=qvAXyf8EnFPjiAuoM7AEmTytTk9EIGRLJCp4yyuAbf4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=CGee7o4ZKfBZ62AjvSscRmny0dfx2YhLF/l+c5WOnAsJoaVd/r5G2ouCq2ypHE5NK
	 PhVlBj9zYw4BTwmnsyLVJAq0ioTC3Yhdk9W5C2wD/Y8z5KqFNeMVGlRaNnCUyf0K6P
	 eLFQIF62tTJfIk0/40r4or9WgfJhwSGmYUa9Ze08/3UYQvy8tEklqyen2eOLN/avo9
	 qSE+nIYDbEUJ7oU1LiuDF6GvpFVP9ws/QbpMUY7liOFDjXihSGayXf9bl1jMnfEDT5
	 B5Eztwxo4tMqEwGHmForwqq8UWB2ZXn73U+nkRFWxxO35/XGLNtL7RVmP9mCwUFqP4
	 +gP4reEeOZj9A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id BC482610B8;
	Tue, 28 Apr 2026 19:13:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id B92DE1B8
 for <buildroot@buildroot.org>; Tue, 28 Apr 2026 19:13:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AB1EF83D39
 for <buildroot@buildroot.org>; Tue, 28 Apr 2026 19:13:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SHhsXwjyp6OC for <buildroot@buildroot.org>;
 Tue, 28 Apr 2026 19:13:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CBFAA83D17
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id CBFAA83D17
 for <buildroot@buildroot.org>; Tue, 28 Apr 2026 19:13:37 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8481783991; Tue, 28 Apr 2026 19:13:37 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 28 Apr 2026 21:12:34 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 12b88015a25c73ad40cf29805be6f826a6dc5bb1
X-Git-Newrev: af589980b34b256c19f2b233a01b92642982c841
X-Patchwork-Hint: ignore
Message-Id: <20260428191337.8481783991@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mstpd: bump to version 0.2.0
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/af589980b34b256c19f2b233a01b92642982c841
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Release notes:
https://github.com/mstpd/mstpd/releases/tag/0.2.0

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
[Julien: add link to release notes in commit log]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/mstpd/mstpd.hash | 2 +-
 package/mstpd/mstpd.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/mstpd/mstpd.hash b/package/mstpd/mstpd.hash
index 7c6c482ef3..021a4743af 100644
--- a/package/mstpd/mstpd.hash
+++ b/package/mstpd/mstpd.hash
@@ -1,4 +1,4 @@
 # locally computed
-sha256  6b4a0a721147373f0b22e8f47c0f13942b78afc55348299fe7b056b75adc98f4  mstpd-0.1.1.tar.gz
+sha256  37cbc03ab14763a2d477d2230508ab98c2acec43fa869b985c264d44e125c386  mstpd-0.2.0.tar.gz
 sha256  c38aee9e3c8c4d5d594ff548a1be05453023016d6286931f6512db215ec1fd42  LICENSE
 sha256  69e0a7ba32b016703dea402deae57348f14d028ff4dd9188b2acad607e484588  hmac_md5.c
diff --git a/package/mstpd/mstpd.mk b/package/mstpd/mstpd.mk
index 79f361ee6c..aa74283637 100644
--- a/package/mstpd/mstpd.mk
+++ b/package/mstpd/mstpd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MSTPD_VERSION = 0.1.1
+MSTPD_VERSION = 0.2.0
 MSTPD_SITE = $(call github,mstpd,mstpd,$(MSTPD_VERSION))
 MSTPD_AUTORECONF = YES
 MSTPD_LICENSE = GPL-2.0, RSA Data Security (md5)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
