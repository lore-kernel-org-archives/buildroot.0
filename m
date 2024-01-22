Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B84CFC47DAF
	for <buildroot@archiver.kernel.org>; Mon, 22 Jan 2024 13:15:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3D6F160F51;
	Mon, 22 Jan 2024 13:15:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3D6F160F51
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GnMy7H8EiCyC; Mon, 22 Jan 2024 13:15:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 97A1060F34;
	Mon, 22 Jan 2024 13:15:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 97A1060F34
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D2A7B1BF401
 for <buildroot@lists.busybox.net>; Mon, 22 Jan 2024 13:15:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AA0AD801E8
 for <buildroot@lists.busybox.net>; Mon, 22 Jan 2024 13:15:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AA0AD801E8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id R6wMGMdChrtH for <buildroot@lists.busybox.net>;
 Mon, 22 Jan 2024 13:15:05 +0000 (UTC)
Received: from smtpdh16-1.aruba.it (smtpdh16-1.aruba.it [62.149.155.100])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 26E6B81BA8
 for <buildroot@buildroot.org>; Mon, 22 Jan 2024 13:15:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 26E6B81BA8
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba Outgoing Smtp  with ESMTPSA
 id Ru8jrpDYafJYdRu8krOEiZ; Mon, 22 Jan 2024 14:15:02 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Mon, 22 Jan 2024 14:15:00 +0100
Message-Id: <20240122131500.1935387-3-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240122131500.1935387-1-giulio.benetti@benettiengineering.com>
References: <20240122131500.1935387-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfNm/htpACv/WLQddIAvmpjXrfnn/0kP3t2gtTohngp5kDge3VxIKZb9Lk0t9Xh9ZMQnxMJeyNKq7YBNqkAepyvgouo0CjDsZ4moW2pxU9E7So8UwRG23
 dgkrmYWyk3Lu+Sj6XGyNe3p+n57fHt6A2c7XBq/kkxhp2GsChM2pTDGYvclop3tRzpZJ9SQLQCijFc8B613K6JChUN327pEQG33lHWNiTmQliYivLKnjjUGz
 E52LcKgqr3fSHE2EohxmKNXbAI4lBCvUq3lycfEUC7lSBwTTqVcNt0OysKPGjEADR/SHH8SeWZL3ilWkAJ/DY/eBpgLasx8IBBHhEHcnGu7BNXI9CLEsxO8Q
 qO1mixCrkiIUHfKhPlCdjhfSv/uqBw==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1705929302; bh=S99ptXfDcbOq73LxvLKZxaToN+a5YhMAzMcJkRLLg+k=;
 h=From:To:Subject:Date:MIME-Version;
 b=UdQ0Gvgj3kcR/nFSLHzR4eZK0FftaCiuZYH6FoKivPKG7sR3pZW+sDI0Y5/kSRtZo
 wyxEB6yHNEsYS1oc0jT/zxsB2yBVCbGEScUxiIqy3xcdLRMccHAdS65j4EbtfJxaEe
 AkYiwm96DedRZ3//myWYyp7vr4lZCYbbw/Bv5B6kLv1wq/vpepfCj2ZbY3c+QmDUT1
 X0KvzyOA9r0LuX6zdVDw+V0YHevEO7cfrPh0gKup45hwPOF+JBWe2JjuFCdZ/8GvQ5
 aShjRQWR1IUwKO72bwxrdjfiuc6lcnYuZMYkEwYrHnPHsWri0y04x1HXEmAnmp97OU
 grYxOwWZK/1Ag==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=UdQ0Gvgj
Subject: [Buildroot] [PATCH] package/rtl8189fs: bump to version 2024-01-21
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
 package/rtl8189fs/rtl8189fs.hash | 2 +-
 package/rtl8189fs/rtl8189fs.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/rtl8189fs/rtl8189fs.hash b/package/rtl8189fs/rtl8189fs.hash
index 377812fba8..3c34fbc07f 100644
--- a/package/rtl8189fs/rtl8189fs.hash
+++ b/package/rtl8189fs/rtl8189fs.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  9ff7aa9ee8cd7a8f386531d3b009e7bcbce1ff71bb676c187c40e538755eb8b5  rtl8189fs-75a566a830037c7d1309c5a9fe411562772a1cf2.tar.gz
+sha256  21044732f402452e587afdd5f2d96a466209b9acf2b24f70c83e1e5cc0eca5d6  rtl8189fs-e9f204d41a1dc837af15bccb50127ecc9d722d8f.tar.gz
diff --git a/package/rtl8189fs/rtl8189fs.mk b/package/rtl8189fs/rtl8189fs.mk
index bd29469242..8d2e044f14 100644
--- a/package/rtl8189fs/rtl8189fs.mk
+++ b/package/rtl8189fs/rtl8189fs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RTL8189FS_VERSION = 75a566a830037c7d1309c5a9fe411562772a1cf2
+RTL8189FS_VERSION = e9f204d41a1dc837af15bccb50127ecc9d722d8f
 RTL8189FS_SITE = $(call github,jwrdegoede,rtl8189ES_linux,$(RTL8189FS_VERSION))
 RTL8189FS_LICENSE = GPL-2.0
 
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
