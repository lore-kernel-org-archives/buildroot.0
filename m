Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98DAA606A31C
	for <buildroot@archiver.kernel.org>; Mon,  9 Nov 2026 07:55:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=PZpjVgIG;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=suNfPA+Q
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 38EAF406A2;
	Mon,  9 Nov 2026 07:55:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bIV3Wa3VLbA0; Mon,  9 Nov 2026 07:55:55 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 5EF4B40695
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794210955;
	b=CnzoZo7urAQNMY4C7qGjoi5kg1ms2QlN8evqlTua/04M/CJnqAIhtuhHOJIwl6vKNbW/
	 ARX3uC6Yovyy1AZ6baaauhbPJpVkHGqwDIjhx+aekFFiiiB09pD60kg6KzBXpbpE0tKPi
	 TaMfEaSV+dwwUsURGDd6OZiKEKrFR9TYv5YbRTvJsjRXLWXdBtvt5OsXmp2zLa4P6f2+O
	 B5SQCAeuoQo7fdFVXk5Z2lQikzohQIKcjpTv5O4g3bRhTM5Wr4pHP41QQf+0Z5NO02A0/
	 UwkX7IceyiVgrhXIAF+FbzNzAEP74Fi5SHI2kZPbBENrnL8DaNGEBeH722CrVTl030A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794210955;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=WAykfVOuHEIH/yAmCPOYwixwMbOkhZvsxnQ6mlUJ1fg=;
	b=osyNUxWqJp/pA02EjHPkYYm8Ub0TpIwQ4ly8Rc5Qw2IVxU5AEIr8SUM/gT9RWu1pWFfM
	 5tlA2CAegGCa6vSd7YjJCWcr8vtYMNraKmX+BCNOBJBQrDZxm4gdMx3eNoEUDfvBS2T/E
	 gZDuzsxebERVd6n1VF9lKszQw+xYVDyELr+yneSWHGSJBzm42NFJpc6vnA9rXHaexAeo8
	 9ehn5646F0XAtfjbyzupuWq5LUzDIz5WVsTBbuhftSHPuBMJ0QS1Z81g/5CInNKMAZ3YE
	 +H+l4Ge019WkRX5MpX5MdZblhrujPxmb0GiCaJ7HhcbUN2zSdrJ18PHvuqRNdSt8+2Q==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794210955;
	bh=WAykfVOuHEIH/yAmCPOYwixwMbOkhZvsxnQ6mlUJ1fg=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=PZpjVgIGxURnAjKqu9wueYn6x2uex6mlup7vS+tMX8ZT54BQ+oTEyilvO34IbryMh
	 F6XcD3VSJtjAZKArfabYjghAm3hzZP66Xq5eixS0aGLn5q4h8yOnCFOym2/ChH8081
	 NJndb9V6B70J7o90TRBhn616OKXsGJEohSQ8V/DkbEYBXmkaRVZ0S9f4OLOVSqzKnp
	 7onbsv9C0q5CBEXOKm28E02pRmjACW7W3DPbjVV+On6J3xbD6vIQBWs+OxH5H2r35F
	 1+DHTkz9du6WXdgVeIrst/08+0dc57yK6m/M0lCLGsybRRFuuZO5gDD9muFdiHVA5V
	 jYbzShHqhy7Sw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5EF4B40695;
	Mon,  9 Nov 2026 07:55:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 4ECD9111
 for <buildroot@buildroot.org>; Mon,  9 Nov 2026 07:55:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 407FB80F45
 for <buildroot@buildroot.org>; Mon,  9 Nov 2026 07:55:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ahgbs4fCSMQL for <buildroot@buildroot.org>;
 Mon,  9 Nov 2026 07:55:53 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 263BA80F3D
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::429"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::429; helo=mail-wr1-x429.google.com;
 envelope-from=shirokovalexs@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp1.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20260707 header.b=suNfPA+Q
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 263BA80F3D
 for <buildroot@buildroot.org>; Mon,  9 Nov 2026 07:55:52 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-490585eddfcso441001f8f.0
 for <buildroot@buildroot.org>; Sun, 08 Nov 2026 23:55:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1794210950; x=1794815750; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=u1UiDRYtmcA61BbfItXMw/B8Sb6vMaynk9U8Ip292zg=;
 b=suNfPA+QYILTrlY+Y+2GeaBMFALBr2xOnJxgSHF4Hascs8dwtin+Vn/LShFBi3ZVGg
 9XliVUNo6F+Q1cmwz5vb25WhEeRm2B+WXjwbyzJQzxPfG8bHGDB+zaqEOLp+HsqtMsSD
 VjhYbA5to6UA4VcGCzOpSKUKhmW4lZsNQkQo8D+pMKF1w+UO4KvuhuDZ3rq/NiVldT5B
 +t7/8tR0pnKztz7TUAuXRRAVmHC90T+yE3FV5j/ZcV1UHad+6GBxhyd1PP1SOsECfz2A
 A1owudKaC6Y9SQoIjhLgMCBrR4A0fZNVBkgpXJwOOpQtdW9/hwaveMG2RmJRWrp0Q7Q7
 EunA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794210950; x=1794815750;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=u1UiDRYtmcA61BbfItXMw/B8Sb6vMaynk9U8Ip292zg=;
 b=bVMZ1QOm/YKe7ARU/38W/fv38iTvMVxfJkO8CGh/l0ZLn2f6b0G1gJ7UT2yoM6x170
 sBWx7SQPuf2a+agmeX2waBxo8CSXEbvuszJ3bvERCC3pfWNeXlO41I/L0jMHrL/yJ/TW
 sspiWfQgA0a9lQP9ABlgRyoZk3lKAqMJKn8gTpd9F5s+YDjIhmLjPHJ6QjG06z56QSZ1
 V0spmGEp3t407CtpOHANFf75eUbwHmTBVXbt6X6QtYlQRWJAwjwHTekolMvyx2HihCt6
 JzWUGx0BGSkRaDmNrdKR/UYNKd58vEKc4SwRFRWgmSxC7FDcnWcvrX2amjeo9yj6pupC
 GPDg==
