Return-Path: <SRS0=BIUF=O2=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BC7FC433F5
	for <buildroot@archiver.kernel.org>; Wed,  6 Oct 2021 14:40:28 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B4B64610EA
	for <buildroot@archiver.kernel.org>; Wed,  6 Oct 2021 14:40:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B4B64610EA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 84EAE406EB;
	Wed,  6 Oct 2021 14:40:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Hg_KZo32J2fQ; Wed,  6 Oct 2021 14:40:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E1E39405C9;
	Wed,  6 Oct 2021 14:40:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 593CB1BF36B
 for <buildroot@lists.busybox.net>; Wed,  6 Oct 2021 14:40:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 494868386F
 for <buildroot@lists.busybox.net>; Wed,  6 Oct 2021 14:40:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KGz6epw8RsFm for <buildroot@lists.busybox.net>;
 Wed,  6 Oct 2021 14:40:23 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id F2298837B6
 for <buildroot@buildroot.org>; Wed,  6 Oct 2021 14:40:22 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id DC6CE92335; Wed,  6 Oct 2021 14:37:46 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 6 Oct 2021 16:37:14 +0200
X-Git-Refname: refs/heads/2021.08.x
X-Git-Oldrev: 081262c59f1a8a20077575eda43990fb649d1f54
X-Git-Newrev: 9ea6fe93886a0535749b8fb57970ff6f5b76530a
X-Patchwork-Hint: ignore
Message-Id: <20211006143746.DC6CE92335@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.08.x] package/lxc: fix typo of
 toolchain in config.in
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

commit: https://git.buildroot.net/buildroot/commit/?id=9ea6fe93886a0535749b8fb57970ff6f5b76530a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.08.x

BR2_TOOLCHAN_USES_UCLIBC -> BR2_TOOLCHAIN_USES_UCLIBC

Signed-off-by: Christian Stewart <christian@paral.in>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 71ce29eff3b1717904decb995b70a25555adef2b)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/lxc/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/lxc/Config.in b/package/lxc/Config.in
index 72b675113d..a3f9be0c90 100644
--- a/package/lxc/Config.in
+++ b/package/lxc/Config.in
@@ -21,4 +21,4 @@ comment "lxc needs a glibc or musl toolchain w/ threads, headers >= 3.0, dynamic
 		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 \
 		|| !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0 \
 		|| BR2_STATIC_LIBS \
-		|| BR2_TOOLCHAN_USES_UCLIBC
+		|| BR2_TOOLCHAIN_USES_UCLIBC
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
