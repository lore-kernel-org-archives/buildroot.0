Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E64E2C624D3
	for <buildroot@archiver.kernel.org>; Fri,  4 Sep 2026 11:23:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CF74260BBE;
	Fri,  4 Sep 2026 11:23:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KzFsoYXG_wb0; Fri,  4 Sep 2026 11:23:30 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 60E39607FF
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788521010;
	b=OCZ8E3CaKQQoUfw58hmRP060LHCln0KpBP01anmAuQu6xrwB12VJcvsJRyrl+8+IDkyJ
	 zQdTuBldgWEGK29GzZh3bzY0ZDLLK6+Obt6/St92oaOVoIXB1NuAcxAUAxSEfVoVOityi
	 EmUf4KrZnKQvc5szcQKBUtC9QK9VvhmuDWVwlVgENKTLv49/Oy29PV2XIvo5A//jBZiLw
	 WJyWontBSfQruLG0gv7ZnLIc0WNx+sYnCL655im6h8G1FKMnKDBhFyLdyGnSauPs02Wde
	 BLqGHNJFuvk1YtJeB28lBAgbEzYBKAibQu2TatXXqR3LCO45Sq4MLZxskyasDl97LYA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788521010;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:To:
	 Date:Message-ID:X-Mailer:MIME-Version:X-Last-TLS-Session-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Cc:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=A4QJ6XX/UoymIOLqIauQevpoCyBqjXfVPZE2j4JjOs8=;
	b=PtIoSqR1kauha/dof+QnPZqiOQ7qbApLxzyxKJ1R8vyjMomLTQ+tIr615eewXnsXAzSp
	 0U3MBb+7XMjs8QQbxnO8JGzwE8CTzRSOJpwLB0E+y4FYyZhBYcVfue8gvyH44iH3uebVx
	 GgLC7Xt5F2FYgjV8+rhhSHqgSHAM8j7Kr3mzYITTQ3smO0O3DfaS7+pyRHZ7dBBbbLE9v
	 q7f49E7au8TdvicJeRieZUrPMcIS17KByGoH4e6iXCZtl5764fogReycUiSSqH08pfGNb
	 6qCD7AOuKA08Hez0ABZ2GsrvgXDAQrhAaIU+scgVL4vaXZyBxLvVwqCJur6/APEcF2w==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788521010;
	bh=A4QJ6XX/UoymIOLqIauQevpoCyBqjXfVPZE2j4JjOs8=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:Cc:From;
	b=sK9fC2TitKHnA4exKZ2g3G1ubCbLEAxWXdF9o60Iwsy+SIf975ZlbbllPq+tdUkXm
	 hnV/kTBrkq7z6SlWlQGkeL0v9EqW8uhhpewIwx2+DtNOtVt0Q5nVaC2+RTREyOew8I
	 h6x+GNE7KV4C+YJxJcZqghOhfppAUiZRSj4n3dXPXdBxVBKyNMUE3ukpj0Li4zKaKd
	 8qKmQFn/6+POd+jKp09QmCKNeFye/9MW5Z/ZVUIo7dNUhQFNWIr1yRQmuRdWlfwWjd
	 u9KIKtl0RCBfsV6bol8Hcf2yjxUXEC3zZ5dLYtvtEx8Lw1PQiTL1lNQJjkiEu8xm/W
	 K/A5VE/dh15lg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 60E39607FF;
	Fri,  4 Sep 2026 11:23:30 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 9F98F118
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 11:23:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 859094031A
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 11:23:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KUlDWZ6aPoB9 for <buildroot@buildroot.org>;
 Fri,  4 Sep 2026 11:23:27 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 1EBDF40080
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788521007;
 b=cAT1GxKMXsGPbAxO4S7NrIKXSowm9tCieec2YlYpiQ+uTp3Wr32oaksW6HZorFVjNO00
 HYxqPJORrWdJdJ5MXtw4/cViMB+Jl2yFuoqpFJRmLURGrCmIEN/a0s1fZpLrG9qMHQYp3
 C2Srl3B20C5VmfFBbpEOGYKDi5vtkySwoBjRIDwymsyyKLLiI5cCQ52nxYCK5nerEO6rI
 3NIgre8LzUOLM7/Qnb59W5pOsP2zt92mkaxGatVJVppVOS0ToUC/9xbN0hJcGLK/lVT8e
 2Rduj9WV661pIdNdVgLoztA+jyEv+Q8oUd+exdGmh5GMr1VvmqWbRniTDYXB/uiiWnw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788521007;
 h=Received-SPF:Received:DKIM-Signature:From:To:Cc:Subject:Date:
 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
 X-Last-TLS-Session-Version;
 bh=KtK7VmQd9bGUUrvCsl4Y8odS4iNzdBaykPfLbwcvDmo=;
 b=RjRHra8VyCZOPUITJalMIB6q0ElQvXX7/zL0TdjBjDMyh6rKDfmZS4BhhC5nglBFc5H+
 lYFSn06ujJchi+FXCL2K7VZJ4gBNlwGI4UVcpGfxVOdxDHtlUHgHjBT4EX0clsKTv/JM3
 uwcPpe8N2mlQBIkguPfrtrce+l+WIV9WU5MDg1vE71/7ZRrrI0is1CufDnhQUQHkzLBMc
 RTlE03zp7/SqRKttgr9nDCwDcDWWIbRxzM0YqZbu0n/+8POBQXkTbTsqYGTb7doFBI3AV
 voV/WILjFLVpUId5be9ydGr6xIg9vtXSb1OhbN+QJG3BiyiZ7+SNdivkKutqsGGr6Yw==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=heine.tech; 
 dkim=pass header.d=heine.tech header.i=@heine.tech header.a=rsa-sha256
 header.s=dkim header.b=daftWDWU; 
 arc=none smtp.remote-ip="2a01:4f8:1c0c:5073::1"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:4f8:1c0c:5073::1; helo=mail.heine.tech;
 envelope-from=buildroot@heine.tech; receiver=<UNKNOWN> 
