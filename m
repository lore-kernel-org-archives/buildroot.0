Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B370C282EC
	for <buildroot@archiver.kernel.org>; Tue, 11 Mar 2025 11:25:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BE8D8606D9;
	Tue, 11 Mar 2025 11:25:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2195PQKY6Tok; Tue, 11 Mar 2025 11:25:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BCD0A60709
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id BCD0A60709;
	Tue, 11 Mar 2025 11:25:25 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id DE3141DA
 for <buildroot@buildroot.org>; Tue, 11 Mar 2025 11:25:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CD8654072E
 for <buildroot@buildroot.org>; Tue, 11 Mar 2025 11:25:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MF3Py29yqxng for <buildroot@buildroot.org>;
 Tue, 11 Mar 2025 11:25:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.22;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 25F9240702
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 25F9240702
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 25F9240702
 for <buildroot@buildroot.org>; Tue, 11 Mar 2025 11:25:21 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from haruka.home.arpa ([85.22.124.191]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Ma20q-1tfwfD0zQq-00YlVu; Tue, 11
 Mar 2025 12:25:19 +0100
To: buildroot@buildroot.org
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 "Fiona Klute (WIWA)" <fiona.klute@gmx.de>
Date: Tue, 11 Mar 2025 12:25:09 +0100
Message-ID: <20250311112509.2245199-1-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
X-Provags-ID: V03:K1:L3nHipR14Ilu+yxceYeeYOT7diZsQ7zi8/jCLy1HpsH5VgMNp9/
 /EntXUSIIGPbE/xw8SfUBnvX7f7R1cGCVWB+L2d/BqtPfZQZ7jLDxOdbnZsjbmI1UyymJyN
 CejSQ+Tr1TZykhtvxm+zKFQArJb2Iy9lQX+7QLB0CAh+itTkIQeG+zwgBniVLCdOGj58bao
 JbmtmaEDJ52adPgu2IN2A==
UI-OutboundReport: notjunk:1;M01:P0:HCndsv9ubD4=;yZ4RpXv09hADPRxFSgfRFJDNqKt
 YIs3SURpyxDwl7opRi0vTaVT8d8h4xdtB9ZicDUiGWsIEiRwWdFF/KTlhqJl2NbfJuLH3FsFT
 LTx6g2dUkBAYnDFCiR5YlX8oNbtdq8DM8v2ftwUzsgUkg/ddlkTGceUGj3lbsBPMx36JtlT7v
 Dqm3bTLnKr6JOGzFMjIMel16reqQyZqveKu5Bw64s0TKhXmaWBgHPFieHRHkqAxyWLIawtYM0
 dY5qhZlN3T9UZQbfKN6x3ZoW/9d0f5L3SNgzED2lMj7BoDH9wxnPky3BxCgakQM5kWfmV1vKU
 qMrz6X3NRXLbIOc0aGWRh8SxBmt735kSarC1LAl7IDXFBwfQ2E7PYVb0ruAX9LfNp5OHjHabZ
 WpcT7FE7UDwati6XqV1qxCRlTWCHIRhYQHSqghOQARJyqexTYjNUWMWJk+kHFcifi+iTps9TS
 mQi1mZsqIFJB5tPJygCgQP7GAYlhYdFS93CYu53byXLCF9lVb00c7xQN0G5NYJbAhhAyCeDAP
 nGsNsZzxM41gql//TjhZ2D/V7erbV/HA1M4Zom5WWJtfRg13Orgz71fcVsBiws12cYAmOX7do
 qpV2IYsTCdgAZCz05cSbJI7mQxRt1kttkRtCZp2wSPGZGS3vs0+7PJUp8wrtoDyNSX6RGb3ri
 Ctf+EVN0gCfxkqoUsI1WdUzJiy6mQLPdIMGET0zg5CBxjJasD74u9RNXpTWBfnVn4LHZWRM0p
 SN9r8AVZN1v+AV4MDBUz0R4CnaZvyqLuiHxazFOrGO1wd50m0O+HFHPcpS2GODDcDPqyN6JEZ
 fcC+ypuBRZe0kRsBNyQj2DZ3me3KAM6fna2o5bjlXpAAwaPyXnrjTw7F43VOZx5tMmvgrBnC/
 cEsHR9kjIiQ5k18Dif7UCrWpBS+LKBrKFg8fjAGenGyUXtnFXCsut4sQeJ0ZVQ2WmgZM2750U
 NY35OdiMO8rVJ9X96NGNmz6SFfSMadXNQoSWmNO0/YmImjEWfD7ECK06SthbUHxZAEt8AnVL0
 TJzq4HeWxeo7bqH6dK7DeEa8VBa5KrqBtqaSgH+ts2ZVj4vt7t6fHO4Xm8aKy99XQLSPnAR8j
 sYDaI2rrT2bBE7XgYF0X4kR1qFAuOdrfUhrKK0vG8tvx7ScIUvv3Rz7lQ4DWbcOLFVrCf8FUV
 d8dj9+JrSzrNQMOtwEVnROU29s9q723/JZR870EraIxiO2oOtu6ELmyxecgiuJRwhbIAznt/l
 wOnH6WicFEsI9Hrr8cB6iUVLa3Dl/XAXIp8xIYPN8ktKvfhQ4Rgl3xhzlwdk2Suj77m9L3vce
 d9CKf8y9pDheX9XXYFpAJa9mqIMxtEblMEruEoS68/rptjjyhSEUaj61XyFTNEYXByxhq0SUZ
 0MrYD6zlKDg6tiemdfhUd4rnDeykQee4PS0aQmIpjOULv7OFPtYuIlWPixD4KpEWYFRMF5R64
 buEIhLNfcUeSAPc/DQk6BfdOLBihGk0j2BzySHw4pYjIoOWnN
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1741692319; x=1742297119; i=fiona.klute@gmx.de;
 bh=076t4LHexIX5zhfwcsCbVV47wvVWYa/jUD2jhvLKnS8=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
 MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=FLGrgvMB7uwE/cRIKZfMAhzNe526+fsfIJc1/XRGqf/s6/pkzppay5zXplMx8lb9
 E7zKE8kLIDA37ACwtYaxh/dLDmsInWWxOqSj2c2OWvyTi0O3z61318aXMVPnpshuh
 o5lYgVu1pxlH57kBtMLWPdQVBetl++t71uBZ3wtsiJy+w6utud6OqWwpsQ/VC5baf
 aj5Qo/OjvVt7Vb/rRvkQpYc+eXW2pcBKTV5sjywNEWWpYoDpVBfVlDVcmmkY/MrL4
 xQqawqLkrG5r4sPwS5QXzeNfPNB0CYtj5/KNjm4f7o8Wm6pk8OiSdS4ureZQG2miX
 bF1oUyjdOSKH8JgrkQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=FLGrgvMB
Subject: [Buildroot] [PATCH 1/1] package/libglib2: bump version to 2.84.0
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

Upstream changelog:
https://gitlab.gnome.org/GNOME/glib/-/blob/main/NEWS?ref_type=heads

Note that upstream is planning to require C11 starting with 2.85.x,
and encourages people who would have problems with that to file
issues: https://gitlab.gnome.org/GNOME/glib/-/merge_requests/4473

Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
---
 package/libglib2/Config.in     | 2 +-
 package/libglib2/libglib2.hash | 4 ++--
 package/libglib2/libglib2.mk   | 4 ++--
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/libglib2/Config.in b/package/libglib2/Config.in
index 393a7f4405..a875203da7 100644
--- a/package/libglib2/Config.in
+++ b/package/libglib2/Config.in
@@ -12,7 +12,7 @@ config BR2_PACKAGE_LIBGLIB2
 	help
 	  Low-level core library that forms the basis of GTK+ and GNOME.
 
-	  http://www.gtk.org/
+	  https://www.gtk.org/
 
 comment "libglib2 needs a toolchain w/ wchar, threads"
 	depends on BR2_USE_MMU
diff --git a/package/libglib2/libglib2.hash b/package/libglib2/libglib2.hash
index 8bd4bf157d..9bc244ff22 100644
--- a/package/libglib2/libglib2.hash
+++ b/package/libglib2/libglib2.hash
@@ -1,4 +1,4 @@
-# https://download.gnome.org/sources/glib/2.82/glib-2.82.5.sha256sum
-sha256  05c2031f9bdf6b5aba7a06ca84f0b4aced28b19bf1b50c6ab25cc675277cbc3f  glib-2.82.5.tar.xz
+# https://download.gnome.org/sources/glib/2.84/glib-2.84.0.sha256sum
+sha256  f8823600cb85425e2815cfad82ea20fdaa538482ab74e7293d58b3f64a5aff6a  glib-2.84.0.tar.xz
 # License files, locally calculated
 sha256  fa6f36630bb1e0c571d34b2bbdf188d08495c9dbf58f28cac112f303fc1f58fb  COPYING
diff --git a/package/libglib2/libglib2.mk b/package/libglib2/libglib2.mk
index 6c012c79c7..a1a3954914 100644
--- a/package/libglib2/libglib2.mk
+++ b/package/libglib2/libglib2.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-LIBGLIB2_VERSION_MAJOR = 2.82
-LIBGLIB2_VERSION = $(LIBGLIB2_VERSION_MAJOR).5
+LIBGLIB2_VERSION_MAJOR = 2.84
+LIBGLIB2_VERSION = $(LIBGLIB2_VERSION_MAJOR).0
 LIBGLIB2_SOURCE = glib-$(LIBGLIB2_VERSION).tar.xz
 LIBGLIB2_SITE = https://download.gnome.org/sources/glib/$(LIBGLIB2_VERSION_MAJOR)
 LIBGLIB2_LICENSE = LGPL-2.1+
-- 
2.47.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
