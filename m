Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACE1EC5CFDB
	for <buildroot@archiver.kernel.org>; Fri, 14 Aug 2026 13:21:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7911460A6F;
	Fri, 14 Aug 2026 13:21:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eSf0RXPAIy0X; Fri, 14 Aug 2026 13:21:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A9B5860A7C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786713713;
	bh=gfWGGWid82kzu/9JHNMv5pBKZSwOFUw3DWGdOaLDol4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=e2WLAX8pFo/HdYDfUKwwb5a+z0XLhi+81lQ2cR0yU8Uf3jLtBgc4+6vzo+jyOZwWU
	 XTus8V9l1gyTNKU0iNcLCtPaLy3+JWl2+NW9EHrgYTvsy01LICwSp8i9TKx8uT8i58
	 Net2rR6vok/slXrgZQDF9cVQ8FN9psI/BzsmYPQY8dcHGhJzx2oe+Q/Et5MldJXHwQ
	 tiy1Wps6ozC1bBO2jFFIauyflqjNt+ncNh02nLluwtKroVgL+FRfBE0qTxFyFlYDYd
	 wyFjn3+0R7k213M7GWIvBavLwk0ccZWuc5n0zXqfrn7mt6rlLAsSAAhlLgIzPdb2FX
	 Z0wsLTfcdLUzQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A9B5860A7C;
	Fri, 14 Aug 2026 13:21:53 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 09938139B
 for <buildroot@buildroot.org>; Fri, 14 Aug 2026 13:21:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 070F26082D
 for <buildroot@buildroot.org>; Fri, 14 Aug 2026 13:21:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QNU2AGq-I2O9 for <buildroot@buildroot.org>;
 Fri, 14 Aug 2026 13:21:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A53CE608EE
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id A53CE608EE
 for <buildroot@buildroot.org>; Fri, 14 Aug 2026 13:21:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A97718D665; Fri, 14 Aug 2026 13:20:35 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 13 Aug 2026 16:03:39 +0200
X-Git-Refname: refs/heads/2026.05.x
X-Git-Oldrev: 98046cbf1dab6683be8b4c38019d02b528f40d13
X-Git-Newrev: 589028df3b73384220114b28603bf7361ab16c10
X-Patchwork-Hint: ignore
Message-Id: <20260814132035.A97718D665@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.05.x] package/stunnel: security
 bump to 5.80
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/589028df3b73384220114b28603bf7361ab16c10
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.05.x

Fixes following CVE's:

CVE-2026-70368: Fixed an out-of-bounds memory
access triggered by logging attacker-controlled protocol messages longer
than 1,024 bytes (thanks to AISLE Research and Clemens Lang).

CVE-2026-70367: Fixed a SOCKS server mode bypass of the localhost
destination filter using alternate local-address encodings and
interface-scoped IPv6 destinations (thanks to AISLE Research and Clemens
Lang).

Complete Changelog is here:
https://www.stunnel.org/NEWS.html

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 8b6eea299b3e519a6dac908e5ceed49cc43c4698)
Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 package/stunnel/stunnel.hash | 4 ++--
 package/stunnel/stunnel.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/stunnel/stunnel.hash b/package/stunnel/stunnel.hash
index 572f226861..f966e19f05 100644
--- a/package/stunnel/stunnel.hash
+++ b/package/stunnel/stunnel.hash
@@ -1,5 +1,5 @@
-# From https://www.stunnel.org/archive/5.x/stunnel-5.78.tar.gz.sha256
-sha256  8727e53bb8b7528f850327a2a149158422c02183bc120d1d733cc65b1e2c349d  stunnel-5.78.tar.gz
+# From https://www.stunnel.org/archive/5.x/stunnel-5.80.tar.gz.sha256
+sha256  6d0841d48de07cbbaf4a055919065bf7bb5ebc63cc15c97a2c76caa2bf285513  stunnel-5.80.tar.gz
 # Locally calculated
 sha256  716f18b10eac3f1875ea2205418dd1b0084bd210bd17d615df6b180cfc4d65b6  COPYING.md
 sha256  62f171d4d8b6726df61f18a6bbc0a70f79c4bc2134d837d35c81fc6289a2d84d  COPYRIGHT.md
diff --git a/package/stunnel/stunnel.mk b/package/stunnel/stunnel.mk
index adae204148..7001340a8f 100644
--- a/package/stunnel/stunnel.mk
+++ b/package/stunnel/stunnel.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-STUNNEL_VERSION = 5.78
+STUNNEL_VERSION = 5.80
 STUNNEL_SITE = https://www.stunnel.org/archive/5.x
 STUNNEL_DEPENDENCIES = host-pkgconf openssl
 STUNNEL_CONF_OPTS = --with-ssl=$(STAGING_DIR)/usr --with-threads=fork \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
