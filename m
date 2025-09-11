Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1F16CAC58E
	for <buildroot@archiver.kernel.org>; Thu, 11 Sep 2025 18:55:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8399C848ED;
	Thu, 11 Sep 2025 18:55:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WC_iuvxd0WqP; Thu, 11 Sep 2025 18:55:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9DD51848C3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9DD51848C3;
	Thu, 11 Sep 2025 18:55:10 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 2F179443
 for <buildroot@buildroot.org>; Thu, 11 Sep 2025 18:54:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D7EE781DFB
 for <buildroot@buildroot.org>; Thu, 11 Sep 2025 18:54:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BPhHVIO_6uqB for <buildroot@buildroot.org>;
 Thu, 11 Sep 2025 18:54:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F20C9813EA
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id F20C9813EA
 for <buildroot@buildroot.org>; Thu, 11 Sep 2025 18:54:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E19B684108; Thu, 11 Sep 2025 18:54:53 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 11 Sep 2025 17:07:43 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 4d0919498b5f5f3b9033e355b9bf64c3faaca1ed
X-Git-Newrev: 21a6c98ac4251d46c0d06d42fe6b5a14adda4da7
X-Patchwork-Hint: ignore
Message-Id: <20250911185453.E19B684108@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/udisks: security
 bump to version 2.10.2
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=21a6c98ac4251d46c0d06d42fe6b5a14adda4da7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

This fixes this security bug:
https://github.com/storaged-project/udisks/security/advisories/GHSA-742q-gggc-473g

Release notes:
https://github.com/storaged-project/udisks/releases/tag/udisks-2.10.2

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit f55145837edbaebd2182d0b81782af79843f36cf)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/udisks/udisks.hash | 2 +-
 package/udisks/udisks.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/udisks/udisks.hash b/package/udisks/udisks.hash
index 66f4be5e1f..8803bedb21 100644
--- a/package/udisks/udisks.hash
+++ b/package/udisks/udisks.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  b75734ccf602540dedb4068bec206adcb508a4c003725e117ae8f994d92d8ece  udisks-2.10.1.tar.bz2
+sha256  6401c715d287ec84fe605e0cb90579e8da6c395bce5f42e419f205dd297e261f  udisks-2.10.2.tar.bz2
 sha256  98046e932dc6c739001e79d7079a3bd958fc55475dcd917d27f884c0c93525cc  COPYING
diff --git a/package/udisks/udisks.mk b/package/udisks/udisks.mk
index 0d63532d8a..515797f39a 100644
--- a/package/udisks/udisks.mk
+++ b/package/udisks/udisks.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-UDISKS_VERSION = 2.10.1
+UDISKS_VERSION = 2.10.2
 UDISKS_SOURCE = udisks-$(UDISKS_VERSION).tar.bz2
 UDISKS_SITE = https://github.com/storaged-project/udisks/releases/download/udisks-$(UDISKS_VERSION)
 UDISKS_LICENSE = GPL-2.0+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
