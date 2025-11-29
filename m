Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4418D4337C
	for <buildroot@archiver.kernel.org>; Fri, 12 Dec 2025 07:57:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A8B4083DC5;
	Fri, 12 Dec 2025 07:57:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oEtTBW_EV2B9; Fri, 12 Dec 2025 07:57:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 93B5082A2D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765526235;
	bh=JmFHP6/Pad2afpknCXwrCrPXwmA06YsUS0vUYdWxYvU=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=rKOrpp6M0rev9T34C9Qx2HuXC3D7BnVlIUikFKT5TEdisTMw/WK9fwYn7pv0UysbI
	 qX2j+5Jit1o/137gP1Ct80mrwWPncTGdBAPq/NJcUlX1Dq9Z/nldbiTZJZsEmXkE+V
	 T4XBxMPdozXslyRM5QOCeiKXHdnS+QPXfMUnJ+8bmLH07Mtl+zIOnCpRUNXehHvh/M
	 1kt/r8el6vJAw4+wLV+DfXdcxXCc9EO4E320JAeT4IaIH3ftqpABRfsS8iZpTfh9fz
	 ZyGg3uuU5tNAOCs7+yGaQ9kQTSDIKlG2Y+3jD5fE/aOkzYLy+cSQvfNCYqbPSOb/nE
	 hHtX6F7z6+O+g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 93B5082A2D;
	Fri, 12 Dec 2025 07:57:15 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id B04D2E7
 for <buildroot@buildroot.org>; Fri, 12 Dec 2025 07:56:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EC0A741138
 for <buildroot@buildroot.org>; Fri, 12 Dec 2025 07:55:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tSOuDn2HGpMB for <buildroot@buildroot.org>;
 Fri, 12 Dec 2025 07:55:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E74EE41143
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id E74EE41143
 for <buildroot@buildroot.org>; Fri, 12 Dec 2025 07:55:35 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E628D86C9A; Fri, 12 Dec 2025 07:55:35 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 29 Nov 2025 18:19:32 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 86b0fb67ea9a98d032e1e16ef49e6d280fe604e5
X-Git-Newrev: 6d397ffed96853fab2985dde4a8126a23af7e22c
X-Patchwork-Hint: ignore
Message-Id: <20251212075535.E628D86C9A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/acsccid: bump to version 1.1.13
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

commit: https://git.buildroot.net/buildroot/commit/?id=6d397ffed96853fab2985dde4a8126a23af7e22c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes:
https://sourceforge.net/p/acsccid/news/2025/11/acsccid-1113-released/

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/acsccid/acsccid.hash | 8 ++++----
 package/acsccid/acsccid.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/acsccid/acsccid.hash b/package/acsccid/acsccid.hash
index 25f894c577..eabce7d71e 100644
--- a/package/acsccid/acsccid.hash
+++ b/package/acsccid/acsccid.hash
@@ -1,6 +1,6 @@
-# From https://sourceforge.net/projects/acsccid/files/acsccid/1.1.12/
-sha1  6d9aa64b195e1b4d72a9b032f8ee70ad0798802d  acsccid-1.1.12.tar.bz2
-md5  34bf40daedd3428c07f9937d4ec43129  acsccid-1.1.12.tar.bz2
+# From https://sourceforge.net/projects/acsccid/files/acsccid/1.1.13/
+md5  80a017891884863feccf2221a656d6b8  acsccid-1.1.13.tar.bz2
+sha1  35be7ee00b331fd7b4f9b718d39e4f43a1fca5c1  acsccid-1.1.13.tar.bz2
 # Locally computed
-sha256  28f6075a5494a568ce2fd8666c489f6f4a51599b44fbc9390e1ddb48d3ccc5bd  acsccid-1.1.12.tar.bz2
+sha256  8b19aba103ec03c448b9d1b562c8322f8d2ff37cf21d4cb8b0cf522c5f385c9f  acsccid-1.1.13.tar.bz2
 sha256  a9bdde5616ecdd1e980b44f360600ee8783b1f99b8cc83a2beb163a0a390e861  COPYING
diff --git a/package/acsccid/acsccid.mk b/package/acsccid/acsccid.mk
index 3be1379552..9c5e0b13dc 100644
--- a/package/acsccid/acsccid.mk
+++ b/package/acsccid/acsccid.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ACSCCID_VERSION = 1.1.12
+ACSCCID_VERSION = 1.1.13
 ACSCCID_SOURCE = acsccid-$(ACSCCID_VERSION).tar.bz2
 ACSCCID_SITE = http://downloads.sourceforge.net/acsccid
 ACSCCID_LICENSE = LGPL-2.1+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
