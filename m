Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E38A1E67482
	for <buildroot@archiver.kernel.org>; Sun, 21 Dec 2025 13:21:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 011AA60C2E;
	Sun, 21 Dec 2025 13:21:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id c9wqktshFyZy; Sun, 21 Dec 2025 13:21:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 30E0760867
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766323292;
	bh=pxlN+htslmTalK8idL3YKc4s/zLQNx2Z20f4P/h8aPI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=JYBIl9etuYZbWg/Et+UOaqP9dz1sS+xyhTfN98VGpmFNvfLPF2aR0d2hlXx2dVOLo
	 g1RKaoBGoO8a4o/AQxeOLTjN6GdoZRKbV24bknVzNp2kxvS17BtwvMQHHFn66gWYiX
	 Obp++FQpgibdvNolN2kiPPJ1raH/TPxudZrr10d2nR3JO+8jNAx3iHFT/rjd8cJoj2
	 4g1FYLcPd10yCqGQq0RIMdiS571+YfwH7x5yapLFlwJQsYIqNOB8jkNkMYkPpj2gB/
	 OCZc12Bj9Ppou3Vcj0o7LC10WGuCh61wrvZCsWn4jedWXPOyolizVRU3zFCHzr2r4k
	 Ia7eTCyg881uw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 30E0760867;
	Sun, 21 Dec 2025 13:21:32 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id BBC28119
 for <buildroot@buildroot.org>; Sun, 21 Dec 2025 13:21:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AD641608C7
 for <buildroot@buildroot.org>; Sun, 21 Dec 2025 13:21:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KkKWjXmeO-OR for <buildroot@buildroot.org>;
 Sun, 21 Dec 2025 13:21:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0316E60867
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0316E60867
 for <buildroot@buildroot.org>; Sun, 21 Dec 2025 13:21:30 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id F2C6582B36; Sun, 21 Dec 2025 13:21:29 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 21 Dec 2025 14:05:24 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7b22fcfefffcda4d839a8c10151c5dffdfef0e8d
X-Git-Newrev: e6499d14f5b1d36eea03bff83a3410af16abbe7e
X-Patchwork-Hint: ignore
Message-Id: <20251221132129.F2C6582B36@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/rtl8723bu: bump to 2025-12-14
 version
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

commit: https://git.buildroot.net/buildroot/commit/?id=e6499d14f5b1d36eea03bff83a3410af16abbe7e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This version allows to build with Linux 6.18

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/rtl8723bu/rtl8723bu.hash | 2 +-
 package/rtl8723bu/rtl8723bu.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/rtl8723bu/rtl8723bu.hash b/package/rtl8723bu/rtl8723bu.hash
index 1261139a20..e230485226 100644
--- a/package/rtl8723bu/rtl8723bu.hash
+++ b/package/rtl8723bu/rtl8723bu.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256  e9f94b6e6a6412acbef98d5e21f5c5ef185b0d856f35790e328caeb5df40702c  rtl8723bu-bb6fcc9d14b1ec8eb9c3b448c2023fa8fc551178.tar.gz
+sha256  22d81a21318cdae23ab6a65bed7c24d7cc98e7d1afef7a200804761c72036019  rtl8723bu-ac3d2f564bdf6816f1e3a3384524dc1a966f78a3.tar.gz
diff --git a/package/rtl8723bu/rtl8723bu.mk b/package/rtl8723bu/rtl8723bu.mk
index b324b87685..f1c4eda4ed 100644
--- a/package/rtl8723bu/rtl8723bu.mk
+++ b/package/rtl8723bu/rtl8723bu.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RTL8723BU_VERSION = bb6fcc9d14b1ec8eb9c3b448c2023fa8fc551178
+RTL8723BU_VERSION = ac3d2f564bdf6816f1e3a3384524dc1a966f78a3
 RTL8723BU_SITE = $(call github,benetti-engineering,rtl8723bu,$(RTL8723BU_VERSION))
 RTL8723BU_LICENSE = GPL-2.0, proprietary (*.bin firmware blobs)
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
