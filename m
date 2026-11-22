Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12B1A606A31A
	for <buildroot@archiver.kernel.org>; Sun, 22 Nov 2026 20:22:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=fXEqvNfk;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vUv5Taq+
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 531FC40624;
	Sun, 22 Nov 2026 20:22:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 35KCd8KKDx1z; Sun, 22 Nov 2026 20:22:03 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org DA10E40613
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795378923;
	b=ijP9IVV0phQ4Wc7W3Ao5lVYuYou4bvyrQKvVUetj0EIDADuvIQ8kUZcukwdYXg/QzmJX
	 Zhkp+z63pKE+Dh5p+oHDtnCzbpNN+j/Q6RZDY7DRDBrgeXVxTklg/Oj3O8ZtTbRax6G7O
	 ao+2C+mZCAWA23tcRPm7ptB7YSswRznaTKVERTl8dPOHomXSpwDYGiDzpAdzE84A2RWTN
	 yXk8TiiBHmrcWM3KNJczf+I9+qFyTexjFFL/1snMsJpdq3cPwH1zpite3s5uodgbK6qtj
	 /cprP+9x5my71o106fqNzeSQ+W8unvQ8tsn7IyzP17i3RROZzsCn+52mSMZUdm3Uupg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795378923;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Cc:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=pMTBdm0ldB+DIOjAJEw0FWrOUM+CO6auYsyJiMiLJ/w=;
	b=KPyiiyibFGpixEXN79x/7yiIZwaaWYxoEr0XcFV5bduXhi3IRkVJASUMHALDRn+6RMIu
	 raRRUZBs30/FJJ+bl5OXnX6wBHoeSMKRYPuCvxDcL0OItXo/D6mHcOV+7D2H4oqTNLYY+
	 otapCwSNOejwt8scCoqELeFmkt6cNncBuUcOyizJ5f85YeiRW9e7RIf7ii35vSdV/C/Dg
	 LrIQrvQGlEWMXMfryACCFicrtP41hn5GCTw+Oxyj0mgIVjRpYT58ZzjZHsAvdtl8Va4Na
	 I814EN/cmsr1qiAEKmBjEKKacoN8I+cCma7rDyNS2CN1LfM4HE+CKD3VHoAoROn4Aog==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795378923;
	bh=pMTBdm0ldB+DIOjAJEw0FWrOUM+CO6auYsyJiMiLJ/w=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=fXEqvNfkXveR3XS6fB26bvCISWsgnnmh6KPmoOyt3+ew87u+NQpXI/tKqYNqLZT/O
	 0dWSh9mAo1qdsRs4lo9KymHxgLSZ6RvDyzyEsvRg0mBt7VyzqeQXNdPeSRk5l1qomD
	 M0Ll3Gj/pfCdG6/Nklxk1xDueeAjrbuDH5bSVAXtzrLLKgbjSfgWnsbIIM8J5sYPid
	 3IjcuABz1v8knRPYUIZpfz4GvQ0uoVhBh0DQ/CV+HKGG9crOkCbVwyazv3CiChFFnf
	 akg5cpIhPsUKKHESOFifJkL1ioJZ59TsfKaWASQS8hHwC3tyI2CP2NoR0LNyNuKXQu
	 ve6AT9X658sww==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id DA10E40613;
	Sun, 22 Nov 2026 20:22:02 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 6CABC499
 for <buildroot@buildroot.org>; Sun, 22 Nov 2026 20:22:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 532C94008B
 for <buildroot@buildroot.org>; Sun, 22 Nov 2026 20:22:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lo43qjdeh5Ba for <buildroot@buildroot.org>;
 Sun, 22 Nov 2026 20:22:00 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 73979400C7
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::32f"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com;
 envelope-from=angelo.compagnucci@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20260707 header.b=vUv5Taq+
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 73979400C7
 for <buildroot@buildroot.org>; Sun, 22 Nov 2026 20:21:59 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-4bb55cda775so16068125e9.0
 for <buildroot@buildroot.org>; Sun, 22 Nov 2026 12:21:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1795378918; x=1795983718; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=5ENXSRZ0M45662auCNe48t1eCPHd0BOYkszRnhY+0bM=;
 b=vUv5Taq+mtLhnmpuUxC+zm5m8y1Ch7mLu7qPNwDd08XITtaX+fp/ji6EY5XlyrrBJ6
 7zf93hUKPRcpujBg9j8hVZ416QOjjYB1RFmwP2Hs2IWqArHjTFEismi7JY7b9s7NvblW
 vDM63CHSznMIckkCt8lEBPiRhlcDnWMz6PCarSSfQ7roYHy+ErEQNGE+H50OxaQp/Ck4
 XhL/hdLiUhIPZ+lMro23W3zuCnIVtLylDio88Ae/J8047TUryIvK/VHEOqfFvVQAVBCM
 GXgcL1/eTKAebjxzfei5s40MQx9M2LDVNzcosTSKwcHDdQwqMtccI1JKVc2gokzvylHC
 8ZYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795378918; x=1795983718;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=5ENXSRZ0M45662auCNe48t1eCPHd0BOYkszRnhY+0bM=;
 b=OKRn1gSV5o0kRTzL+8EMjhj7hldgmq59sqaG8yoC13etxXGabic/nCuA8zbhjVzKR0
 okA1HX/Cew+KyyUGTPzMIF3XK6G1dYmJjpGv9hEaWKx8xpxqtNihcBgAA3qlNbmP2U/r
 +2ZSD1GBv35OZT5FWdVAmDNkE0KOhIgXuCUQHKLJ0lGP0i1hWl8EdVL+NsOBD7Em38Uv
 1qEzxKcFBPnUk619tbeH9+PPjFFJ9rlM7RLyR3j/MPK3hvIoZzbb91aaJKsMBWxv1zUg
 crT4Xse+BbJ1TeUNm4rI6ld+UurbzfugSEg0KpyBmCTXV2dOdbEgTZxvUwE4IsOqRqJ6
 HdPQ==
