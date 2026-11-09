Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32959606A33F
	for <buildroot@archiver.kernel.org>; Mon,  9 Nov 2026 14:23:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=OZMFzKSf;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256 header.s=a1 header.b=CmsgE/EU
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 07BBE607B9;
	Mon,  9 Nov 2026 14:23:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZXxr8MoDc-I3; Mon,  9 Nov 2026 14:23:39 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 3D5D5607B1
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794234219;
	b=RCcEGZ3IyV302gDScvBmp7qSqaV1qJNeLiJ1pm2sLFBi97gqVpxZtOlpMMyTsrNFNnjF
	 eHBFI3prFx7cQvjTb4YqtdFsy8r0UKwZgPs1syEYC4GW1kTHiXD87q5E9i7kyIuU5M2qb
	 FQC7PYTN/XfdHVvyipGra+K0n10uJN5YzO+eDcdoK8iGEuJpSQOwa5V7gprcyR7jEto2v
	 zm+eHo6dYirUnNW/P7UwTK/b51MZB4Ca/hs6NyWzK1xUAgTWDhKbskr9JDbFSYF0IYwyi
	 w7m7qTmH9syRRtbimlwzXnTwA4xBydq11cH/IVVRzti2F57AYqRnRF5AAWVWnyVxzWg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794234219;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:From:To:Cc:Date:Message-ID:X-Mailer:MIME-Version:
	 X-CMAE-Envelope:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=lbivFY3ur2Un031a25HKkZZlPUQrxdb/xJEjKiZGJFo=;
	b=IiArXo29gwY+i7m4E1t338mqDCthonNEHZTrk9viddyJi5MOJ2KZ5yu21wtKgKLb2LL9
	 yS7FPLxjrFbGZqJkrvePeuEi5tpwas48HN73AqghT0gcFlDBc3+ywJT9M8X+p8mS8HXk1
	 sE8g86y0bdnLO1ABrAkh3vpC4YyiQQF2M8r9kXbYkTtHcGRu6TfeBOWoFqn7XNWwEUgfI
	 p3nthirFkmHEsF99sQfjPH2jwP6pykXRy88tRavLQubjRCH8bF7ZfEPxWnD/8gQty4u8b
	 nkLuDQXSh/Hvz3Wq80wHSd9W+MCgJWh9eI5/FTk4ZKR7hq2ZbgxhVC5uym6cc9/e7Yg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	dmarc=pass header.from=benettiengineering.com;
	dkim=pass header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256 header.s=a1 header.b="CmsgE/EU";
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794234219;
	bh=lbivFY3ur2Un031a25HKkZZlPUQrxdb/xJEjKiZGJFo=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=OZMFzKSfP4B1pZYY4Pty3NHykKMs6MB9Rt/SMXRUwwbxzURV33kDRtpQeGKbBk3wh
	 ldEXDco9Svi58osI3bRtGU+9fRepelELGCkVjoLKEiB3yeY4NxvlDBqUHGiMiVwK0f
	 ZRUQFTyicgUyDrAMRGqUlHIU0xUSVygyv3WAk8H5clJ6mXWonOvl+Vl7/5+kI4DVsM
	 sEZwynVfRa6wZ/+77aqenaZFKzTxnuMnLu8Yfph09eDyuKfoJatxSNvrQHU4uIxu5p
	 Ivn/fzUeBfxVlZVWSt9KtFhLqdCZGVeWf+p5mud+nNiP/WXSh2WafjCKv2sNx5tpiH
	 zmYVjhEWp8wxg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3D5D5607B1;
	Mon,  9 Nov 2026 14:23:39 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 74E20111
 for <buildroot@buildroot.org>; Mon,  9 Nov 2026 14:23:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5AB31607B1
 for <buildroot@buildroot.org>; Mon,  9 Nov 2026 14:23:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id E8Ip_8htwZe7 for <buildroot@buildroot.org>;
 Mon,  9 Nov 2026 14:23:35 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 0091C605FA
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip=62.149.158.147
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.158.147;
 helo=smtpweb147.aruba.it; envelope-from=giulio.benetti@benettiengineering.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
