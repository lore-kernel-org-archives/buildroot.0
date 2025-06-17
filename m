Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F3EEC71136
	for <buildroot@archiver.kernel.org>; Tue, 17 Jun 2025 09:21:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C10C2820B4;
	Tue, 17 Jun 2025 09:21:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tUpqReX15mZi; Tue, 17 Jun 2025 09:21:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ED83981F91
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id ED83981F91;
	Tue, 17 Jun 2025 09:21:29 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 471D916B
 for <buildroot@buildroot.org>; Tue, 17 Jun 2025 09:21:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4362660B63
 for <buildroot@buildroot.org>; Tue, 17 Jun 2025 09:21:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id h_LJCBi1WRmo for <buildroot@buildroot.org>;
 Tue, 17 Jun 2025 09:21:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.21;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org E6EC260B3C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E6EC260B3C
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E6EC260B3C
 for <buildroot@buildroot.org>; Tue, 17 Jun 2025 09:21:26 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from haruka.home.arpa ([85.22.115.88]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N1OXT-1uuVce2lwp-00rEx8; Tue, 17
 Jun 2025 11:21:23 +0200
To: buildroot@buildroot.org
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 "Fiona Klute (WIWA)" <fiona.klute@gmx.de>
Date: Tue, 17 Jun 2025 11:21:07 +0200
Message-ID: <20250617092107.417361-1-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:gpo2pDMufU3SQKF8U3gEvv18RHxHz+9j5wu80zsR54ju6DZoEuP
 0/WUi+9h//k8SU4UW8RIBoAemQis23wdsxhZhWFWx9p38oxp2tcvSRDCklHlbjJ+ormzKYG
 a3/DTVNVnULaWj4iPbOYpOMtag4F7WSVmGUA0h26a2IabY2j7GZPpwxY5ba0LkZehc+rqGp
 xB8ILr7IpYIGyUgjGewFw==
UI-OutboundReport: notjunk:1;M01:P0:xzbrjC7Vbvo=;RLICjrKGf6Vo4k2GxVe1LODAYyH
 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
 KUpdEyEn6kAI1gCR
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1750152084; x=1750756884; i=fiona.klute@gmx.de;
 bh=8nXTjVDk2twnoRaAKKgXyH50gnnQ23O+w0UnnQ6JkG4=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
 MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=FA9vDhDCUNPh+iZUAl48jUy9d3dxt3idV+Z3PiBfSMAJhaZgReRTtzUBl7H0+QmW
 aU4eR64+xfy4h+dGQ8QxJqwYfAqJ0DfwFFr2ecx/D8WpMgtOYVancrn7KYbe4/IFz
 eHWwKATSOu/33nEtaJNcA8AIBmqq1ZqcZUtxfDqvvKhvL9CBFZfABEGJ0GsqZsfDU
 UhKxaWATzIijhZEFxtnTWryABYdh6M+edGG2g9PiSYcNxBDqu+Csa/cJv7dqjHdYw
 anVNSfBG/g1PriBUViUGg3+x3ItlwJqKwLZToHjCsDg823Wh9zBCPzZ7ZTpUe4+TK
 NVzeKuef7YMZ/lguAw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=FA9vDhDC
Subject: [Buildroot] [PATCH 1/1] package/libglib2: security bump version to
 2.84.3
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: "Fiona Klute (WIWA)" <fiona.klute@gmx.de>

Fixes CVE-2025-6052, see [1] (backport of "gstring: Fix overflow check
when expanding the string" [2] to the stable 2.84 series).

[1] https://gitlab.gnome.org/GNOME/glib/-/merge_requests/4656
[2] https://gitlab.gnome.org/GNOME/glib/-/merge_requests/4655

Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
---
 package/libglib2/libglib2.hash | 4 ++--
 package/libglib2/libglib2.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libglib2/libglib2.hash b/package/libglib2/libglib2.hash
index bfa74f7505..9ed0b204ee 100644
--- a/package/libglib2/libglib2.hash
+++ b/package/libglib2/libglib2.hash
@@ -1,4 +1,4 @@
-# https://download.gnome.org/sources/glib/2.84/glib-2.84.2.sha256sum
-sha256  88e960dd937057407d61fcb3b45a860704b25923c37ae2478b85f2ecb5a4021f  glib-2.84.2.tar.xz
+# https://download.gnome.org/sources/glib/2.84/glib-2.84.3.sha256sum
+sha256  aa4f87c3225bf57ca85f320888f7484901a17934ca37023c3bd8435a72db863e  glib-2.84.3.tar.xz
 # License files, locally calculated
 sha256  fa6f36630bb1e0c571d34b2bbdf188d08495c9dbf58f28cac112f303fc1f58fb  COPYING
diff --git a/package/libglib2/libglib2.mk b/package/libglib2/libglib2.mk
index 05f6ac0c20..7eda9742c1 100644
--- a/package/libglib2/libglib2.mk
+++ b/package/libglib2/libglib2.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBGLIB2_VERSION_MAJOR = 2.84
-LIBGLIB2_VERSION = $(LIBGLIB2_VERSION_MAJOR).2
+LIBGLIB2_VERSION = $(LIBGLIB2_VERSION_MAJOR).3
 LIBGLIB2_SOURCE = glib-$(LIBGLIB2_VERSION).tar.xz
 LIBGLIB2_SITE = https://download.gnome.org/sources/glib/$(LIBGLIB2_VERSION_MAJOR)
 LIBGLIB2_LICENSE = LGPL-2.1+
-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
