Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CD67C05027
	for <buildroot@archiver.kernel.org>; Wed,  8 Feb 2023 07:25:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A3F0F61097;
	Wed,  8 Feb 2023 07:25:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A3F0F61097
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jDkFV_i50JAR; Wed,  8 Feb 2023 07:25:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id CC8E961059;
	Wed,  8 Feb 2023 07:25:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CC8E961059
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B16A41BF3BB
 for <buildroot@lists.busybox.net>; Wed,  8 Feb 2023 07:25:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8B70240B88
 for <buildroot@lists.busybox.net>; Wed,  8 Feb 2023 07:25:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8B70240B88
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1i29at9fO5Xi for <buildroot@lists.busybox.net>;
 Wed,  8 Feb 2023 07:25:20 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4C956401F8
Received: from smtpng3.i.mail.ru (smtpng3.i.mail.ru [94.100.177.149])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4C956401F8
 for <buildroot@buildroot.org>; Wed,  8 Feb 2023 07:25:20 +0000 (UTC)
Received: by smtpng3.m.smailru.net with esmtpa (envelope-from
 <fido_max@inbox.ru>)
 id 1pPepR-0003g1-U7; Wed, 08 Feb 2023 10:25:18 +0300
From: Maxim Kochetkov <fido_max@inbox.ru>
To: buildroot@buildroot.org
Date: Wed,  8 Feb 2023 10:25:16 +0300
Message-Id: <20230208072516.42067-1-fido_max@inbox.ru>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
X-Mailru-Src: smtp
X-7564579A: 646B95376F6C166E
X-77F55803: 4F1203BC0FB41BD9D919194CF4FC6604C8FF198FB4DC917E089C2BE5AA575A8D182A05F538085040E5A761A70D5B0457020FB051D336C6A45E45B91E02D20972BFF1DDFFDBC137F1
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE7A1E06C56A402FD6FEA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F7900637D24CDE3D695BBBC6EA1F7E6F0F101C6723150C8DA25C47586E58E00D9D99D84E1BDDB23E98D2D38B6F1F7B995052D5CE7990B52E2658EFA96088915AD98FA9E220879F7C8C5043D14489FFFB0AA5F4BF176DF2183F8FC7C0B272A53F9BBAC8E28941B15DA834481FA18204E546F3947C744B801E316CB65FF6B57BC7E64490618DEB871D839B7333395957E7521B51C2DFABB839C843B9C08941B15DA834481F8AA50765F7900637545B104AF56618B9389733CBF5DBD5E9B5C8C57E37DE458B9E9CE733340B9D5F3BBE47FD9DD3FB595F5C1EE8F4F765FC72CEEB2601E22B093A03B725D353964B0B7D0EA88DDEDAC722CA9DD8327EE4930A3850AC1BE2E735F43AACC0BCEB2632C4224003CC83647689D4C264860C145E
X-C1DE0DAB: 0D63561A33F958A5582E32195167626E886C63BE9D3DEBBD6630BF085634F1F84EAF44D9B582CE87C8A4C02DF684249C2E763F503762DF505830FD47C92F6C63
X-C8649E89: 4E36BF7865823D7055A7F0CF078B5EC49A30900B95165D346C409ABC5F9C579BD807474C861516BF69DDB0B6AD95A5555FAD74F98A27DFBCA3868E0D8E025D8E1D7E09C32AA3244C219F9495E19F10EC0D286AE013DBD6B1F94338140B71B8EE729B2BEF169E0186
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojDL2JcYrVG/80psX4cV7PdQ==
X-Mailru-Sender: 689FA8AB762F73933AF1F914F131DBF504EC7CA26A3165D86EFB044976FDBBEE98CC072019C18A892CA7F8C7C9492E1F2F5E575105D0B01ADBE2EF17B331888EEAB4BC95F72C04283CDA0F3B3F5B9367
X-Mras: Ok
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=inbox.ru; s=mail4; 
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc;
 bh=fFBMK88bwYB4NDtpp8z352j59k/CleCfYsBLcd17wDM=; 
 t=1675841120;x=1675931120; 
 b=QEwSbTVRyppa41TFnvXpA8yC3sGUQSu+ocBBgwIjqZJDxC7vdusmzvBRt5NFEm67uCAx958bmWWLbabKZngL+qlIZB7jBkGFJoWGYMFGs0F6GXFIJlS0kHmUOMHkvBiBANo8L4i7tG0OtDYcQevfsdsRpGggfaC/a9H/o3bbn/5r9XNscg0Ru3LZ4bGFVMVuYFgcuNDPo2rzXBLHk80GLmRUGC6MC+Kj+khwD7bF0VGCLgux/CoO8K3wqcSBobIWHIQ6vJD8aYOEftX5GbsP211QC8yJKK0LzX6WAQ6h4yByFlU1PjqhO28Hgh/+vtokYSaA3i53iTaHywESJWoXkA==;
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=inbox.ru header.i=@inbox.ru
 header.a=rsa-sha256 header.s=mail4 header.b=QEwSbTVR
X-Mailman-Original-Authentication-Results: smtpng3.m.smailru.net; auth=pass
 smtp.auth=fido_max@inbox.ru smtp.mailfrom=fido_max@inbox.ru
Subject: [Buildroot] [PATCH 1/1] package/timescaledb: bump version to 2.9.3
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
Cc: Maxim Kochetkov <fido_max@inbox.ru>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Release notes: https://github.com/timescale/timescaledb/releases/tag/2.9.3

Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
---
 package/timescaledb/timescaledb.hash | 2 +-
 package/timescaledb/timescaledb.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/timescaledb/timescaledb.hash b/package/timescaledb/timescaledb.hash
index a6560eb326..2fd14e6c1a 100644
--- a/package/timescaledb/timescaledb.hash
+++ b/package/timescaledb/timescaledb.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  883638f2e79d25ec88ee58f603f3c81c999b6364cb4c799919d363f04089b47b  timescaledb-2.9.1.tar.gz
+sha256  ff0820891646a772aceab19ee0f7da0a5343dc53b9a72c965ab70f723d231d5c  timescaledb-2.9.3.tar.gz
 sha256  0378e0948feefd85f579319c74d6e2b671194037f550c7176ef26649d94c895b  LICENSE
diff --git a/package/timescaledb/timescaledb.mk b/package/timescaledb/timescaledb.mk
index 44e365285b..e3c94ed2fe 100644
--- a/package/timescaledb/timescaledb.mk
+++ b/package/timescaledb/timescaledb.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TIMESCALEDB_VERSION = 2.9.1
+TIMESCALEDB_VERSION = 2.9.3
 TIMESCALEDB_SITE = $(call github,timescale,timescaledb,$(TIMESCALEDB_VERSION))
 TIMESCALEDB_LICENSE = Apache-2.0
 TIMESCALEDB_LICENSE_FILES = LICENSE
-- 
2.38.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
