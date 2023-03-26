Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C593C6FD1C
	for <buildroot@archiver.kernel.org>; Sun, 26 Mar 2023 08:00:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AACEB60BCA;
	Sun, 26 Mar 2023 08:00:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AACEB60BCA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qJ5RPCzEMDKD; Sun, 26 Mar 2023 08:00:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id EAB5260A7D;
	Sun, 26 Mar 2023 08:00:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EAB5260A7D
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CB1CF1BF2B6
 for <buildroot@lists.busybox.net>; Sun, 26 Mar 2023 08:00:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A50CF81ECA
 for <buildroot@lists.busybox.net>; Sun, 26 Mar 2023 08:00:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A50CF81ECA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Zd_m_j4gqFbO for <buildroot@lists.busybox.net>;
 Sun, 26 Mar 2023 08:00:39 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6FE7E81ED0
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6FE7E81ED0
 for <buildroot@buildroot.org>; Sun, 26 Mar 2023 08:00:38 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost.fritz.box ([62.216.208.192]) by mail.gmx.net
 (mrgmx004 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1MQe5k-1proBR3wla-00NgyV; Sun, 26 Mar 2023 10:00:36 +0200
From: Peter Seiderer <ps.report@gmx.net>
To: buildroot@buildroot.org
Date: Sun, 26 Mar 2023 10:00:31 +0200
Message-Id: <20230326080034.14629-2-ps.report@gmx.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230326080034.14629-1-ps.report@gmx.net>
References: <20230326080034.14629-1-ps.report@gmx.net>
MIME-Version: 1.0
X-Provags-ID: V03:K1:WTLtkrtZehD6IWw4y6k5WCrv/WO6AbpdM/MlR1Q/f4VaGVKwyJH
 7UlqfDMpDyzXcucWWuNNbwimmck1COqgrjI4Z38sLUzeT0906TNc0D5jWDilfaMuklYm/Wq
 AXdYQR/fRXrEfrnG3i3F3REdw4MgaiVVLSphKtt6mO1jup4zbDt0BgXtoPhqXUin41/pkb8
 d1pwzhStLFTYnxae7XFCA==
UI-OutboundReport: notjunk:1;M01:P0:o6w79q5fres=;hF/SIB+XLc83oRvpS5YAbofec98
 t+F8EY6HFbcwWhqTG5FKbmJkJVnGSJJBnXLiS+eOwdwT5fF2eGYPpfOByCSOc/4t5I3GQ3+Cs
 q7NmorsK7GKNA/5ICaUI/ipCD4LnNHrD+m9MofsVCjBCm+Mj/V2uW7odwTWbC8UWkND4jgDAi
 97WIKxm8JSL7B7PbG5sKfwXtaJxiXxqfTEOZhWI4X8ri7MjUDRHosJVP7AaqA8DBywDP8DdaR
 lZcWMSBfTF5rScRle5b+d4eOlV3GOPLxfTDOkk1A/wz0ZeOGEnxRp2cnPZYb4+B11MWUgNaOR
 9h0kmvRTQi6u8vFgHE3WCtqNp72UKzs3zFVtWsf3jlalI804PKH2WT5vRsz+FaB+FVuCA/TzR
 npIcPK5NBfe0kldbwQeQE0IqjtEAEin0CLDICkcGtTmpBWyjqd1a1NDVgKN2nxxd4hHzQhDjg
 z9QbvNACAQ/qzTCiV53QE7MQ1n4H/bRNgWpX60OKKmvNrJQFjo6zyEP+JGs/Q0i69hnMQIgO4
 93EHr69UQ87ETXWUgdMLdguInsT7Epoekg+JRIW6+yXXAtRU5Ll6fkcDbZpUIgDJ1sz6ACNl5
 8r66UwID86OvdVIDipz98PxHJ8LMufBlLjkwy9Q8PIPwBaqhyYcDWWUKfbcdl0fOo6k79K8lx
 gYVgwGSO640KSkrDjRZq5rEcvxjck8CShS1rczpu/S/x1ArlAx1oup9hVkEQ1nYFdq1JTvkc4
 V4ksLxSgsEmC1jrtHWXtbDyMce6/64vQ5LQULs6rZzfL5JFEsOM+8bN3WaQ+UBdoHQ2Mw6WQr
 +4kqVLrLhAQF3IUmu910tfpITSYfu6sJqyHrDUd8MCuxsq2doMboM6J5aeZcDZmDVvRQvYRrz
 yKSckySxCjbp/wgpKWo587QP1BaKwW+yc9CQwzv0X1Nf49tLdpzBwaXOVnxc31NtXMKXGIuyS
 siUbEhGpAveIFY5P3KMCtl681GI=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gmx.net; s=s31663417; 
 t=1679817636; i=ps.report@gmx.net;
 bh=tOdERCkXmPP2IYAtP5JClb8eyzNiQUT00FTr8i3tFCY=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=AC4mJKJzIbVj81TZyFF4EeZI7yHRi1xgkZr9/z0NxWrWR8lT0XSYXmLedq9pWHUwF
 bYATdgM45BRUaZmKptvsHTaOgK0hciOTAmRSm7RKxYv0Oa3EdxBIddlBrOoM0PJc0f
 LzPBbALL+h1HV79BE/66GuZvT35C43iuOxiN8kdEB1t93aPDpOXOxKuONPGzAi7KwK
 AcKEyy9soNobWo2uq/f0an+cx44Ppkov44kYjpSSjtwRstRzOFGCxmni1PLU5ig9s7
 ubSKK3U+wrxG3jQEyEiLCGVbleD3kS78aXT7k6efnK3mNnGL3v91fu5A36b4dlaN1n
 mTiDYLr/eGZBA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.net header.i=ps.report@gmx.net
 header.a=rsa-sha256 header.s=s31663417 header.b=AC4mJKJz
Subject: [Buildroot] [PATCH v1 2/5] package/lcdproc: fix double space in
 Config.in comment
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
Cc: Maxim Kochetkov <fido_max@inbox.ru>,
 =?UTF-8?q?Vincent=20Stehl=C3=A9?= <vincent.stehle@laposte.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/lcdproc/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/lcdproc/Config.in b/package/lcdproc/Config.in
index 042abd69df..e5ff432d40 100644
--- a/package/lcdproc/Config.in
+++ b/package/lcdproc/Config.in
@@ -1,4 +1,4 @@
-comment "lcdproc needs a toolchain w/  dynamic library"
+comment "lcdproc needs a toolchain w/ dynamic library"
 	depends on BR2_STATIC_LIBS
 
 config BR2_PACKAGE_LCDPROC
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
