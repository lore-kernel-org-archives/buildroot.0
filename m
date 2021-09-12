Return-Path: <SRS0=7Pu+=OC=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14767C433EF
	for <buildroot@archiver.kernel.org>; Sun, 12 Sep 2021 07:49:20 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7A364610FD
	for <buildroot@archiver.kernel.org>; Sun, 12 Sep 2021 07:49:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7A364610FD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 26E3660A58;
	Sun, 12 Sep 2021 07:49:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id g61Qp1vm13fW; Sun, 12 Sep 2021 07:49:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 84F55608FA;
	Sun, 12 Sep 2021 07:49:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 328541BF584
 for <buildroot@lists.busybox.net>; Sun, 12 Sep 2021 07:49:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1CA6A4020E
 for <buildroot@lists.busybox.net>; Sun, 12 Sep 2021 07:49:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id evKy0aE4q6qA for <buildroot@lists.busybox.net>;
 Sun, 12 Sep 2021 07:49:15 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7B3F4401FF
 for <buildroot@buildroot.org>; Sun, 12 Sep 2021 07:49:15 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id A73CD8A3B3; Sun, 12 Sep 2021 07:47:35 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 12 Sep 2021 09:48:58 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 144acc313df5b0a21afb4a65e98377f0b3c63279
X-Git-Newrev: 0a8ad41f3bcfec1fc28ebc46968f58860aec413e
X-Patchwork-Hint: ignore
Message-Id: <20210912074735.A73CD8A3B3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/rpm: support lua v5.3+
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=0a8ad41f3bcfec1fc28ebc46968f58860aec413e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The version bump [1] for the rpm package to v4.17 added the newly
required dependency to Lua; however, the change limited support to only
v5.3 (and not higher). Correcting support for v5.3 or higher by making
a dependency on the Lua package and omitting older versions which are
not supported (specifically, the v5.1 series)

[1]: 429e247b869027f6ecd4efa0f31bccd2765e3875

Signed-off-by: James Knight <james.d.knight@live.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/rpm/Config.in | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/rpm/Config.in b/package/rpm/Config.in
index adaf7c96ec..8730e15200 100644
--- a/package/rpm/Config.in
+++ b/package/rpm/Config.in
@@ -1,6 +1,6 @@
 comment "rpm needs a toolchain w/ dynamic library, threads and lua >= 5.3"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS \
-		|| !BR2_PACKAGE_LUA_5_3
+		|| !BR2_PACKAGE_LUA || BR2_PACKAGE_LUA_5_1
 	depends on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 	depends on BR2_USE_MMU
 
@@ -8,7 +8,7 @@ config BR2_PACKAGE_RPM
 	bool "rpm"
 	depends on !BR2_STATIC_LIBS # dlfcn.h
 	depends on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
-	depends on BR2_PACKAGE_LUA_5_3
+	depends on BR2_PACKAGE_LUA && !BR2_PACKAGE_LUA_5_1
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_USE_MMU # fork()
 	select BR2_PACKAGE_OPENSSL if !BR2_PACKAGE_LIBGCRYPT
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
