Return-Path: <SRS0=/mEu=MO=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8177DC4338F
	for <buildroot@archiver.kernel.org>; Thu, 22 Jul 2021 23:43:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0E89860E9B
	for <buildroot@archiver.kernel.org>; Thu, 22 Jul 2021 23:43:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0E89860E9B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C8AAA838C0;
	Thu, 22 Jul 2021 23:43:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0v-HVYa34Xt7; Thu, 22 Jul 2021 23:43:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 34CA482EA4;
	Thu, 22 Jul 2021 23:43:06 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 564F61C118B
 for <buildroot@lists.busybox.net>; Thu, 22 Jul 2021 23:42:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4600A4015E
 for <buildroot@lists.busybox.net>; Thu, 22 Jul 2021 23:42:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5cXoO9bfFDHr for <buildroot@lists.busybox.net>;
 Thu, 22 Jul 2021 23:42:50 +0000 (UTC)
X-Greylist: delayed 00:07:01 by SQLgrey-1.8.0
Received: from smtpcmd02101.aruba.it (smtpcmd02101.aruba.it [62.149.158.101])
 by smtp2.osuosl.org (Postfix) with ESMTP id E304F4015B
 for <buildroot@buildroot.org>; Thu, 22 Jul 2021 23:42:49 +0000 (UTC)
Received: from ubuntu.localdomain ([146.241.181.181])
 by Aruba Outgoing Smtp  with ESMTPSA
 id 6iEDmGaT8qG1w6iEEmUXMr; Fri, 23 Jul 2021 01:35:47 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1626996947; bh=JgUjtE6BYV8UdYRptlT/sR+kz258Z6SAZUI34hcugWo=;
 h=From:To:Subject:Date:MIME-Version;
 b=iFSReKB82jR9FCwoW261FVn5MDiw/YPisne5oRCGT08voWvkowtieCwbqna4L/CLn
 /UbPSkzdNN3Z/YkwkPjIWrvvyZZJv0vkKS+kBY4O7ou7HiqMLOWNhT2NK+GBACauzS
 9shIS1GvObl14sMk4dK2GJdoSPQCQhtJXtcR0vmoo1Z9HLzG1o3axr+ylB0VuuTWAB
 in5/QGPPgNAwQm6zmEcsbxLZPGnwG9mwkJ1u5zRvm+zZkJqtPNcBXISHGWJriiGXdz
 k/Mt+0yW1QIhUu3gKpf8LjXgyNa0qD4YmUkZbfPbzocy0jcbYlxE3OtluZ/znFiE/g
 0StMIcSTf/N9g==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Fri, 23 Jul 2021 01:35:44 +0200
Message-Id: <20210722233544.1210678-3-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210722233544.1210678-1-giulio.benetti@benettiengineering.com>
References: <20210720224443.24edcd0f@windsurf>
 <20210722233544.1210678-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfP7tDRzX9xxDl/glr21pbjsZ8D27pKqKAISP0PmMqq877luIiYweakpdXYXJTX14dVRrEzP/tywwKl+j/urDXHCEiuNlmpr+7rNkOHmLB7JFSeVHlaZe
 MwQPHas7NNevXn32EEFQKx4v4SxWL94gRDsm/xwOjmzNHIsSGXmM7H1Kmf0ZictAOJW20K00UBnWTp6Ly6tVW79oXDNKRD9MP3wRUsaOoJHBC42KK9u/L7d4
 OlIR/sU7iYri4rJ2JSQddoPwMH2BaOHIFsvEprXsgx3yZvEWNYOFxftJhL2As7jV
Subject: [Buildroot] [PATCH 2/2] package/libnss: bump to version 3.68
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Joseph Kogut <joseph.kogut@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

libnss 3.68 requires libnspr 4.32.

Release Notes (not yet available, but should eventually land):
https://developer.mozilla.org/en-US/docs/Mozilla/Projects/NSS/NSS_3.68_release_notes

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/libnss/libnss.hash | 4 ++--
 package/libnss/libnss.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libnss/libnss.hash b/package/libnss/libnss.hash
index 02fda14eec..b8c58e3425 100644
--- a/package/libnss/libnss.hash
+++ b/package/libnss/libnss.hash
@@ -1,4 +1,4 @@
-# From https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_65_RTM/src/SHA256SUMS
-sha256  32170f6c188212a78bf9fdacffa2eeed0d564ef8faae63fd8ae971b208e8c637  nss-3.65.tar.gz
+# From https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_68_RTM/src/SHA256SUMS
+sha256  c402b32cac83034ec1c3d826ef4306cd14a066d7d9a6f4c30d82b3bc043c725b  nss-3.68.tar.gz
 # Locally calculated
 sha256  a20c1a32d1f8102432360b42e932869f7c11c7cdbacf9cac554c422132af47f4  nss/COPYING
diff --git a/package/libnss/libnss.mk b/package/libnss/libnss.mk
index 90f30698ff..100ce2f8aa 100644
--- a/package/libnss/libnss.mk
+++ b/package/libnss/libnss.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBNSS_VERSION = 3.65
+LIBNSS_VERSION = 3.68
 LIBNSS_SOURCE = nss-$(LIBNSS_VERSION).tar.gz
 LIBNSS_SITE = https://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/NSS_$(subst .,_,$(LIBNSS_VERSION))_RTM/src
 LIBNSS_DISTDIR = dist
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
