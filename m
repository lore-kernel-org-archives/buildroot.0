Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E798C369D1
	for <buildroot@archiver.kernel.org>; Fri, 25 Apr 2025 22:27:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8D31C608D4;
	Fri, 25 Apr 2025 22:27:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7s1JMAwye8hw; Fri, 25 Apr 2025 22:26:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 124E66079A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 124E66079A;
	Fri, 25 Apr 2025 22:26:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 078FA443
 for <buildroot@buildroot.org>; Fri, 25 Apr 2025 22:26:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E261280BE8
 for <buildroot@buildroot.org>; Fri, 25 Apr 2025 22:26:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id S3XD4xsBCEVO for <buildroot@buildroot.org>;
 Fri, 25 Apr 2025 22:26:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.155.149;
 helo=smtpdh19-2.aruba.it; envelope-from=giulio.benetti@benettiengineering.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 8F47380B43
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8F47380B43
Received: from smtpdh19-2.aruba.it (smtpdh19-2.aruba.it [62.149.155.149])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8F47380B43
 for <buildroot@buildroot.org>; Fri, 25 Apr 2025 22:26:51 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba SMTP with ESMTPSA
 id 8RVQunzi3voVF8RVRumo52; Sat, 26 Apr 2025 00:26:49 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Louis Aussedat <aussedat.louis@gmail.com>,
 Sergey Matyukevich <geomatsi@gmail.com>
Date: Sat, 26 Apr 2025 00:26:45 +0200
Message-Id: <20250425222647.2340402-2-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250425222647.2340402-1-giulio.benetti@benettiengineering.com>
References: <20250425222647.2340402-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfMx+L3GcV6Bx/aLhnC7gV7ADbMSyhjNGEH2dJJ/zFTe5gZsCI6vInZzqkNt1KfS+LqdCzSTLWFzKA8KafZ3eLi4Z1nvMyuSGZ43lSHe4VhvBLfmUY3YC
 SpbkAoKMKDM8/eLIIeGU6Nr9BGJlz3sp4w6DIpfOGfujCc1PBhLRjVkY5FMyEIgcqtjLwVWWGxqVXmegkqZ5AkAMyYc9/qKvBdnoYTNm2XdCc2gJc7ImcNct
 bCwlqwL0vLXy2QIjbaC9w0pdhUMmDB5yGn5hu4I/PWpn//FJscPJscR3trBFIed6eyccQ+aNd7iApLh08Y2+XH6/rxrQHIMKR7by/y4gx0QKe2dZRmZNVYio
 dxKYWoAqioFUSfsRCUWJ36FHfuFYyg==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1745620009; bh=ShvqJh5deMsyIjDWteLJxiLe2iVOuYkfFAgN3GYqR4w=;
 h=From:To:Subject:Date:MIME-Version;
 b=k5HX6f/6attkufl71BJSNX31tGfcYhdwqpUj/i4cPqXcjK5+q6gdh8P3VvcseJLPa
 rYLVvB35WMZ1y3Nd9yEYojxacM2JkgFxJfR03705/SViMB97E4/jJNAVHCZDN3cPw6
 /wWLIesb9G1uLJJdgmV0hFONdpIJOdexIVC0zdj2sou/keA9I8J14zV9B4HVgmEMN6
 JtXzaoOufHCj10+dEQClkSWkkBXjmaPg3HRuQBqPa+X5afFjY2t8+/49lqp3NxwS0h
 d6OfmQv4LsnoAii+AIitmG47xSc8FF+eM7I2baRZALVDjnoWP2m5JN4fqoIdkiLdqx
 RXx4VR6k4fDyQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=temperror header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=k5HX6f/6
Subject: [Buildroot] [PATCH] package/rtl8189fs: bump to version 2025-02-24
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

With this version we can build with Linux 6.14 and support for
cfg80211_rtw_get_txpower() has been added.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/rtl8189fs/rtl8189fs.hash | 2 +-
 package/rtl8189fs/rtl8189fs.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/rtl8189fs/rtl8189fs.hash b/package/rtl8189fs/rtl8189fs.hash
index cca58ee3cc..eedbb46bea 100644
--- a/package/rtl8189fs/rtl8189fs.hash
+++ b/package/rtl8189fs/rtl8189fs.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  a621c0df9372d952449a06abb82f1edb806ad3200f9b1dd54fa9beab08d81b92  rtl8189fs-94cc959d56c1425fbca4f6e49e949cf58ec5dc8d.tar.gz
+sha256  40a0890d3ea2d6d2b58748a9e05e20a14942c0f7652a0178e7466e8279106345  rtl8189fs-3f34f380715b88e4a3ef049b3a60e2fc69ccc9bd.tar.gz
diff --git a/package/rtl8189fs/rtl8189fs.mk b/package/rtl8189fs/rtl8189fs.mk
index 33afb011e1..800956a927 100644
--- a/package/rtl8189fs/rtl8189fs.mk
+++ b/package/rtl8189fs/rtl8189fs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RTL8189FS_VERSION = 94cc959d56c1425fbca4f6e49e949cf58ec5dc8d
+RTL8189FS_VERSION = 3f34f380715b88e4a3ef049b3a60e2fc69ccc9bd
 RTL8189FS_SITE = $(call github,jwrdegoede,rtl8189ES_linux,$(RTL8189FS_VERSION))
 RTL8189FS_LICENSE = GPL-2.0
 
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
