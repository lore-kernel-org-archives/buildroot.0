Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94098CE8D6B
	for <buildroot@archiver.kernel.org>; Mon, 17 Nov 2025 17:53:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3684840CC7;
	Mon, 17 Nov 2025 17:53:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RiSrlcPTBJeZ; Mon, 17 Nov 2025 17:53:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5DD3E40C76
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5DD3E40C76;
	Mon, 17 Nov 2025 17:53:32 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id ABEC4158
 for <buildroot@buildroot.org>; Mon, 17 Nov 2025 17:53:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A8E7B81B3E
 for <buildroot@buildroot.org>; Mon, 17 Nov 2025 17:53:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZGaB15ovKVKv for <buildroot@buildroot.org>;
 Mon, 17 Nov 2025 17:53:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=pkerbrat@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A2510817A0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A2510817A0
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A2510817A0
 for <buildroot@buildroot.org>; Mon, 17 Nov 2025 17:53:29 +0000 (UTC)
Received: from pyk-laptop.. (unknown [82.64.130.240])
 (Authenticated sender: pkerbrat@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id A6692B00583;
 Mon, 17 Nov 2025 18:53:25 +0100 (CET)
To: buildroot@buildroot.org
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Pierre-Yves Kerbrat <pkerbrat@free.fr>
Date: Mon, 17 Nov 2025 18:53:04 +0100
Message-ID: <20251117175304.121081-1-pkerbrat@free.fr>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1763402008;
 bh=IxAEPSsXh6QajpbA8yUiJJVU7+mSreZLC/66pF2kAfw=;
 h=From:To:Cc:Subject:Date:From;
 b=HyMCUkv0L5HNXJRXBT7z3sbfpUtprWyIb7p9JMVXJOLyBi74vC1oP8KFBjSbNzJpQ
 HTk9xXDocPfX+gp9G7bvg3eM7Jn9rLjA/wf7CQyAzrb2bEaU5Ola3TJDspHBbG8/IB
 bdqEHPrFprWIZ9eGA382u/H8q2TlqDWbt2FYqJd70qgnudZG7E8necqS7NlTfKKG8u
 Tv7UdQSTnnnLirp9QIjJi+N1/I+lKwv92R/bx+AiRQvdy+PQyMFthS+zZpbkteAsJh
 Gfak9iqD81wSqGxJBiV1GLrNoahUmn+3TiKlMxpRvwwvkdNfHC2wIcEK5RVcwwANa1
 wuwBbjGrI/McQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=HyMCUkv0
Subject: [Buildroot] [PATCH 1/1] package/whois: bump to version 5.6.5
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
From: Pierre-Yves Kerbrat via buildroot <buildroot@buildroot.org>
Reply-To: Pierre-Yves Kerbrat <pkerbrat@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Changelog:
https://github.com/rfc1036/whois/blob/v5.6.5/debian/changelog

Signed-off-by: Pierre-Yves Kerbrat <pkerbrat@free.fr>
---
 package/whois/whois.hash | 6 +++---
 package/whois/whois.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/whois/whois.hash b/package/whois/whois.hash
index 49ded707b8..e671347eae 100644
--- a/package/whois/whois.hash
+++ b/package/whois/whois.hash
@@ -1,6 +1,6 @@
-# From https://snapshot.debian.org/archive/debian/20250607T082433Z/pool/main/w/whois/whois_5.6.2.dsc
-sha1  6095840107fcaf5339a7c9840c153ad3f29a7ffc  whois_5.6.2.tar.xz
-sha256  7fbcbc00b7aa321ac1af28a85d86d3ce7b11db1d4a2317b25407be04e506ead0  whois_5.6.2.tar.xz
+# From https://snapshot.debian.org/archive/debian/20251116T144052Z/pool/main/w/whois/whois_5.6.5.dsc
+sha1  a550d7c51399fc24d9f325cb48560ef8d406fbbf  whois_5.6.5.tar.xz
+sha256  3ec4168da3ff61e5e426964428202bc0573ad6ecc1f3baf6f43daea6c748aa7d  whois_5.6.5.tar.xz
 
 # Hash for license file:
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/whois/whois.mk b/package/whois/whois.mk
index 9451aa195d..78811e69fc 100644
--- a/package/whois/whois.mk
+++ b/package/whois/whois.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-WHOIS_VERSION = 5.6.2
-WHOIS_SITE = https://snapshot.debian.org/archive/debian/20250607T082433Z/pool/main/w/whois
+WHOIS_VERSION = 5.6.5
+WHOIS_SITE = https://snapshot.debian.org/archive/debian/20251116T144052Z/pool/main/w/whois
 WHOIS_SOURCE = whois_$(WHOIS_VERSION).tar.xz
 WHOIS_DEPENDENCIES = \
 	host-pkgconf \
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
