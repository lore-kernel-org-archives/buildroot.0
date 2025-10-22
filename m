Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA517CCD1BC
	for <buildroot@archiver.kernel.org>; Wed, 22 Oct 2025 16:36:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8050761390;
	Wed, 22 Oct 2025 16:36:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id l3ul-KvhKJNz; Wed, 22 Oct 2025 16:36:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9AD6261287
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9AD6261287;
	Wed, 22 Oct 2025 16:36:51 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 71AB043F
 for <buildroot@buildroot.org>; Wed, 22 Oct 2025 16:36:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 965E840F99
 for <buildroot@buildroot.org>; Wed, 22 Oct 2025 16:36:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XET_Ct7p0PXC for <buildroot@buildroot.org>;
 Wed, 22 Oct 2025 16:36:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A5CBA4112A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id A5CBA4112A
 for <buildroot@buildroot.org>; Wed, 22 Oct 2025 16:36:34 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A310D87676; Wed, 22 Oct 2025 16:36:34 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 22 Oct 2025 18:35:38 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: d88b247633f826a5eb392dd28639eb3b860d4335
X-Git-Newrev: 284b177b60beebde90c6f4fb2ab8e48d63fbf703
X-Patchwork-Hint: ignore
Message-Id: <20251022163634.A310D87676@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/libcurl: fix
 configure options for GnuTLS
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=284b177b60beebde90c6f4fb2ab8e48d63fbf703
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

Buildroot commit fb5fb06ee5a886df5036c5c5e6c4536f2bc8e1c1 bumped libcurl
to 8.16.0 which includes commit
https://github.com/curl/curl/commit/2f6524ce3c3a8231c62d1e0c8af509fe5b0228a0
to limit the use of the configure option --with-ca-fallback to OpenSSL
causing build errors with GnuTLS:

configure: error: --with-ca-fallback only works with OpenSSL

Fixes: https://autobuild.buildroot.net/results/64f/64fad87dddecda1e8ff6b0a9abc0b827b5136e4f/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Reviewed-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 15df9ec173f0c25df7f14f65719107f744248d4d)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/libcurl/libcurl.mk | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/package/libcurl/libcurl.mk b/package/libcurl/libcurl.mk
index 0aa88044bd..51b8c4d147 100644
--- a/package/libcurl/libcurl.mk
+++ b/package/libcurl/libcurl.mk
@@ -68,8 +68,7 @@ LIBCURL_CONF_OPTS += --without-openssl
 endif
 
 ifeq ($(BR2_PACKAGE_LIBCURL_GNUTLS),y)
-LIBCURL_CONF_OPTS += --with-gnutls=$(STAGING_DIR)/usr \
-	--with-ca-fallback
+LIBCURL_CONF_OPTS += --with-gnutls=$(STAGING_DIR)/usr
 LIBCURL_DEPENDENCIES += gnutls
 else
 LIBCURL_CONF_OPTS += --without-gnutls
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
