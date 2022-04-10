Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64B77C433F5
	for <buildroot@archiver.kernel.org>; Sun, 10 Apr 2022 13:46:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BDEAA60C25;
	Sun, 10 Apr 2022 13:46:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EQ8z8xr8TQAm; Sun, 10 Apr 2022 13:46:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id DF80060D55;
	Sun, 10 Apr 2022 13:46:17 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E6E561BF86C
 for <buildroot@lists.busybox.net>; Sun, 10 Apr 2022 13:46:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D3F0660BE4
 for <buildroot@lists.busybox.net>; Sun, 10 Apr 2022 13:46:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IgdbQV-7mCz4 for <buildroot@lists.busybox.net>;
 Sun, 10 Apr 2022 13:46:15 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CE205607A4
 for <buildroot@buildroot.org>; Sun, 10 Apr 2022 13:46:14 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 j5-20020a05600c1c0500b0038ea8b53580so2589046wms.1
 for <buildroot@buildroot.org>; Sun, 10 Apr 2022 06:46:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=AWflb9zaNoQH58WON5KHFnn1BQyHInB7Cgat0yhcIVA=;
 b=DTk/sWgFjI0MxMnqUt4ys1y1vB44oKNLwzYo18fRi0vgAPRA3BA+DENNQ4W55KPxzR
 yjNKJO4rpm1Db7FkTV5HDpIR03G56VyihGWruoPpvS6qE9mQl4D8Md4pc/Ih7IK/fKAX
 Rgu+Jz/rSNDfmd1jxf1AxSZDZbu7iHFCpsbxr9/dtQCsv8hRjk0ciAtvRLEnQRg930O3
 fUm536oP9YRKU5Ef3HMm0Pvn7W0QSINDIDCjJYBtOwO4140SJrPEKZP+On9NRZhuF8ZK
 T4UsYi433m+XIej6hyUvbk7yyOnOFK3H6hHiGlxhrtBWXS87a1YV/WG4f8oiHkr/3nwC
 1fwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=AWflb9zaNoQH58WON5KHFnn1BQyHInB7Cgat0yhcIVA=;
 b=oSA6KyKi5JpFsI6UDwhSxXxDdsQNO1vDqMAohq3zbV0gPoByprhfc3TSEBDcihdd0Y
 TrwgaxIqAE0KYYiEnUvaZ50wX5/73SmNWNXJgrJVegv2qe+pyHmWbWtmxBCHcs8udmho
 1sY89MNkQLuiER+PUmthX4TCTK9x8WMdgxe5uerEHkMk1kbN/mSawdKhk/plrOgRdYJh
 91xRiwHpNLTpd7EQOGhBs/QWzghZ6PWZaGrYV3bPcV0gbXEP84bP+coBWokB/rPwthCi
 NS68VixCd/+nAaSc6XHWF9e+mRTCu0p3ZEWeaC8voca98Li8zVV8dNAc5NkqEU5Ej7dh
 GnyA==
X-Gm-Message-State: AOAM532/e5scE2RGNtijRFGKrizXefSrwet72Ypavm9qPbdB1/NhjKA6
 oE5urgZikyZ/vwCZTKG/u+HXyPE2044=
X-Google-Smtp-Source: ABdhPJwabdcpI+S4FHrYC+T6waV1ZdhcmEzjPBUEeXGvauC8lmHGA/L9AY2mJPXVj+tAYlgAn3vFyg==
X-Received: by 2002:a7b:c155:0:b0:38e:b840:c99e with SMTP id
 z21-20020a7bc155000000b0038eb840c99emr2726012wmi.201.1649598372697; 
 Sun, 10 Apr 2022 06:46:12 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 2-20020a056000154200b00203ee1fd1desm25743186wry.64.2022.04.10.06.46.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 10 Apr 2022 06:46:12 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 10 Apr 2022 15:44:15 +0200
Message-Id: <20220410134415.137573-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/tbb: add CPE variables
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
Cc: Francis Laniel <flaniel@linux.microsoft.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

cpe:2.3:a:intel:threading_building_blocks is a valid CPE identifier for
this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Aintel%3Athreading_building_blocks

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/tbb/tbb.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/tbb/tbb.mk b/package/tbb/tbb.mk
index e5929388a2..87e83551fe 100644
--- a/package/tbb/tbb.mk
+++ b/package/tbb/tbb.mk
@@ -9,6 +9,8 @@ TBB_SITE = $(call github,01org,tbb,$(TBB_VERSION))
 TBB_INSTALL_STAGING = YES
 TBB_LICENSE = Apache-2.0
 TBB_LICENSE_FILES = LICENSE
+TBB_CPE_ID_VENDOR = intel
+TBB_CPE_ID_PRODUCT = threading_building_blocks
 
 TBB_SO_VERSION = 2
 TBB_LIBS = libtbb libtbbmalloc libtbbmalloc_proxy
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
