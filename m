Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5681FCA0EEB
	for <buildroot@archiver.kernel.org>; Thu, 21 Aug 2025 19:20:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2A51B6171D;
	Thu, 21 Aug 2025 19:20:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PcEtZJsqCW9b; Thu, 21 Aug 2025 19:20:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 818E061AFF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 818E061AFF;
	Thu, 21 Aug 2025 19:20:41 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 554CE1C7
 for <buildroot@buildroot.org>; Thu, 21 Aug 2025 19:20:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 473BF40DEF
 for <buildroot@buildroot.org>; Thu, 21 Aug 2025 19:20:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TAK3LlUQZWbu for <buildroot@buildroot.org>;
 Thu, 21 Aug 2025 19:20:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9394740CF0
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9394740CF0
 for <buildroot@buildroot.org>; Thu, 21 Aug 2025 19:20:14 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 852A18403C; Thu, 21 Aug 2025 19:20:14 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 21 Aug 2025 10:54:07 +0200
X-Git-Refname: refs/heads/2025.05.x
X-Git-Oldrev: 888ed31a3fbdb19c41303e53adc99b14b6a64676
X-Git-Newrev: 765217168ac4ce4f2f67876445b221dd583c7b08
X-Patchwork-Hint: ignore
Message-Id: <20250821192014.852A18403C@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.05.x] package/libcue: add CPE
 vendor
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

commit: https://git.buildroot.net/buildroot/commit/?id=765217168ac4ce4f2f67876445b221dd583c7b08
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.05.x

lipnitsk is a valid CPE vendor ID for libcue, see
https://nvd.nist.gov/products/cpe/detail/79A927B3-A7E5-476D-94C9-0FA0AB71D182

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 0fc81120335e3fc2161e409dc94afff162167bf3)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/libcue/libcue.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libcue/libcue.mk b/package/libcue/libcue.mk
index 7ef27f5a17..8eac4725c9 100644
--- a/package/libcue/libcue.mk
+++ b/package/libcue/libcue.mk
@@ -10,5 +10,6 @@ LIBCUE_LICENSE = GPL-2.0, BSD-2-Clause (rem.c)
 LIBCUE_LICENSE_FILES = LICENSE
 LIBCUE_DEPENDENCIES = host-bison host-flex flex
 LIBCUE_INSTALL_STAGING = YES
+LIBCUE_CPE_ID_VENDOR = lipnitsk
 
 $(eval $(cmake-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
