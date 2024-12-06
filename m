Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BB63E77173
	for <buildroot@archiver.kernel.org>; Fri,  6 Dec 2024 09:29:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2172A81FB7;
	Fri,  6 Dec 2024 09:29:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Rdk1zcs4dgpw; Fri,  6 Dec 2024 09:29:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8F3BA81FAF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8F3BA81FAF;
	Fri,  6 Dec 2024 09:29:08 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id BB819ED0
 for <buildroot@buildroot.org>; Fri,  6 Dec 2024 09:28:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 99BBD412EF
 for <buildroot@buildroot.org>; Fri,  6 Dec 2024 09:28:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qc6iGNb7Rlzf for <buildroot@buildroot.org>;
 Fri,  6 Dec 2024 09:28:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8E89140C20
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8E89140C20
 for <buildroot@buildroot.org>; Fri,  6 Dec 2024 09:28:46 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8A49F86A33; Fri,  6 Dec 2024 09:28:46 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 6 Dec 2024 10:20:52 +0100
X-Git-Refname: refs/heads/2024.08.x
X-Git-Oldrev: 6195a3db776a3c0fcd7debf64e7972a57da22e76
X-Git-Newrev: 8c3836ac8fd8e7b2f320dadf24f2c6190e775bfb
X-Patchwork-Hint: ignore
Message-Id: <20241206092846.8A49F86A33@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.08.x] package/quagga: fetch
 from sources.buildroot.net
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=8c3836ac8fd8e7b2f320dadf24f2c6190e775bfb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.08.x

Fixes https://autobuild.buildroot.org/results/54a/54a165827f536be47cd45c98da3937a1e94a7c65/

Upstream is no longer accessible, so use s.b.n instead.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 39a54900727a359bb0285a751ff7de857088c1f4)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/quagga/quagga.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/quagga/quagga.mk b/package/quagga/quagga.mk
index 5d8d52263a..dd921552f1 100644
--- a/package/quagga/quagga.mk
+++ b/package/quagga/quagga.mk
@@ -5,7 +5,8 @@
 ################################################################################
 
 QUAGGA_VERSION = 1.2.4
-QUAGGA_SITE = http://download.savannah.gnu.org/releases/quagga
+# upstream (http://download.savannah.gnu.org/releases/quagga) dead
+QUAGGA_SITE = http://sources.buildroot.net/quagga
 QUAGGA_INSTALL_STAGING = YES
 QUAGGA_DEPENDENCIES = host-gawk host-pkgconf
 QUAGGA_LICENSE = GPL-2.0+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
