Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8740FC4451C
	for <buildroot@archiver.kernel.org>; Tue, 21 Jul 2026 19:41:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2EE6360692;
	Tue, 21 Jul 2026 19:41:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1JFiScB-TkAz; Tue, 21 Jul 2026 19:41:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 51A316089A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784662866;
	bh=CNLkb6lcO2OLPMxnmJog6wwsgz8y7K9r/PebZ2C0cNs=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=RoJPdbP5yK7N5oO6SiUjzMIRbCUNJ73HBpG3kDJ0c6c1YLthV/7dua/D0kKBiLSj0
	 qvtTnq4SVxQgQGc6PQ4hjKWbuKrLDj/j3KcQS7qy70Xm0dwE+D/moaq9KbGgimNyeW
	 bU8tefNcdZd6ftGoUjo6+Du2wcYlJ2PyiE4oD+Dqzx79afb7QtzNf2JFjHeG3QiorG
	 S/9tQ8IuX3aiEnYrXCyveDVi0Nif9gPtJXArCDnpxxJag1TBfwj1Fw1YAOtJuzRXVQ
	 dugfJnzikW3Rgxp50Jkp3CFcqny43gDyFldSVP9kuKRYuCTAEZX97OxQ52BF3Qe6VN
	 Qub4AclKzkd+A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 51A316089A;
	Tue, 21 Jul 2026 19:41:06 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 4836142A
 for <buildroot@buildroot.org>; Tue, 21 Jul 2026 19:41:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2E7D740422
 for <buildroot@buildroot.org>; Tue, 21 Jul 2026 19:41:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KW7DPhxBdSxj for <buildroot@buildroot.org>;
 Tue, 21 Jul 2026 19:41:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2746E4036A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2746E4036A
 for <buildroot@buildroot.org>; Tue, 21 Jul 2026 19:41:04 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DA5AD89139; Tue, 21 Jul 2026 19:40:25 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 21 Jul 2026 21:35:47 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a44b18837dc54504f25139d7a3e571cb67cbc9c4
X-Git-Newrev: be3100145892f8f3c5d59382ebbc3e9dfadc6bbd
X-Patchwork-Hint: ignore
Message-Id: <20260721194025.DA5AD89139@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/iproute2: bump to version 7.1.0
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/be3100145892f8f3c5d59382ebbc3e9dfadc6bbd
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

For release announce, see:
https://lore.kernel.org/netdev/20260615160636.412a064e@phoenix.local/

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/iproute2/iproute2.hash | 2 +-
 package/iproute2/iproute2.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/iproute2/iproute2.hash b/package/iproute2/iproute2.hash
index c918fcd2b3..691e87bb43 100644
--- a/package/iproute2/iproute2.hash
+++ b/package/iproute2/iproute2.hash
@@ -1,3 +1,3 @@
 # From https://kernel.org/pub/linux/utils/net/iproute2/sha256sums.asc
-sha256  e62890f7b5de63c05a3bf331dc8deb4c015c336013f341a4edf46969797f2f4e  iproute2-7.0.0.tar.xz
+sha256  fd9fa1b95809417157ca83dd72957e3261bdbce896353cb936f80af0b33a4b5c  iproute2-7.1.0.tar.xz
 sha256  e6d6a009505e345fe949e1310334fcb0747f28dae2856759de102ab66b722cb4  COPYING
diff --git a/package/iproute2/iproute2.mk b/package/iproute2/iproute2.mk
index 4ca49d294e..fe7a6fc304 100644
--- a/package/iproute2/iproute2.mk
+++ b/package/iproute2/iproute2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IPROUTE2_VERSION = 7.0.0
+IPROUTE2_VERSION = 7.1.0
 IPROUTE2_SOURCE = iproute2-$(IPROUTE2_VERSION).tar.xz
 IPROUTE2_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/net/iproute2
 IPROUTE2_DEPENDENCIES = host-bison host-flex host-pkgconf \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
