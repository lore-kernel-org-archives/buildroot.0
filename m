Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4357C3DA78
	for <buildroot@archiver.kernel.org>; Tue, 17 Jan 2023 09:41:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7088781F00;
	Tue, 17 Jan 2023 09:41:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7088781F00
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OgS7G--WJzwO; Tue, 17 Jan 2023 09:41:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B482581424;
	Tue, 17 Jan 2023 09:41:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B482581424
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 761FD1BF2B1
 for <buildroot@lists.busybox.net>; Tue, 17 Jan 2023 09:40:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 50BCA417D1
 for <buildroot@lists.busybox.net>; Tue, 17 Jan 2023 09:40:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 50BCA417D1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CzJg7TWXc1-d for <buildroot@lists.busybox.net>;
 Tue, 17 Jan 2023 09:40:50 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 25EAD41769
 for <buildroot@buildroot.org>; Tue, 17 Jan 2023 09:40:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 25EAD41769
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 12B2F87C39; Tue, 17 Jan 2023 09:40:50 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 16 Jan 2023 15:52:10 +0100
X-Git-Refname: refs/heads/2022.11.x
X-Git-Oldrev: b1eb1e7d92b57637df04e5ecc233175abd40d17e
X-Git-Newrev: e227c45200d9ecd996754b7bc4508cc2c4921068
X-Patchwork-Hint: ignore
Message-Id: <20230117094050.12B2F87C39@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.11.x] package/at-spi2-core:
 switch to https download
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=e227c45200d9ecd996754b7bc4508cc2c4921068
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.11.x

Signed-off-by: Daniel Lang <d.lang@abatec.at>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit dde078790a965dfd469ec6ed745e4f7b5edc60ba)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/at-spi2-core/at-spi2-core.hash | 2 +-
 package/at-spi2-core/at-spi2-core.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/at-spi2-core/at-spi2-core.hash b/package/at-spi2-core/at-spi2-core.hash
index e2cc403e71..764e4c3661 100644
--- a/package/at-spi2-core/at-spi2-core.hash
+++ b/package/at-spi2-core/at-spi2-core.hash
@@ -1,4 +1,4 @@
-# From http://ftp.acc.umu.se/pub/gnome/sources/at-spi2-core/2.36/at-spi2-core-2.36.0.sha256sum
+# From https://download.gnome.org/sources/at-spi2-core/2.36/at-spi2-core-2.36.0.sha256sum
 sha256  88da57de0a7e3c60bc341a974a80fdba091612db3547c410d6deab039ca5c05a  at-spi2-core-2.36.0.tar.xz
 
 # locally calculated
diff --git a/package/at-spi2-core/at-spi2-core.mk b/package/at-spi2-core/at-spi2-core.mk
index cf7fdd297c..f0b019c0ed 100644
--- a/package/at-spi2-core/at-spi2-core.mk
+++ b/package/at-spi2-core/at-spi2-core.mk
@@ -7,7 +7,7 @@
 AT_SPI2_CORE_VERSION_MAJOR = 2.36
 AT_SPI2_CORE_VERSION = $(AT_SPI2_CORE_VERSION_MAJOR).0
 AT_SPI2_CORE_SOURCE = at-spi2-core-$(AT_SPI2_CORE_VERSION).tar.xz
-AT_SPI2_CORE_SITE = http://ftp.gnome.org/pub/gnome/sources/at-spi2-core/$(AT_SPI2_CORE_VERSION_MAJOR)
+AT_SPI2_CORE_SITE = https://download.gnome.org/sources/at-spi2-core/$(AT_SPI2_CORE_VERSION_MAJOR)
 AT_SPI2_CORE_LICENSE = LGPL-2.1+
 AT_SPI2_CORE_LICENSE_FILES = COPYING
 AT_SPI2_CORE_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
