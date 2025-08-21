Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16DDFCA0EEB
	for <buildroot@archiver.kernel.org>; Thu, 21 Aug 2025 18:57:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E058784654;
	Thu, 21 Aug 2025 18:57:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JboQegCiZBPJ; Thu, 21 Aug 2025 18:57:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 22D8484601
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 22D8484601;
	Thu, 21 Aug 2025 18:57:35 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1A08E93D
 for <buildroot@buildroot.org>; Thu, 21 Aug 2025 18:57:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EF5716171A
 for <buildroot@buildroot.org>; Thu, 21 Aug 2025 18:57:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sgWFwr3BcAsR for <buildroot@buildroot.org>;
 Thu, 21 Aug 2025 18:57:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2AEA961703
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2AEA961703
 for <buildroot@buildroot.org>; Thu, 21 Aug 2025 18:57:09 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 273AD87A07; Thu, 21 Aug 2025 18:57:09 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 21 Aug 2025 10:41:39 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 7799f3d02c003e472b9f809fa06ca54c2d3173c2
X-Git-Newrev: 621eae3114f6c52add571f0665ff0f364c9eb7a3
X-Patchwork-Hint: ignore
Message-Id: <20250821185709.273AD87A07@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/libcue: add CPE
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

commit: https://git.buildroot.net/buildroot/commit/?id=621eae3114f6c52add571f0665ff0f364c9eb7a3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

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
