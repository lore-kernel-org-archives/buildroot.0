Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A289ECAC5B5
	for <buildroot@archiver.kernel.org>; Sun, 28 Sep 2025 14:51:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4B4C3607A7;
	Sun, 28 Sep 2025 14:51:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NiaNDq1GonF2; Sun, 28 Sep 2025 14:51:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7DFB7607B0
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7DFB7607B0;
	Sun, 28 Sep 2025 14:51:33 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 44201111
 for <buildroot@buildroot.org>; Sun, 28 Sep 2025 14:51:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1ADCE607AD
 for <buildroot@buildroot.org>; Sun, 28 Sep 2025 14:51:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oqL0Z9lUIQEB for <buildroot@buildroot.org>;
 Sun, 28 Sep 2025 14:51:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=136.243.2.102;
 helo=nyx.n621.de; envelope-from=fl@n621.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 04360607BE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 04360607BE
Received: from nyx.n621.de (v4gw.hekate.n621.de [136.243.2.102])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 04360607BE
 for <buildroot@buildroot.org>; Sun, 28 Sep 2025 14:51:26 +0000 (UTC)
Received: from eos.home.n621.de (localhost [127.0.0.1])
 by nyx.n621.de (Postfix) with ESMTP id A8543E00078;
 Sun, 28 Sep 2025 16:51:23 +0200 (CEST)
From: Florian Larysch <fl@n621.de>
To: buildroot@buildroot.org
Cc: Heiko Thiery <heiko.thiery@gmail.com>, Petr Kulhavy <brain@jikos.cz>,
 Florian Larysch <fl@n621.de>
Date: Sun, 28 Sep 2025 16:50:42 +0200
Message-ID: <20250928145118.32282-1-fl@n621.de>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=n621.de; s=dkim; t=1759071083;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=zZm37p9S/+xOrag312vXKqyF1spHBmtn1xu/ga1qeIc=;
 b=wJpBXgal9As4Yc511tb4FlTfEoOnmEjO1w5FXSk5+Ucq8mlm6wbSITFX4GIMcz9idUT5lX
 7BeZhcWsdogsZ8fver89CRHsFp0i53+ITQF6nL2dx+yNEpjs/XDYAihfbSsi2DUopi89Ck
 jOzDLnj1e0XlRz/n2mfH+kVID+rwj+8=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=n621.de
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=n621.de header.i=@n621.de header.a=rsa-sha256
 header.s=dkim header.b=wJpBXgal
Subject: [Buildroot] [PATCH 1/1] package/linuxptp: update default config
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Since upstream commit fe01cc7 ("Deprecate the slaveOnly option in favor
of clientOnly."), included in v4.0, ptp4l complains about the
"slaveOnly" option being deprecated on startup.

Update the default config to silence this warning.

Signed-off-by: Florian Larysch <fl@n621.de>
---
 package/linuxptp/linuxptp.cfg | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/linuxptp/linuxptp.cfg b/package/linuxptp/linuxptp.cfg
index f9d02e8d97..09a905ed9e 100644
--- a/package/linuxptp/linuxptp.cfg
+++ b/package/linuxptp/linuxptp.cfg
@@ -10,7 +10,7 @@
 # or the linuxptp SysV init script.
 
 [global]
-slaveOnly		1
+clientOnly		1
 delay_mechanism		Auto
 network_transport	UDPv4
 time_stamping		hardware
-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
