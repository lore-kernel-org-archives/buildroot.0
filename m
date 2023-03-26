Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3AD5C74A5B
	for <buildroot@archiver.kernel.org>; Sun, 26 Mar 2023 08:00:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4F72C60E78;
	Sun, 26 Mar 2023 08:00:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4F72C60E78
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id u6D8VDozCR1I; Sun, 26 Mar 2023 08:00:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 94A2A607B4;
	Sun, 26 Mar 2023 08:00:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 94A2A607B4
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id F0F6A1BF870
 for <buildroot@lists.busybox.net>; Sun, 26 Mar 2023 08:00:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D7C1B40194
 for <buildroot@lists.busybox.net>; Sun, 26 Mar 2023 08:00:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D7C1B40194
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Rq90crXTHz0D for <buildroot@lists.busybox.net>;
 Sun, 26 Mar 2023 08:00:38 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3969C402D7
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3969C402D7
 for <buildroot@buildroot.org>; Sun, 26 Mar 2023 08:00:37 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost.fritz.box ([62.216.208.192]) by mail.gmx.net
 (mrgmx004 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1MF3DW-1piTxj2XFY-00FTWz; Sun, 26 Mar 2023 10:00:35 +0200
From: Peter Seiderer <ps.report@gmx.net>
To: buildroot@buildroot.org
Date: Sun, 26 Mar 2023 10:00:30 +0200
Message-Id: <20230326080034.14629-1-ps.report@gmx.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Provags-ID: V03:K1:cCnAmGW7l3MZjVPcnt+m73/L6bi8Jvfcp8ZwjmjQgd4wAarkh1O
 8MYhnhBkr0D+pH9XyIn1KnbLBqyrWjHZyb8dg6ie3BAYYSwt+t/AoZqAne/0kxmAYZge2MJ
 i9cJNbOyHF2zbaKizVZ+W70r2yzrvh3/CH/ivsFEy4N+DHd9wFTrKC8yZl2BIzM8pPKgx+K
 FwXWMvzlirBUz382Yrg7w==
UI-OutboundReport: notjunk:1;M01:P0:kjtsYZ2l4e4=;gUUAFA30EzbWT9prkP4tvNSoF0/
 oV/JTXwlth3ojltA7q1eWjHeLeN+kcUEgaHW3OtPB+VmEOlg6S0woz/vkYut3qdSHJmpXR/s5
 sUw4g9FjKQD9MzIc1yo2y/ywtKEk0EObPR0L/RMBPHbJIdiuLdaWYFLVyQS108K1yytLjRI69
 OIptpGJZdlcPo+MmpKiJw6j0HP+xVYfCgHaoWW9yoUg7grrdj8lEIWCYTeDB0I/6sVnatV5Jr
 +oKiRj+Xbz6+HVU/B5WcCsgLTIOgtvs9cawpUPD3wWZ77B8PDZxoM84xez7HvZ/xQH/RbpuZT
 4TSnjO0MOfgN8qTrPfXmlzZO1DXhjksj4oKh3wsSAcyiruNkP1lTcTJp7ly5fAUZeHRfhxgy+
 tPgmkkKxN1jFCauNRJjxXHGxczDBfutXPW5JpctJoqy/RXa5Fj8x0RSCcSdmRuy8jaLByH5lb
 WsEDh1B4V+q8bX1DKuTE5Hkev2Nr/X9MfAtnMNHDLMoGLoI8t/ziDB3mE6Dp0/j73rFSfgQQE
 YtZv+lRkzJ7gob52np/eLDfd0YALfl9KxJkTiUyosKF58RNSPFuu9UXRCIPyf/p/cWRKUGobr
 kfjm3K/aPO3GyQyqAw6+cVsBdIHeX02C9cQUgNNp5wVgOj+x/kzRfEBJtTnah2VIodY3b2ftl
 pyda9b4Wd9LlxHj4dXoZvPMFtIQ0frwYQO4lRaRNSnjd8az+bSiNfHdu5XOzqfOp+pqYOOBtn
 jshba0lxYcMm00qO8zH2qIHPAt6XQIxT+6sAFeJjd0Gv9impULFDWlsKlQwBbKa2sU8/ziXio
 udRNLPTWaP42PRsHIipZtfLyBF6cSDOK+qBiwqxPxiwdPaIviDW2odNypZIlOfp2a2SsskOnB
 /L43IY0MYWeyjCX1Pu7qG0MxhCHxiwd1R7PWVILLNvmYeq5ykvMbDv1JeW6XAWx+a/Evm7GXs
 4kD4nqR4/SuKnoEOvde4Rbl04v8=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gmx.net; s=s31663417; 
 t=1679817635; i=ps.report@gmx.net;
 bh=FRfGWZMxunCV9dwAC6NsWhUEQ7/VfJ10bGGyqMw3APw=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
 b=qUuNuP/iVXBb+gXj4S8NWlc75t+f0uWNdIKOpP+D40dASm6a2wVa3ATaISNXoPf0q
 QCjJfH2uTofwi43SvljHnf8sRW5yqoLMKwb/1DOJUutM6HPUvHxNzLKHHzOxWNSyhK
 hCk5VhMO7vsqj6B0Jr6a0PxbJuN5qwbjTJnF+sl3QqwEizdmxdOnXZpm7RcjL9/EO6
 E5KcFxCcQPlaivgFdr3nrkQUWzJ0CFnXurGyY65R3/OncD6jpHdXumVqi8UwjuxvFm
 bECeK1fC5MxkTrKNg+Jeg2NOe1NC/V/8Yj4/FSOcgFobPwkeOCBzb8coBqF4FnJkof
 rND21EdBMNRTA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.net header.i=ps.report@gmx.net
 header.a=rsa-sha256 header.s=s31663417 header.b=qUuNuP/i
Subject: [Buildroot] [PATCH v1 1/5] package/protozero: fix double space in
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
 package/protozero/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/protozero/Config.in b/package/protozero/Config.in
index 19048dfe8d..e6347e6f7f 100644
--- a/package/protozero/Config.in
+++ b/package/protozero/Config.in
@@ -16,5 +16,5 @@ config BR2_PACKAGE_PROTOZERO
 
 	  https://github.com/mapbox/protozero
 
-comment "protozero needs a toolchain w/ C++,  gcc >= 4.7"
+comment "protozero needs a toolchain w/ C++, gcc >= 4.7"
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_7
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
