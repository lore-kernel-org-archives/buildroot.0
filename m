Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1826EC369AB
	for <buildroot@archiver.kernel.org>; Fri, 18 Apr 2025 14:45:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BC73742F26;
	Fri, 18 Apr 2025 14:45:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id e1b_MCaal_XO; Fri, 18 Apr 2025 14:45:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D11F642D6E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D11F642D6E;
	Fri, 18 Apr 2025 14:45:55 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id F3D02228
 for <buildroot@buildroot.org>; Fri, 18 Apr 2025 14:45:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D9D0F44149
 for <buildroot@buildroot.org>; Fri, 18 Apr 2025 14:45:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GntL1aVdnF4w for <buildroot@buildroot.org>;
 Fri, 18 Apr 2025 14:45:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.22;
 helo=mout.gmx.net; envelope-from=dalang@gmx.at; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org A3D3F4310E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A3D3F4310E
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A3D3F4310E
 for <buildroot@buildroot.org>; Fri, 18 Apr 2025 14:45:52 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost.localdomain ([213.208.157.35]) by mail.gmx.net
 (mrgmx105 [212.227.17.168]) with ESMTPSA (Nemesis) id
 1MdNcG-1uf7j42Tjs-00f8nb; Fri, 18 Apr 2025 16:45:50 +0200
To: buildroot@buildroot.org
Cc: James Knight <james.knight@collins.com>
Date: Fri, 18 Apr 2025 16:45:29 +0200
Message-ID: <20250418144530.24911-2-dalang@gmx.at>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:R36SRhxtbWx8XIVKdNuVbaClKShoBCCTMT54Z/SX//OuEbe6j8f
 HgoVc7Gntk8ytb1VjK24jUkf2H0YgsjATcAc8d39nr2H+OGGsShR1TqQY6IJfENl8lk3U6z
 8NBIQ5ONcPYf6yfg8y4E3cRCaq+0u9oN8BAvfnZyPW0Y9E84XROLGS5QYQPPOpec1+23TtY
 mEgFtqFYuxSJNYCu37eCw==
UI-OutboundReport: notjunk:1;M01:P0:9AFyCCuhUa8=;P6lJcSKVfsIdmte+6DoVGaKm3xp
 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
 6RQr1sr+7FO/k=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.at; 
 s=s31663417; t=1744987550; x=1745592350; i=dalang@gmx.at;
 bh=F1Iy7sOuhYN0YW5e4++Po2im8R1yVF9BX2cEl43WVqk=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
 MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=KyN19ZvY6Cy4jpLoR6RuFpHBXZU8outnZ89v7OcfkAsTXmuJZ4/IOPLriOH8hK+4
 nVQxhsQ8cqoAO3E6JG9HZNEPEUM2yyoHGhP34IhKPNQZ/z3znGIknPWc+VDpoQsIf
 KdIF1Shc+9wm4ZvZnzP/oXyh0KVXrmGmIdb2jLANjaXO9RBcCO88vP80Ku10I4LuI
 nIAEmMCYnpe2YuyV4Mqi89TL0HV0uoU04d/u2493Za0xI73/eCTIVLIm732jDhkcc
 wPCvjlZSqJtm/AAg50sUwExm7DR+74Rg9AIVrKcLEKqSvoWu8RLELBrL59saVLQ99
 fK+Fg96fM4zJ1qW6LA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.at
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.at header.i=dalang@gmx.at
 header.a=rsa-sha256 header.s=s31663417 header.b=KyN19ZvY
Subject: [Buildroot] [PATCH] package/gtkmm3: bump to version 3.24.10
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
From: Daniel Lang via buildroot <buildroot@buildroot.org>
Reply-To: Daniel Lang <dalang@gmx.at>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://gitlab.gnome.org/GNOME/gtkmm/-/blob/3.24.10/NEWS

Signed-off-by: Daniel Lang <dalang@gmx.at>
---
 package/gtkmm3/gtkmm3.hash | 4 ++--
 package/gtkmm3/gtkmm3.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gtkmm3/gtkmm3.hash b/package/gtkmm3/gtkmm3.hash
index 9bfd68e027..3671a1d001 100644
--- a/package/gtkmm3/gtkmm3.hash
+++ b/package/gtkmm3/gtkmm3.hash
@@ -1,5 +1,5 @@
-# From https://download.gnome.org/sources/gtkmm/3.24/gtkmm-3.24.8.sha256sum
-sha256  d2940c64922e5b958554b23d4c41d1839ea9e43e0d2e5b3819cfb46824a098c4  gtkmm-3.24.8.tar.xz
+# From https://download.gnome.org/sources/gtkmm/3.24/gtkmm-3.24.10.sha256sum
+sha256  7ab7e2266808716e26c39924ace1fb46da86c17ef39d989624c42314b32b5a76  gtkmm-3.24.10.tar.xz
 # Locally computed
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
 sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING.tools
diff --git a/package/gtkmm3/gtkmm3.mk b/package/gtkmm3/gtkmm3.mk
index f4fc54849c..5a7e494bf7 100644
--- a/package/gtkmm3/gtkmm3.mk
+++ b/package/gtkmm3/gtkmm3.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 GTKMM3_VERSION_MAJOR = 3.24
-GTKMM3_VERSION = $(GTKMM3_VERSION_MAJOR).8
+GTKMM3_VERSION = $(GTKMM3_VERSION_MAJOR).10
 GTKMM3_SOURCE = gtkmm-$(GTKMM3_VERSION).tar.xz
 GTKMM3_SITE = https://download.gnome.org/sources/gtkmm/$(GTKMM3_VERSION_MAJOR)
 GTKMM3_LICENSE = LGPL-2.1+ (library), GPL-2.0+ (tools)
-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
