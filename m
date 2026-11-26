Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D60B3606A327
	for <buildroot@archiver.kernel.org>; Thu, 26 Nov 2026 19:26:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=M17CXy+x;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=VX1xc6cz
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B50C1409E9;
	Thu, 26 Nov 2026 19:26:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wH6c45pjTxoG; Thu, 26 Nov 2026 19:26:25 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org BFDCC40A02
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795721185;
	b=MOntxJEgShj1c2z+m1gPDRNzCWDaYGB2tB/AZrL6JZsbRn1gPGErUEUXCO6uRlrr/ANF
	 rAit2xjXZ24euMRjEiqXfPT5uxUwPW+YAvt5r+vNm5M27yjNhVLfc1ua784YBsTRkbFC7
	 CNoW6peV3Q415sbEB2nghWY0x0zvwXygQ1ZMtUO4KmgPq3WuB2LhiMyIUBvbjEn4jmCbM
	 DdW1KyxcvxsbOvMzV1NXBPqrJ37WbuKj7J7YZa2fHvzWTjAyQapFoi4FB1Mqox66YWPtR
	 IstFe0IHlhMBx5vi9lAdBa00A4Z4PhzJtRdmUBGpP8gbYZgNuW4SxGozaQnFxFXw7Ew==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795721185;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=SaQzLYQtibK+dU65XiGmsgzc8wcJb8dGxIWHbvCimAo=;
	b=qH8DbkJQVApkwbxMMREok5s+pShM1KKOVZ8Divw2fE+tDE/JHFaUK8ulyQP8soIT72Tp
	 3casFwJhogwxq17qW13H3xQ7l57TGgj6ZcHqWMXJUcJgb3vZU9uATFEZy1ikUfde5P3ne
	 2MgDCgxDCjupZVzZ1yd4CpJRkujjAP2sW0swGZjMFkVPmbL8kJsUK2uBep9kyh/mhMCbw
	 e0+1d9QE0/cfbXdGPcnq5iRtdti8U/JJt5m6MRjTFI913+A/hC9ck9NfBo548Cyv51ALv
	 IDMsvCVKjbaGUy1FeRijwuwJc6ZG+82+nOclJgfB+S3Zgo44Vrzpk8IHqLKbI+yZ/OQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795721185;
	bh=SaQzLYQtibK+dU65XiGmsgzc8wcJb8dGxIWHbvCimAo=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=M17CXy+xsEbCSrsop8WKlbGm8O+koB25I9jiCPfv1SoQtFp8BJl4q81vLXwCbVHii
	 z+bolfr7KSst7a3lvnpnLiMTwsX6O+UAoy3BErJc0Gv1Viy+BhxDa14YieiS/hxXew
	 CKB/ShskaLd2zTnJOSxenbrLOmzj/dnfpuI3ZchkJpnpPpb6HxGnGyf8Y3bzYWlx2a
	 1t1uaVn/DlwzCZ0nZjJZoc0ogD65ttx7SfiFMG0c9xERXHp0V+umqkpEl8jYHatsSy
	 nEef8jdRyaEhGfMZ4r7hEj4Xbb4aORPEZBlqSAQIkcAQc4TzQeHfGn1UlbWDdxvZX/
	 /rA7MJu9n0XKA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id BFDCC40A02;
	Thu, 26 Nov 2026 19:26:25 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 33601260
 for <buildroot@buildroot.org>; Thu, 26 Nov 2026 19:26:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 24B3060AC7
 for <buildroot@buildroot.org>; Thu, 26 Nov 2026 19:26:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iespY3CWTnDK for <buildroot@buildroot.org>;
 Thu, 26 Nov 2026 19:26:23 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org E68A660ABA
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::32b"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32b; helo=mail-wm1-x32b.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
Authentication-Results: smtp3.osuosl.org; dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=VX1xc6cz
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E68A660ABA
 for <buildroot@buildroot.org>; Thu, 26 Nov 2026 19:26:22 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-4a2d6d01ecbso39791425e9.0
 for <buildroot@buildroot.org>; Thu, 26 Nov 2026 11:26:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1795721180; x=1796325980;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=duhPO7v48vvvbBkAiX/RoZknL/UxAUe43bWSoxAts7c=;
 b=VX1xc6czUjhNLZEhp6P2U3erWG8sAvA/oXLWNP5X8mW2zB/4vllBF48Yy+K1eYgOkV
 uctoF1P4h3qF15m1MiGF1w4IIhQo0JCQzCklAbTDaRzs8R5aHXphCEQ5cD6yMsO0xxdE
 rJQVDvZQ2E405OPR6IgxR5QhRIlGhprpYTkvE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795721180; x=1796325980;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=duhPO7v48vvvbBkAiX/RoZknL/UxAUe43bWSoxAts7c=;
 b=ohiXYNmKJxpEZFOhdVVfuA3ki5vEFG7sfz9ShdQL/a+yrwCApKaAG6335RweI/JruP
 imDWt0ZWAgnyIPPbqXory5U2HFa8ndEzyUaxUe1m94PpTas+fCsf98DlFZv2l2NQMqPv
 J9tMuA2GvaiEhXih15uie1LW9OM1nj7QTBMllHmbHCiCWGLHdksyJurApSu+qxLsshvx
 cEwxatoL/JhT6CeAKIqwN9tBPppCA0S6AvMseylzTXSN11ZnLRhKOVCdbg+KrG3euYMd
 JrYt1KutEDEIKGF0vrev9yeh0708r4RyNyGfpAFLjryGwxE5iHsFbke3Om4slRWhfJ1+
 eACw==
