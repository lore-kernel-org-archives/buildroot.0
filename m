Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B710A606A31C
	for <buildroot@archiver.kernel.org>; Tue, 17 Nov 2026 22:12:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=P+2jJ+AQ
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B64EC6083F;
	Tue, 17 Nov 2026 22:12:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9za2WSxetjzN; Tue, 17 Nov 2026 22:12:14 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org A1CCB60730
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794953534;
	b=UNQ2Eu2HTWOQ1j2ER7/pZ1C5OCSaWKD22sI7Mnc7Jr1xLYKngMuLXbxKZfFq890itO8z
	 EclPqq8Qq/BzAfQaBx+VIkwInfZa4iizDf5sStM6/VZiryePCIfVndK/vj96/dso7QcYm
	 tH15y+dyQBv5NROX8nAQ2c3dx1mFAGgzzx3AsNjO2IyJwqxP1L5ij6NfNrnEN9FG8JWzx
	 58hCfjlYRPPwv8DYdm3H+dHs2f2QiwTeoM+WP0mrOZou09INUwVWy51ghSpNbMtZrHn4c
	 S1jwj5XbC8nKhGm1wBo+iBWiiBVU+kKZy5OOlBZa4bDrdZV631K5KWCJH33jfU19XXg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794953534;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Date:Message-Id:X-Mailer:MIME-Version:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=Jb7WU5a8x19VGDU1Hz8W1x05UUKOzbQ2m9/Z4yPf2mo=;
	b=eCrICAYs2O2u9za8h68uP1gv1+VJluW+FJz/YwO5+SOEApdI5Y36U3BuQrKgy5SP6Xh3
	 bsN85BP5Jn6X+tyGOSQcMj/QmT50/LsgXtUWCc7HRJOAH2OTqe8CR8irhL/mk9vmH7a9X
	 LAFiUwsU6rDrHh0FJWhtk/NI8kR7c7y+7iejcr/sbti41vqB/l3w/Sv0LwKjVvAbSRtNZ
	 aHWqHrGE93NzuXPh1RFLH6MsnOVavf3mjssv25uMs/zX6yDryRdc/re3t1fdqC+gbH7fO
	 aRc5ecayAPPcASH3bbM//maaVQFHarYMYWNIX7kCUcuwsacSrkbNfEW8ClkyduTYjZQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794953534;
	bh=Jb7WU5a8x19VGDU1Hz8W1x05UUKOzbQ2m9/Z4yPf2mo=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:Cc:From;
	b=P+2jJ+AQwe4U9rywgUbvtDTHqiFdeI2+1vsjsVDQ0FCN64VY5p9fil8z6aVjVg5Wy
	 oCAIa0S36ELyirhIkl0+e/SAqKuEkPVfqSKxI9RgalS6I4HAcLmWiVoWBB8VwhiqD8
	 mC88tZsqWGiOarNHBDx71hMFD5s4C6q86YnRmHOZZrwjclLaGWRPLLfcoL37uAIDUQ
	 GgS+fxYh1gpaVK2AkP++BASHoKJyVlOrj46+/d7uXLKQjXUp0a5e3bisWxEQBP/8qg
	 /Ue9O6jtdFuwNUJouI1hXTg9xUPbyf2nSC1zQSoDkGV0ZUYg2hjuNz4LnsvuMjbPkt
	 KaOuNDvkFUlAA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A1CCB60730;
	Tue, 17 Nov 2026 22:12:14 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 96D061A6
 for <buildroot@buildroot.org>; Tue, 17 Nov 2026 22:12:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8889A406A5
 for <buildroot@buildroot.org>; Tue, 17 Nov 2026 22:12:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6MGIS5NYkC-n for <buildroot@buildroot.org>;
 Tue, 17 Nov 2026 22:12:12 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 74D2D40668
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62b; helo=mail-ej1-x62b.google.com;
 envelope-from=yegorslists@googlemail.com; receiver=<UNKNOWN> 
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 74D2D40668
 for <buildroot@buildroot.org>; Tue, 17 Nov 2026 22:12:11 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-c468bd799ecso31737566b.1
 for <buildroot@buildroot.org>; Tue, 17 Nov 2026 14:12:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794953530; x=1795558330;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=hlq0OX8L+zOM8AdqyuekG3Q9zfIl1GohCPq3zCzMNns=;
 b=TZVKl/aGh4KyRQIuyzTXFHmnb9QcObKXayEPeTisULcSJrEUjmco+3FY6lXy7ir8cw
 IgiRqfrGUYVtFYrfLMUi6LR0IsRa3MilK4ePkdkeOzu5nI5drk3YISEqR5asKC4MyNUE
 Vu0U0Dc7jVd3XOfQtdkbB0RUm18Vp1+CBnmCD34/SEoP7PbL4RLIqzjQpdSgLKCglUvV
 3GAhVntF8/stRkLnTWoEeigWKVhTEN8V2VdxAyZSfwjcFpiUYonrP325z/w/cF48bWOj
 UtwzGUwPijLu7rrOa0b9YluDfc4Pc3D4shZN1Xv+18JkUYkxHuyB5xjKqr3ouFA42Ro6
 yCnQ==