Authentication-Results: smtp3.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=CmsgE/EU
Received: from smtpweb147.aruba.it (smtpweb147.aruba.it [62.149.158.147])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0091C605FA
 for <buildroot@buildroot.org>; Mon,  9 Nov 2026 14:23:33 +0000 (UTC)
Received: from localhost.localdomain ([151.95.84.63])
 by Aruba SMTP with ESMTPSA
 id QQHTxugV1yeI3QQHTxNLL1; Mon, 09 Nov 2026 15:23:31 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1794234211; bh=3S+VaRkYPsU8YEWKWRDWneoxABI35FY4jypURjR3AWw=;
 h=From:To:Subject:Date:MIME-Version;
 b=CmsgE/EUozlxG5joj57g/LxmFYwyr/re4oKxvTkcwiavxPO2ayugXUeFIanDP0Enc
 sMYVdG13cFA1sLuAWHLk7J6uYaAOJQ3YqSYBWfJQaUG0v5ZrdbISpnqpoJyjsjC7UH
 hXlPjcDqGjOZzrJu1PNEI7iwDOL9aTUDy1Q9gDKuGYLI7f+WnEgKOBK3RlveSUk9Qo
 KGK24ZgLQoh/53sG2z3yXswOuaZkQJ7T/q3PMbktRiuzAfx+Wp73eldmjs0t+1pM6y
 gGvbE5ad7L6pmUHJ8QFHjP3uwEA325yX+0w87LGTTz+kmQYT+hYEPzPm0tEUYwCPBm
 oWShkjucyI4ng==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Mon,  9 Nov 2026 15:23:30 +0100
Message-ID: <20261109142330.2279770-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfDu6agJqOqDlIW9l2+sJjs4juN7IcKcBHJAbtk8OBlS77ieV4rE9h3RBDfFKzX0UOCFXFrmfzhR8SWrGJjCKQdBKyQGkxNI1m5yUYJgrNWu4QNkatsT7
 sS2ty+xNVwsYLvUqDfLzGIHeh6mlxnbiRxgrQbAH5d87S5kJbZeHkUXxWbD+B8Ldp/z1aYSSHjtB39YH0B5lewlnx4iLQ3v/+UIE1S5ggympPq3TssPnqtNa
 wiadXISoIcFTSnm20xnYAaVcrUHcpjBPOB7Hj8Peva8=
Subject: [Buildroot] [PATCH] package/rtl8723bu: bump to 2026-11-09 version
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This commit allows to build driver up to Linux version 7.3.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/rtl8723bu/rtl8723bu.hash | 2 +-
 package/rtl8723bu/rtl8723bu.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/rtl8723bu/rtl8723bu.hash b/package/rtl8723bu/rtl8723bu.hash
index 4b2b71ddb2..b116fe133b 100644
--- a/package/rtl8723bu/rtl8723bu.hash
+++ b/package/rtl8723bu/rtl8723bu.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256  eaebe07d38931408c8f5dedb3a8c61e251862e0b8859b899d193f9d5cb77d748  rtl8723bu-8292ef94965fb61d3052ff2bf068fcd830e665c1.tar.gz
+sha256  b57169715cc75e5807ec780c45df741f329d8513f1163e190740113e8b429b6e  rtl8723bu-82af2b05a11e3214898828db39e53cce1e85fcd9.tar.gz
diff --git a/package/rtl8723bu/rtl8723bu.mk b/package/rtl8723bu/rtl8723bu.mk
index 4175d02d52..b0ce518c48 100644
--- a/package/rtl8723bu/rtl8723bu.mk
+++ b/package/rtl8723bu/rtl8723bu.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RTL8723BU_VERSION = 8292ef94965fb61d3052ff2bf068fcd830e665c1
+RTL8723BU_VERSION = 82af2b05a11e3214898828db39e53cce1e85fcd9
 RTL8723BU_SITE = $(call github,benetti-engineering,rtl8723bu,$(RTL8723BU_VERSION))
 RTL8723BU_LICENSE = GPL-2.0, proprietary (*.bin firmware blobs)
 
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
