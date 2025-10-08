Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF1B5CCA470
	for <buildroot@archiver.kernel.org>; Wed,  8 Oct 2025 16:23:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2551160E73;
	Wed,  8 Oct 2025 16:23:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PEeKsB-3r8ZL; Wed,  8 Oct 2025 16:23:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2C00E60E74
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2C00E60E74;
	Wed,  8 Oct 2025 16:23:36 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 17C77119
 for <buildroot@buildroot.org>; Wed,  8 Oct 2025 16:23:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 06D9760E6B
 for <buildroot@buildroot.org>; Wed,  8 Oct 2025 16:23:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WyvnKG-KD2Wf for <buildroot@buildroot.org>;
 Wed,  8 Oct 2025 16:23:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.158.146;
 helo=smtpweb146.aruba.it; envelope-from=giulio.benetti@benettiengineering.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 152E860E07
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 152E860E07
Received: from smtpweb146.aruba.it (smtpweb146.aruba.it [62.149.158.146])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 152E860E07
 for <buildroot@buildroot.org>; Wed,  8 Oct 2025 16:23:31 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba SMTP with ESMTPSA
 id 6WwrvyUuj3rWi6Wwrve6nT; Wed, 08 Oct 2025 18:23:29 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Christian Stewart <christian@aperture.us>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Wed,  8 Oct 2025 18:23:24 +0200
Message-ID: <20251008162328.3569687-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfNWeTNmg7nRikH5gf2s679btU26J3qptSA1IiQuvEbuHqlNb0ov7itdNRmypxwZ4gQxxKcVmVCke32/TQBF4m0bysCftgyab6KGD+PPPpp0rhycdFhQ3
 dI0XJs2Du/PTchB6HKnZOFwdGEIu+zwcA7sDWBopLWPwqxESo1n3bc3G2IrocePThPCwZ+XshDD1OgGEiHmaMmckM1o4KDHqQkvd2NZ/V4JAbCVISSR54rXN
 c/T/0eDj/h/Dun0mRz4tFChtLX/gK9bqVmG1C0iqGTFVya1qc9EM9et+NWZaVm6an2vej/6XTp8pGv5gP4y24JpeGfMuteONTURmvHmKcJIVINxgel9VBHg/
 A+bJDxW0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1759940609; bh=IMedXqChlKJtVyHINz/ZxMpT3B1oW5Eus3jVw5Q5U2s=;
 h=From:To:Subject:Date:MIME-Version;
 b=V1TYxVQJg0c/HKVFgXJsd0Hg/UXP3dJ6trCkMjgzfUcQlHkSGlJSJrs9OcO61b448
 R/dXRCWxD0UzOZhA+sEwM5lqoAINZW0dpU6NIsx9byDpJAxI5OeH0GPPI/fwekN/rB
 +I3PQN98YbYeQQeUqZjXbgP5S6ZMFRoKtG97Zaj+c1W58e7mFh5+jONXaGKaZwoOgy
 JuxSzJjUV3WMewdEF8wAt531vCQ6VggzdBdo9gbCydAmYLsTBh1vW1G0TbWYS7wYSl
 fn1u+SIl5Aik3rR54DALPpkfwXbt11JfyzQI/csJmrkn7B9OzQNytBoY2mgyAgXG9b
 /E6KsJMXjEn2w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=V1TYxVQJ
Subject: [Buildroot] [PATCH] package/rtl8723bu: bump to 2025-10-08 version
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

This version allows to build with Linux 6.17

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/rtl8723bu/rtl8723bu.hash | 2 +-
 package/rtl8723bu/rtl8723bu.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/rtl8723bu/rtl8723bu.hash b/package/rtl8723bu/rtl8723bu.hash
index 39d2202d6e..1261139a20 100644
--- a/package/rtl8723bu/rtl8723bu.hash
+++ b/package/rtl8723bu/rtl8723bu.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256  f0d5fecf6f8fd9668d46c462d0cdb13d5cb91ecc383123989812f3d50ff28e65  rtl8723bu-89b6e527ad6bbae19caa6781ebac849b927d87db.tar.gz
+sha256  e9f94b6e6a6412acbef98d5e21f5c5ef185b0d856f35790e328caeb5df40702c  rtl8723bu-bb6fcc9d14b1ec8eb9c3b448c2023fa8fc551178.tar.gz
diff --git a/package/rtl8723bu/rtl8723bu.mk b/package/rtl8723bu/rtl8723bu.mk
index 92fd93ccd2..b324b87685 100644
--- a/package/rtl8723bu/rtl8723bu.mk
+++ b/package/rtl8723bu/rtl8723bu.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RTL8723BU_VERSION = 89b6e527ad6bbae19caa6781ebac849b927d87db
+RTL8723BU_VERSION = bb6fcc9d14b1ec8eb9c3b448c2023fa8fc551178
 RTL8723BU_SITE = $(call github,benetti-engineering,rtl8723bu,$(RTL8723BU_VERSION))
 RTL8723BU_LICENSE = GPL-2.0, proprietary (*.bin firmware blobs)
 
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
