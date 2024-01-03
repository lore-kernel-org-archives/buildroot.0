Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A520EC47077
	for <buildroot@archiver.kernel.org>; Wed,  3 Jan 2024 07:11:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5369681E90;
	Wed,  3 Jan 2024 07:11:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5369681E90
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mnZUujKva67c; Wed,  3 Jan 2024 07:11:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9EE1381D68;
	Wed,  3 Jan 2024 07:11:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9EE1381D68
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2DA4D1BF27E
 for <buildroot@lists.busybox.net>; Wed,  3 Jan 2024 07:11:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 051FF81D68
 for <buildroot@lists.busybox.net>; Wed,  3 Jan 2024 07:11:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 051FF81D68
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SLO5wDzpuQW3 for <buildroot@lists.busybox.net>;
 Wed,  3 Jan 2024 07:11:44 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BF0E181AA7
 for <buildroot@buildroot.org>; Wed,  3 Jan 2024 07:11:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BF0E181AA7
Received: from fli4l.lan.fli4l (p5b3a0630.dip0.t-ipconnect.de [91.58.6.48])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 4FC3BA4C07F3
 for <buildroot@buildroot.org>; Wed,  3 Jan 2024 08:11:41 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:58942)
 by fli4l.lan.fli4l with esmtp (Exim 4.97.1)
 (envelope-from <bernd@kuhls.net>) id 1rKvPh-000000001jD-0SoY
 for buildroot@buildroot.org; Wed, 03 Jan 2024 08:11:41 +0100
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Wed,  3 Jan 2024 08:11:41 +0100
Message-Id: <20240103071141.6147-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: ++++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202312101026; t=1704265901;
 bh=3iWXAKV+xmMQ/vcxgjSUniHul9JquBLDV15SWtP5sbY=;
 h=From:To:Subject:Date:From;
 b=amuJQ1nBIqHg2HVJmAe3yVtN7uFZ8TUsznG9SFXuF2PJI9c7s+eIMnB/KmIYlrtXP
 86/KvdkYlsFj/tepxphTkt5+ER0oQrKMBQF+VkEbXgpClNPJH0z1aNvVQalVgqso3A
 S0TYhHXPzHbn5L89wACNn3BWKqKrpJEXPEAQZHBz/WzPZLhUNvxvekgmePdv9rq+iz
 eSgUjXaURB0FiJU2ZRHxqm6c7MSZNhydVs45H12/2wUKeY4KN1KpG/tkrSScYqLkok
 53GvPHzV2iYgXE0JrCDPear9kn5f2FBeCpJU+YpE17quO5BjVwna/kM7B1J49GgRBe
 TX1APaWC3dfvQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202312101026 header.b=amuJQ1nB
Subject: [Buildroot] [PATCH 1/1] package/libdrm: bump version to 2.4.119
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Release notes:
https://lists.x.org/archives/xorg-announce/2023-December/003438.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/libdrm/libdrm.hash | 6 +++---
 package/libdrm/libdrm.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libdrm/libdrm.hash b/package/libdrm/libdrm.hash
index bcbcdccf30..219c2c0712 100644
--- a/package/libdrm/libdrm.hash
+++ b/package/libdrm/libdrm.hash
@@ -1,6 +1,6 @@
-# From https://lists.x.org/archives/xorg-announce/2023-November/003433.html
-sha256  a777bd85f2b5fc9c57f886c82058300578317cafdbc77d0a769d7e9a9567ab88  libdrm-2.4.118.tar.xz
-sha512  2740ec10dfe96b520345c3f6f0d99a30aac95b1f96656bd9cd11269c2a83a9dac423da29d74a3deb55360e3ae2ca4a1de283e1e443667bedd22673f6629c9920  libdrm-2.4.118.tar.xz
+# From https://lists.x.org/archives/xorg-announce/2023-December/003438.html
+sha256  0a49f12f09b5b6e68eaaaff3f02ca7cff9aa926939b212d343161d3e8ac56291  libdrm-2.4.119.tar.xz
+sha512  c8dd7665e85c01a67fcce1c1c614bc05a3ec311f31cae7de5fb1cd27d0f11f1801be63de3fa3e33b2f505544fd4b1bc292965c5e8de46a3beaaedb10334945ca  libdrm-2.4.119.tar.xz
 
 # Hash for license file
 sha256  d0a616a9020dc0271e36e6dd4bad174b4e2c2a42636f13785f8e18dd5f85fd83  data/meson.build
diff --git a/package/libdrm/libdrm.mk b/package/libdrm/libdrm.mk
index 0db0c51284..fd50f4f22e 100644
--- a/package/libdrm/libdrm.mk
+++ b/package/libdrm/libdrm.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBDRM_VERSION = 2.4.118
+LIBDRM_VERSION = 2.4.119
 LIBDRM_SOURCE = libdrm-$(LIBDRM_VERSION).tar.xz
 LIBDRM_SITE = https://dri.freedesktop.org/libdrm
 LIBDRM_LICENSE = MIT
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
