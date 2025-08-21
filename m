Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F4AECA0EFA
	for <buildroot@archiver.kernel.org>; Thu, 21 Aug 2025 18:57:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 18F736167C;
	Thu, 21 Aug 2025 18:57:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id f9rFAqxVCeAL; Thu, 21 Aug 2025 18:57:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BF17161AF8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id BF17161AF8;
	Thu, 21 Aug 2025 18:57:37 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 502451C7
 for <buildroot@buildroot.org>; Thu, 21 Aug 2025 18:57:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D274F418D3
 for <buildroot@buildroot.org>; Thu, 21 Aug 2025 18:57:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AiUDxlhp4fbC for <buildroot@buildroot.org>;
 Thu, 21 Aug 2025 18:57:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2B814418A5
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2B814418A5
 for <buildroot@buildroot.org>; Thu, 21 Aug 2025 18:57:09 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1BA01813AF; Thu, 21 Aug 2025 18:57:09 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 21 Aug 2025 10:41:33 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 41cfa2f45753e9abab37227d1f2a085f8b161615
X-Git-Newrev: 7799f3d02c003e472b9f809fa06ca54c2d3173c2
X-Patchwork-Hint: ignore
Message-Id: <20250821185709.1BA01813AF@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/openocd: add CPE
 vendor and product
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=7799f3d02c003e472b9f809fa06ca54c2d3173c2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

openocd:open_on-chip_debugger is a valid CPE ID for openocd, see
https://nvd.nist.gov/products/cpe/detail/91C79641-7554-4DA6-939D-E9B0A6E54C99

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit a46810838a57ed82dd2b794600ecc22995776d87)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/openocd/openocd.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/openocd/openocd.mk b/package/openocd/openocd.mk
index 78f872fa76..a563cc6a9e 100644
--- a/package/openocd/openocd.mk
+++ b/package/openocd/openocd.mk
@@ -33,6 +33,9 @@ OPENOCD_LICENSE_FILES = \
 	LICENSES/preferred/MIT \
 	LICENSES/stand-alone/GPL-3.0
 
+OPENOCD_CPE_ID_VENDOR = openocd
+OPENOCD_CPE_ID_PRODUCT = open_on-chip_debugger
+
 # 0001-configure-enable-build-on-uclinux.patch patches configure.ac
 OPENOCD_AUTORECONF = YES
 OPENOCD_CONF_ENV = CFLAGS="$(TARGET_CFLAGS) -std=gnu99"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
