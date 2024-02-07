Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EB59C4828F
	for <buildroot@archiver.kernel.org>; Wed,  7 Feb 2024 06:33:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8A6DB61346;
	Wed,  7 Feb 2024 06:33:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id da4L9lWSDQB1; Wed,  7 Feb 2024 06:33:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 953FB61367
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 953FB61367;
	Wed,  7 Feb 2024 06:33:34 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 94FD21BF32D
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 06:33:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 76B5361367
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 06:33:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 20cJmdIbin2L for <buildroot@lists.busybox.net>;
 Wed,  7 Feb 2024 06:33:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=95.163.41.75;
 helo=smtp34.i.mail.ru; envelope-from=fido_max@inbox.ru; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 116A561346
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 116A561346
Received: from smtp34.i.mail.ru (smtp34.i.mail.ru [95.163.41.75])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 116A561346
 for <buildroot@buildroot.org>; Wed,  7 Feb 2024 06:33:29 +0000 (UTC)
Received: by smtp34.i.mail.ru with esmtpa (envelope-from <fido_max@inbox.ru>)
 id 1rXbUs-0000000GWBD-0aFf; Wed, 07 Feb 2024 09:33:26 +0300
To: buildroot@buildroot.org
Date: Wed,  7 Feb 2024 09:33:24 +0300
Message-ID: <20240207063324.1003727-1-fido_max@inbox.ru>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailru-Src: smtp
X-7564579A: B8F34718100C35BD
X-77F55803: 4F1203BC0FB41BD94C460F083DF69F51F716FD8A96C6C408CD848DA42FE26380182A05F5380850404505A7583CCF5D57479CDAE959BF642456D9EB469C07AB780213D7449A2EA4B66E399A284FE16A5F
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE7AC5438007118D6FAEA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F79006375AC38C7EC4509C8B8638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D872211F09058463576B55C399037FA85553B16A584740021420879F7C8C5043D14489FFFB0AA5F4BF176DF2183F8FC7C0C8FBEF6EAD8577B08941B15DA834481FA18204E546F3947C4B6F6234D9065C97F6B57BC7E64490618DEB871D839B7333395957E7521B51C2DFABB839C843B9C08941B15DA834481F8AA50765F79006370A32D918A17158F1389733CBF5DBD5E9B5C8C57E37DE458B9E9CE733340B9D5F3BBE47FD9DD3FB595F5C1EE8F4F765FCF1175FABE1C0F9B6E2021AF6380DFAD18AA50765F790063735872C767BF85DA227C277FBC8AE2E8BDCE939D40DBB93CA75ECD9A6C639B01B4E70A05D1297E1BBCB5012B2E24CD356
X-C1DE0DAB: 0D63561A33F958A508BBDC55BBEC912C5002B1117B3ED6962719838CE31E391F3D2BBC1EF78EDEBE823CB91A9FED034534781492E4B8EEAD01200A96CB7104FFC79554A2A72441328621D336A7BC284946AD531847A6065AED8438A78DFE0A9EBDAD6C7F3747799A
X-C8649E89: 1C3962B70DF3F0ADE00A9FD3E00BEEDF77DD89D51EBB7742D3581295AF09D3DF87807E0823442EA2ED31085941D9CD0AF7F820E7B07EA4CFE44EE1FA91C72E5232B7C733790E205F729B65452BC52E84EA39E4261A9814ACF397AE266BD3C14B807D692F32DC70325D382190CCFED1D53FC8FB5AF11234910F9CA24D68180CB2111DC66A97D0BFE2913E6812662D5F2A17D6C1CDD2003EB8E03787203701020945C72C348FB7EED3
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojh/iSjD2txnNYn/IjWRicXQ==
X-Mailru-Sender: 689FA8AB762F7393590D8C940224AE33B14F1F41200347CD67B445DF6E4DF007661CA61B5EB6C07990DE4A6105A3658D481B2AED7BCCC0A49AE3A01A4DD0D55C6C99E19F044156F45FEEDEB644C299C0ED14614B50AE0675
X-Mras: Ok
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=inbox.ru; 
 s=mail4; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:
 To:From:From:Sender:Reply-To:To:Cc:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive:
 X-Cloud-Ids:Disposition-Notification-To;
 bh=4PsBK0qU3nJZg7R7hjfB5HPSQYtOmsqe8LLrmFLKRfg=; t=1707287611; x=1707377611; 
 b=beMzDJW6SBwv3jSJKef+ej1PBbo//hGmPRBxY4Omkyh7QkhdleshbzW+46VFMBp+J2Icc/7bPxh
 kR8SMa2ylsI0TQPXRcElw8pjMwa51jp2ikiplorCSAcnXG6WwxN7OX1WCCKyKe8z6AaTho08IZAjB
 +Yw7L6o9evbN4KzMJTXesvA5kqfHZ2r1VfJEz1wumbEDzLwp7fz0o7sy5nHPRjKVRMWScWP7N5ilW
 y5RGOiZMmseAjYU24A6xu/lIZNSK6zFj1S02Ih2XWHHoWMW/wypDVoC3fwCWZV/8wS22Rva7qdD+4
 RfA8CMAxiyB1N3mhCheZcQuJYWfAy6tbus5g==;
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=inbox.ru
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=inbox.ru header.i=@inbox.ru header.a=rsa-sha256
 header.s=mail4 header.b=beMzDJW6
X-Mailman-Original-Authentication-Results: smtp34.i.mail.ru; auth=pass
 smtp.auth=fido_max@inbox.ru smtp.mailfrom=fido_max@inbox.ru
Subject: [Buildroot] [PATCH 1/1] package/timescaledb: bump version to 2.13.1
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
From: Maxim Kochetkov via buildroot <buildroot@buildroot.org>
Reply-To: Maxim Kochetkov <fido_max@inbox.ru>
Cc: Maxim Kochetkov <fido_max@inbox.ru>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Release notes: https://github.com/timescale/timescaledb/blob/2.13.1/CHANGELOG.md

Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
---
 package/timescaledb/timescaledb.hash | 2 +-
 package/timescaledb/timescaledb.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/timescaledb/timescaledb.hash b/package/timescaledb/timescaledb.hash
index b7e4c71774..8d0fc125d6 100644
--- a/package/timescaledb/timescaledb.hash
+++ b/package/timescaledb/timescaledb.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  584a351c7775f0e067eaa0e7277ea88cab9077cc4c455cbbf09a5d9723dce95d  timescaledb-2.13.0.tar.gz
+sha256  ca4f48147cb1bf3bf22af9f643822a5931e12a89909cc73c4a89ddae3c828ac1  timescaledb-2.13.1.tar.gz
 sha256  0378e0948feefd85f579319c74d6e2b671194037f550c7176ef26649d94c895b  LICENSE
diff --git a/package/timescaledb/timescaledb.mk b/package/timescaledb/timescaledb.mk
index 34a48ad0c3..a5d77eda80 100644
--- a/package/timescaledb/timescaledb.mk
+++ b/package/timescaledb/timescaledb.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TIMESCALEDB_VERSION = 2.13.0
+TIMESCALEDB_VERSION = 2.13.1
 TIMESCALEDB_SITE = $(call github,timescale,timescaledb,$(TIMESCALEDB_VERSION))
 TIMESCALEDB_LICENSE = Apache-2.0
 TIMESCALEDB_LICENSE_FILES = LICENSE
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
