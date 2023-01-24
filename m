Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B646C25B4E
	for <buildroot@archiver.kernel.org>; Tue, 24 Jan 2023 05:59:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E1D1481F82;
	Tue, 24 Jan 2023 05:59:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E1D1481F82
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Z7c_gz4yf1bw; Tue, 24 Jan 2023 05:59:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2744081F63;
	Tue, 24 Jan 2023 05:59:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2744081F63
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6C3D11BF28C
 for <buildroot@lists.busybox.net>; Tue, 24 Jan 2023 05:59:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 51EB740942
 for <buildroot@lists.busybox.net>; Tue, 24 Jan 2023 05:59:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 51EB740942
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jDDfFfYYLDVK for <buildroot@lists.busybox.net>;
 Tue, 24 Jan 2023 05:59:37 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BC37B40913
Received: from smtpng1.i.mail.ru (smtpng1.i.mail.ru [94.100.181.251])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BC37B40913
 for <buildroot@buildroot.org>; Tue, 24 Jan 2023 05:59:36 +0000 (UTC)
Received: by smtpng1.m.smailru.net with esmtpa (envelope-from
 <fido_max@inbox.ru>)
 id 1pKCLF-0003t1-TX; Tue, 24 Jan 2023 08:59:34 +0300
From: Maxim Kochetkov <fido_max@inbox.ru>
To: buildroot@buildroot.org
Date: Tue, 24 Jan 2023 08:59:32 +0300
Message-Id: <20230124055932.177366-1-fido_max@inbox.ru>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
X-Mailru-Src: smtp
X-7564579A: B8F34718100C35BD
X-77F55803: 4F1203BC0FB41BD9A6D6F5724DD3A0B6C12891D890DB1A8B9DA76E5CFCE64EAE182A05F5380850408E0B8CE121AD00A43B5B1110BA4236B54BEBF1203E68853356753E8D0ECEBA52
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE74323F140F3EE5B6AC2099A533E45F2D0395957E7521B51C2CFCAF695D4D8E9FCEA1F7E6F0F101C6778DA827A17800CE7370F4F695FFFC24BEA1F7E6F0F101C6723150C8DA25C47586E58E00D9D99D84E1BDDB23E98D2D38B6F1F7B995052D5CE5E2F70FF27FF69B63A6C776EFC329A3620879F7C8C5043D14489FFFB0AA5F4BF176DF2183F8FC7C0A29E2F051442AF778941B15DA834481FA18204E546F3947C744B801E316CB65FF6B57BC7E64490618DEB871D839B7333395957E7521B51C2DFABB839C843B9C08941B15DA834481F8AA50765F790063706CBA4EB72A0A67C389733CBF5DBD5E9B5C8C57E37DE458B9E9CE733340B9D5F3BBE47FD9DD3FB595F5C1EE8F4F765FC72CEEB2601E22B093A03B725D353964B0B7D0EA88DDEDAC722CA9DD8327EE4930A3850AC1BE2E7358CCB3ED2A1DE2304C4224003CC83647689D4C264860C145E
X-C1DE0DAB: 0D63561A33F958A59E25253C48816079B81DBF4A1DC68673E8D1AFA4C7CECF364EAF44D9B582CE87C8A4C02DF684249C2E763F503762DF508DC63EAE0DBA7CFC
X-C8649E89: 4E36BF7865823D7055A7F0CF078B5EC49A30900B95165D348F343DA43F62289F1D1C221FCFD3610461CCB5A53D1FDAAF5BC5E600A99D08296428D8AE6FE4DF3F1D7E09C32AA3244C6DE24FBC16627BEB8809A0833608D4D330452B15D76AEC14729B2BEF169E0186
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2bioj4ukhBIi/0FCfVh3ocrbBNA==
X-Mailru-Sender: 689FA8AB762F73933AF1F914F131DBF52BC03C4A86624050503E7720A30A7E5B98CC072019C18A892CA7F8C7C9492E1F2F5E575105D0B01ADBE2EF17B331888EEAB4BC95F72C04283CDA0F3B3F5B9367
X-Mras: Ok
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=inbox.ru; s=mail4; 
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc;
 bh=vwMcy6YAS+/Ko/8eEjJKuInXokQ+9Dmmegtqpn6P7qo=; 
 t=1674539976;x=1674629976; 
 b=oOpTqkA222VTPBugS3beOUCSObImh+neyReJzFbLZSzYGXIrpIdxDp/L41mLxFN4OaiPhGxe/Z4uvI5+/djiHs845GQk6ixNF+u9Ig5RY7gJIRO7hdjoH8xUHyuZbF55YjZroofhrxlFq8yFVQaRgipFjbygAAx7g4NtbZrY7uG8RH1dcE9tuc/3PFa2xCSWvbqQE9CR1M8SI9I+BnBv8F9RrpXaxhfxc1SM9LTNxxNDLiI/qN9ElBl3s+NV0Ia99KEw1gedh7vASq5WUuabxYBA3QRaQZrQV6UeswbJF54VmVUDn3yNQfdT7hQGfnTdDEQkSPBGBJ7U3Tl8iAivQA==;
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=inbox.ru header.i=@inbox.ru header.a=rsa-sha256
 header.s=mail4 header.b=oOpTqkA2
X-Mailman-Original-Authentication-Results: smtpng1.m.smailru.net; auth=pass
 smtp.auth=fido_max@inbox.ru smtp.mailfrom=fido_max@inbox.ru
Subject: [Buildroot] [PATCH 1/1] package/timescaledb: bump version to 2.9.1
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

Release notes: https://github.com/timescale/timescaledb/releases/tag/2.9.1

Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
---
 package/timescaledb/timescaledb.hash | 2 +-
 package/timescaledb/timescaledb.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/timescaledb/timescaledb.hash b/package/timescaledb/timescaledb.hash
index a970ffa1ad..a6560eb326 100644
--- a/package/timescaledb/timescaledb.hash
+++ b/package/timescaledb/timescaledb.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  666f5427cb036500bca731d24d845285299cff82f576ad4474f85da682b2ee78  timescaledb-2.9.0.tar.gz
+sha256  883638f2e79d25ec88ee58f603f3c81c999b6364cb4c799919d363f04089b47b  timescaledb-2.9.1.tar.gz
 sha256  0378e0948feefd85f579319c74d6e2b671194037f550c7176ef26649d94c895b  LICENSE
diff --git a/package/timescaledb/timescaledb.mk b/package/timescaledb/timescaledb.mk
index 7530368498..44e365285b 100644
--- a/package/timescaledb/timescaledb.mk
+++ b/package/timescaledb/timescaledb.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TIMESCALEDB_VERSION = 2.9.0
+TIMESCALEDB_VERSION = 2.9.1
 TIMESCALEDB_SITE = $(call github,timescale,timescaledb,$(TIMESCALEDB_VERSION))
 TIMESCALEDB_LICENSE = Apache-2.0
 TIMESCALEDB_LICENSE_FILES = LICENSE
-- 
2.38.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
