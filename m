Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F34FC433F5
	for <buildroot@archiver.kernel.org>; Tue,  5 Apr 2022 21:54:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 42700826EA;
	Tue,  5 Apr 2022 21:54:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YobzMCn1qmNI; Tue,  5 Apr 2022 21:54:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4D2E0824EF;
	Tue,  5 Apr 2022 21:54:01 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 48B331BF3A3
 for <buildroot@lists.busybox.net>; Tue,  5 Apr 2022 21:54:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 362E481A29
 for <buildroot@lists.busybox.net>; Tue,  5 Apr 2022 21:54:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PjAKBmtxbmuB for <buildroot@lists.busybox.net>;
 Tue,  5 Apr 2022 21:53:59 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5336A813D0
 for <buildroot@buildroot.org>; Tue,  5 Apr 2022 21:53:59 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id d29so443328wra.10
 for <buildroot@buildroot.org>; Tue, 05 Apr 2022 14:53:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=pgFB3xl9QWKNGYUnNK6mU0gfcYsagbNa4u7JdtaSfws=;
 b=YdOqy9WlC7sxNiFuS3ah/G4j7VcLa+CIIFLAeZM4h6/BArbMYFinb5ZZwveazm4KN4
 0zFpZo4hof+lnHWt+Fi8n/gGhkTv63B0cOMnH/K5ICLK4svpfnxLCKHXQATzD3BpeKJt
 ipU4KGmjic5IRaAhosiN6UnO99RZfsiFlUkAoz0MC3IbCGEYejgGPVF6svs6j2X5OZwf
 JqDeqW9ephmC4q+87pYpT06vybsS5X2jUVJwvALyzdd24mD7QRleodPDpkMWcczcR7lK
 VDT9kTaYgwo7cFS28uZZmC2d4gW3JnzNYuekKUmyEmYt5rX8g2tQwjb+cnmSv9YYm7Dd
 IYNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=pgFB3xl9QWKNGYUnNK6mU0gfcYsagbNa4u7JdtaSfws=;
 b=d33a+TFu2ojPVP+II1zgQl3Tr8gzT0tQcvw1eknL0pkhTntRqLgaOdd2BRhcCb9hjz
 gUmPuXNBgZYKeXEv77o7qsck05P1tz87YgokEnV/RwlwBujqT4bL1brvry9SnCOwclE2
 7e2JexcNLMMoHj9z3/KhkGMqGlloKND+YxqlfDqU1aBQviBvSApOC8tCZ+b2Ce1+R5LF
 zPcnQyt+1LTuBPSQ6IUc8KvJkJH7t6MycQkiSHJOwKk6C3IBcE91BoRzn9A5FW3MIUEw
 8zYgFKtDHMr/hjpPAP2bkXpLzkH/cLX0K+DsPiprs5t83+fW68qLEgmp0f/pcT9YMfAt
 T/Qw==
X-Gm-Message-State: AOAM532dfCNb368TNDdScvAiqLmJTzJbAEPiTfD9Ao2vi2Sw+qWubJ2M
 0ylrbJSnzsy+aLfmGwvaeJvLAlnpIig=
X-Google-Smtp-Source: ABdhPJwNBgqHseqzRkLFzAhKi5yqdgQX9kXgbT7ZkiDebW1ugySl97Mkdl6NPXg2jU62fx4IN0QtiQ==
X-Received: by 2002:a05:6000:1e16:b0:206:40c:872d with SMTP id
 bj22-20020a0560001e1600b00206040c872dmr4168325wrb.535.1649195637257; 
 Tue, 05 Apr 2022 14:53:57 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 y15-20020a05600015cf00b00203e324347bsm15739932wry.102.2022.04.05.14.53.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Apr 2022 14:53:56 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  5 Apr 2022 23:52:07 +0200
Message-Id: <20220405215207.2696390-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/rt-tests: needs __sync_*_4 intrisics
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

rt-tests needs __sync_*_4 intrisics since bump to version 1.9 in commit
32be34427956a590d07d12e965f97fa9d2110ae9 and
https://git.kernel.org/pub/scm/utils/rt-tests/rt-tests.git/commit/?id=c86dec5765e1ad0bd1d0c429ca7c138c11da2c80:

oslat.c:(.text+0x1034): undefined reference to `__sync_add_and_fetch_4'

Fixes:
 - http://autobuild.buildroot.org/results/9b065ee7611db3a404863b85161f46a2e9e8ddad

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/rt-tests/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/rt-tests/Config.in b/package/rt-tests/Config.in
index 47fa7cd840..8efa3d194e 100644
--- a/package/rt-tests/Config.in
+++ b/package/rt-tests/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_RT_TESTS
 	bool "rt-tests"
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # __sync_*_4 intrisics
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_5
 	depends on BR2_USE_MMU # fork(), numactl
@@ -30,6 +31,7 @@ comment "rt-tests may not work on MIPS with an external uClibc toolchain"
 	depends on BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el
 
 comment "rt-tests needs a uClibc or glibc toolchain w/ NPTL, headers >= 4.5, dynamic library"
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL || BR2_STATIC_LIBS \
 		|| BR2_TOOLCHAIN_USES_MUSL || !BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_5
 	depends on BR2_USE_MMU
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
