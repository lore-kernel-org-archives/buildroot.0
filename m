Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4A79CF2568
	for <buildroot@archiver.kernel.org>; Sat, 12 Oct 2024 15:03:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7368E606D0;
	Sat, 12 Oct 2024 15:03:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hN1OVKy0tTEY; Sat, 12 Oct 2024 15:03:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5028E606D5
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5028E606D5;
	Sat, 12 Oct 2024 15:03:33 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C1AB81BF8B4
 for <buildroot@lists.busybox.net>; Sat, 12 Oct 2024 15:02:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B14386067C
 for <buildroot@lists.busybox.net>; Sat, 12 Oct 2024 15:02:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IVOlM2LtGxKp for <buildroot@lists.busybox.net>;
 Sat, 12 Oct 2024 15:02:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C7E4E60628
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id C7E4E60628
 for <buildroot@buildroot.org>; Sat, 12 Oct 2024 15:02:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B4FED85E1F; Sat, 12 Oct 2024 15:02:51 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 12 Oct 2024 16:57:42 +0200
X-Git-Refname: refs/heads/2024.08.x
X-Git-Oldrev: 8f83cdaaff5a5867726c9f73092abe847ccb4532
X-Git-Newrev: 2113a945cd1b18c7eccb33cdceebc25063e583b9
X-Patchwork-Hint: ignore
Message-Id: <20241012150251.B4FED85E1F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.08.x] package/libcurl: drop
 link-with-openssl workaround
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

commit: https://git.buildroot.net/buildroot/commit/?id=2113a945cd1b18c7eccb33cdceebc25063e583b9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.08.x

Upstream curl commit f057de5a1a950 ("libcurl.pc: add `Requires.private`,
`Requires` for static linking") deals with proper pkg-config
configuration since version 8.9.0.

Our local libcurl.pc modification we added back in commit 61d322c3d258
(package/cURL: fix static link whith openSSL) is no longer needed.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
[yann.morin.1998@free.fr: this is not a "revert", reword commit log]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit a5cef5339bd26f9d161d080d352d4adfe7627434)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libcurl/libcurl.mk | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/package/libcurl/libcurl.mk b/package/libcurl/libcurl.mk
index b81e355195..9bf7724e7d 100644
--- a/package/libcurl/libcurl.mk
+++ b/package/libcurl/libcurl.mk
@@ -190,11 +190,6 @@ LIBCURL_CONF_OPTS += \
 	--disable-tftp
 endif
 
-define LIBCURL_FIX_DOT_PC
-	printf 'Requires: openssl\n' >>$(@D)/libcurl.pc.in
-endef
-LIBCURL_POST_PATCH_HOOKS += $(if $(BR2_PACKAGE_LIBCURL_OPENSSL),LIBCURL_FIX_DOT_PC)
-
 ifeq ($(BR2_PACKAGE_LIBCURL_CURL),)
 define LIBCURL_TARGET_CLEANUP
 	rm -rf $(TARGET_DIR)/usr/bin/curl
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
