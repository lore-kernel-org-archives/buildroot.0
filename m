Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBD5DC4451C
	for <buildroot@archiver.kernel.org>; Wed, 22 Jul 2026 06:33:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0B5D180DB1;
	Wed, 22 Jul 2026 06:33:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cRYGt8lovYvo; Wed, 22 Jul 2026 06:33:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4E71380D5B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784702026;
	bh=sMHM84dtvjmWSscHCrqa/77V7g8r5Ut2Nte1dYWUCUg=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=PVVLnH37d4eMMKhH32MDV4TyCNPSAk9+/Q7cavF/uCXIAzPQlYuJtcZucRS6bcQlp
	 eOvxVS0KgbqvJq7P0yx1Kh2PJKiuLJRGjIlepmXSgn+fm67g7EDkX73Q87vOA+rW1z
	 gjBBM8x8Fds9POQgDvvjL/ccetXIKXmU2qD1a88Q3WIKm0+bBZcC9F/8CAWqEHq+2W
	 p9dCWmBcvmab7z8FZT5JHco8+iTLPj1TlRmEDx0gH9pPBVSuiRG5NuiFZ7ton1XG/2
	 b4Ro/uc6vxdiz7eIULUQ1XljQAByPgZAHcHbUAJXn6XU/seCZrPP9D2m+Emxw+4PVs
	 488mTVEIMgxjw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4E71380D5B;
	Wed, 22 Jul 2026 06:33:46 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 946F342A
 for <buildroot@buildroot.org>; Wed, 22 Jul 2026 06:33:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7A014400AF
 for <buildroot@buildroot.org>; Wed, 22 Jul 2026 06:33:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UXN_mXzcjsqh for <buildroot@buildroot.org>;
 Wed, 22 Jul 2026 06:33:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=89.221.237.152;
 helo=send57.i.mail.ru; envelope-from=fido_max@inbox.ru; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org B618740072
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B618740072
Received: from send57.i.mail.ru (send57.i.mail.ru [89.221.237.152])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B618740072
 for <buildroot@buildroot.org>; Wed, 22 Jul 2026 06:33:42 +0000 (UTC)
Received: by exim-smtp-86556fd747-v2dc8 with esmtpa (envelope-from
 <fido_max@inbox.ru>)
 id 1wmQWR-000000008Ot-2ITD; Wed, 22 Jul 2026 09:33:39 +0300
