Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D6CCFF886D
	for <buildroot@archiver.kernel.org>; Tue, 28 Apr 2026 18:52:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A54A682779;
	Tue, 28 Apr 2026 18:52:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sTQEWHZ0wMkh; Tue, 28 Apr 2026 18:52:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 84B4E8272C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777402333;
	bh=MyYeQ3OZZK0EL6aPU1WExcpVHxLQmCo3MjqqBiItzE0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=DiHBzJURXjPAQ+jhu3eqvYBRzVG+IjUfCUFTzr1v2XCcBAN2q98lP5Ex8MZrHfm6U
	 5izuyPJW8deZt/YdKHq88s0fQjR6hzGeHOK/oX1pHdPlNv9eQN5sT+RS14mNxu+go4
	 KBEa20CtKVea0NJw8AmGcevJhlmhtSggxAaGPOscC2a4R8lwTy3Sqw8fYUHAhboNIc
	 GfHu2IfS0nmmih+noOAvxCTtMimRrYFfnqxyIbhY/h9bsHi2Akh2Z9vDO10yXwoTJG
	 CIlNErW1fekfClI6Lp9pKRDiqsfhDjIQPX0MA2D66mCoEVx2JlJZuKV8hHNRMaFUEq
	 KsOTwg2IVTbEg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 84B4E8272C;
	Tue, 28 Apr 2026 18:52:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 723D7231
 for <buildroot@buildroot.org>; Tue, 28 Apr 2026 18:52:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5752E826DF
 for <buildroot@buildroot.org>; Tue, 28 Apr 2026 18:52:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kUGkYEOuV5ts for <buildroot@buildroot.org>;
 Tue, 28 Apr 2026 18:52:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3A884826D6
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3A884826D6
 for <buildroot@buildroot.org>; Tue, 28 Apr 2026 18:52:11 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E71F383954; Tue, 28 Apr 2026 18:52:10 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 28 Apr 2026 20:50:43 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6284105e0ce4fc37ab1c99d78b07da7861d19d69
X-Git-Newrev: 73ba4a7152b12bf07d4ae5f4191039afb73b6611
X-Patchwork-Hint: ignore
Message-Id: <20260428185210.E71F383954@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/ytree: bump version to 2.12
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/73ba4a7152b12bf07d4ae5f4191039afb73b6611
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://www.han.de/~werner/ytree.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/ytree/ytree.hash | 2 +-
 package/ytree/ytree.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/ytree/ytree.hash b/package/ytree/ytree.hash
index e38586b0b4..d986b68518 100644
--- a/package/ytree/ytree.hash
+++ b/package/ytree/ytree.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  3bbbbd32f568cdae3e03fc735b1783d8cba605a2ca6056d1b971143d7ddd517d  ytree-2.10.tar.gz
+sha256  2366d2d5fc1f644460323863e5be9974584bc9b2d66d7247165a8ff1a0991114  ytree-2.12.tar.gz
 sha256  eb6bf7204569b4fe8eaf9d4dffc57e44047c5efb5deba1b2d99069ddbc99d031  COPYING
diff --git a/package/ytree/ytree.mk b/package/ytree/ytree.mk
index 162b2a1c02..c597367f9a 100644
--- a/package/ytree/ytree.mk
+++ b/package/ytree/ytree.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-YTREE_VERSION = 2.10
+YTREE_VERSION = 2.12
 YTREE_SITE = https://www.han.de/~werner
 YTREE_LICENSE = GPL-2.0+
 YTREE_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
