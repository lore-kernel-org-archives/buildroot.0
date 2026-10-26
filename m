Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12CE8606A322
	for <buildroot@archiver.kernel.org>; Mon, 26 Oct 2026 11:27:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=bMXVNA8R
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BB4234064A;
	Mon, 26 Oct 2026 11:27:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3YYv8mNUfRXg; Mon, 26 Oct 2026 11:27:54 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org D2E2C4064B
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793014073;
	b=Gu2klDNZuy6q5bAgH8rec1R5Y5J07+FDo1GeODGJxuFQoLAjbkWZe18NX9kXnd0xHQKw
	 wluh0sDJRS3fWYJA3TIkh3SkhUneZmV8IAEShLqW7QHEvjRjEoYMXjg8DlT+pNxkzUGRK
	 n/K/Oj/SMMscp7sZDbLCepyQSNerQQtAy/wZqC745gZBzuIvl7pRbz/Y3nq8HIVbmJOs/
	 SWoYkiEme1uddhXPCf70tM+/xnzOrg8+6cOdWMs+VeqZhMNzWUH95wE3u0oSySsYl705j
	 Bw9rjMwYp2si+jQsyxd1qgt4HkPMRVA6gTrCQ+V5ZHN4Nl7J8/TafQvjo81EMR6B0FA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793014073;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Date:Message-Id:X-Mailer:MIME-Version:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=RE6yJA0o702ko+/jHubcl5MECqK653U1yudi2w+RRTs=;
	b=k7NU8qzJI4+JZM7PKA4+lhjlRGVVoGxx3LRb4jppxPeahHDAfh/gWmot8WbMK3/9IwZw
	 Cr0oQszviHJkZ+zbLurR5WcE5ibUIpHhUJQbifmPYx7qL513fDyAVYUQlUFNcAOznboHB
	 sTivxEDIx9B8y0QqF9hHhZSdBA8zoWRgd0pu2gTEqFHY10QqnskDNrSBdJgSuMiVKHkVK
	 zBW63n6nw8/dmOXp83lCCZGlKgo8nA805zrrUw/U18N8smE8+rlaA+I1Mv9TOlScisO/P
	 t2EttsdBzHaohZWLgxsagxMaQKT3RhstyF0S9DhaEuRPxZAeNY9VgCuNLsBIJ98ZmgQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793014073;
	bh=RE6yJA0o702ko+/jHubcl5MECqK653U1yudi2w+RRTs=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=bMXVNA8R1A502CS+xG1r/bEINU6MgN7fzoK/PfedbV5TS3Tsvr1SvhmWqIygtk4Gh
	 +cd+HNRiTI1J/G/3vkH5fAF5mkVSeH73RgRTDFM+dZ7/PSq1qYCWTayRBa+mU8Ixux
	 8NdRXl/FpAPCPcQYibZnZ4ViHeZ4KQhhFm4oYtu+lA+MlAuRnO0KXd8V6wHH2gF5L8
	 Y0DJ9NkUgOrViHexqEPWjTTKNiyu+gi+bDp3ruQx6XMSn1MhrQXDkoAkxqOtwUSylk
	 Vkn48rj1xUodc1IlKyJYkos7ovhvQ4E1+VoYCIyUkhLlx0hxqQBWQlCF9oWRkrBKC+
	 AZfeOQ6ALwVyw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D2E2C4064B;
	Mon, 26 Oct 2026 11:27:53 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 2DA1643
 for <buildroot@buildroot.org>; Mon, 26 Oct 2026 11:27:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1F5CC4064B
 for <buildroot@buildroot.org>; Mon, 26 Oct 2026 11:27:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WY7vi_URtay8 for <buildroot@buildroot.org>;
 Mon, 26 Oct 2026 11:27:52 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org BFEC14064A
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793014072;
 b=iT5pn3Smnn5vuiG6ttBMpQ2RrnUsd8qNuHQmd4Ma8HPJQOjpRWbooEKLkZRRPRP3RUfH
 8b0iZI+iXe56iCEZmaOmBleuM1BON+LS3q70CcUd0hBcOPMvCuyTkhMZG4zsUEK8BKlMr
 NfoxGA/0oKXoF9RxYIZ8n9kDN0yF3oT3WxMjUw7ag7k4GlC9eEOBMtm5QCKa9J9ukz2SJ
 ZqrVhfmd/uiYrBK6mhxZQJet5yUU4fyRjeOJkmeeQJ3vtlnBTPNs2QPS4LHsu4qPdBTBW
 26DTBUFKtlE/g5xaPxPrO+C3hZCvk7zBHnPz8AONcB+5IjzqFm91QqldDkqB22ik37Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793014072;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-Id:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=UPV4Zh4M/mZniiwtF6t7bCtxBLwqMVrtel0balcZ/XU=;
 b=GBhRwogYzuXBwzX4rmGvj0TdddP8ffOQumFIQ50T6VqURTxzq7twWFuHJdVoTu1y5tRl
 8Gs9zcIXBmoeqOZ3+Q9HbPTlTX4NHYT6XBX8zh+RJehJ4hsePfjTD95E374GT+sFUgL+E
 2s62EKRQgtMz4vtAYAQXZrul0w4HGyiJ6bcp3EnxuAQHdvUoNWS2EBLxvOvokx/yIEt+s
 BVUiUuAMOsKUWQ+utsZ6n1kiC6ZNEKOxlRpuHcBgSR1zenVu33qNIWrffehSah4QKxKTA
 WmbDmJdAWS2mcIEst894jegNpbwm70skm3FLawfOnMyJ7e4or5iZfYTSAFOuR7Ax3Jw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=googlemail.com;
 dkim=pass header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256
 header.s=20251104 header.b=IePMgrV4; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::534"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::534; helo=mail-ed1-x534.google.com;
 envelope-from=yegorslists@googlemail.com; receiver=<UNKNOWN> 
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BFEC14064A
 for <buildroot@buildroot.org>; Mon, 26 Oct 2026 11:27:51 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-6afa651700eso3992014a12.2
 for <buildroot@buildroot.org>; Mon, 26 Oct 2026 04:27:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793014069; x=1793618869;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=UPV4Zh4M/mZniiwtF6t7bCtxBLwqMVrtel0balcZ/XU=;
 b=XOZTSGUhMPfkYCionbrlKHtTzakrBk7j/ya7o9PeqqNA6W25Gn42eXZg0ofkBauQ4s
 4+wRYGy2gPrT9B3zMqOO1bGVReturwPjwLa8UTf3M1mDMBiGw7Ody70X6BqKky5r93Os
 A+NVaMHoEzYZR2HVnpUl1Y5WOjS77KRvt2Jp6NMmgUZ0Q38miRwtHs7O35YBa2PNA4xc
 DuaZnwnBaA3XkNeQwPjvJYomxwVQFutvSKvvkyAsY9u+W2vDvp1BEkDZaoyW/7E8gYo1
 1FspIiypFxMpg48MxBJyUa45AgVZBxzwq5ikKKmrpTmV1MYpo6IrJf9tLqGqe9WIKkq9
 uL6Q==