X-Gm-Message-State: APuU4Z9ShYhVq/ZYLqr884aRwwhLjNKDxVeQ1AmqFlUnSYgiUtQLUVBk
 AZ2uw0XCNP1a4mVk9XlPHqMimGzP5GQ7T6kPDtBNc4RP5wmPnfi7VMLst5COauqJlslZ+fZ7kyA
 dDzr4
X-Gm-Gg: AZFdTZdQVoQTKd+GlJtmEMlYvVoZYIn9d2xL2HG65TKSKjM0AwyQmJWP4UzwviqAhyp
 7pFM7CKj+PhegRL8i5m9mnsAxNYx3J7HSyPT5ZCXltUPfTOEp6JAGWXTynQR/WKUy2z39lF+ooi
 d5GWieW6JF+EDy+jjsK5Ie4i+AcQcfvzEdqNDB3BR3XiuYaGwoGp1W1GXE+KCLzSc1IO1AGshXw
 2C9prpxWU5HfWrcumX4YY6I+lvVm9QMA9k13sgdXwszSo1RBYI/2pXU79tGaU+pxQtiwa2H5I+R
 fRDrni5GYtLonwfcQdC5EX3QE1zclmOsyyHfgrtCroWniKRWOnr5wj9Hk/W1F3gG1mXDYIO7p6R
 vQ6yQfFTMQFTkMXB/P0kxbgjQLWb15jBd0Nw6OHdbJBpCo6dqzlF41AH6NantFWaStJ2VO9U+9O
 QfLExu269glyX1s4KrqcApb5rg9WH0+ByMSnKMyG4SQhtwqjueUVR5rWWXlfD6zluCbeMT5Y6Sx
 /SMld9SwZGjFj8+xeIcP/7XTcEnSRag4//D6jbTeXt9U9n246NbIqmEjMwa6OwV8AunmwxGUgb0
 zTIuhHWVpBakKpDK1xnxldDN/XP4vESOC0VPAJ+XX+zHQbF9PCaul4A/TBiKxzGMkmTeiZso8sp
 2/liKqKsPMelqFuqmxW0/53EBiRovGfdItrJa0aZJr9GVxzBiTKn39MgFYe+5O6TSVqD/GvnUOS
 VFQw3EwQhFD7bMJ+PiupDH
X-Received: by 2002:a05:600c:3ba3:b0:4bb:6118:4c9a with SMTP id
 5b1f17b1804b1-4bb88819940mr516933175e9.30.1795721180446; 
 Thu, 26 Nov 2026 11:26:20 -0800 (PST)
Received: from dario-ThinkPad-P14s-Gen-5.amarulasolutions.com
 (host-79-14-29-58.business.telecomitalia.it. [79.14.29.58])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4bb884a15absm569795045e9.9.2026.11.26.11.26.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Nov 2026 11:26:19 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Bernd Kuhls <bernd@kuhls.net>, Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Fiona Klute <fiona.klute@gmx.de>, linux-amarula@amarulasolutions.com,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Thu, 26 Nov 2026 20:26:12 +0100
Message-ID: <20261126192612.1598984-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2] package/eudev: S10udevd: wait for udevd
 before triggering events
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

start-stop-daemon starts udevd in the background and returns before
udevd listens to kernel events. The coldplug events generated right
after by "udevadm trigger" may then get lost, so that no module is
loaded at boot.

  Starting network: Waiting for interface eth0 to appear............... timeout!

Wait until udevd answers on its control socket before triggering the
events. The udevadm control command of eudev has no --ping option, so
use --start-exec-queue, which has no effect on a daemon whose queue is
already running.

While at it, return right away when udevd fails to start, as there is
no point in triggering events then.

Fixes: 41258a81948fddfa7fc8ac06b69d77fa051b744d ("package/eudev: refactor init script and rename it to S10udevd")
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
Changes in v2:
- Return right away when udevd fails to start and move the wait loop
  out of the if statement.
- Use '[ "$i" -lt 50 ] || break' to leave the loop.
- Explain in the commit message why --start-exec-queue is used.

v1: https://lore.kernel.org/buildroot/20261029164212.672884-1-dario.binacchi@amarulasolutions.com

 package/eudev/S10udevd | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/package/eudev/S10udevd b/package/eudev/S10udevd
index 8bb8f6eb3a01..8eb764f65215 100644
--- a/package/eudev/S10udevd
+++ b/package/eudev/S10udevd
@@ -37,7 +37,16 @@ start() {
 		echo "OK"
 	else
 		echo "FAIL"
+		return "$status"
 	fi
+	# start-stop-daemon returns before udevd listens to kernel events.
+	# Wait for it, or the events triggered below may get lost.
+	i=0
+	while ! udevadm control --start-exec-queue 2>/dev/null; do
+		i=$((i + 1))
+		[ "$i" -lt 50 ] || break
+		sleep 0.1
+	done
 	udevadm trigger --type=subsystems --action=add
 	udevadm trigger --type=devices --action=add
 	udevadm settle --timeout=$SETTLE_TIMEOUT || echo "udevadm settle failed"
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
