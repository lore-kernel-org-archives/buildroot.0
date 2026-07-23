Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00AE2C531CC
	for <buildroot@archiver.kernel.org>; Thu, 23 Jul 2026 17:38:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A1D2B605EC;
	Thu, 23 Jul 2026 17:38:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id K2evUD_9tna8; Thu, 23 Jul 2026 17:38:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2000D60A66
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784828337;
	bh=zYbn1AQgSOzxnjFaqPEm3w05VdIEZr4UjT3QRs3zYuo=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=QcVg72UsPWMN/0OyOLCTV/NM7ZalXuN/gd4kQqRVsCkehp7mG6Qrzk7jYx6HC/SMq
	 AB40lZDFy+aM5Z9wJown97bL+jUZoQUIJUw3g5Lq4ayZeqzru+rQIUBAxuVugA4H7M
	 Qb7AUCTxFVnZf1nrzOwEMZ8g1AG4F4FOBhYFRhUdsQ5T+tSi/XAfKzB2H2XlxML9SR
	 pSFP3KZHJwY/LMM/FsOsSJvfRCI4NfyVw9Y6QlAFq5+tNMj/29wb9FRMW8YKntyAri
	 CdhbunXxxKwqu6t83v4M/iXmGqwqM/Fljz0w2OmgOXyhpzhytwG3d1rUxdCmmQ/IMV
	 vnoxJwG65QvRQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2000D60A66;
	Thu, 23 Jul 2026 17:38:57 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 5EE2F788
 for <buildroot@buildroot.org>; Thu, 23 Jul 2026 17:38:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3860B810FF
 for <buildroot@buildroot.org>; Thu, 23 Jul 2026 17:38:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id w_ydiNvNMqwK for <buildroot@buildroot.org>;
 Thu, 23 Jul 2026 17:38:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 72FFF810CC
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 72FFF810CC
 for <buildroot@buildroot.org>; Thu, 23 Jul 2026 17:38:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9434589115; Thu, 23 Jul 2026 17:38:11 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 23 Jul 2026 19:28:53 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8cbda07d31b66cd1083a8e8798624aa32162e0ee
X-Git-Newrev: 34dfa10df86669683f25536f1b8876b5abb675e2
X-Patchwork-Hint: ignore
Message-Id: <20260723173811.9434589115@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/frr: bump version to 10.7.0
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/34dfa10df86669683f25536f1b8876b5abb675e2
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

For change logs, see:
https://github.com/FRRouting/frr/releases/tag/frr-10.6.0
https://github.com/FRRouting/frr/releases/tag/frr-10.6.1
https://github.com/FRRouting/frr/releases/tag/frr-10.7.0

Signed-off-by: Maxime Leroy <maxime@leroys.fr>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/frr/frr.hash | 2 +-
 package/frr/frr.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/frr/frr.hash b/package/frr/frr.hash
index 043d890b23..151207d500 100644
--- a/package/frr/frr.hash
+++ b/package/frr/frr.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  1e8401e1bfcbb9b0dfefc9b335013733a3c77cdf85c79ff66d9e65167d9cfb1e  frr-10.5.4.tar.gz
+sha256  5c56b27756854b8d0a62b3e152d3f9ea08091851b2d686e140fdfb95cd88f612  frr-10.7.0.tar.gz
 sha256  7bf053957d6c38e39a06a112c60ff35b228d3bd03edbe8c9a03508b051128d16  COPYING
 sha256  f9e0c21faf738da586281c0beaad3cd56204c19085a10fe05e4d3d7f8b5863d2  doc/licenses/BSD-2-Clause
 sha256  aca297b8fd3a43e3bb200f1e2e043c0db6c897325f5ff7f23f7530302a6bf713  doc/licenses/BSD-3-Clause
diff --git a/package/frr/frr.mk b/package/frr/frr.mk
index 5138b34dca..0d922195af 100644
--- a/package/frr/frr.mk
+++ b/package/frr/frr.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FRR_VERSION = 10.5.4
+FRR_VERSION = 10.7.0
 FRR_SITE = $(call github,FRRouting,frr,frr-$(FRR_VERSION))
 FRR_LICENSE = GPL-2.0+
 FRR_LICENSE_FILES = \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