To: buildroot@buildroot.org
Cc: Maxim Kochetkov <fido_max@inbox.ru>
Date: Wed, 22 Jul 2026 09:33:38 +0300
Message-ID: <20260722063338.80807-1-fido_max@inbox.ru>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Mailru-Src: smtp
X-7564579A: 646B95376F6C166E
X-77F55803: 4F1203BC0FB41BD93ED3C6BF6FFA701F0B3D367FDA022B560160F5E35392B611182A05F5380850404E9A38B12CC755493DE06ABAFEAF6705A54548B829BA553DD2D25DF418839AFDBDDFA93EA4B3182B
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE77A6D8F9467FE415BEA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F7900637F28F4AF03526AA8F8638F802B75D45FF914D58D5BE9E6BC1A93B80C6DEB9DEE97C6FB206A91F05B2771E8645BC0E549D2E070BE324C7D3C40524BB2D0FA76DB7BB0A4F435E46E6718B35066C979671628AA50765F790063783E00425F71A4181389733CBF5DBD5E913377AFFFEAFD269176DF2183F8FC7C0AD76BF5943A59ECC8941B15DA834481FCF19DD082D7633A0EF3E4896CB9E6436389733CBF5DBD5E9D5E8D9A59859A8B649BD6D9C51793B4DCC7F00164DA146DA6F5DAA56C3B73B237318B6A418E8EAB86D1867E19FE14079C09775C1D3CA48CF3D321E7403792E342EB15956EA79C166A417C69337E82CC275ECD9A6C639B01B78DA827A17800CE7588D3C263EAE74EA731C566533BA786AA5CC5B56E945C8DA
X-C1DE0DAB: 0D63561A33F958A57D5C65DB8BA31B455002B1117B3ED6966673BE556C00010C3E67C18142C611B7823CB91A9FED034534781492E4B8EEADF4F3DF47829F65C7C79554A2A72441328621D336A7BC284946AD531847A6065AED8438A78DFE0A9EBDAD6C7F3747799A
X-C8649E89: 1C3962B70DF3F0AD73CAD6646DEDE191716CD42B3DD1D34C77DD89D51EBB774225B6776AC983F447FC0B9F89525902EE6F57B2FD27647F25E66C117BDB76D659F7E3645839B55D1C9CF525BCE3F6C903CB19971865BD6F8D9E56944B52B328FDBF282869EC25A2AFB8341EE9D5BE9A0A566E17C4CF95D35123E2C3E8746DB59ABAB74675BE81CBD88CD93680B12512CF4C41F94D744909CEE921556F0E976A29E6EC0772259F8F8F8815B87D7EC76CB9
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu53w8ahmwBjZKM/YPHZyZHvz5uv+WouB9+ObcCpyrx6l7KImUglyhkEat/+ysWwi0gdhEs0JGjl6ggRWTy1haxBpVdbIX1nthFXMZebaIdHP2ghjoIc/363UZI6Kf1ptIMVWmxowtcrDwUtVokYl9qQ+o=
X-Mailru-Sender: 689FA8AB762F7393520AF17B8A65FDE20576099E9E4ABB581FBFD5DE71884DFB587EB5851F500D3E90DE4A6105A3658D481B2AED7BCCC0A49AE3A01A4DD0D55C6C99E19F044156F45FEEDEB644C299C0ED14614B50AE0675
X-Mras: Ok
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=inbox.ru; 
 s=mail4; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:
 To:From:From:Sender:Reply-To:To:Cc:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive:
 X-Cloud-Ids:Disposition-Notification-To;
 bh=dWx3qsXtifrVLylR3on4EuOg+HlZDXYadSjredKn3K0=; t=1784702023; x=1784792023; 
 b=YuV/fwIy8R0YUDd0Ej2q5FT4Zi3QythFwhSpghqov9TnGijk8teKgJ3OW4JOO7nazWckPlAPzOr
 0Cpxquj3+xEVRQQGu8jQwOIp2LtLcG2qVrOtgUW9Gik7uC/AkS7r6Sm1xkYKEosLmmSnWpxu6hZF2
 1vLRkCViUwEk/Ykz256lzEhcD95ZszoBCEJ8A2314aniten7bmf6LQqmN5ZjOWBnCeTbSPD6g0Xxa
 8Fkw8bNUdpxrX/xQam+6SlHlqFNuClxTSSyMf1tsuA5nYENrmlPykSOxBjjK6oggn7zPB8X7lpdMh
 nhEQri0sqAQ6hblCfNqGmYfkkvWgDfxUWVxg==;
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=inbox.ru
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=inbox.ru header.i=@inbox.ru header.a=rsa-sha256
 header.s=mail4 header.b=YuV/fwIy
X-Mailman-Original-Authentication-Results: exim-smtp-86556fd747-v2dc8;
 auth=pass
 smtp.auth=fido_max@inbox.ru smtp.mailfrom=fido_max@inbox.ru
Subject: [Buildroot] [PATCH 1/1] package/timescaledb: bump version to 2.28.3
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
From: Maxim Kochetkov via buildroot <buildroot@buildroot.org>
Reply-To: Maxim Kochetkov <fido_max@inbox.ru>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Changelog: https://github.com/timescale/timescaledb/blob/2.28.3/CHANGELOG.md

Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
---
 package/timescaledb/timescaledb.hash | 2 +-
 package/timescaledb/timescaledb.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/timescaledb/timescaledb.hash b/package/timescaledb/timescaledb.hash
index fe733f323b..75f9b542de 100644
--- a/package/timescaledb/timescaledb.hash
+++ b/package/timescaledb/timescaledb.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  f0a940720bb5b0b635dae4d8aeceb13e83b196b8aab8717876af0f45efa47ab6  timescaledb-2.27.1.tar.gz
+sha256  c9f95c8865f71244cdd333076284377e83dad62f85679fbf1c94ba48a7d67334  timescaledb-2.28.3.tar.gz
 sha256  0378e0948feefd85f579319c74d6e2b671194037f550c7176ef26649d94c895b  LICENSE
diff --git a/package/timescaledb/timescaledb.mk b/package/timescaledb/timescaledb.mk
index bc38eb9279..9bbe502941 100644
--- a/package/timescaledb/timescaledb.mk
+++ b/package/timescaledb/timescaledb.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TIMESCALEDB_VERSION = 2.27.1
+TIMESCALEDB_VERSION = 2.28.3
 TIMESCALEDB_SITE = $(call github,timescale,timescaledb,$(TIMESCALEDB_VERSION))
 TIMESCALEDB_LICENSE = Apache-2.0
 TIMESCALEDB_LICENSE_FILES = LICENSE
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
