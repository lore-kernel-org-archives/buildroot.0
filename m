Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F4BAECD9A6
	for <buildroot@archiver.kernel.org>; Thu,  5 Feb 2026 21:29:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3079080FB5;
	Thu,  5 Feb 2026 21:29:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Xa2HZ5V6O-5y; Thu,  5 Feb 2026 21:29:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 801FF80FE8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770326989;
	bh=y0UprwepR5zxmb+6tO0xa9Rl2b72ZGs9BxX1wTY9+80=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=BuSuu1IoKBgOmvxPEkSTwWglZFclv4gPq4TFGxcC5Ui/1bBDYxe/qq/xOErhgcAXd
	 +pPhc8ySgKPW46i1MQBOagZ9p8fofcJUD9dx3JbooTxxZm89/2C/zz8MjWh89S/8VO
	 CdaJPgQEFMZ8Yz1+KMPHil8cKhJg36lZla/j2fQUxbhA7CecnAZev0dEPxTFGLh8YV
	 aAZCGpKVFXOQBRUNfrDEGwVoEsgWnFz369KU451VJIFSbcSixJNkF3+0z8eTXYk4rS
	 LRx1hUak6lqUcDxLiD8F6k34ziqXPVnVZwNAY2pMxb/XLaleWVjIHGYLzVfwmykPlw
	 wZX1OxgTYfZBg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 801FF80FE8;
	Thu,  5 Feb 2026 21:29:49 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id B24C6470
 for <buildroot@buildroot.org>; Thu,  5 Feb 2026 21:29:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2640141774
 for <buildroot@buildroot.org>; Thu,  5 Feb 2026 21:29:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fvaVGSNiKFJo for <buildroot@buildroot.org>;
 Thu,  5 Feb 2026 21:29:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5662441821
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5662441821
 for <buildroot@buildroot.org>; Thu,  5 Feb 2026 21:29:45 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2836E86A3F; Thu,  5 Feb 2026 21:29:45 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 5 Feb 2026 22:18:33 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d6ce4e260263ef293b7a5dc7052ec56615ffd9eb
X-Git-Newrev: 94a817a58909e1cfe0c1f63b63754079f1866523
X-Patchwork-Hint: ignore
Message-Id: <20260205212945.2836E86A3F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/asterisk: bump to 22.8.1
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
From: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Reply-To: Marcus Hoffmann <buildroot@bubu1.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/94a817a58909e1cfe0c1f63b63754079f1866523
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

See here for Changes:
https://downloads.asterisk.org/pub/telephony/asterisk/releases/ChangeLog-22.8.1.html
https://downloads.asterisk.org/pub/telephony/asterisk/releases/ChangeLog-22.8.0.html
https://downloads.asterisk.org/pub/telephony/asterisk/releases/ChangeLog-22.7.0.html
https://downloads.asterisk.org/pub/telephony/asterisk/releases/ChangeLog-22.6.0.html

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
---
 package/asterisk/asterisk.hash | 2 +-
 package/asterisk/asterisk.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/asterisk/asterisk.hash b/package/asterisk/asterisk.hash
index 26175667c3..f1573f6575 100644
--- a/package/asterisk/asterisk.hash
+++ b/package/asterisk/asterisk.hash
@@ -1,5 +1,5 @@
 # Locally computed
-sha256  8a94650b6f348af1f1c9cce7ed3585d280f3a31b0d3820084a42b03712df95d5  asterisk-22.5.2.tar.gz
+sha256  4f30af0695a0131fc091d85e7b91e22504609434b3fbd263898c7354d41959c9  asterisk-22.8.1.tar.gz
 
 # Locally computed
 sha256  58bb83cec4d431f48d006e455d821668450f8cf6b6c95f090def47062fa3a60c  pjproject-2.15.1.tar.bz2
diff --git a/package/asterisk/asterisk.mk b/package/asterisk/asterisk.mk
index 9a071fb8e0..b59f2bf5aa 100644
--- a/package/asterisk/asterisk.mk
+++ b/package/asterisk/asterisk.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ASTERISK_VERSION = 22.5.2
+ASTERISK_VERSION = 22.8.1
 # Use the github mirror: it's an official mirror maintained by Digium, and
 # provides tarballs, which the main Asterisk git tree (behind Gerrit) does not.
 ASTERISK_SITE = $(call github,asterisk,asterisk,$(ASTERISK_VERSION))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
