Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4807CCA0EFF
	for <buildroot@archiver.kernel.org>; Thu, 21 Aug 2025 19:20:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2270B8468C;
	Thu, 21 Aug 2025 19:20:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CYNOuQMC3SOx; Thu, 21 Aug 2025 19:20:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3C5C5846B2
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3C5C5846B2;
	Thu, 21 Aug 2025 19:20:40 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0AFAD1C8
 for <buildroot@buildroot.org>; Thu, 21 Aug 2025 19:20:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F14BF4194D
 for <buildroot@buildroot.org>; Thu, 21 Aug 2025 19:20:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IHyaXSgTpeyy for <buildroot@buildroot.org>;
 Thu, 21 Aug 2025 19:20:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4B5AD4190F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4B5AD4190F
 for <buildroot@buildroot.org>; Thu, 21 Aug 2025 19:20:14 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 47E5E8403C; Thu, 21 Aug 2025 19:20:14 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 21 Aug 2025 10:53:46 +0200
X-Git-Refname: refs/heads/2025.05.x
X-Git-Oldrev: 2bf2d75cf27fce4d3bff5950ac33f8b8f9785841
X-Git-Newrev: 2435f3148f75b7fc9e98adf8eca245368af45a0f
X-Patchwork-Hint: ignore
Message-Id: <20250821192014.47E5E8403C@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.05.x] package/openconnect: add
 CPE vendor
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

commit: https://git.buildroot.net/buildroot/commit/?id=2435f3148f75b7fc9e98adf8eca245368af45a0f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.05.x

infradead is a valid CPE vendor for openconnect, see
https://nvd.nist.gov/products/cpe/detail/2877E5FD-6361-465D-81D7-AE1EBB3E059F

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit d2c975ad0291bb579411faec39e4e243e90abcdd)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/openconnect/openconnect.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/openconnect/openconnect.mk b/package/openconnect/openconnect.mk
index 3fd9f990b0..73716d708e 100644
--- a/package/openconnect/openconnect.mk
+++ b/package/openconnect/openconnect.mk
@@ -9,6 +9,7 @@ OPENCONNECT_SITE = https://www.infradead.org/openconnect/download
 OPENCONNECT_DEPENDENCIES = host-pkgconf libxml2 zlib
 OPENCONNECT_LICENSE = LGPL-2.1
 OPENCONNECT_LICENSE_FILES = COPYING.LGPL
+OPENCONNECT_CPE_ID_VENDOR = infradead
 OPENCONNECT_CONF_OPTS = \
 	--disable-dsa-tests \
 	--with-vpnc-script=/etc/vpnc/vpnc-script \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
