Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A73BC55174
	for <buildroot@archiver.kernel.org>; Sun,  2 Aug 2026 19:48:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DEC05809E9;
	Sun,  2 Aug 2026 19:48:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 050Ad8MMrBmY; Sun,  2 Aug 2026 19:48:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 00A0A809B0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785700125;
	bh=mV6gXgBilr9GMa2Apv4E9DIx72aYfSKLRYiDRKX8E7Q=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=rKe6BXeR6+OL2SsL7o0mnJz/7StGvft2HONWvAdxZmHztc6ZrwoTyAxvA+48y/8up
	 QQ07+lpsUaH6WEqUsYDkF8iZGmItHINgb3HHrW5t3roO0gCcNBLo4q1qVy80N88qKl
	 sckGbYzSDUKd3yIuuitrTtgqxnGZNZCplUbRuIWxhMKWfNkk7Wv1OucldvgDMNh/jT
	 ziWx3b5kORm9iNDV5tSmv0fyBteMppoSRWmBGOo3TOc40clfu9wANQ/tyUeGesbZqT
	 zl2logdjVWQ9jhs2EkuaiRZ9UeC7+MnaVCfA6WVHCPFNdsBUGKxKh6MPKfAjVoSB1A
	 505NX4MiOT+LA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 00A0A809B0;
	Sun,  2 Aug 2026 19:48:45 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 25678109F
 for <buildroot@buildroot.org>; Sun,  2 Aug 2026 19:48:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 08AE6405D9
 for <buildroot@buildroot.org>; Sun,  2 Aug 2026 19:48:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id miHsy1rK2xSc for <buildroot@buildroot.org>;
 Sun,  2 Aug 2026 19:48:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 11E7B405E2
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 11E7B405E2
 for <buildroot@buildroot.org>; Sun,  2 Aug 2026 19:48:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C1A4186F9A; Sun,  2 Aug 2026 19:47:57 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 2 Aug 2026 21:12:45 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e14a4b9fb4e965a712d309216c7ef228cbf7ab82
X-Git-Newrev: 46525eb25f8144014ddbb5224770f25609a646d0
X-Patchwork-Hint: ignore
Message-Id: <20260802194757.C1A4186F9A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/perftest: bump to version 26.01.5
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/46525eb25f8144014ddbb5224770f25609a646d0
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

For changelog since version 24.07.0-0.44, see:
https://github.com/linux-rdma/perftest/releases/tag/perftest-26.01.5

The tag name is now prefixed with "perftest-", so this commit
updates _SITE accordingly.

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/perftest/perftest.hash | 2 +-
 package/perftest/perftest.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/perftest/perftest.hash b/package/perftest/perftest.hash
index 496ced9a61..79a290f4a7 100644
--- a/package/perftest/perftest.hash
+++ b/package/perftest/perftest.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  3e62774a4b098ad91aa13353333ad221cf541d280dc9ba94db50270d4bb5b84a  perftest-24.07.0-0.44.tar.gz
+sha256  662a426ac4aa8dddc8807a5010edc33e2168145598109c5eefc2acaa4d87df3f  perftest-26.01.5.tar.gz
 sha256  763adb7d5094f2127b026adea8701f042d28d4b1f6fb8b6e828989227a9cf7f5  COPYING
diff --git a/package/perftest/perftest.mk b/package/perftest/perftest.mk
index 12d5c1fdba..d2c2466512 100644
--- a/package/perftest/perftest.mk
+++ b/package/perftest/perftest.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-PERFTEST_VERSION = 24.07.0-0.44
-PERFTEST_SITE = $(call github,linux-rdma,perftest,$(PERFTEST_VERSION))
+PERFTEST_VERSION = 26.01.5
+PERFTEST_SITE = $(call github,linux-rdma,perftest,perftest-$(PERFTEST_VERSION))
 PERFTEST_LICENSE = GPL-2.0 or BSD-2-Clause
 PERFTEST_LICENSE_FILES = COPYING
 PERFTEST_DEPENDENCIES = pciutils rdma-core
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
