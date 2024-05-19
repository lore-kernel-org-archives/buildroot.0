Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36486C25B75
	for <buildroot@archiver.kernel.org>; Sun, 19 May 2024 13:31:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C0ACC404E9;
	Sun, 19 May 2024 13:31:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id L-0bPUFBGrHn; Sun, 19 May 2024 13:31:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7C599404D6
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7C599404D6;
	Sun, 19 May 2024 13:31:22 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E81441C3E46
 for <buildroot@lists.busybox.net>; Sun, 19 May 2024 13:31:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E20F481EE9
 for <buildroot@lists.busybox.net>; Sun, 19 May 2024 13:31:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LsdQUMgxNmld for <buildroot@lists.busybox.net>;
 Sun, 19 May 2024 13:31:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.22;
 helo=mout.gmx.net; envelope-from=ps.report@gmx.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 72C0681EE4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 72C0681EE4
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 72C0681EE4
 for <buildroot@busybox.net>; Sun, 19 May 2024 13:31:18 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost.fritz.box ([82.135.81.11]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Mq2jC-1svRVg2ZgA-00qey7; Sun, 19
 May 2024 15:31:14 +0200
To: buildroot@busybox.net
Date: Sun, 19 May 2024 15:31:13 +0200
Message-ID: <20240519133113.16738-1-ps.report@gmx.net>
X-Mailer: git-send-email 2.45.1
MIME-Version: 1.0
X-Provags-ID: V03:K1:5XYfHD+MKQOEEWBZQ+T2F8gy4aq3irj5xjZqzfouqa3t/Zmatv6
 +Iw2LO22K84TfmYWZOs9CAtlTmfJ04HeVhwkE93DskLCTTkIS7BGphi4WPsQmMhEaG0Gt7n
 PWbDFB53TBOjzJRWIVcxWmSX9GY0RGCImwktON1hsusSTEeUuyx8gfDwDNV83wjr3Vro4R6
 MB+DaDLB7/vrWP7oY9Wsw==
UI-OutboundReport: notjunk:1;M01:P0:4wYtr5Nv3GA=;aOkRUJPL6TGnaigBkb7h1uWnwSH
 9nORggDBHkswYdQvRGGb30yrXyKF27kgiCGLHTFb7r19vw56X1/nQaL0G7UE9krvWSLs+f2HW
 YdFeoGgpogl/RqCob52U2PgUUk0Z0q/MAAeiG7t/tMJSkF9weG+J7vLptzgMmhdhcv1SenyIT
 M9U04su1/hzHRMy44v/PAyu07CfUWieHvO61AnNLRO04pBR+uf82Tf59knfAqRzM2fmYVql5T
 10NAI3bU1LNjLfuUFp68Qi6hnR873Rwg177qnbvvgbPfxiB+EJVi9FNdGlE3B9UTkM75udTuh
 8PykeeKXDCQMuzQR1239hV/dVj8vvBBbLMmBlV+0BwRjVRoKMlyEnHmXREPS9fQ8UZcqnvnQq
 ANhAsh8J0CYTMZVR7063kE+TyD4IiQvlHNgD/IysRXPHVeXD6mDd3CuKvNrclfckhF5loETpu
 Ky8RfXvP7vPuL7EuJ37fsKxIFr6wHjbouQjsYFQx+ZD7henn3fAqw5uV3WuodnedrZ0hNfzET
 IwSo8XWX49Z3pCfyBSe8pyCzrGFIgdqPuOPrDwtrfsGTZRYpo4CGCcuq1quoxm0iGrA0ylzim
 BBq5N4Dc/vyk5gW5XdDR9gH1BwTWTQfapyOJ/DXQiRLm7yZOrKape7z3ou+RmliJVvOUCHg45
 dYwb/QQczKHICdvCvew1zS1/spxiyRenBqMJNF+RKFNyHkBo0zyz77cIWU76WkmhbBHvXqM/w
 kqIez6SURAgxtv+PgyxdZDrkiDFpp+OPNbkeAMiJitErJsBijglYw+/+DoNucFbyY9luME7s/
 UdFFYMFDphgDWCVFdoNH28bIxj5cNVts9CKZn3uBtCg3k=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.net; 
 s=s31663417; t=1716125474; x=1716730274; i=ps.report@gmx.net;
 bh=sxwDtj53O+mKs2MQAK460/QmrhVvXcw2JNCsIxXTqfM=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
 MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=uSUs77H4K0lFJC/tmRsQ/v+bUDmSsesMbecrwLn+5RJG/VaW5XPcOVEu5axs0eGj
 zFSDf6g0EPPjXqv+VZNN082rlE77hHR71XlBnc5NZKbH6CXf3VliIrO4nQK+8RAy6
 v3Llb8z9ty3JvNO2DzpZIMgKJFnr0xfPKxbW1efe0zF/xhiIFh9/wCATEoJ14sGjZ
 gWhek2GwkaMAuUHClIk7pDY35YGlZHuNkpSzdxfYP30kibA5C/7MkVwnAYjPBK4vt
 cvs4yWKrIO7QWwCFbUKvu0kC2wPVERdsmw0xMuCEznPWHegsGYJyMIaKv9/pUimHn
 Rm9xvvRHTLEM5P9Ppg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.net header.i=ps.report@gmx.net header.a=rsa-sha256
 header.s=s31663417 header.b=uSUs77H4
Subject: [Buildroot] [PATCH for 2024.02.x v1] package/git: security bump
 version to 2.43.4
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Peter Seiderer via buildroot <buildroot@buildroot.org>
Reply-To: Peter Seiderer <ps.report@gmx.net>
Cc: Bagas Sanjaya <bagasdotme@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes CVE-2024-32002, CVE-2024-32004, CVE-2024-32020 and CVE-2024-32021
(for details see [1]).

[1] https://lore.kernel.org/lkml/xmqqv83g4937.fsf@gitster.g/

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/git/git.hash | 2 +-
 package/git/git.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/git/git.hash b/package/git/git.hash
index 9cf044cc07..f24023f2f3 100644
--- a/package/git/git.hash
+++ b/package/git/git.hash
@@ -1,5 +1,5 @@
 # From: https://www.kernel.org/pub/software/scm/git/sha256sums.asc
-sha256  5446603e73d911781d259e565750dcd277a42836c8e392cac91cf137aa9b76ec  git-2.43.0.tar.xz
+sha256  6b7aadda1787f0c1eaa257c1df56bb12e43d12bce55cfe7e5ade00228ee3d886  git-2.43.4.tar.xz
 # Locally calculated
 sha256  5b2198d1645f767585e8a88ac0499b04472164c0d2da22e75ecf97ef443ab32e  COPYING
 sha256  1922f45d2c49e390032c9c0ba6d7cac904087f7cec51af30c2b2ad022ce0e76a  LGPL-2.1
diff --git a/package/git/git.mk b/package/git/git.mk
index 1502968186..15a29d1f6c 100644
--- a/package/git/git.mk
+++ b/package/git/git.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GIT_VERSION = 2.43.0
+GIT_VERSION = 2.43.4
 GIT_SOURCE = git-$(GIT_VERSION).tar.xz
 GIT_SITE = $(BR2_KERNEL_MIRROR)/software/scm/git
 GIT_LICENSE = GPL-2.0, LGPL-2.1+
-- 
2.45.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
