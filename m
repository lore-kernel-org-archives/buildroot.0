Return-Path: <SRS0=EGOI=OZ=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86298C433EF
	for <buildroot@archiver.kernel.org>; Tue,  5 Oct 2021 20:32:04 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1347E61058
	for <buildroot@archiver.kernel.org>; Tue,  5 Oct 2021 20:32:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1347E61058
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmx.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A35E083E47;
	Tue,  5 Oct 2021 20:32:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NBuVMixYAwfq; Tue,  5 Oct 2021 20:32:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0F82683E2F;
	Tue,  5 Oct 2021 20:32:02 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 75F081BF315
 for <buildroot@lists.busybox.net>; Tue,  5 Oct 2021 20:32:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 64DEF402DE
 for <buildroot@lists.busybox.net>; Tue,  5 Oct 2021 20:32:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=gmx.net
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PjF2UKoHHYw3 for <buildroot@lists.busybox.net>;
 Tue,  5 Oct 2021 20:31:59 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 12C0140227
 for <buildroot@buildroot.org>; Tue,  5 Oct 2021 20:31:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1633465917;
 bh=O5jYPrX2omZZ2an0jNSgWCQ8mkFv0UG5TWzHWtpMsj4=;
 h=X-UI-Sender-Class:From:To:Subject:Date;
 b=M9VrxAO/Ja6//yF4rVMseYswUwW75g0orc+eb1MtyNe0DOkluK139dydqrMH+AtAy
 tcFoeGGmFzRdkpZywLUnQJQgIqqOe7vZ3blTXpSRTfd0XtsvOH3CdMFHfcNVIwBo9j
 P0J+hyyxl3EFIOG8qPAIdp+Jr+pGG8/omtewIxbU=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.fritz.box ([62.216.209.251]) by mail.gmx.net
 (mrgmx105 [212.227.17.168]) with ESMTPSA (Nemesis) id
 1N1wll-1mwEhZ3XQn-012Eu3 for <buildroot@buildroot.org>; Tue, 05 Oct 2021
 22:31:56 +0200
From: Peter Seiderer <ps.report@gmx.net>
To: buildroot@buildroot.org
Date: Tue,  5 Oct 2021 22:31:56 +0200
Message-Id: <20211005203156.23462-1-ps.report@gmx.net>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:IeTUGr0Ve3nCpMbj3fu8IiWQtVJspSTsMZoXFVrm17OHTneKT/X
 Qil9rNmJ+pFnLelpyJ8LWsZF97xY+lHCitAOpajxDpQm1dUfYCovaapcwW6Mw4MON4L60LB
 pT+mKg5SMTBHX72Nic20L4jq2/2WSSeBjJP5lLAg5mgN2/Y/x4V5mr2dM7x0l4hrCeCbHjG
 LfX/m1rJt7CLfY6vpq4xQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:rUjaMtDZCVs=:yIxXrS/A9/Rema8Q7IlXwE
 FB+OZlVP1bERtyiZo2N6gvn2V7Y5XpL14pfg1Eoqn18pPvqtY3gWzsXsZoeDZFdXTd6MHZyKc
 /xB0e8FPU5ZYSWd552WF6cxU32wVbYM2+AvVtOHh7tEDDRoGkYkvLYd20hzvUlmPgbutQsk+q
 jChdNkdGK6kmRx+MpTw3tFah5WaTi1pdotqWl8kTWrZbULX07+HcigStXPLU8mQq5NggijOMa
 pEEoeHMZPWluRxaC3NaGvrvPNxA5Qsh5vURmEhf4TzbjxkhdyHhE2M2igmGyuDRjY3R1Cs+fN
 NMNfjLCGMUSSs6GSL3+DOMCykdnTvfGqDvM17C6Si2YftETfDoQUgBEcHT0RKoTbvZSt4Xqvl
 NjrcR9wE2undihr4kg/nxNRfrLTqctzYtjD+6MzMHOmEYxazHzu6aaMpvp8BSiyrjMtbrNzNY
 O7HgblzAlMmK6AkE2G0snvGjLlPRhmgquDxM/mpLH5974cAJOGWuFTO9cvEC9V7fyZIvX5uO5
 C9CucOWaaYp79BZEX1dfYLSles6pQ1J7AMTTiDSq3806FVfzrV/UQakaG+9lRRH4lVWuTgrAL
 Lz8F6jQRmwzWSTcRPlRvfo0WAj8d1jnpHaWZVMMGCY1a0LDimWCWQ1ZsKoj4Rwn2Xuz36TKTm
 7hgTS08kODvTKeVjr0xLTkKVfzMlVteyI0RIt11sNkG6uyuJx3XkY/RN7OxvjluP42cS/Nexs
 petkYGbjl+iqnq552vT/HNT7mDphVd5BGY9qMe+qZ4qCt+RkeHzyszmzuC3XCOh24cVUQSjEX
 3e4iz5Fn+cN4QOkYkHtJ1Ypgs+SKHhzLa/v4eui6qQajjxP8mVSVwK+noPhwhwYrqRK2uta6a
 eLjRQZIcfztMjubNerzqpuqQpOzkuLxgHuc44rIRpo/FXkL5hdSAY8nyJ+6gPhrPYXy1BIvDV
 kgDHit8RYUNEP/xe3xP5d/JwNpKUxNcSdn0nne2Ou+/K84sMTtMchtPeHsN8bBDlDgLJP4wTQ
 70DpBqv6H40Oj53Y2pMIHn5aj/Z/8c724xnI5KrimyHbKK9/doQg7CR5w43hJ76ikqlxXJnMf
 QDZt93SSQWZn68=
Subject: [Buildroot] [PATCH v1] package/libuev: bump version to 2.4.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

For details see [1].

[1] https://github.com/troglobit/libuev/releases/tag/v2.4.0

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/libuev/libuev.hash | 4 ++--
 package/libuev/libuev.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libuev/libuev.hash b/package/libuev/libuev.hash
index d52d210d10..e5c9660a02 100644
--- a/package/libuev/libuev.hash
+++ b/package/libuev/libuev.hash
@@ -1,4 +1,4 @@
-# From https://github.com/troglobit/libuev/releases/download/v2.3.2/libuev-2.3.2.tar.xz.sha256
-sha256  af31ffe1058a2ff6c56fee26ec8749688704d297189b6a898380a601efefbec9  libuev-2.3.2.tar.xz
+# From https://github.com/troglobit/libuev/releases/download/v2.4.0/libuev-2.4.0.tar.xz.sha256
+sha256  31f1aa4f492ba4f6a5dd6b19968ae6a732968dc05cae6575930560b6cee1f5ef  libuev-2.4.0.tar.xz
 # License files
 sha256  694a734d9c1b46ae203314ed1c744a1acebd4fe5fc964b761703772546f0d3ab  LICENSE
diff --git a/package/libuev/libuev.mk b/package/libuev/libuev.mk
index 8a6759a2d7..a32381dcc5 100644
--- a/package/libuev/libuev.mk
+++ b/package/libuev/libuev.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBUEV_VERSION = 2.3.2
+LIBUEV_VERSION = 2.4.0
 LIBUEV_SOURCE = libuev-$(LIBUEV_VERSION).tar.xz
 LIBUEV_SITE = https://github.com/troglobit/libuev/releases/download/v$(LIBUEV_VERSION)
 LIBUEV_LICENSE = MIT
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
