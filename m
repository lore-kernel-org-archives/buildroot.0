Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9107ACD5BD0
	for <buildroot@archiver.kernel.org>; Sat, 30 May 2026 21:56:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4D062852FA;
	Sat, 30 May 2026 21:56:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id F5A_iP9Doz04; Sat, 30 May 2026 21:56:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CF236852F1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780178188;
	bh=3dDWj6DHkIUM/AocenspENNNkAavES5LKvI2pRZx7ac=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=bwXPnZhdzup4kcbGw9Gmii+KZh2Dukb6uQ0/2Aqphss6bcEwzZpuB5l6HWr+ssAue
	 0jCcxV3iDOdvQlv9tupEO9yXwxOKJRiV9qWkFXxNkldib6EfRK3lJ9xHjdJF3yb1E1
	 qXPAR6YeN54UcQ+cwFV0r5SL0gIPGoVkGMxkpeRmsOWRGP7EEXZNBOlWvIEa5bjUbX
	 5chq1C6PWVMEtvaEq3vOpidZxSeQOZzQ/uJy0fzYeSsAcQmuSmjTYMwVHVNE5uM/k8
	 XpIqrNlb5DUuQ0mgbngnHKTw6hldOEBMDWknDqXmOq/A2mVp1jkx/22qotWYLbi/B3
	 B6I9uJBVji4Vw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id CF236852F1;
	Sat, 30 May 2026 21:56:28 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 888AED3
 for <buildroot@buildroot.org>; Sat, 30 May 2026 21:56:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6D99B852EC
 for <buildroot@buildroot.org>; Sat, 30 May 2026 21:56:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9ZxTReuMbfMq for <buildroot@buildroot.org>;
 Sat, 30 May 2026 21:56:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B8C0A852E3
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id B8C0A852E3
 for <buildroot@buildroot.org>; Sat, 30 May 2026 21:56:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7762687641; Sat, 30 May 2026 21:56:12 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 30 May 2026 23:46:07 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 88e600efb60979d2ed69819446add87bbde2bdb9
X-Git-Newrev: 9737b2135c67f14f3243b4a34b85eb4eb5fe39d3
X-Patchwork-Hint: ignore
Message-Id: <20260530215612.7762687641@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/rtl8822cs: bump driver version to
 latest with support kernel 7.1+
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/9737b2135c67f14f3243b4a34b85eb4eb5fe39d3
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Update rtl8822cs driver latest of the jethome-iot/rtl88x2cs.

Signed-off-by: Viacheslav Bocharov <v@baodeep.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/rtl8822cs/rtl8822cs.hash | 2 +-
 package/rtl8822cs/rtl8822cs.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/rtl8822cs/rtl8822cs.hash b/package/rtl8822cs/rtl8822cs.hash
index ff2e5d3eaa..fa5c9b1f89 100644
--- a/package/rtl8822cs/rtl8822cs.hash
+++ b/package/rtl8822cs/rtl8822cs.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  71d1d29d1f04a9decaba4e23df0b213fb454c4cf15f6305133d2821188b588b0  rtl8822cs-2519c0b865e31d93daa65fc5b1168722f6ec7526.tar.gz
+sha256  eecd40ef41e3dabd7263f48330d35a138092637063c5d5d4cc3936939502df82  rtl8822cs-55971663534233fd8d80363ddcb2fec1c01c473c.tar.gz
diff --git a/package/rtl8822cs/rtl8822cs.mk b/package/rtl8822cs/rtl8822cs.mk
index c6a541dd99..531a07e60d 100644
--- a/package/rtl8822cs/rtl8822cs.mk
+++ b/package/rtl8822cs/rtl8822cs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RTL8822CS_VERSION = 2519c0b865e31d93daa65fc5b1168722f6ec7526
+RTL8822CS_VERSION = 55971663534233fd8d80363ddcb2fec1c01c473c
 RTL8822CS_SITE = $(call github,jethome-iot,rtl88x2cs,$(RTL8822CS_VERSION))
 RTL8822CS_LICENSE = GPL-2.0
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
