Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF07DC88E56
	for <buildroot@archiver.kernel.org>; Sun, 13 Sep 2026 12:07:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7C4AD60624;
	Sun, 13 Sep 2026 12:07:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WAbBSI8_xHQn; Sun, 13 Sep 2026 12:07:39 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 1326C60614
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789301259;
	b=mLyOJDo4P6PI7ZoIW7L0idiPTDrUFpFf3GQpm2qIWKgoeAJXBqQKUMc7KtI+bRgZyzr8
	 V4PpWsnMybdpjgIftvxCBgiwSLkoPOza7zyc3LE3PrXoVc6nZzjZkfUq9aX5Ac4bd3R8K
	 dWrcKmEw9vcbYNVwx0yUzaD2APEuONiCxQWbD3AXxgx7Qff0PCUMBkXC/oepjIgxL8vn1
	 +mpoZ5fDcOtoVrOJZceeW9C/pPWDVM0s8bioBk72qm0ivvoKxEqvXuE5smumyozPZ5Uv3
	 vR9FeHo9hEfrQDhVSrlFNNUGaLNVJxO/VfYRJvS8cYap9gDe4tLr/dnDOoYVkMvQ8RA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789301259;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:To:Cc:Date:Message-ID:X-Mailer:MIME-Version:
	 X-Last-TLS-Session-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Type:Content-Transfer-Encoding:
	 Errors-To:Sender;
	bh=znY9w2vbSJwONQN+fPB9a6s1Am7Qnd+YbfvCY5eDUf0=;
	b=gAGhiaFSHMEWrbhbzs7VBKSf/PysbP7osqLrudio70zUjvcZeASh5fI7AtNFjBltnMzs
	 NpIX46hB61wfxdB7+7L8gng9I9t6q7S+hm2ETFgMqyruueOdekGmKOkwViW/HnrJH+zwf
	 lpPMa0WnLFK1G3XFLnNnMGforcW+sTpVSReEhJaIeLzq6O03WJ0TpKrVsHwjr5h6b1olg
	 f7OOGCjPUQ6HlAR8Ok49Df4M9nCuyXTF/gU2+KSQ98zX18rMRVe02klfttQpugSVI0955
	 I95Ig+kdNquDtQOMYp+Vf3+ijXO2ig5xW/L0KTp8hi0bupvonXtX4L+xDIdV98Zxzww==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789301259;
	bh=znY9w2vbSJwONQN+fPB9a6s1Am7Qnd+YbfvCY5eDUf0=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=kMe6/f2fdyVNMZIhRgNnOexLGFrX52XWnuwvLmRg48S0ZEALv0A9ld/DwQb2rLeq7
	 +9kmY4MPkk9/94sTd5gDMQ1yvVhs77uGGBEbOCbT5RlyPVfHoIx//jGksQ4TXC/Oi5
	 HQzED3/krg0ls1WNoFG+Jr2nznnP6y0dw+H7GtkafdUcMLFkD3VSezEanWpkMuDj3+
	 BwGndnwgz2XUKaJun8e7zsNFyXXWIpQZp3d7vGEeZyc5GoKcC8UEN3aVPrzjF3pnw1
	 ELkBTbBUI9mnSwydYo5mSY89ZKUmEIi2HKxmqjdWw8yZHYEOoUPgzDLeC3e9GLggU0
	 OcOXbWrUWRKag==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1326C60614;
	Sun, 13 Sep 2026 12:07:39 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id AD1102D0
 for <buildroot@buildroot.org>; Sun, 13 Sep 2026 12:07:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9F087400AB
 for <buildroot@buildroot.org>; Sun, 13 Sep 2026 12:07:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TxtoSMUMsMcx for <buildroot@buildroot.org>;
 Sun, 13 Sep 2026 12:07:36 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 3BD6A40022
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789301256;
 b=bx3wCudcPkafuSgxGWUyIr9FD8gtQ1CHQCK0reDjli0pgu1ladrDlJQDp/6b1JnsnUGK
 XlUu1NvuStSsX6TTt9n3BHFiWfMCuA7jHd3PC7tj/vI99m1AbjlvfX4rzLMn8jVQ3sBeZ
 oL+EGfWauuo2WS/uONAtQ3qgTnepjl43QnVkBynWwQcsNwf5qVAq+u8Uiq22X6Mb4CT0a
 rESZZkVrtRsdkCEmsbLqB/oFFffxRN1VvImBEyGh4LT+tw8p8+gQv2dTXJowIq+I5/1wE
 /bQymCsYdzva2M1AzAtURKZXo9+8iwDDNxenHGaVlweZD58iiaKWPOqFLamedr/7TsA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789301256;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:MIME-Version:
 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
 bh=DMMnQyTtd9Bdo1MbkVLB7AlA6OOiRRmgAaFcJz0sOKg=;
 b=a2kXba560J4TvM7d+qSd50XKqIQYNWcMgqE8Ki5+WZHqpUKeEfrUPLcQlxNQWPkBXek3
 4PYDPn0K+qOXXsDYRAOye+oeczviiKIr/4m4Wakymv6DielfrWt+DbAbGE+YW3pRMNzfM
 /tpi9IBn0h30Tsx2LalbvCSfoyI6k19TthmCjP2pzwpc/DIvSjVUfmY0nQZXrF/7abn57
 jwUUON4lYmK+zGshcMSjCNE/ukTRSrqMSndqchzB2lEmVslM4Q8HYtM8G7uTN9aSDGzAC
 ZGkqAfBhnQGPv6U5b0bv0iq9aeG7vcBDWfM6m27IDNIWIT/QWaDymSNvhF+9Iecb9jg==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=GTo4Fpzl; 
 arc=none smtp.remote-ip=185.171.202.116
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3BD6A40022
 for <buildroot@buildroot.org>; Sun, 13 Sep 2026 12:07:35 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id C435CC63451
 for <buildroot@buildroot.org>; Sun, 13 Sep 2026 12:08:14 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 053D460435;
 Sun, 13 Sep 2026 12:07:32 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 9238B11C78D5A; 
 Sun, 13 Sep 2026 14:07:30 +0200 (CEST)
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Bernd Kuhls <bernd@kuhls.net>
Date: Sun, 13 Sep 2026 14:07:28 +0200
Message-ID: <20260913120729.1647806-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
Subject: [Buildroot] [PATCH] package/kodi: propagate mariadb dependencies to
 BR2_PACKAGE_KODI_MYSQL
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Even though kodi itself has architecture dependencies (expressed
through BR2_PACKAGE_KODI_ARCH_SUPPORTS, the option
BR2_PACKAGE_KODI_MYSQL selects BR2_PACKAGE_MARIADB, which has its own
architecture dependencies as well. Make sure to propagate those to
BR2_PACKAGE_KODI_MYSQL, which doesn't require adding a Config.in
comment as these are purely architecture dependencies.

We haven't replicate all dependencies of BR2_PACKAGE_MARIADB because
all the others are covered by the top-level BR2_PACKAGE_KODI, and
propagating them would require adding a Config.in comment for
BR2_PACKAGE_KODI_MYSQL.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
We don't have a super clear/strong policy on whether dependencies need
to be replicated to a sub-option when the package top-level option
already has them. I haven't done so in this case, but if people feel
like it should be done, I'll be happy to send an updated patch.
---
 package/kodi/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index 08a7caae2c..0b13136d82 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -202,6 +202,7 @@ comment "nfs support needs a toolchain w/ threads support"
 
 config BR2_PACKAGE_KODI_MYSQL
 	bool "mysql"
+	depends on BR2_TOOLCHAIN_HAS_ATOMIC || BR2_TOOLCHAIN_HAS_SYNC_8 # mariadb
 	select BR2_PACKAGE_MARIADB
 	help
 	  Enable MySQL support
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