X-Gm-Message-State: AFq9FYLVhLRLl6EBChAAQU0UAEnGxPtRwE4oDP1MHYKy13u1vQkNQJQH
 BAlAJPMRwQUK60oXYLGX/1lQlRcCC8dmpVl8ufGI2M5LnJVqWzSRRmzI6rARaw==
X-Gm-Gg: AYBFou2hZmeiauClCmRaW9x08vH0Gn9emoHABJaZFVKj9QRiBU5h6IUPq1sJRLvsMnM
 6pJNs6QP3S+umqkuOZ1pyH58p2MqnHqbKnO0WicZeyusRayDZa63fTiJLBeCPfhGx2/actor4KG
 TTn6nv8RwVBjPqPXkBUEEUetGKiPnZlCh++EG/CBR2b3YL12yYqI6yoOVxO6NquvqwKkoW1c2I8
 l5Az5reQ4gwHk+RKB3vU9o1f3La+9qZxRLOhEaS9xd6tVHlpVjmftt+ZHrBeQJi/PLIKa/tudd4
 YwXirx14PN1DWtV+xUNfOfUCqyDJucvOf37yx2gRI+H5M1uwwXRHj7XtdUXlGQXhH495vE8FLNd
 THF8JORfgiNo/Z7xCLINJqdgPr13WDDhtqgs1SDMsZNO+QbZuVAxThZ6OW5iqPzNYoerpYr8zd6
 3oONkwwD++hs+9Cd3RFxGqImFCjWmQcHQdp7FPvSQdixqF1CqIE4NV6d+S4JAYC1MFiGs6yGNfy
 55wqH0EkK2paUEjVIBbpl+/jM13KaM6izbpChTsVJBbro0b9oTW/U+fLycOhHTzduv6mo41jUF+
 IhHGGfusRUAHx6v873WCF4sMJTS2cJ0KeX6g
