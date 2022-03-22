Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0EF0C433EF
	for <buildroot@archiver.kernel.org>; Tue, 22 Mar 2022 17:50:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 82D0B41881;
	Tue, 22 Mar 2022 17:50:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Z5TrKPa9RrqC; Tue, 22 Mar 2022 17:50:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A5B534184E;
	Tue, 22 Mar 2022 17:49:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C62D11BF5DD
 for <buildroot@lists.busybox.net>; Tue, 22 Mar 2022 17:49:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B499984140
 for <buildroot@lists.busybox.net>; Tue, 22 Mar 2022 17:49:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aB8kZX2Nmz-Z for <buildroot@lists.busybox.net>;
 Tue, 22 Mar 2022 17:49:58 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B32F981AD7
 for <buildroot@buildroot.org>; Tue, 22 Mar 2022 17:49:57 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id j18so14877461wrd.6
 for <buildroot@buildroot.org>; Tue, 22 Mar 2022 10:49:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=iJuvoEFiLRqydnRG0xgwFCWNIn80dWZpidXpZNbAi5o=;
 b=nI1g/gIx9FhgIOqDbDfp3Df2Kj3XKDCcB0Nip43FX0TBKJFIuPFY87ou8ulwz1vcnX
 FRAB+TraovIi1DIfK9wLBAxS+qlbv6XWZL90OcWIW7KUoNO0sYdrDiUSG/4C7qYEJGlG
 0uAfXFbzmKf1E31okuav/YQLBe2qwhqK40A3MphRCiWhebEl3e0HDqaxAffO4jkP/hWB
 rgBlcQ+soPDThfk6o7+Y1PsON1rBt0GOcsAm7gRLHervo9rAe3b4XICI/JT6XISju9JB
 bHetAVfCcx2QPyzyTDAO6EdLeluLZTQFIQr73J9NIkWjGz0nzslMZiYDyOMm+s/iazBp
 ANLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=iJuvoEFiLRqydnRG0xgwFCWNIn80dWZpidXpZNbAi5o=;
 b=aWMeSQoyKq582vVQ0uB94xwSrnpIAubhY9JPyNVHAIS4KaGjHp/RofVlaKw6w0Uuf9
 cybiVCv/cDfjx7dPe2PfEApvRkEwiR2VG6fZ2YCrMFFCOCDpLu9MsBep/1BbAP8ql6zO
 HePmDQUrPiRWHd4N9d6Vmx8I8BoT/nLy6RQfqQslflEKtwA+2RKDDOWLIGIdGXXL+uNN
 h7MylGdIT9rn/hmTeF7yj7fG7kEgmukhl0veSfDTqxKEPvvUq76+q/hjt40oup8LNkCG
 RxElt6EGquzWrlpgVqxU0f3uI8gRoTHPaXOwK+SG0FbjjY3Ecp14dKJn9YkfyM9El4yj
 Y7uw==
X-Gm-Message-State: AOAM533UzYPad03SuChCtUdDKVs0GUZE1uFSQ3L86/wQUAFmBxXgyED6
 hzbG7t+kofW+8qRNcatszppv4GMk1Yk=
X-Google-Smtp-Source: ABdhPJxgYRFeXI+zOKhVgRWLRP4io4P6vu4TzuBj/iUVg2QMmXvnxN+qr0KMXPOqE9DAlm4GPGP88g==
X-Received: by 2002:adf:e241:0:b0:203:f56e:51e3 with SMTP id
 bl1-20020adfe241000000b00203f56e51e3mr17502025wrb.473.1647971395665; 
 Tue, 22 Mar 2022 10:49:55 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 a25-20020a5d4579000000b00203ee633c2asm12503622wrc.1.2022.03.22.10.49.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Mar 2022 10:49:55 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 22 Mar 2022 18:48:38 +0100
Message-Id: <20220322174839.2189015-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/2] package/jack2: fix build with libexecinfo
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
Cc: "Wojciech M . Zabolotny" <wzab01@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure raised on uclibc and musl since the
addition of libexecinfo package in commit
eea8ba446c10701a273432552108d80fb2224ef4:

/home/peko/autobuild/instance-1/output-1/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabi/10.3.0/../../../../arm-buildroot-linux-uclibcgnueabi/bin/ld: dbus/sigsegv.c.17.o: in function `signal_segv':
sigsegv.c:(.text+0x98): undefined reference to `backtrace'

Fixes:
 - http://autobuild.buildroot.org/results/dca49cb9b3e66fac921601560e9358bcce9acffc

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/jack2/jack2.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/jack2/jack2.mk b/package/jack2/jack2.mk
index 2e55169984..127c99eed1 100644
--- a/package/jack2/jack2.mk
+++ b/package/jack2/jack2.mk
@@ -14,6 +14,11 @@ JACK2_INSTALL_STAGING = YES
 
 JACK2_CONF_OPTS = --alsa
 
+ifeq ($(BR2_PACKAGE_LIBEXECINFO),y)
+JACK2_DEPENDENCIES += libexecinfo
+JACK2_CONF_ENV += LDFLAGS="$(TARGET_LDFLAGS) -lexecinfo"
+endif
+
 ifeq ($(BR2_PACKAGE_OPUS),y)
 JACK2_DEPENDENCIES += opus
 endif
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