Received: from mail.heine.tech (mail.heine.tech [IPv6:2a01:4f8:1c0c:5073::1])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1EBDF40080
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 11:23:26 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 51DCB1814BC; Fri, 04 Sep 2026 13:23:23 +0200 (CEST)
To: buildroot@buildroot.org
Date: Fri,  4 Sep 2026 13:23:09 +0200
Message-ID: <20260904112311.582007-2-buildroot@heine.tech>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
Subject: [Buildroot] [PATCH] package/gtest: bump to version 1.18.0
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
From: Michael Nosthoff via buildroot <buildroot@buildroot.org>
Reply-To: Michael Nosthoff <buildroot@heine.tech>
Cc: Stephan Hoffmann <sho@relinux.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

changelog:
https://github.com/google/googletest/releases/tag/v1.18.0

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
---
 package/gtest/gtest.hash | 2 +-
 package/gtest/gtest.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/gtest/gtest.hash b/package/gtest/gtest.hash
index 95cd4adc85..3c5c0618a7 100644
--- a/package/gtest/gtest.hash
+++ b/package/gtest/gtest.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  65fab701d9829d38cb77c14acdc431d2108bfdbf8979e40eb8ae567edf10b27c  gtest-1.17.0.tar.gz
+sha256  6e3191c1455468b3fc35a417fb565c1c5071aee1b7e7f85e30cf48a98d37d8b5  gtest-1.18.0.tar.gz
 sha256  9702de7e4117a8e2b20dafab11ffda58c198aede066406496bef670d40a22138  LICENSE
diff --git a/package/gtest/gtest.mk b/package/gtest/gtest.mk
index 1eab9371a1..ba17785288 100644
--- a/package/gtest/gtest.mk
+++ b/package/gtest/gtest.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GTEST_VERSION = 1.17.0
+GTEST_VERSION = 1.18.0
 GTEST_SITE = $(call github,google,googletest,v$(GTEST_VERSION))
 GTEST_INSTALL_STAGING = YES
 GTEST_INSTALL_TARGET = NO
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
