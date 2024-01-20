Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE598C47258
	for <buildroot@archiver.kernel.org>; Sat, 20 Jan 2024 11:00:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3287942DAB;
	Sat, 20 Jan 2024 11:00:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3287942DAB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id odIFZKGSb-P6; Sat, 20 Jan 2024 11:00:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D5C0E42E06;
	Sat, 20 Jan 2024 11:00:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D5C0E42E06
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 332851BF298
 for <buildroot@lists.busybox.net>; Sat, 20 Jan 2024 11:00:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0C5D060BDC
 for <buildroot@lists.busybox.net>; Sat, 20 Jan 2024 11:00:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0C5D060BDC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 24gRzRgVWUwj for <buildroot@lists.busybox.net>;
 Sat, 20 Jan 2024 11:00:23 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3C05860BD8
 for <buildroot@buildroot.org>; Sat, 20 Jan 2024 11:00:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3C05860BD8
Received: from fpd2fa7e2a.ap.nuro.jp ([210.250.126.42] helo=[192.168.1.6])
 by casper.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
 id 1rR95H-00000009OLd-2Bhm; Sat, 20 Jan 2024 11:00:19 +0000
Message-ID: <ec21ccc1-415b-422c-ad37-fe1602205c6c@infradead.org>
Date: Sat, 20 Jan 2024 20:00:13 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
From: Geoff Levand <geoff@infradead.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; 
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
 Subject:From:To:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:Content-ID:
 Content-Description:In-Reply-To:References;
 bh=BFIuwokr8OJPyFghKMLzAaj4mTGomWx52Tta+0aW6GY=; b=LkTWen9BtDzCj5YD7M6c01WmWT
 QZGP3kqiFoa/nyHCZUdypzUsEP1unlVmHGmXSQF0J+YZCDVcu1iJVFETEBgEb27aPyXrjWNihz/iT
 IJ3btCIsSWftSN3T9G6bv6kXsIU8sBEJbK9VCerE56mVgsrbpIjiMLwDNla+k4pIXnN9OQ+PQBmVV
 XINowljqmSzUDaaJO4BHXf8FB4umjaDMe9wNTQYX+91K8/R/UVHUE0F952yHJ2mCDJA7WwNCFOr0U
 ehkHedsKu2lJYONO+aQgSiKu4ys1RCTxJnxxlCHrE7YzuvuM5dpPrkr/Sl5pIJUismbjylg9RCOlU
 GeOgmcYA==;
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org
 header.a=rsa-sha256 header.s=casper.20170209 header.b=LkTWen9B
Subject: [Buildroot] [PATCH] package/flannel: Bump to version 0.24.2
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

Signed-off-by: Geoff Levand <geoff@infradead.org>

---
 package/flannel/flannel.hash | 2 +-
 package/flannel/flannel.mk   | 3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/flannel/flannel.hash b/package/flannel/flannel.hash
index bafc453097..c1ceeed9e8 100644
--- a/package/flannel/flannel.hash
+++ b/package/flannel/flannel.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  e17164db3b158d13ce5e40bb7b233790cb186762d929fa4f626baf586d4d63ca  flannel-0.14.0.tar.gz
+sha256  f9e68bc9c5b41ee7f721a754c9fa4eddf3da775faa9e638581a564e33b3fabcf  flannel-0.24.2.tar.gz
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/flannel/flannel.mk b/package/flannel/flannel.mk
index b4e2b2f777..515ecfca86 100644
--- a/package/flannel/flannel.mk
+++ b/package/flannel/flannel.mk
@@ -4,7 +4,8 @@
 #
 ################################################################################
 
-FLANNEL_VERSION = 0.14.0
+FLANNEL_VERSION = 0.24.2
+FLANNEL_SOURCE = flannel-$(FLANNEL_VERSION).tar.gz
 FLANNEL_SITE = $(call github,flannel-io,flannel,v$(FLANNEL_VERSION))
 
 FLANNEL_LICENSE = Apache-2.0
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
