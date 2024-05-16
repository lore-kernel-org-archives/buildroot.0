Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3C16C25B74
	for <buildroot@archiver.kernel.org>; Thu, 16 May 2024 11:09:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9EBC141CCD;
	Thu, 16 May 2024 11:09:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rIST1hFT6dec; Thu, 16 May 2024 11:09:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8A50A41CD7
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8A50A41CD7;
	Thu, 16 May 2024 11:09:31 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2E23E1BF263
 for <buildroot@lists.busybox.net>; Thu, 16 May 2024 11:09:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1B46D81DF3
 for <buildroot@lists.busybox.net>; Thu, 16 May 2024 11:09:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bVNmtCCWZTAa for <buildroot@lists.busybox.net>;
 Thu, 16 May 2024 11:09:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 408B081BB4
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 408B081BB4
 for <buildroot@buildroot.org>; Thu, 16 May 2024 11:09:28 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2449E8740B; Thu, 16 May 2024 11:09:28 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 16 May 2024 11:27:46 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: bb7a0c27d4bca705089f7d17d5a6c302545f2539
X-Git-Newrev: f2eb2273170e9d12e44fd56c707e54ddc245b949
X-Patchwork-Hint: ignore
Message-Id: <20240516110928.2449E8740B@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/coreutils: drop
 gmp optional dependency
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

commit: https://git.buildroot.net/buildroot/commit/?id=f2eb2273170e9d12e44fd56c707e54ddc245b949
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

libgmp is included in coreutils (through bootstrap.conf) since bump to
version 9.0 in commit 2ee43bad85693d1c96e14f5b39ccb13a8982f50a and
https://git.savannah.gnu.org/cgit/coreutils.git/commit/?id=13046444888a7e96f48d28fdd5a6ffe03d4ab036:

configure: WARNING: unrecognized options: --disable-gtk-doc, --disable-gtk-doc-html, --disable-doc, --disable-docs, --disable-documentation, --with-xmlto, --with-fop, --enable-ipv6, --enable-static, --enable-shared, --without-gmp

Fixes: 2ee43bad85693d1c96e14f5b39ccb13a8982f50a

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 16463a00affa0ba4814e583bcd544174528f371e)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/coreutils/coreutils.mk | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/package/coreutils/coreutils.mk b/package/coreutils/coreutils.mk
index e9cb7b67cb..846d4fa567 100644
--- a/package/coreutils/coreutils.mk
+++ b/package/coreutils/coreutils.mk
@@ -75,12 +75,6 @@ ifeq ($(BR2_PACKAGE_GETTEXT_PROVIDES_LIBINTL),y)
 COREUTILS_CONF_OPTS += --with-libintl-prefix=$(STAGING_DIR)/usr
 endif
 
-ifeq ($(BR2_PACKAGE_GMP),y)
-COREUTILS_DEPENDENCIES += gmp
-else
-COREUTILS_CONF_OPTS += --without-gmp
-endif
-
 ifeq ($(BR2_PACKAGE_LIBCAP),y)
 COREUTILS_DEPENDENCIES += libcap
 else
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
