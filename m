Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C240D2503F
	for <buildroot@archiver.kernel.org>; Mon, 12 Jan 2026 07:51:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 01E4360585;
	Mon, 12 Jan 2026 07:51:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MK-8Rzwe2Xb7; Mon, 12 Jan 2026 07:51:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 23513612B9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768204305;
	bh=inuC2O6HDPhiPzdh+mMn8I+JGegYVF77c/YHhIOQfFY=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=A4gc+sp5gz5Nxbd2k/UW9pRY8gEs13bd08DaKDhfSqlbfim+gzrpW2zZB4eBde0t0
	 QgUMqcflRb8PRQR/b8d99sy+cRONyQnqmjha2/9TBiPivQ0DzVuvYwFo0noWxHkJ7d
	 R94yNyeP3boKRbJJ2mgOcftTJFcH2beRJrpOyMK+YHP7Kq3qj9S6ddzbRskJq2sf15
	 sbQ4Fws09Ynm85P0uhFsDThmAVWloG3EJY7MooTP3qQJwD+8ie7ErXg1hEZ8YImUTI
	 X11D9eZD9d+zsw4lSSrvDsFoeGSfzfOFVU2e1xuxhRWduRZRqHXcttd+8Wx70cm2TH
	 u0B/n+Laz+ASQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 23513612B9;
	Mon, 12 Jan 2026 07:51:45 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id BF4DB12E
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 07:51:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A665F405D1
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 07:51:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dojqNCMG2tbz for <buildroot@buildroot.org>;
 Mon, 12 Jan 2026 07:51:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=89.221.237.177;
 helo=send82.i.mail.ru; envelope-from=fido_max@inbox.ru; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 1D9944059A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1D9944059A
Received: from send82.i.mail.ru (send82.i.mail.ru [89.221.237.177])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1D9944059A
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 07:51:41 +0000 (UTC)
Received: by exim-smtp-7b4fb89df9-xh88n with esmtpa (envelope-from
 <fido_max@inbox.ru>)
 id 1vfCiA-000000002Mh-0kDp; Mon, 12 Jan 2026 10:51:38 +0300
