Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05444CCD1BB
	for <buildroot@archiver.kernel.org>; Wed, 22 Oct 2025 16:42:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CF4AA6143E;
	Wed, 22 Oct 2025 16:42:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6g9uZlrtBYAA; Wed, 22 Oct 2025 16:41:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C89D761440
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C89D761440;
	Wed, 22 Oct 2025 16:41:59 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 0E475D8A
 for <buildroot@buildroot.org>; Wed, 22 Oct 2025 16:41:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 83EE640BDC
 for <buildroot@buildroot.org>; Wed, 22 Oct 2025 16:41:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gnpoosVNgdkO for <buildroot@buildroot.org>;
 Wed, 22 Oct 2025 16:41:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 64E4540BED
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 64E4540BED
 for <buildroot@buildroot.org>; Wed, 22 Oct 2025 16:41:30 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 621DE87038; Wed, 22 Oct 2025 16:41:30 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 22 Oct 2025 18:38:51 +0200
X-Git-Refname: refs/heads/2025.08.x
X-Git-Oldrev: b3d14555838e695e451aea2f5fd9d0784059fea6
X-Git-Newrev: 33d0a717330bc27c8c435af3c4e835e7115f9ae8
X-Patchwork-Hint: ignore
Message-Id: <20251022164130.621DE87038@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.08.x] package/libcurl: fix
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

commit: https://git.buildroot.net/buildroot/commit/?id=33d0a717330bc27c8c435af3c4e835e7115f9ae8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.08.x

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
