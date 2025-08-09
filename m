Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48265C87FCB
	for <buildroot@archiver.kernel.org>; Sat,  9 Aug 2025 22:37:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DDF8C60E07;
	Sat,  9 Aug 2025 22:37:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id H3pIK8iXMvb1; Sat,  9 Aug 2025 22:37:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1921960E0D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1921960E0D;
	Sat,  9 Aug 2025 22:37:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 3EB9C154
 for <buildroot@buildroot.org>; Sat,  9 Aug 2025 22:37:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2480681D72
 for <buildroot@buildroot.org>; Sat,  9 Aug 2025 22:37:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BjCyi8LPvcej for <buildroot@buildroot.org>;
 Sat,  9 Aug 2025 22:37:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.21;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org EEE0081D3D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EEE0081D3D
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EEE0081D3D
 for <buildroot@buildroot.org>; Sat,  9 Aug 2025 22:37:47 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from haruka.home.arpa ([85.22.119.120]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MStCY-1vBm8X2Trq-00NrcB; Sun, 10
 Aug 2025 00:32:39 +0200
To: buildroot@buildroot.org
Date: Sun, 10 Aug 2025 00:32:23 +0200
Message-ID: <20250809223229.2307960-2-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250809223229.2307960-1-fiona.klute@gmx.de>
References: <20250809223229.2307960-1-fiona.klute@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:EqFTmZo/vcYe68xBnuwfPguN6EN/5kNXrfbyA5xvwf1ZfZnp4OP
 ATACv2hqSv7FUaKEXY1JQpfq0c4bzTcPW3HVUzZUXVPkrcg9Hc3oOpl2JpAmPqPpY8cP/+s
 1ZfdkgiKevi8zSzoRDf73Lg6Qp4gp33rot5wU56R/qbaQDwVGeO+5KmKjP1Zu0j00K1lvIN
 zvADKHnYkxukIpTmexM+Q==
UI-OutboundReport: notjunk:1;M01:P0:sjdpXzy89YQ=;A0Rq+JKD3d8/o/woW3RjDv/MXUV
 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
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1754779066; x=1755383866; i=fiona.klute@gmx.de;
 bh=NlVju3/+AufyRYDOSCNJW3RT8nBERvYYFJWOt086er8=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=QAqEPlKGnFT/bOZJLEsB9edfqUiGzVn6UgN0TzRr6dv7UkZAVFcqk85b4ya8fGGz
 NaKHYdD+aTVcf2Ls7iOt564IYtjke7tgq3wAzAZZNrVb0nHd6VMGvEoCh00KMvSIq
 V54+/hOtoPtqqAR1j3GioHtnOv2rGgVpY93kKUAXnwrCcDYN27Mrl9fMqPdeF8vtP
 CrxcA5k44k5ujCMjR7VBWqQGEVoh2LDkaM9G95hFIzlvAkEMYq+Cx/f4ete8JGeMu
 rLzhbpnvOgrknQr3gogHM5PdZwo/HGvAe3gUVAX9we28lPFCm+tNjnb7+wfVxKjky
 8qarQXVZV4rMBkNM3Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=QAqEPlKG
Subject: [Buildroot] [PATCH 1/7] package/elfutils: enable libdebuginfod for
 target if requirements are met
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Fiona Klute <fiona.klute@gmx.de>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: "Fiona Klute (WIWA)" <fiona.klute@gmx.de>

This does not make debug info available, but allows programs to build
that link against libdebuginfod.

Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
---
 package/elfutils/elfutils.mk | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/package/elfutils/elfutils.mk b/package/elfutils/elfutils.mk
index 39d6607cdf..624c40203e 100644
--- a/package/elfutils/elfutils.mk
+++ b/package/elfutils/elfutils.mk
@@ -49,8 +49,13 @@ ifeq ($(BR2_microblaze),y)
 ELFUTILS_CONF_OPTS += --disable-symbol-versioning
 endif
 
-# disable for now, needs "distro" support
-ELFUTILS_CONF_OPTS += --disable-libdebuginfod --disable-debuginfod
+ifeq ($(BR2_PACKAGE_JSON_C)$(BR2_PACKAGE_LIBCURL),yy)
+ELFUTILS_CONF_OPTS += --enable-libdebuginfod
+ELFUTILS_DEPENDENCIES += json-c libcurl
+else
+ELFUTILS_CONF_OPTS += --disable-libdebuginfod
+endif
+ELFUTILS_CONF_OPTS += --disable-debuginfod
 HOST_ELFUTILS_CONF_OPTS += --disable-libdebuginfod --disable-debuginfod
 
 ELFUTILS_CONF_ENV += \
-- 
2.50.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
