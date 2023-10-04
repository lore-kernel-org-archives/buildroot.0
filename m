Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72BAFE8FDD4
	for <buildroot@archiver.kernel.org>; Wed,  4 Oct 2023 07:03:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 07D6C82A3B;
	Wed,  4 Oct 2023 07:03:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 07D6C82A3B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ahwMeipIAUeE; Wed,  4 Oct 2023 07:03:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5BA5082A29;
	Wed,  4 Oct 2023 07:03:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5BA5082A29
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 658E91BF281
 for <buildroot@lists.busybox.net>; Wed,  4 Oct 2023 07:03:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3EFDA414B6
 for <buildroot@lists.busybox.net>; Wed,  4 Oct 2023 07:03:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3EFDA414B6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7ttyai8lezry for <buildroot@lists.busybox.net>;
 Wed,  4 Oct 2023 07:03:50 +0000 (UTC)
X-Greylist: delayed 306 seconds by postgrey-1.37 at util1.osuosl.org;
 Wed, 04 Oct 2023 07:03:49 UTC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D34DE409DB
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.10])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D34DE409DB
 for <buildroot@buildroot.org>; Wed,  4 Oct 2023 07:03:49 +0000 (UTC)
Received: from quad ([82.142.8.70]) by mrelayeu.kundenserver.de (mreue109
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1MDQqe-1qwDJS2ila-00AWK0; Wed, 04
 Oct 2023 08:58:36 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: buildroot@buildroot.org
Date: Wed,  4 Oct 2023 08:58:35 +0200
Message-ID: <20231004065835.2190872-1-laurent@vivier.eu>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:NqUbcy7XgCLxnt2LBj30KJ7wmYg6iNhR3XOJn8vEZHyRAtb+XCC
 58c2oR+hqezaiaxT3LwzJsuNwiOWgkRKUtlMFsWqqlPrie08/KzvCPvRi9s4lmQ1ADIR/MH
 2M9hsTEs5+dH9vjbvQNQu4jlDl+Rt1C4kSj2yHEg5HVELMalweoHz8wsilBI7xoxrz9Bq5v
 E7Rp2C6100yJ+IbcUE5sQ==
UI-OutboundReport: notjunk:1;M01:P0:MSo/0ElmIbs=;OgJ9UIlLkifLaXPAWjvWBBrM6TM
 6G+L3dCXpDgf/PHqLLTrhw5F1t5n9gtDWccop8UzjA1FIpTMybPvT7WIFoMtIdwmOywSIh1S5
 ykSmBcpdL+a9H8o+vz95h6dkbs38apmunEhr7ZCiENRMilRkXUSnOz4B6v66qmVgG0zVeKPjm
 2JhZTN8iYeABkDUYsZgWTjKg1Q2xmYUpTmgDwkHesYQn67NhMekABSJw4D9oY7ZeXWJDVNjHO
 HjbsgVco7zO7AVrqUbDrka21DEwraqB9W6vJywT1uO+5jVHNwAEn/hW8x2PyyjTdXYsAljSbH
 tYkJmh2Z2+XwazcnQ03pb0gFvFbOrMNGE3cpMqhbuHscBx0dWNU92ShaJw5v3WpWWrKVXWzgR
 ZZKlLU2qceY8LXKQ73Cmi0M4Dpvb8w9ZbMp8rb0dfzmXf+quixplCoegdI31KLnE2dnNeCFON
 lUVEb2kSwca7gZ6OhnLZPS9bvdJkVXCijBOFOdxUk3zv/FttBCmW2bdDJwhIei5ado+o4OvYp
 1k8soBagtrqb1zbaWK41DNdhw7CQ/5Hz0XHTJ53H6DfXl/9oStQd/czCQFPIKadMjNqjVFNlw
 RugcWyRa5nmhE6nbdcFQ4T57TbhduCyPpWbZOS1IoLhLrUZTe4lvMFTQzYt3ikQrUwpLyi+xt
 FxUgn0ql84MJMzyG8eYdq8DHoU18i27FQyLe3rnctxlY2NDqMLY0OaR0Nq6TxGI/thq19Z2Aw
 mjaoIu4nvpBUh2h8smvOgHJKjJ7A2V2qYFAZG4HgavQMG+VahowBIkIJv7vxwygEgjgqf5lI+
 Beon/UujdUDnVzb4zq893Z5QK+9H0rLH1+V8FRXghAbZVlZNir75MKdVJhMNwnkwm3ljwhZKw
 Y7BpviqBwBPf0vg==
Subject: [Buildroot] [PATCH] package/petitboot: bump to version 1.14
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
Cc: Reza Arbab <arbab@linux.ibm.com>, Laurent Vivier <laurent@vivier.eu>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 package/petitboot/petitboot.hash | 2 +-
 package/petitboot/petitboot.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/petitboot/petitboot.hash b/package/petitboot/petitboot.hash
index bf7bf56a6751..a9a21f2c1b69 100644
--- a/package/petitboot/petitboot.hash
+++ b/package/petitboot/petitboot.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  b42ae4fb2a81e9cf68f727c3f54c6312788c654bd97628ec9ba61b19a68990e6  petitboot-v1.13.tar.gz
+sha256  fa2367370d3ce5dd9910ab08a0832071e2508c8bf75cfec6d3b9807fbefc507a  petitboot-v1.14.tar.gz
 sha256  204d8eff92f95aac4df6c8122bc1505f468f3a901e5a4cc08940e0ede1938994  COPYING
diff --git a/package/petitboot/petitboot.mk b/package/petitboot/petitboot.mk
index 8d220f88f45a..0992111cb1ec 100644
--- a/package/petitboot/petitboot.mk
+++ b/package/petitboot/petitboot.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PETITBOOT_VERSION = 1.13
+PETITBOOT_VERSION = 1.14
 PETITBOOT_SOURCE = petitboot-v$(PETITBOOT_VERSION).tar.gz
 PETITBOOT_SITE = https://github.com/open-power/petitboot/releases/download/v$(PETITBOOT_VERSION)
 PETITBOOT_DEPENDENCIES = elfutils ncurses udev host-bison host-flex lvm2
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