To: buildroot@buildroot.org
Cc: Maxim Kochetkov <fido_max@inbox.ru>
Date: Mon, 12 Jan 2026 10:51:36 +0300
Message-ID: <20260112075136.49022-1-fido_max@inbox.ru>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Mailru-Src: smtp
X-7564579A: 646B95376F6C166E
X-77F55803: 4F1203BC0FB41BD979975AF0D777FEBD390EF5E93CD1F773F45ED97938852624182A05F53808504033C8880901B5A78A3DE06ABAFEAF67054D60EA109C22549FFECFA8B313761F0CB69AF26CEA7F1A08
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE7F1942E6D70B4A2F0EA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F7900637AC83A81C8FD4AD23D82A6BABE6F325AC2E85FA5F3EDFCBAA7353EFBB55337566DDAE7ACB9D63E4C4B78AC8A2FBB1853A7E855638A5A8E3079E447177311B5A8E8EEF46B7454FC60B9742502CCDD46D0D2FFDA4F57982C5F4F6B57BC7E64490618DEB871D839B73339E8FC8737B5C224910E9550EC214CEE2CC7F00164DA146DAFE8445B8C89999729449624AB7ADAF37F6B57BC7E64490611E7FA7ABCAF51C927680F9384605B90328FC0C15DC2E66F28941B15DA834481F9449624AB7ADAF372E808ACE2090B5E14AD6D5ED66289B5259CC434672EE63711DD303D21008E298D5E8D9A59859A8B6B372FE9A2E580EFC725E5C173C3A84C3FB9365559B687AC835872C767BF85DA2F004C90652538430E4A6367B16DE6309
X-C1DE0DAB: 0D63561A33F958A52F1D20A98107B1025002B1117B3ED696FA565770FB8F75D58D59E407A97E9958823CB91A9FED034534781492E4B8EEAD5C5DFC4BFF39B799F36E2E0160E5C55395B8A2A0B6518DF68C46860778A80D547F664E23DCAEEEE3
X-C8649E89: 1C3962B70DF3F0AD73CAD6646DEDE191716CD42B3DD1D34C77DD89D51EBB774225B6776AC983F447FC0B9F89525902EE6F57B2FD27647F25E66C117BDB76D6597D0FA7892F46FD5D865677555715CF283228AB0D793A4E323D85BB4FC02103DEE3C33768C64A2876B8341EE9D5BE9A0AD90743C9B721EC7EEDB7C7AAA5346921737A19E0EE8FD93A8CD93680B12512CF4C41F94D744909CEE921556F0E976A29E6EC0772259F8F8F8815B87D7EC76CB9
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu53w8ahmwBjZKM/YPHZyZHvz5uv+WouB9+ObcCpyrx6l7KImUglyhkEat/+ysWwi0gdhEs0JGjl6ggRWTy1haxBpVdbIX1nthFXMZebaIdHP2ghjoIc/363UZI6Kf1ptIMVVt0N+pdRHOZQqlmYkP9Ufw=
X-Mailru-Sender: 689FA8AB762F7393DDD5FD59B456EAD2A2A12837C90DB9F426BB378C58D1F9F9D41ED6FBAAD3875690DE4A6105A3658D481B2AED7BCCC0A49AE3A01A4DD0D55C6C99E19F044156F45FEEDEB644C299C0ED14614B50AE0675
X-Mras: Ok
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=inbox.ru; 
 s=mail4; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:
 To:From:From:Sender:Reply-To:To:Cc:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive:
 X-Cloud-Ids:Disposition-Notification-To;
 bh=Z4CdXpAR2OO4DknLRam7VB4r94ns9d7MbhrxIVpRErw=; t=1768204302; x=1768294302; 
 b=tjgYjjSpeA7l8gqlCA+h08qKH+7xnLujhuamrB5d/oP76RomQ7BMAmD2zz4VQHVEM+S/cvXufuw
 2x2WGm1KJMEftgRX+Dxt5Df5IvgVkO61Y4ECX9eJihkzr7TGUy/QXwIT5zNsxwBglv9s6LXEJg24g
 cJaXIS5MpJTU8wZmNae4xIwFnpibpAV9HdJZ96I8vs97Oa3XXq+BcfN2qCbqmVV9u1qhxnXT+BwVx
 ti7bCtShAT9XuGVi5oWnR7QTNvzYQmjRjUpvmXkqKxwjtVJCLSA6S+331mPVnH1IPFiigJXAMFiSv
 wL+UYksPvwCh7DGEAVva7DkLRfUILRNWtseA==;
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=inbox.ru
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=inbox.ru header.i=@inbox.ru header.a=rsa-sha256
 header.s=mail4 header.b=tjgYjjSp
X-Mailman-Original-Authentication-Results: exim-smtp-7b4fb89df9-xh88n;
 auth=pass
 smtp.auth=fido_max@inbox.ru smtp.mailfrom=fido_max@inbox.ru
Subject: [Buildroot] [PATCH 1/1] package/postgis: bump to version 3.6.1
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

Changelog: https://github.com/postgis/postgis/blob/3.6.0/NEWS

Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
---
 package/postgis/postgis.hash | 2 +-
 package/postgis/postgis.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/postgis/postgis.hash b/package/postgis/postgis.hash
index 2d205ff5b4..e70d0e43eb 100644
--- a/package/postgis/postgis.hash
+++ b/package/postgis/postgis.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  8caffef4b457ed70d5328bf4e5a21f9306b06c271662e03e1a65d30090e5f25f  postgis-3.6.0.tar.gz
+sha256  ec0cfaab475630106211d180d71df46782e41e10b6dffe91d79ca818ecd2cbb4  postgis-3.6.1.tar.gz
 sha256  81749eea887e78402c9b85896cd629b155bc29256927f818f01001f038146391  LICENSE.TXT
diff --git a/package/postgis/postgis.mk b/package/postgis/postgis.mk
index a3a2756593..d5c8fc80be 100644
--- a/package/postgis/postgis.mk
+++ b/package/postgis/postgis.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-POSTGIS_VERSION = 3.6.0
+POSTGIS_VERSION = 3.6.1
 POSTGIS_SITE = https://download.osgeo.org/postgis/source
 # parallel build issues
 POSTGIS_MAKE = $(MAKE1)
-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