X-Gm-Message-State: APuU4Z+CZe+mS9bcaxaYIz7uEqc/uqa/hmUYN64VW6MeoVRfjopmcOOF
 nUHzRYWv0AtT/WSsgPzB1hMqVy6MTfnmay+f3CGB9IzHO0INIBMZNtRUgPEcDA==
X-Gm-Gg: AYBFou3h4KCxtva2Wi83EY0Z/BLaeLjK6jsD3ieQnyPJ+0+2VmMxTVEa3nYTKui0Xab
 bGlbX9UAzXocdwnwZEsZbZafw/azRTiB7kaewDXqalpb+Iha5eOdJkRiZQ9mcwE6ml4PYwUw2t+
 XlX79iYzz6s3MlX2LNKyh8me1u5uMO5DeGH8EE6/FRIQH1TP+V+l39MMvAmEcw7JrIm9E5kmQ2j
 eaLSYYYB+MpKcoU2l1V1jmvz0twN28X8eyVbr959tqTv1Z9qKXPqCLlusdutw/N6MjotKPqhncs
 HMnsULZJbok5Xu+1qpo/aWg1dvNVv9rqFPryw2JnPGi0ryJwivLDnoQK8H2tO3ji94Lr5uLgseP
 TIQBDnw0T9w4ej9HTVe5eulII34Gmyr2DHnKrz84I+wFGpF599bquyS6Lc6pdPU5eiw5Gu7D9dq
 YdtQmEu1fflukLApYzsytouLv7uDTB3tKjYSmdeFgZt/AWs1ET2BM2vIla6wLm/bkFrbGbExM/k
 i/WHwwohNjq+vCMxRBqVHpoWSRrE5xX+MePuCcJP4Uj3FlUxPlfrHT8v9rOW/3mVdoOaoEZWuaP
 uqi4utacL8CKzhjNZVhUQJMwuMvhfOBT7C4zLzNeJ2X7O0llME3AZfQd4ZMt29uhR4GSeILbybF
 H1QrE7ii7
X-Received: by 2002:a17:907:ea8e:b0:c4d:22e2:1a2b with SMTP id
 a640c23a62f3a-c510debe78amr52562266b.1.1794953530015; 
 Tue, 17 Nov 2026 14:12:10 -0800 (PST)
Received: from development2.visionsystems.local (mail.visionsystems.de.
 [213.209.99.202]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c510c8401a9sm27729566b.4.2026.11.17.14.12.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Nov 2026 14:12:09 -0800 (PST)
To: buildroot@buildroot.org
Date: Tue, 17 Nov 2026 23:12:09 +0100
Message-Id: <20261117221209.3984234-1-yegorslists@googlemail.com>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/balena-engine: security bump to version
 20.10.44
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
Cc: Christian Stewart <christian@aperture.us>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-24.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The vendored runc is updated from v1.0.0-rc92 to a balena fork of
v1.1.12, which fixes CVE-2024-21626 (container breakout through a
leaked file descriptor to the host's /sys/fs/cgroup), and containerd
from 1.5.0-dev to a fork of v1.6.6.

Other changes include more resilient image pulls and delta handling,
a libnetwork update fixing a port binding issue, and AppArmor no longer
being enabled when apparmor_parser is missing.

https://github.com/balena-os/balena-engine/blob/v20.10.44/CHANGELOG.md

The LICENSE file is unchanged.

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/balena-engine/balena-engine.hash | 2 +-
 package/balena-engine/balena-engine.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/balena-engine/balena-engine.hash b/package/balena-engine/balena-engine.hash
index 076c72fd9a..9506c39c87 100644
--- a/package/balena-engine/balena-engine.hash
+++ b/package/balena-engine/balena-engine.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  1482b64e35d5406be719e362647ed7d0599cf4eead7770247ebd972c4c85ede5  balena-engine-20.10.26-go2.tar.gz
+sha256  6fff52e527072cc670286ca32d0805b6f73032e49fd7c6cbff82b46ca29dec3b  balena-engine-20.10.44-go2.tar.gz
 sha256  7c87873291f289713ac5df48b1f2010eb6963752bbd6b530416ab99fc37914a8  LICENSE
diff --git a/package/balena-engine/balena-engine.mk b/package/balena-engine/balena-engine.mk
index 49d526a465..a3695a5cca 100644
--- a/package/balena-engine/balena-engine.mk
+++ b/package/balena-engine/balena-engine.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BALENA_ENGINE_VERSION = 20.10.26
+BALENA_ENGINE_VERSION = 20.10.44
 BALENA_ENGINE_SITE = $(call github,balena-os,balena-engine,v$(BALENA_ENGINE_VERSION))
 
 BALENA_ENGINE_LICENSE = Apache-2.0
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
