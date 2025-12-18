Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFBD1D6E2B2
	for <buildroot@archiver.kernel.org>; Thu, 18 Dec 2025 16:44:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BADA5410B5;
	Thu, 18 Dec 2025 16:44:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ImalnGKIc226; Thu, 18 Dec 2025 16:44:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BFD5D410B8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766076242;
	bh=kcGYfdQoaXiEZeBVNJRnqnj565HVvGndJVTPMhS+VvY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=gvUGW9V9rMAlmhhnv1ywIu9sOX2u9fZ0XMWOxRc0tV8tdPId14Cv7iOCrsp52G4L0
	 D3kjaySI+8QiCY1JwdLEaSz+1XGdBTHqSuKj2+pxHOlkwY6tsgAYg8MnwjJfrMSYiQ
	 fAkW6F8lfJIBtWXdFXF+nJo/hQFI3fiEudi8SgYffMswxlLxeRlWaSc6w6kOo6WQMx
	 f6P64HZV8RmCfz9oCmqqa/M/DcY3f9m/leva8Mw4qzV/CKfYJawkrxGS7X+Zn4hkz3
	 k4vhLiLKjQmq5xJj4BD8gVwclCvkzYezMQ55vBJ2wvqMdiZbuy4u93bSQlp26OzeKo
	 J07Y7uM/9KbeQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id BFD5D410B8;
	Thu, 18 Dec 2025 16:44:02 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 8BFF8361
 for <buildroot@buildroot.org>; Thu, 18 Dec 2025 16:43:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7DEDA61166
 for <buildroot@buildroot.org>; Thu, 18 Dec 2025 16:43:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Iglgh3fLgkmD for <buildroot@buildroot.org>;
 Thu, 18 Dec 2025 16:43:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A9B3B607BD
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id A9B3B607BD
 for <buildroot@buildroot.org>; Thu, 18 Dec 2025 16:43:58 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9C182873D7; Thu, 18 Dec 2025 16:43:58 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 18 Dec 2025 16:56:54 +0100
X-Git-Refname: refs/heads/2025.11.x
X-Git-Oldrev: 45a8a415bce326728540921fb728bacb137cb955
X-Git-Newrev: a57d4e39bb1f17ca07354645f6adbfa2fac44ab2
X-Patchwork-Hint: ignore
Message-Id: <20251218164358.9C182873D7@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.11.x] package/rtl8723ds: bump
 to version 2025-12-09
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=a57d4e39bb1f17ca07354645f6adbfa2fac44ab2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.11.x

With Kernel >= 6.18 introduced in [1] rtl8723ds fails at build
time with error:

    core/rtw_security.c:2183:13: error: conflicting types for 'sha256_init'; have 'void(struct rtl_sha256_state *)'

Fixes:
https://autobuild.buildroot.org/results/52081e3a500dd2566af145e8c6d793df7f72d025/

[1] https://gitlab.com/buildroot.org/buildroot/-/commit/a06d79862a60d3c8d5ddd6a9ab12b5ccdd91984c

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
[Julien: add details in commit log]
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 1bd758209ee909b62ac448b570d8944b0057e518)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/rtl8723ds/rtl8723ds.hash | 2 +-
 package/rtl8723ds/rtl8723ds.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/rtl8723ds/rtl8723ds.hash b/package/rtl8723ds/rtl8723ds.hash
index c2691402bd..580f5d09f6 100644
--- a/package/rtl8723ds/rtl8723ds.hash
+++ b/package/rtl8723ds/rtl8723ds.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  338f0fe08acdd1352428d86f88366935e1b967b134f252ac9a3e50cc8922fe14  rtl8723ds-546ffb2cb735e0c33e765936721bd66dd58e6893.tar.gz
+sha256  a04bc28cbaead30aca2894633ffa93d4bf0bf407a8c5b7120dd9832ceaf0310e  rtl8723ds-122a574f780da32bb0de760bf089a3a9ec1e8f87.tar.gz
 sha256  cd5c66af63b509ccd75ec85fee41b6e5cbb77cd6bf9392a54900acc0f02be4a6  COPYING
diff --git a/package/rtl8723ds/rtl8723ds.mk b/package/rtl8723ds/rtl8723ds.mk
index 14938daaf6..d8072f14bc 100644
--- a/package/rtl8723ds/rtl8723ds.mk
+++ b/package/rtl8723ds/rtl8723ds.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RTL8723DS_VERSION = 546ffb2cb735e0c33e765936721bd66dd58e6893
+RTL8723DS_VERSION = 122a574f780da32bb0de760bf089a3a9ec1e8f87
 RTL8723DS_SITE = $(call github,benetti-engineering,rtl8723ds,$(RTL8723DS_VERSION))
 RTL8723DS_LICENSE = GPL-2.0
 RTL8723DS_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