X-Gm-Message-State: APuU4Z+cREEPUeSukyS2ObmCZ+wTTXD2zc48cwo3Is092qo3YIQjg3so
 CyRKYLI9CXwHVbEoLMjkh1gwvdrhjlgDd6Y16vo4di1IRlpbSyWntVk17Nbz
X-Gm-Gg: AYBFou3yxAXu3Xdgizyj6NZOSccPhMlPIxwL3j0P94j5BuHoUfEd3AwB97YEfVIOtg7
 ET/zeIWyZSSxbEUlbfOjc322Yb95NGEZEhiP7AV/7uXQvDK7y6VrK/wmhnknQ1BWM9qid4QSyYh
 e6YIi9dqO+3am4U6BQSxDcT0R5TJOiuwOHNDII7BBWbq9xh5KT53FlwqkTFURGRC68tXXlxtXVA
 jlIh8QZiWaNFslOg0yTh/pbfbujfiBcTkg7CqmIX+qcIFr2XULyKoqp08pByKT1+Kaf5tfx4Bvn
 ML9Bz9yY6QO89k09waHZXH9rXwKCaGRU+37UBkEdPZ6FJGmOKmR1hNMlWkn3n134FOYLqr5DuVb
 jDc9rFyms7kFigiZfRbZZl/r7xeAqojIaEPm+2UTHatygZWbhFMGc1o5o09yO/erW/3OIivkIuY
 BH9QQJCyqJWYxw+ZekAJLUqAZmTHhj2vv5L5NvL/BSm5oWOSE+ZTkzLUxEYRdWJs/+EOy7/4ikJ
 u/U8pPGOhpatWCj9nISk9/McVakGHQvkkaawLGbBnmtyQLa1UVpOdjeLZeGeceExXGzbH2EUdTS
 l182Mq1m+mTwguTfk8qUnArmTcWlBThltHxN1DIfyLgWEC3QFvk=
X-Received: by 2002:a05:6000:4a07:b0:48e:5d33:da5c with SMTP id
 ffacd0b85a97d-495877ba012mr6017608f8f.1.1794210950278; 
 Sun, 08 Nov 2026 23:55:50 -0800 (PST)
Received: from devhost1 (77-236-0-65.static.play.pl. [77.236.0.65])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-49592f398afsm7894394f8f.5.2026.11.08.23.55.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Nov 2026 23:55:49 -0800 (PST)
From: Alexander Shirokov <shirokovalexs@gmail.com>
To: buildroot@buildroot.org
Cc: Alexander Shirokov <shirokovalexs@gmail.com>
Date: Mon,  9 Nov 2026 08:55:41 +0100
Message-ID: <20261109075547.418921-1-shirokovalexs@gmail.com>
X-Mailer: git-send-email 2.56.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/broot: bump to version 1.62.0
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Changelog: https://github.com/Canop/broot/blob/v1.62.0/CHANGELOG.md

Signed-off-by: Alexander Shirokov <shirokovalexs@gmail.com>
---
 package/broot/broot.hash | 2 +-
 package/broot/broot.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/broot/broot.hash b/package/broot/broot.hash
index 1f45965fd5..bfe724c3c1 100644
--- a/package/broot/broot.hash
+++ b/package/broot/broot.hash
@@ -1,3 +1,3 @@
 # Locally generated
-sha256  6daf2a7381fdbce5acc08261c2899304b4a1efa7c33623e456b8c45853cdb7a0  broot-1.60.1-cargo6.tar.gz
+sha256  053931463684c7f5b912c1b55b1bf49dbb325dd4cc45c5995b45ff476da41381  broot-1.62.0-cargo6.tar.gz
 sha256  89461664ce2aee7d80ea8fba7118fe7abd490d76ba435cf1d81d3128e060711f  LICENSE
diff --git a/package/broot/broot.mk b/package/broot/broot.mk
index 1467f55279..c979c2de51 100644
--- a/package/broot/broot.mk
+++ b/package/broot/broot.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BROOT_VERSION = 1.60.1
+BROOT_VERSION = 1.62.0
 BROOT_SITE = $(call github,Canop,broot,v$(BROOT_VERSION))
 BROOT_LICENSE = MIT
 BROOT_LICENSE_FILES = LICENSE
-- 
2.56.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
