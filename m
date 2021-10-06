Return-Path: <SRS0=BIUF=O2=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F9AEC433EF
	for <buildroot@archiver.kernel.org>; Wed,  6 Oct 2021 14:39:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5BFB4610C8
	for <buildroot@archiver.kernel.org>; Wed,  6 Oct 2021 14:39:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5BFB4610C8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 38E6283FA6;
	Wed,  6 Oct 2021 14:39:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BgNi3EP8_-gQ; Wed,  6 Oct 2021 14:39:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9211F83FF0;
	Wed,  6 Oct 2021 14:39:11 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0AAD31BF36B
 for <buildroot@lists.busybox.net>; Wed,  6 Oct 2021 14:39:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EE1AA60EA2
 for <buildroot@lists.busybox.net>; Wed,  6 Oct 2021 14:39:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pvqKdqsjSHmj for <buildroot@lists.busybox.net>;
 Wed,  6 Oct 2021 14:39:09 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 40B9A606BB
 for <buildroot@buildroot.org>; Wed,  6 Oct 2021 14:39:09 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 285B29231C; Wed,  6 Oct 2021 14:36:33 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 6 Oct 2021 16:37:36 +0200
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: bba5c4345aade8cf5c39f9cc4dc029f6ad7dbbac
X-Git-Newrev: 2593b03c03c717c6bc4db981040da2b17e70b8e5
X-Patchwork-Hint: ignore
Message-Id: <20211006143633.285B29231C@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] package/lxc: fix typo of
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

commit: https://git.buildroot.net/buildroot/commit/?id=2593b03c03c717c6bc4db981040da2b17e70b8e5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

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
