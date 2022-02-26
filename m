Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 158DAC433F5
	for <buildroot@archiver.kernel.org>; Sat, 26 Feb 2022 18:11:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 99ECA60C2F;
	Sat, 26 Feb 2022 18:11:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GHvEpUnOlEbt; Sat, 26 Feb 2022 18:11:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C081460C22;
	Sat, 26 Feb 2022 18:11:11 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D2B761BF281
 for <buildroot@lists.busybox.net>; Sat, 26 Feb 2022 18:11:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C6C7D40A00
 for <buildroot@lists.busybox.net>; Sat, 26 Feb 2022 18:11:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PnSZuGC5J3Xo for <buildroot@lists.busybox.net>;
 Sat, 26 Feb 2022 18:11:06 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DBE8C40961
 for <buildroot@buildroot.org>; Sat, 26 Feb 2022 18:11:05 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id d17so9144516wrc.9
 for <buildroot@buildroot.org>; Sat, 26 Feb 2022 10:11:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=yieFLUM3ZkqRAotaUTi2BBrjF+f1J21+iRmdDk6eqh4=;
 b=WjfkCXldBKcOQ/qvRCcqekv6AHuii3fjuOVn8F6owMpR1uR7R6WLOj+qQm3C2JITgT
 aaD16mezjtyN4UEzKwDDrN6BJ0ehdoSfZdm6AbGf1eI+1D5ncP+RRLWHJ/yVWdbmtbbq
 F9gDrXgl2gKNv4V9Or+uoenPK8JCxxjexcmJ5dYs9RxGM761DANEcnNT9ITHQBpN3WyA
 PbmixkLN34mgTaFVlMENp5I4Jms6257My3PhU8HlJiS+emerRUXWPHqNXX8naJjqTK80
 mIorB1vUphKqihCOfdk8yetteWKlScz2z9IszG1KGAO78RxdtXlroIPlrPCioGgwD1rc
 ltfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=yieFLUM3ZkqRAotaUTi2BBrjF+f1J21+iRmdDk6eqh4=;
 b=R1hWSWGAdqgpfPtWnDVLP1bHHKIG/YUdV0yRMhPjv361vJVsDOfSMw10vQ4vRv5PwH
 6z++2eF+ycplUQzG0f27l2skHE8tbih6A+CTCBe9Taan/sjLWll7EPFiWZoECiX5c6tb
 4xxPSYss9S2cjxzoWAYCBbT8hftox4feQ6PDEe0RY+kfymrYImRE2/p6RHANuOyI9mcv
 wbe/kkg6GlLIyiYZLHGeQ5NwgQJ9M959+Ycwr+YKRlu2LUqLQFVnMfY/HlpzCsDNgauN
 AQB/PTbaEFvun/8b5WE4j8XRYT+AkXFyovZ0gcaB0y2AWRzSjDaD2inyp3WXoAbsLQHD
 3ZVw==
X-Gm-Message-State: AOAM531k0kPAmmezWLmG4H0yN1PC4ovN4y1iXXm5Y/Y9ZQT/UoC49svC
 7yRQ24jVaJzgEm656NBZ05wR/aOLODk=
X-Google-Smtp-Source: ABdhPJzA4qYA9AE2eOwD9N3ky5kHArQPRpnJpDKsgwLqI1HqGAamGaGUWoswL/0GS1F4GW0ds7WocQ==
X-Received: by 2002:adf:80ad:0:b0:1e3:238a:178e with SMTP id
 42-20020adf80ad000000b001e3238a178emr10815564wrl.551.1645899063857; 
 Sat, 26 Feb 2022 10:11:03 -0800 (PST)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 s16-20020adfecd0000000b001e7be443a17sm8181029wro.27.2022.02.26.10.11.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 26 Feb 2022 10:11:03 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 26 Feb 2022 19:10:45 +0100
Message-Id: <20220226181045.2922875-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/wireshark: security bump to version
 3.4.12
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix CVE-2021-4190, CVE-2022-0581, CVE-2022-0582, CVE-2022-0583,
CVE-2022-0585 and CVE-2022-0586

https://www.wireshark.org/security/wnpa-sec-2021-22.html
https://www.wireshark.org/security/wnpa-sec-2022-01.html
https://www.wireshark.org/security/wnpa-sec-2022-02.html
https://www.wireshark.org/security/wnpa-sec-2022-03.html
https://www.wireshark.org/security/wnpa-sec-2022-04.html
https://www.wireshark.org/security/wnpa-sec-2022-05.html

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/wireshark/wireshark.hash | 6 +++---
 package/wireshark/wireshark.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/wireshark/wireshark.hash b/package/wireshark/wireshark.hash
index 7b67e316ed..db1f71e9ef 100644
--- a/package/wireshark/wireshark.hash
+++ b/package/wireshark/wireshark.hash
@@ -1,6 +1,6 @@
-# From https://www.wireshark.org/download/src/all-versions/SIGNATURES-3.4.11.txt
-sha1  b656d8709b8b0b3d2a94665af6bec88495ad994c  wireshark-3.4.11.tar.xz
-sha256  a0e227bce2cc3a51ef3301891a0243231990b52a39b68a84a6e32f69c4e75279  wireshark-3.4.11.tar.xz
+# From https://www.wireshark.org/download/src/all-versions/SIGNATURES-3.4.12.txt
+sha1  91ca69b0029e58b9c824266237ab392a62f0a248  wireshark-3.4.12.tar.xz
+sha256  881a13303e263b7dc7fe337534c8a541d4914552287879bed30bbe76c5bf68ca  wireshark-3.4.12.tar.xz
 
 # Locally calculated
 sha256  7cdbed2b697efaa45576a033f1ac0e73cd045644a91c79bbf41d4a7d81dac7bf  COPYING
diff --git a/package/wireshark/wireshark.mk b/package/wireshark/wireshark.mk
index 0361d0bb64..a5ca4b1f73 100644
--- a/package/wireshark/wireshark.mk
+++ b/package/wireshark/wireshark.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WIRESHARK_VERSION = 3.4.11
+WIRESHARK_VERSION = 3.4.12
 WIRESHARK_SOURCE = wireshark-$(WIRESHARK_VERSION).tar.xz
 WIRESHARK_SITE = https://www.wireshark.org/download/src/all-versions
 WIRESHARK_LICENSE = wireshark license
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
