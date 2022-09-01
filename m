Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D6FAECAAD3
	for <buildroot@archiver.kernel.org>; Thu,  1 Sep 2022 12:03:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 15D7A83E18;
	Thu,  1 Sep 2022 12:03:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 15D7A83E18
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bnIN8aSGsCsE; Thu,  1 Sep 2022 12:03:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 34F0E83E19;
	Thu,  1 Sep 2022 12:03:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 34F0E83E19
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D2DF51BF2CD
 for <buildroot@lists.busybox.net>; Thu,  1 Sep 2022 12:03:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BBED341132
 for <buildroot@lists.busybox.net>; Thu,  1 Sep 2022 12:03:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BBED341132
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1bt2VhgCc-9t for <buildroot@lists.busybox.net>;
 Thu,  1 Sep 2022 12:03:23 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 48FC7410EF
Received: from mail.heine.tech (mail.heine.tech [195.201.24.99])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 48FC7410EF
 for <buildroot@buildroot.org>; Thu,  1 Sep 2022 12:03:23 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id B2A771814B9; Thu,  1 Sep 2022 14:03:18 +0200 (CEST)
To: buildroot@buildroot.org
Date: Thu,  1 Sep 2022 14:02:59 +0200
Message-Id: <20220901120301.58714-1-buildroot@heine.tech>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=heine.tech; s=dkim; 
 t=1662033799; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding; bh=Ej7gXIetdUZmX/mhAQXwmGGjLfqDsK4cW+3Rxtd5m7U=;
 b=NGOy9yUaycI3kSRt0loBv5ZSfCJgvmhtn8QMl21gIh1eBVk1H0GwFCoN/A56MVAmrnV/GS
 WUnvuEEdcnArU9k23wUSBs+nQs+pgSBZAsouyqvGuxFd/yj+EfG8HaJr9oKH1GrqDVO6aU
 eiQ/rHBuNd7Ez/olqwKHpW/2pQkU29Y=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=heine.tech header.i=@heine.tech
 header.a=rsa-sha256 header.s=dkim header.b=NGOy9yUa
Subject: [Buildroot] [PATCH] package/networkd-dispatcher: bump to version
 2.2.3
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
From: Michael Nosthoff via buildroot <buildroot@buildroot.org>
Reply-To: Michael Nosthoff <buildroot@heine.tech>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

lots of fixes but most importantly:
 - don't allow unknown operational/admin states (CVE-2022-29799, CVE-2022-29800)

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
---
 package/networkd-dispatcher/networkd-dispatcher.hash | 2 +-
 package/networkd-dispatcher/networkd-dispatcher.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/networkd-dispatcher/networkd-dispatcher.hash b/package/networkd-dispatcher/networkd-dispatcher.hash
index ca7c300783..ffb4fa846a 100644
--- a/package/networkd-dispatcher/networkd-dispatcher.hash
+++ b/package/networkd-dispatcher/networkd-dispatcher.hash
@@ -1,3 +1,3 @@
 # locally computed
-sha256  1682c0106d9d2879087612e76aebb87672ebf339c43f229a3ee27dadb428575b  networkd-dispatcher-2.1.tar.bz2
+sha256  61270b4c2f39c36da4b0a62724a3cc01f6732493fed0f166ee675bafedff11df  networkd-dispatcher-2.2.3.tar.bz2
 sha256  589ed823e9a84c56feb95ac58e7cf384626b9cbf4fda2a907bc36e103de1bad2  LICENSE
diff --git a/package/networkd-dispatcher/networkd-dispatcher.mk b/package/networkd-dispatcher/networkd-dispatcher.mk
index 4f609db73a..2b1aa257ce 100644
--- a/package/networkd-dispatcher/networkd-dispatcher.mk
+++ b/package/networkd-dispatcher/networkd-dispatcher.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NETWORKD_DISPATCHER_VERSION = 2.1
+NETWORKD_DISPATCHER_VERSION = 2.2.3
 NETWORKD_DISPATCHER_SOURCE = networkd-dispatcher-$(NETWORKD_DISPATCHER_VERSION).tar.bz2
 NETWORKD_DISPATCHER_SITE = https://gitlab.com/craftyguy/networkd-dispatcher/-/archive/$(NETWORKD_DISPATCHER_VERSION)
 NETWORKD_DISPATCHER_LICENSE = GPL-3.0
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