X-Received: by 2002:a05:6402:2712:b0:6b3:b7bf:9389 with SMTP id
 4fb4d7f45d1cf-6b442fc6c99mr7712174a12.9.1793014069234; 
 Mon, 26 Oct 2026 04:27:49 -0700 (PDT)
Received: from development2.visionsystems.local (mail.visionsystems.de.
 [213.209.99.202]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6b445984d85sm3650785a12.29.2026.10.26.04.27.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Oct 2026 04:27:48 -0700 (PDT)
To: buildroot@buildroot.org
Date: Mon, 26 Oct 2026 12:27:48 +0100
Message-Id: <20261026112748.915897-1-yegorslists@googlemail.com>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/x11r7/xapp_xconsole: bump version to
 1.1.1
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Yegor Yefremov via buildroot <buildroot@buildroot.org>
Reply-To: Yegor Yefremov <yegorslists@googlemail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Release notes:
https://lists.x.org/archives/xorg-announce/2026-April/003689.html

This release fixes the man page formatting and adds an optional meson
build. The autoconf build is still supported, so keep using it.

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/x11r7/xapp_xconsole/xapp_xconsole.hash | 6 +++---
 package/x11r7/xapp_xconsole/xapp_xconsole.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/x11r7/xapp_xconsole/xapp_xconsole.hash b/package/x11r7/xapp_xconsole/xapp_xconsole.hash
index d8181fbe5f..92851f7d4a 100644
--- a/package/x11r7/xapp_xconsole/xapp_xconsole.hash
+++ b/package/x11r7/xapp_xconsole/xapp_xconsole.hash
@@ -1,5 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2024-April/003512.html
-sha256  0c775978cacdda76dfc8b5a97142f145a177d26220dd307866d9dd62e7391189  xconsole-1.1.0.tar.xz
-sha512  1b5b1e1e15e3b988c159e924ac5c51734c4e37ed112815fc6bf6e36f80e840ccd904a4f0b0f27191e0dbf656d367a38873fd493a266887daa111e5266eebf37e  xconsole-1.1.0.tar.xz
+# From https://lists.x.org/archives/xorg-announce/2026-April/003689.html
+sha256  d412abbea2423f2930443c43db1c83d7d0cf2b677419b86ed54aa5d47f072322  xconsole-1.1.1.tar.xz
+sha512  8024ae0dc1bc3512234ee0a2bf66dcc665daa2af67056f680af3e7f330952eb5fa6dab0442a4b4ad54df3d35ef4ec0442e7c0c6cb9fe6d9b70b2038102ae8bef  xconsole-1.1.1.tar.xz
 # Locally computed
 sha256  a29ea5dbcde7ba1695c95949be6303d1ca1de0b7786a38b60f33eccf03506f9d  COPYING
diff --git a/package/x11r7/xapp_xconsole/xapp_xconsole.mk b/package/x11r7/xapp_xconsole/xapp_xconsole.mk
index bd4c43e321..cdebf5accc 100644
--- a/package/x11r7/xapp_xconsole/xapp_xconsole.mk
+++ b/package/x11r7/xapp_xconsole/xapp_xconsole.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XAPP_XCONSOLE_VERSION = 1.1.0
+XAPP_XCONSOLE_VERSION = 1.1.1
 XAPP_XCONSOLE_SOURCE = xconsole-$(XAPP_XCONSOLE_VERSION).tar.xz
 XAPP_XCONSOLE_SITE = https://xorg.freedesktop.org/archive/individual/app
 XAPP_XCONSOLE_LICENSE = MIT
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
