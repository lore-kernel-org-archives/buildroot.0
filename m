Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FBB1E66886
	for <buildroot@archiver.kernel.org>; Sun, 21 Dec 2025 13:04:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1982A81BBD;
	Sun, 21 Dec 2025 13:04:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5FI69KVeYIZw; Sun, 21 Dec 2025 13:04:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 230D381B04
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766322250;
	bh=Fi4vgoApUQ6ftNjmvdgi9j3bn4wlCB96VVvmIzTdXXA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=pd7LT232SdgPNMCv/cZ5GBeHABSQh2yTiRzxV8HynbuPoMDMGQuE2D5TnHCBx8bXk
	 xCwGX2+h0OPv9+3XLtuq0c+rvVhZC970JlrgGlOmtUYRtXHC0LKWn5CBvc/LTqpmMz
	 Mvu23wobEwxG0dCwcnS8OHWLzqkHuu+dgipJYRBKyiYcWDZBLoAIfvIrqK6Dbq90Zp
	 moU8Cn1MKgLfKSxP+FgidfDz/cb3pc9XAQRzkpJ/GuZkGCJnoGQkso5pMKCxEfkiu+
	 kRVHgZvgxmEIYzxnzPWbA7EwTyZ1ZzTXv6N8iQOt6VH/da/bhDW00yklPpZThH1aZK
	 hjWYIYgZBNUfw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 230D381B04;
	Sun, 21 Dec 2025 13:04:10 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id DDD51195
 for <buildroot@buildroot.org>; Sun, 21 Dec 2025 13:04:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C074260C2E
 for <buildroot@buildroot.org>; Sun, 21 Dec 2025 13:04:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vljDxOg8atsr for <buildroot@buildroot.org>;
 Sun, 21 Dec 2025 13:04:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1889D60BBC
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1889D60BBC
 for <buildroot@buildroot.org>; Sun, 21 Dec 2025 13:04:07 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1367B870DC; Sun, 21 Dec 2025 13:04:07 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 21 Dec 2025 13:58:02 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e4233b02c1bff005062523e23fa31adef0deab52
X-Git-Newrev: 7b22fcfefffcda4d839a8c10151c5dffdfef0e8d
X-Patchwork-Hint: ignore
Message-Id: <20251221130407.1367B870DC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/rtl8821cu: bump to version
 2025-12-14
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

commit: https://git.buildroot.net/buildroot/commit/?id=7b22fcfefffcda4d839a8c10151c5dffdfef0e8d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

With this commit it builds with Linux 6.18

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/rtl8821cu/rtl8821cu.hash | 2 +-
 package/rtl8821cu/rtl8821cu.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/rtl8821cu/rtl8821cu.hash b/package/rtl8821cu/rtl8821cu.hash
index b9869303de..5ff86f439c 100644
--- a/package/rtl8821cu/rtl8821cu.hash
+++ b/package/rtl8821cu/rtl8821cu.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  3e7fc5b598b81006fb07a5a3534aa4288cb387ed531c71f3734e55e6cae729b0  rtl8821cu-3d1fcf4bc838542ceb03b0b4e9e40600720cf6ae.tar.gz
+sha256  c471f8a73efb5985b4e880e40de439ac8837241c74d3b7f8cc06a1bbfcc85075  rtl8821cu-7f63a9da2e8ed83403f6f920e9b1628a37b38ef4.tar.gz
 sha256  22cdb0a9cf492dbf05c5b27381a5c0e73ae0d4622427b522b0ba92b7495e5fb0  LICENSE
diff --git a/package/rtl8821cu/rtl8821cu.mk b/package/rtl8821cu/rtl8821cu.mk
index e1ef396110..45d1da3750 100644
--- a/package/rtl8821cu/rtl8821cu.mk
+++ b/package/rtl8821cu/rtl8821cu.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RTL8821CU_VERSION = 3d1fcf4bc838542ceb03b0b4e9e40600720cf6ae
+RTL8821CU_VERSION = 7f63a9da2e8ed83403f6f920e9b1628a37b38ef4
 RTL8821CU_SITE = $(call github,morrownr,8821cu-20210916,$(RTL8821CU_VERSION))
 RTL8821CU_LICENSE = GPL-2.0
 RTL8821CU_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
