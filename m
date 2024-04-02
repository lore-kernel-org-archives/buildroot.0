Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15A2ECD1284
	for <buildroot@archiver.kernel.org>; Tue,  2 Apr 2024 21:27:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CAA2860D4D;
	Tue,  2 Apr 2024 21:27:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NsFyxVUbkuhS; Tue,  2 Apr 2024 21:27:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B91AC60D50
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B91AC60D50;
	Tue,  2 Apr 2024 21:27:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 32DBA1BF295
 for <buildroot@lists.busybox.net>; Tue,  2 Apr 2024 21:27:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C200180B4F
 for <buildroot@lists.busybox.net>; Tue,  2 Apr 2024 21:27:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dnRyJG5pU8HZ for <buildroot@lists.busybox.net>;
 Tue,  2 Apr 2024 21:27:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A630680AD4
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id A630680AD4
 for <buildroot@buildroot.org>; Tue,  2 Apr 2024 21:27:32 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 82ECB8462D; Tue,  2 Apr 2024 21:27:32 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Tue, 2 Apr 2024 23:22:12 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 13607926f1e24a0df34eccf0a9caed1ef78267ef
X-Git-Newrev: 305abd7a302a7859eabc934eba0ffb85cd3657ff
X-Patchwork-Hint: ignore
Message-Id: <20240402212732.82ECB8462D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libxcrypt: support host package
 build
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

commit: https://git.buildroot.net/buildroot/commit/?id=305abd7a302a7859eabc934eba0ffb85cd3657ff
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This is needed by host-systemd.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
[yann.morin.1998@free.fr: set the host _CONF_OPTS]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/libxcrypt/libxcrypt.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/libxcrypt/libxcrypt.mk b/package/libxcrypt/libxcrypt.mk
index 9ad030fbd2..8cb6751442 100644
--- a/package/libxcrypt/libxcrypt.mk
+++ b/package/libxcrypt/libxcrypt.mk
@@ -13,8 +13,11 @@ LIBXCRYPT_AUTORECONF = YES
 
 # Some warnings turn into errors with some sensitive compilers
 LIBXCRYPT_CONF_OPTS = --disable-werror
+HOST_LIBXCRYPT_CONF_OPTS = --disable-werror
 
 # Disable obsolete and unsecure API
 LIBXCRYPT_CONF_OPTS += --disable-obsolete_api
+HOST_LIBXCRYPT_CONF_OPTS += --disable-obsolete_api
 
 $(eval $(autotools-package))
+$(eval $(host-autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