X-Gm-Message-State: APuU4Z8z+/OywVmh7xw87n/Gy9uHH+ukrSsxP8c1Q4OSGnFGddbhUTWw
 LfaFQXcA4gPkzp30ACSqNNZjzuWLkodnVAl0j3WAt0dxuHZ/Q9tvF+Cfy4z8VuJq
X-Gm-Gg: AZFdTZey2NQXuIGzfwOqTUYhCZHfWMjKQ9Fm+WDFj7GWXfo2YBwNuno3YwMhGjlQFbO
 UeBTNSxv6sagYQySZN/lB9Bess9MW8oxwFb6G4Kr//9aZWO5uHO7X/1O0rq14WEk19fcefUWnS2
 OGYInoUSWbVa9H9AgXaMhUWVgcjEnLuhq3ZBPk/zJQ33jXgX/lyUwK7shKRiQntNzgMrOaSLsy2
 OVRe9qN8Bas8mMlXeI25AMFmZiMee4799z/kNitlrq1dvQdaXjCzbu0l7pfbQDXUdZ2UQg7h27h
 JKVa2bg/Ov0HABPRubKYNYaBmxg6ape0+zaSPyyv2NNF31rcLlpIWJx5BdLwD3nziT4lPywLwIi
 QQ/WbLwZDMiveLKRv2khJOMLqWuvYKlnLX6WerNHqgfASO2lJoIkPUnWqESngX5Xx6Tg0hPLiqA
 AfRSbgzca11re+p+XPKSpCfob4AXF5xJpB1F89mwkvLVu9wWHwPhKilK3VFc7gbLa2YuaHqn8dv
 cf+Csgr3FYMKpDBZOkQTTnLOnBBTupOISK12spHmeIfM00SRSGKuBgIsrt1lStcEospAaaGk//z
 XUypEwcNwG62bY4rzaiATpI2Z+nohD5dgjD9ebzYNiQ+PJaOazA=
X-Received: by 2002:a05:600c:5303:b0:4ba:4928:8aec with SMTP id
 5b1f17b1804b1-4bb88807d7cmr193097015e9.9.1795378918209; 
 Sun, 22 Nov 2026 12:21:58 -0800 (PST)
Received: from angelo-Precision-7550 ([2.58.136.216])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4bb853a12acsm319409495e9.8.2026.11.22.12.21.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 22 Nov 2026 12:21:57 -0800 (PST)
From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 22 Nov 2026 21:21:51 +0100
Message-ID: <20261122202154.3606582-2-angelo.compagnucci@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261122202154.3606582-1-angelo.compagnucci@gmail.com>
References: <20261122202154.3606582-1-angelo.compagnucci@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/4] package/qt6/qt6positioning: select network
 for QML
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>,
 Christian Hitz <christian@klarinett.li>, Bernd Kuhls <bernd@kuhls.net>,
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Baxiche Su <baxiche@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The QML module of qt6positioning is built when qt6declarative has the
Quick module. Its PositionSource type uses QTcpSocket, for NMEA data
over TCP. It doesn't link to QtNetwork itself: it gets it through
QtQml and QtQuick, only when qt6base has network support.

Without BR2_PACKAGE_QT6BASE_NETWORK, the build fails:

  qdeclarativepositionsource_p.h:22:10: fatal error: QtNetwork/QAbstractSocket: No such file or directory

Select BR2_PACKAGE_QT6BASE_NETWORK when the QML module is built.

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
---
 package/qt6/qt6positioning/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/qt6/qt6positioning/Config.in b/package/qt6/qt6positioning/Config.in
index 37d2a2d273..e0ce6442d6 100644
--- a/package/qt6/qt6positioning/Config.in
+++ b/package/qt6/qt6positioning/Config.in
@@ -1,5 +1,7 @@
 config BR2_PACKAGE_QT6POSITIONING
 	bool "qt6positioning"
+	# The QML module uses QTcpSocket
+	select BR2_PACKAGE_QT6BASE_NETWORK if BR2_PACKAGE_QT6DECLARATIVE_QUICK
 	help
 	  This package provides Qt6 Positioning:
 
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
