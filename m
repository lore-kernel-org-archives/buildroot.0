Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9831710398B2
	for <buildroot@archiver.kernel.org>; Fri, 27 Feb 2026 20:57:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AE7F480E05;
	Fri, 27 Feb 2026 20:57:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cfjv9vtP7k99; Fri, 27 Feb 2026 20:57:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 409B880DEB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772225824;
	bh=fpU6YHMUI6GF0VcJDo4NIyV8e684HWFATRQPbW1mhn8=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=E1lP9oQBNseJQNs2uy9wNmldHQsP8RjjZaIRkTJUly5nX1YEodg+/6U3Bw5nghri4
	 oHyJ8rejgnT2Jol3D28i50l6V/xQUv7wXg8dlCbOlw2E5x+gebCRKKHFDnKU5G5hM8
	 WBPYPSPBoUSLE31yOkrQKvNmkb50enw3Cp1ZYCyYMAQ6POpfo65dvHswARjBakC3Ha
	 w0zt9ddbpkI076eWw8aKDpJ4jt2OdYvKiXDelugMGQ49xHYau3BU2vKcokmouneLUW
	 /b6w9V5lbVKlEDzcXBeFZ0VbIXhEeMx8zF2m9paRM+lPpE85vWlLokzhyhZlJL/KYc
	 FDbw33azHyCog==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 409B880DEB;
	Fri, 27 Feb 2026 20:57:04 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 8CA241F3
 for <buildroot@buildroot.org>; Fri, 27 Feb 2026 20:57:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 72CF3403DE
 for <buildroot@buildroot.org>; Fri, 27 Feb 2026 20:57:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id f2YOsC6xVyGy for <buildroot@buildroot.org>;
 Fri, 27 Feb 2026 20:57:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7CA8A403D3
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7CA8A403D3
 for <buildroot@buildroot.org>; Fri, 27 Feb 2026 20:57:02 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 70459854A7; Fri, 27 Feb 2026 20:57:02 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 27 Feb 2026 21:47:22 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: fbdabe5fda6573fb90571e0188ffaed5dc16dea9
X-Git-Newrev: 2ce4c8c266b06bdfbfcfe11eb567784c04331d53
X-Patchwork-Hint: ignore
Message-Id: <20260227205702.70459854A7@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/udisks: security bump to version
 2.11.1
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/2ce4c8c266b06bdfbfcfe11eb567784c04331d53
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

This fixes these CVEs:
CVE-2026-26103:
https://github.com/storaged-project/udisks/security/advisories/GHSA-c75h-phf8-ccjm
CVE-2026-26104:
https://github.com/storaged-project/udisks/security/advisories/GHSA-fcvx-497g-6xmw

Release notes:
https://github.com/storaged-project/udisks/releases/tag/udisks-2.11.1

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/udisks/udisks.hash | 2 +-
 package/udisks/udisks.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/udisks/udisks.hash b/package/udisks/udisks.hash
index a62e6b5ed6..8a70b90a67 100644
--- a/package/udisks/udisks.hash
+++ b/package/udisks/udisks.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  0bf30151fe8d9d2fb59b57f6630739dfbbd16417dee69ec57d43b37335bd649a  udisks-2.11.0.tar.bz2
+sha256  e88c52bae02fa13414604bbef42c6bb91c2e24177ee0057ed55c6bd7451bcb6d  udisks-2.11.1.tar.bz2
 sha256  98046e932dc6c739001e79d7079a3bd958fc55475dcd917d27f884c0c93525cc  COPYING
diff --git a/package/udisks/udisks.mk b/package/udisks/udisks.mk
index c9b66872e9..43d066c9e1 100644
--- a/package/udisks/udisks.mk
+++ b/package/udisks/udisks.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-UDISKS_VERSION = 2.11.0
+UDISKS_VERSION = 2.11.1
 UDISKS_SOURCE = udisks-$(UDISKS_VERSION).tar.bz2
 UDISKS_SITE = https://github.com/storaged-project/udisks/releases/download/udisks-$(UDISKS_VERSION)
 UDISKS_LICENSE = GPL-2.0+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
