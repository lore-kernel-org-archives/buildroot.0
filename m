Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB4FEC47DAF
	for <buildroot@archiver.kernel.org>; Mon, 22 Jan 2024 13:15:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6682160F85;
	Mon, 22 Jan 2024 13:15:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6682160F85
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wF9P629qKZE3; Mon, 22 Jan 2024 13:15:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B3B7260F7E;
	Mon, 22 Jan 2024 13:15:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B3B7260F7E
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id EACF31BF94D
 for <buildroot@lists.busybox.net>; Mon, 22 Jan 2024 13:15:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C34C44031E
 for <buildroot@lists.busybox.net>; Mon, 22 Jan 2024 13:15:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C34C44031E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WBK2Eft0zJfp for <buildroot@lists.busybox.net>;
 Mon, 22 Jan 2024 13:15:05 +0000 (UTC)
Received: from smtpdh16-1.aruba.it (smtpdh16-1.aruba.it [62.149.155.100])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2F1DA416AA
 for <buildroot@buildroot.org>; Mon, 22 Jan 2024 13:15:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2F1DA416AA
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba Outgoing Smtp  with ESMTPSA
 id Ru8jrpDYafJYdRu8krOEhw; Mon, 22 Jan 2024 14:15:02 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Mon, 22 Jan 2024 14:14:58 +0100
Message-Id: <20240122131500.1935387-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfNm/htpACv/WLQddIAvmpjXrfnn/0kP3t2gtTohngp5kDge3VxIKZb9Lk0t9Xh9ZMQnxMJeyNKq7YBNqkAepyvgouo0CjDsZ4moW2pxU9E7So8UwRG23
 dgkrmYWyk3Lu+Sj6XGyNe3p+n57fHt6A2c7XBq/kkxhp2GsChM2pTDGYvclop3tRzpZJ9SQLQCijFc8B613K6JChUN327pEQG33lHWNiTmQliYivLKnjjUGz
 E52LcKgqr3fSHE2EohxmKNXbAI4lBCvUq3lycfEUC7lSBwTTqVcNt0OysKPGjEADR/SHH8SeWZL3ilWkAJ/DY/eBpgLasx8IBBHhEHcnGu7BNXI9CLEsxO8Q
 qO1mixCrkiIUHfKhPlCdjhfSv/uqBw==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1705929302; bh=91uCBkEzVhNO5Eenbhsg00lJrJsPp6pjFToIOpvECZo=;
 h=From:To:Subject:Date:MIME-Version;
 b=Q8Hd14RNYGOTviDgpzDObBQiDcNE9MxeD8ZvU4OyFcIwQzNP1PosX8CEO2dq9MIVI
 1ZTrwoEzGG4xEgk4kOQ82XjyLJJU6/mVzISoonzt1EWlotkY4bKyNVO7vbI3qwp1pz
 Wmjqnu4Dv/K99R443pMHICZYS0H4Ue1bWLxK0mccAGsjFfOnGeyh8DYz+QVNo9wnZ/
 zic3vUy1gd028JcdRakZ80/qaM+zk7VGLl9PbZRK7VtOS6rVOXI2AXRcVR8gy3QIez
 u3loHZZZnNsU/TnNThoTmBbzCaAu0QKXz/nEVo/87AWSr9BnOZhOKSBqiO8YsmUedZ
 nA7F/LGwDgL1Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=Q8Hd14RN
Subject: [Buildroot] [PATCH] package/rtl8821cu: bump to version 2024-01-21
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
Cc: Louis Aussedat <aussedat.louis@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Christian Stewart <christian@aperture.us>,
 Sergey Matyukevich <geomatsi@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

With this version we can build with Linux 6.8.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/rtl8821cu/rtl8821cu.hash | 2 +-
 package/rtl8821cu/rtl8821cu.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/rtl8821cu/rtl8821cu.hash b/package/rtl8821cu/rtl8821cu.hash
index 3d7a1be9d1..b3d6d2c569 100644
--- a/package/rtl8821cu/rtl8821cu.hash
+++ b/package/rtl8821cu/rtl8821cu.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  5226fefd72d2dd2b8048a8d836f731139ddcb9a34eab68e9b07acee6ee5d8553  rtl8821cu-eb52ece92607394ecc22e96b41671ec3e5b1fa30.tar.gz
+sha256  3ccec54462a8668142a9c2b2ddfffe4e0434feebe6caf6a7de6812dc8713c37f  rtl8821cu-5b39398e2de146edeb76716420f3288f508bea61.tar.gz
 sha256  22cdb0a9cf492dbf05c5b27381a5c0e73ae0d4622427b522b0ba92b7495e5fb0  LICENSE
diff --git a/package/rtl8821cu/rtl8821cu.mk b/package/rtl8821cu/rtl8821cu.mk
index 8f344d518f..8cb8ea710b 100644
--- a/package/rtl8821cu/rtl8821cu.mk
+++ b/package/rtl8821cu/rtl8821cu.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RTL8821CU_VERSION = eb52ece92607394ecc22e96b41671ec3e5b1fa30
+RTL8821CU_VERSION = 5b39398e2de146edeb76716420f3288f508bea61
 RTL8821CU_SITE = $(call github,morrownr,8821cu-20210916,$(RTL8821CU_VERSION))
 RTL8821CU_LICENSE = GPL-2.0
 RTL8821CU_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
