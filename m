Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3871C4332F
	for <buildroot@archiver.kernel.org>; Tue, 20 Dec 2022 08:29:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5EA658130A;
	Tue, 20 Dec 2022 08:29:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5EA658130A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qPICt6gGo2_x; Tue, 20 Dec 2022 08:29:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id BA73D812F5;
	Tue, 20 Dec 2022 08:29:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BA73D812F5
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9B6801BF28C
 for <buildroot@lists.busybox.net>; Tue, 20 Dec 2022 08:29:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7712440133
 for <buildroot@lists.busybox.net>; Tue, 20 Dec 2022 08:29:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7712440133
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tJ5QNvYgPfgb for <buildroot@lists.busybox.net>;
 Tue, 20 Dec 2022 08:29:37 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8E627400D9
 for <buildroot@buildroot.org>; Tue, 20 Dec 2022 08:29:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8E627400D9
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7A3A986A7B; Tue, 20 Dec 2022 08:29:37 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Tue, 20 Dec 2022 09:27:39 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 447abe169af7e69a82a3e0218670006a42914053
X-Git-Newrev: 9abb21ab314cb5d5000334fd9399521104d64043
X-Patchwork-Hint: ignore
Message-Id: <20221220082937.7A3A986A7B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libgpg-error: Disable support for
 non-C languages
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

commit: https://git.buildroot.net/buildroot/commit/?id=9abb21ab314cb5d5000334fd9399521104d64043
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The only other language supported is CL (Common Lisp) which buildroot
does not package yet. This saves 52KB in the final root filesystem.

Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
[yann.morin.1998@free.fr: reformat for one-option per-line]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/libgpg-error/libgpg-error.mk | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/libgpg-error/libgpg-error.mk b/package/libgpg-error/libgpg-error.mk
index 86dea6ad2a..252d95ac7f 100644
--- a/package/libgpg-error/libgpg-error.mk
+++ b/package/libgpg-error/libgpg-error.mk
@@ -13,8 +13,10 @@ LIBGPG_ERROR_CPE_ID_VENDOR = gnupg
 LIBGPG_ERROR_INSTALL_STAGING = YES
 LIBGPG_ERROR_CONFIG_SCRIPTS = gpg-error-config
 LIBGPG_ERROR_DEPENDENCIES = $(TARGET_NLS_DEPENDENCIES)
-LIBGPG_ERROR_CONF_OPTS = --disable-tests \
-		--host=$(BR2_PACKAGE_LIBGPG_ERROR_SYSCFG)
+LIBGPG_ERROR_CONF_OPTS = \
+	--host=$(BR2_PACKAGE_LIBGPG_ERROR_SYSCFG) \
+	--disable-tests \
+	--disable-languages
 
 ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
 LIBGPG_ERROR_CONF_OPTS += --enable-threads
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
