Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58C1DC4345F
	for <buildroot@archiver.kernel.org>; Mon, 22 Apr 2024 07:38:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 18B8D404BF;
	Mon, 22 Apr 2024 07:38:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dm5WPZzGzJ6Q; Mon, 22 Apr 2024 07:38:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EFCA4404C5
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id EFCA4404C5;
	Mon, 22 Apr 2024 07:38:46 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0E2751BF2EC
 for <buildroot@lists.busybox.net>; Mon, 22 Apr 2024 07:38:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 07E4880BE5
 for <buildroot@lists.busybox.net>; Mon, 22 Apr 2024 07:38:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9uv9jgnbIQ8e for <buildroot@lists.busybox.net>;
 Mon, 22 Apr 2024 07:38:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.22;
 helo=mout.gmx.net; envelope-from=ps.report@gmx.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 8B83680B6F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8B83680B6F
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8B83680B6F
 for <buildroot@busybox.net>; Mon, 22 Apr 2024 07:38:42 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost.fritz.box ([212.114.183.37]) by mail.gmx.net
 (mrgmx105 [212.227.17.168]) with ESMTPSA (Nemesis) id
 1Mq2nK-1sTD373tnG-00nCkO for <buildroot@busybox.net>; Mon, 22 Apr 2024
 09:38:40 +0200
To: buildroot@busybox.net
Date: Mon, 22 Apr 2024 09:38:39 +0200
Message-ID: <20240422073839.12672-1-ps.report@gmx.net>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:2Fno1Jycv2jZzderJoEjPLHrDmsOxnCZSg+/COjC3Pwxe7kMsia
 t6NZshPdj+97rdhRJXA1j1jqYItvyxBoyMt4QA7sju1UuoWGlE5sqc1v2+QJEkKZ2eqsiSK
 sRifeveFJFVIX1snPhLb/4SaWp01ixC4fdATRFqA36BG7BjTm1UnfhV5LyGaRankB0MMKn1
 402s7qw6KmWwokDBrqfyQ==
UI-OutboundReport: notjunk:1;M01:P0:/TtGcKmj8A4=;sbtEsZFyADDM1Qd9j7aIVuhqHVz
 pUYl8KNeiEAO7Jr9VN7DyZpaDfVx40kQ6CES9UvjI7SD05uHL+IN/x7AjXlRd1KSCq8/OJJD6
 L10mYumJWkCli8ISLEBuUxkIgcS49rcFAWfCzwodsTcUAwc4KCBgVzKn05Q2bwdyYeyaGjsI+
 2gTWLDBtYWXQ09L0R8X/POHRbv6Ynajn8QBbEUd1rgso30BRMoXWgAefPsZnksCLCbooiYevb
 oMpviggjfuwY74JtlZHt5zRicDONRMweY+BXi1IwCYxUSvA9kl1+RbTH0gC5Iavar0aVvf+gI
 tpi4/zx6dd0uwOWvfN53At4Yztb6aBQeR3zB7mK5VILd3phWXWxczIUdWGphUf4nrqR2M4DJs
 HSN3MetuLg4BJVczLOt1DL7oa4lL1IaKIYkwzC8wLcsc7op5g6wS71KciwVEH6TCGKGCAnFSm
 0YZu3QA3Gi/vMvoiM28n2Q7XKBeM50uf6962xNQS23Nu/iImXeVqs5qz4W2ZkmI4cW994aKPg
 UMADga+IrxNhblTZBR6L+domZpvcSSP7k2uIXqMt+v+rYYBAgIftTGZlV9y6JHvzuI3vluoUA
 KF+EAhrORl7bug/m3f26FXXI0+KVz9tbgfNrPZYKE8L53gfrvSydHUaRg1LsFhT1/WyVaO4+8
 HNKNgzZjNrxhMMgfiuE4AQMH9fZd//79z26f42jv72NPSwo10lHLjhcV43Pvs5wNZyHhGBbZY
 mOGG76Hc5vhkmE/kZsNwOMIF34Rhx9QNrwlLftGmbESanx3Xsotf67IO3Z2padi/Yv1kjoCqv
 1z0srw9PzYwXxDENWHIDq9ig0nrIAoIFYX8p3aO0x0AFs=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.net; 
 s=s31663417; t=1713771520; x=1714376320; i=ps.report@gmx.net;
 bh=Jt4FtI6HFCB3DSenpnGohX6I5iIIFWQ2VJptghO3Dpc=;
 h=X-UI-Sender-Class:From:To:Subject:Date:Message-ID:MIME-Version:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=gUrHAhkaAJQrZya7Iv3rARUhWCNgV420O2QMxYbVmix1jcuwBdrhA4gvWJ6lVud+
 qtTZ4RK6wIk0APi/XdIA1K/dmOnFFIR9jVz0+scd0h+SEjKjB6r0zex1C4RRdIapb
 IyHToeBmHvPjfNYOR5ZWGUv3EEd6r8p6g9I6IEy9dR1TtWMUqUJKp0a8pJnpOCArN
 tF9/kyNaFTyDMqX1GQBFgIHM15IFCNYCtxZsE+Lb3zEC8/h57g5B56OgGlrujUwUc
 RNQvJXBxi6WKpU8gDCl3rZtPVgwgUzkiZnSyp4VgX3Qrnv24XtbTO7s1Nug2ZdUBu
 /8J6I4xnZvN3qRY4qw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.net header.i=ps.report@gmx.net
 header.a=rsa-sha256 header.s=s31663417 header.b=gUrHAhka
Subject: [Buildroot] [PATCH v1] package/speechd: set CPE_ID_VENDOR (to
 silence mismatched CVE warning)
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
From: Peter Seiderer via buildroot <buildroot@buildroot.org>
Reply-To: Peter Seiderer <ps.report@gmx.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- set CPE_ID_VENDOR to silence mismatched CVE-2001-0956 ([1], [2]) warning
  clearly aiming some other product/version ("speechd 0.54 with Festival or
  rsynth speech synthesis package")

[1] https://security-tracker.debian.org/tracker/CVE-2001-0956
[2] https://github.com/advisories/GHSA-67cw-4jhh-3jm7

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/speechd/speechd.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/speechd/speechd.mk b/package/speechd/speechd.mk
index 7d50f88c1d..669bec0634 100644
--- a/package/speechd/speechd.mk
+++ b/package/speechd/speechd.mk
@@ -8,6 +8,7 @@ SPEECHD_VERSION = 0.11.5
 SPEECHD_SITE = $(call github,brailcom,speechd,$(SPEECHD_VERSION))
 SPEECHD_LICENSE = GPL-2.0+, GPL-3.0+ (buildsystem), LGPL-2.1+
 SPEECHD_LICENSE_FILES = COPYING.GPL-2 COPYING.GPL-3 COPYING.LGPL
+SPEECHD_CPE_ID_VENDOR = brailcom
 SPEECHD_INSTALL_STAGING = YES
 # speechd source code is released without configure script
 SPEECHD_AUTORECONF = YES
-- 
2.44.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
