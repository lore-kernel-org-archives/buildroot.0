Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA4F8C3ABD8
	for <buildroot@archiver.kernel.org>; Fri, 16 May 2025 15:38:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6845D83C4C;
	Fri, 16 May 2025 15:38:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bk0U1xBHuh6R; Fri, 16 May 2025 15:38:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A4FBF83C52
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A4FBF83C52;
	Fri, 16 May 2025 15:38:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 9D0A0185
 for <buildroot@buildroot.org>; Fri, 16 May 2025 15:38:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9994983C4C
 for <buildroot@buildroot.org>; Fri, 16 May 2025 15:38:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QQ24c5Wr5ESV for <buildroot@buildroot.org>;
 Fri, 16 May 2025 15:38:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=114.111.35.26;
 helo=cvsmtppost05.nm.naver.com; envelope-from=dungeonlords789@naver.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 3E28D83C49
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3E28D83C49
Received: from cvsmtppost05.nm.naver.com (cvsmtppost05.nm.naver.com
 [114.111.35.26])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3E28D83C49
 for <buildroot@buildroot.org>; Fri, 16 May 2025 15:38:08 +0000 (UTC)
X-Originating-IP: 125.132.232.68
Received: from cvsendbo015.nm ([10.112.22.33])
 by cvsmtppost05.nm.naver.com with ESMTP id e1koOFRlSE6B40Y9wZ9O7Q
 for <buildroot@buildroot.org>; Fri, 16 May 2025 15:38:07 -0000
X-Session-ID: XhiKGxGMQtG7PGeWMp1oGw
X-Originating-IP: 125.132.232.68
X-Works-Send-Opt: k/YdjAJYjHmlKxu/FoJYKxgXKBwkx0eFjAJYKg==
X-Works-Smtp-Source: e9bXKqbdFqJZ+HmraAtX+6E=
Received: from Linux.. ([125.132.232.68])
 by cvnsmtp001.nm.naver.com with ESMTP id XhiKGxGMQtG7PGeWMp1oGw
 for <multiple recipients>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Fri, 16 May 2025 15:38:06 -0000
From: Cherniaev Andrei <dungeonlords789@naver.com>
To: buildroot@buildroot.org,
	peter@korsgaard.com
Cc: Cherniaev Andrei <dungeonlords789@naver.com>,
 Bernd Kuhls <bernd@kuhls.net>, Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Sat, 17 May 2025 00:37:59 +0900
Message-ID: <20250516153801.354271-1-dungeonlords789@naver.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=naver.com; s=s20171208; 
 t=1747409887; bh=yTANyD8MFkucBRxmUFGagdKGrn+ih1kC2JDEmXa0KEk=;
 h=From:To:Subject:Date:Message-ID:From:Subject:Feedback-ID:
 X-Works-Security;
 b=HLg9d99R9gJfLX98Iivoyh2oTUOhULUw87fbR+jxB0x7ntDax3JNFlYwi93LmkpWb
 JLWgNE2/DBjowAxOr8bYADKX53QAGqZte/pDShuxB+NqYmh9U8RXu0xuRMm+F4293w
 CuirX8yoP9FRy6yCATJv11g9iqisQ7ET5qXNbiGXVwkLNi9v0Ex3jWqHuZhkxW+9qQ
 pGND0omiTqTK1EMCCyfKKE2gI3ktSlq1X7Ieyuukkksq7ZIwVp7Xr2zXUlmmxT2Jxm
 b63to1CN+4EqekvqgsUL8JkZIKMC/rJk2lQu6rhdFbW2zl+nqfdynlMvdyR7rb8lE4
 RxwmXQTGYoaxw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=naver.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=naver.com header.i=@naver.com header.a=rsa-sha256
 header.s=s20171208 header.b=HLg9d99R
Subject: [Buildroot] [PATCH] package/libopenh264: switch to meson
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Modern build system meson was added to openh264 because of many reasons, details https://github.com/cisco/openh264/pull/2955 buildroot should prefer modern build system.

Signed-off-by: Cherniaev Andrei <dungeonlords789@naver.com>
---
 package/libopenh264/libopenh264.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libopenh264/libopenh264.mk b/package/libopenh264/libopenh264.mk
index 9ae996fee1..87bd537fe7 100644
--- a/package/libopenh264/libopenh264.mk
+++ b/package/libopenh264/libopenh264.mk
@@ -55,4 +55,4 @@ define LIBOPENH264_INSTALL_TARGET_CMDS
 		DESTDIR=$(TARGET_DIR) PREFIX=/usr install
 endef
 
-$(eval $(generic-package))
+$(eval $(meson-package))
-- 
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
