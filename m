Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CDB9C369A2
	for <buildroot@archiver.kernel.org>; Mon, 14 Apr 2025 16:16:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CAD7440E09;
	Mon, 14 Apr 2025 16:16:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ud_BZ5VGQ5os; Mon, 14 Apr 2025 16:16:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EE20441117
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id EE20441117;
	Mon, 14 Apr 2025 16:16:10 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 5591C251
 for <buildroot@buildroot.org>; Mon, 14 Apr 2025 16:16:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3962260791
 for <buildroot@buildroot.org>; Mon, 14 Apr 2025 16:16:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8dnc7UUX27qE for <buildroot@buildroot.org>;
 Mon, 14 Apr 2025 16:16:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.20;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org B86206072E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B86206072E
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B86206072E
 for <buildroot@buildroot.org>; Mon, 14 Apr 2025 16:16:06 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from haruka.home.arpa ([85.22.122.10]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MGyxX-1trOC72vch-00GEGY; Mon, 14
 Apr 2025 18:16:04 +0200
To: buildroot@buildroot.org
Date: Mon, 14 Apr 2025 18:15:45 +0200
Message-ID: <20250414161545.2863615-4-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250414161545.2863615-1-fiona.klute@gmx.de>
References: <20250414161545.2863615-1-fiona.klute@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:k+xxNCYfCk5pXA6WaGDISh4DhO5xCdM7VKhPqjJgIvKK+frmlMV
 4KAle88YGul1nUYMyKKDr8IsugygBa/zgICFSAYy3xpIxXw06kBuErNJIZhhrK+TLkzoeL6
 CG6itjFQiwAG0/Riqir/oJXCUCbvEgpvPnsOmb9g1Q7IX5o9WmDFPPmiFY7yrDkYP0wtUe3
 0p2Y0sW+dB/GBbJ7lj3FQ==
UI-OutboundReport: notjunk:1;M01:P0:ndIFvwI0HoE=;37sRRnqlRdI6n5h+VaWpsB3kEUh
 q6uQXEHNu4ZpPSae93wnp2YnX6CArJQnjrV4ggDqz8Pwo1JdyZfjnVatm2LTyQnRcz9zBIkEg
 gJnNDVcw2AzlL364izsIg95ZyAhWoaXkmF8CboSwpfxiG6YFb2B7K3ZkjoMgLFJeb6vLWMUhJ
 aFV3UUNOB2KdaNSdglaLU29rhcmvNL7mr2u4wz4NeoDZiRpCfpccYObWbJWTIy/aMZHhlKS/B
 fE91SUvHEqm58Kx7AZxxvfI8g9XiORs5mNnFQlhehD9GGXNHP3IDgTe5s6RizlpCkY60uZKqA
 1YAsOBlEfglrxQze0zZaHA8HYsr7yNqzXhZK/7b0Z5plGRmCBbUqNIWN18Pji96OQ9eJ5Qygl
 9Mx3XwL4ijlRg5oeo/Lf8sP29s7VuAWaBdTOkD4W+80ubV6avOStAJM9SocBNimY901Lgz34j
 YAT6WP/9zxxqLyboyOKjZ0PSQws5i+oU2NP+zo6AuzPvhBnGhKMzeNJq3FsiQP5g+lgdTeTkx
 GIakgqBMh69WgoeY2ISfKYVTw+Zq3dvnz6J0cliHbMRhqwZMk6dbMKiFcBArh5WYBKJ4UsJSW
 YY+E0U+rtPb7dbj1HTpTNi3ub7xqInbwdE6aaL1MO6cTLe+cFP1ilqzbzu7kf5v3ROiZBpuPB
 cfk8wXB0uOVPJeJAfZY9VnOSTI3Dh2epxX2b6RBBKYNZCZOmoyaOg227k2v2hhPCSOfCm1QsQ
 tl0lcNre6DHpMLFPWHU8kRgrO2p2qFr5S0lfmkOBwKCXixzWyn4hQ08GA6KDnFloxsTUOWQAN
 Ztk6YoezR8+nECwkscXBW7DC5Rt8DJl4saPuMK2XXTyiUs20mmUFruddzufExQxM0bO+astC/
 PJ5NXt1oIscQiw8JCsAQCMVmVgBue9apNhuRUSxGaxm87r1Z6j81dDxdXvhe3TEkIWNqxhebw
 9Wf2dU2/PMbHQpVYwWt8EMO5j7UbbqzEIRnDGcTma479asJ7wZuoDds6FdMKd2kwK07VjOQsK
 fZAxoCfYJftgALGQvWQGY0gsvPRzWdcYgRcpPngoh4QZtFOiHpL6bNjlYZA0aKihJ4IwcHKiu
 3bKzL59/70pyqQ6IIjulRqYyNtiTkHLf3z6VDJdKQ4DT/aowA9LgNHnZyNgCdwEY0hDpUkwoh
 G0mH6z/0JfKJvODrV2exO2duvQPOnX0HUGetzul2dVgunv+PJkzqp5DCUZuWpH+nAIXtOPEo7
 hgj5nffwJij+kDD8eyv10+PSP3UtYEx12HxI2pb75xy+PwCJlCs27BWIAmhrpq15Zr58h9+yp
 vQbPIMbEjw0rx0uChlSTmpWzJap/SZg/px2jg7k3VHXerO/xkH22cjJZs7l7J1toOuhRMlEVU
 +nhhlDk1Hk/aGo8TJ3ENvDoBkcZ/2X7Ui+k1wKoJ0JADv+vZ8Ur8xsn+meec3a/mzu2rZjpv9
 N0Tbw/GP682VosIGw97fMCuj3XYkjN29C/OYOmsAlveE9rPyd
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1744647364; x=1745252164; i=fiona.klute@gmx.de;
 bh=UH5Zk4vgkZuK/ONBcU+/VHddlsZfdxj0qGv8jct/JSU=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=ZTRN5gG67qRaps97DKJhM3H6xUtewkbECUdvMzxy5oLkfjw8BL8n2Fc8fqKJdhb2
 rh78+36W6Wu2ibRpSJ4C8g9cjTT1MGbb7MPXTFRiH4ukUEBCNIFyxTXZc2jixTgcv
 w3ZBwVIzrss8Q5MSHkkWBzFb+Rcd55HZPyThVTQS5ph9nTi2AyJOGiFe6tCAobin8
 X5fF12BhI1BKsjXrib2ZFLQS0MV990NPHPoc98mtWi/OL/WmdpeTyk7dXryt8IEY1
 ebJSLNkU0t1tBb5yQc+ufag3iDltQPbPI8nu47R0hqOjykXO2+VzGpQBJA9O33q3d
 SU0PtwLl+EEagrWDyQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.de header.i=fiona.klute@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=ZTRN5gG6
Subject: [Buildroot] [PATCH v4 4/4] package/libglib2: bump version to 2.84.1
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
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 "Fiona Klute \(WIWA\)" <fiona.klute@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: "Fiona Klute (WIWA)" <fiona.klute@gmx.de>

Bug fix release, upstream changelog:
https://gitlab.gnome.org/GNOME/glib/-/blob/2.84.1/NEWS?ref_type=tags

Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
---
Patch added in v3 (new upstream release).

 package/libglib2/libglib2.hash | 4 ++--
 package/libglib2/libglib2.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libglib2/libglib2.hash b/package/libglib2/libglib2.hash
index 9bc244ff22..5985c82d8a 100644
--- a/package/libglib2/libglib2.hash
+++ b/package/libglib2/libglib2.hash
@@ -1,4 +1,4 @@
-# https://download.gnome.org/sources/glib/2.84/glib-2.84.0.sha256sum
-sha256  f8823600cb85425e2815cfad82ea20fdaa538482ab74e7293d58b3f64a5aff6a  glib-2.84.0.tar.xz
+# https://download.gnome.org/sources/glib/2.84/glib-2.84.1.sha256sum
+sha256  2b4bc2ec49611a5fc35f86aca855f2ed0196e69e53092bab6bb73396bf30789a  glib-2.84.1.tar.xz
 # License files, locally calculated
 sha256  fa6f36630bb1e0c571d34b2bbdf188d08495c9dbf58f28cac112f303fc1f58fb  COPYING
diff --git a/package/libglib2/libglib2.mk b/package/libglib2/libglib2.mk
index a1a3954914..baa75fd10b 100644
--- a/package/libglib2/libglib2.mk
+++ b/package/libglib2/libglib2.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBGLIB2_VERSION_MAJOR = 2.84
-LIBGLIB2_VERSION = $(LIBGLIB2_VERSION_MAJOR).0
+LIBGLIB2_VERSION = $(LIBGLIB2_VERSION_MAJOR).1
 LIBGLIB2_SOURCE = glib-$(LIBGLIB2_VERSION).tar.xz
 LIBGLIB2_SITE = https://download.gnome.org/sources/glib/$(LIBGLIB2_VERSION_MAJOR)
 LIBGLIB2_LICENSE = LGPL-2.1+
-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
