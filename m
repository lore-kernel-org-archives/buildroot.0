Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 635E4C43334
	for <buildroot@archiver.kernel.org>; Tue, 19 Jul 2022 15:13:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id ED33C611AA;
	Tue, 19 Jul 2022 15:13:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ED33C611AA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id urUwByeKEYqd; Tue, 19 Jul 2022 15:13:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E89046119A;
	Tue, 19 Jul 2022 15:13:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E89046119A
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7EEC51BF9BA
 for <buildroot@lists.busybox.net>; Tue, 19 Jul 2022 15:12:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 59B5C611A0
 for <buildroot@lists.busybox.net>; Tue, 19 Jul 2022 15:12:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 59B5C611A0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BP7Sp2XwtKXA for <buildroot@lists.busybox.net>;
 Tue, 19 Jul 2022 15:12:48 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 78E5061198
 for <buildroot@buildroot.org>; Tue, 19 Jul 2022 15:12:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 78E5061198
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 7FBAB83D0D; Tue, 19 Jul 2022 14:59:20 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 19 Jul 2022 17:07:48 +0200
X-Git-Refname: refs/heads/2022.05.x
X-Git-Oldrev: c4eb3dd0a683a45bf946f3e60c68d358c9a05c90
X-Git-Newrev: 78b3a2b33e72bd4ef2a42b495297a6bdb8ec4e5c
X-Patchwork-Hint: ignore
Message-Id: <20220719145920.7FBAB83D0D@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.05.x] package/uacme: allow
 ualpn with mbedTLS
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

commit: https://git.buildroot.net/buildroot/commit/?id=78b3a2b33e72bd4ef2a42b495297a6bdb8ec4e5c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.05.x

Following the update to mbedTLS 2.28.0 in commit 0f8aab08, ualpn can
work with mbedTLS without restrictions.

References
https://git.buildroot.net/buildroot/commit?id=96c3b52132b41716ca445b4c73a1a8886c26e5ee
https://github.com/ndilieto/uacme/issues/23#issuecomment-1043409796
https://github.com/ndilieto/uacme/commit/bbee626cf5f60908f064c123f7a9622639348c3d
https://github.com/Mbed-TLS/mbedtls/pull/3243

Signed-off-by: Nicola Di Lieto <nicola.dilieto@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 6c7b46945e656e03713ffeb1230211ec81791478)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/uacme/Config.in | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/package/uacme/Config.in b/package/uacme/Config.in
index d693436115..58b7c534e7 100644
--- a/package/uacme/Config.in
+++ b/package/uacme/Config.in
@@ -19,7 +19,6 @@ if BR2_PACKAGE_UACME
 config BR2_PACKAGE_UACME_UALPN
 	bool "enable ualpn"
 	depends on BR2_TOOLCHAIN_HAS_THREADS
-	depends on BR2_PACKAGE_OPENSSL || BR2_PACKAGE_GNUTLS
 	select BR2_PACKAGE_LIBEV
 	help
 	  Build and install ualpn, the transparent proxying tls-alpn-01
@@ -28,7 +27,4 @@ config BR2_PACKAGE_UACME_UALPN
 comment "ualpn needs a toolchain w/ threads"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS
 
-comment "ualpn needs either OpenSSL or GnuTLS"
-	depends on !(BR2_PACKAGE_OPENSSL || BR2_PACKAGE_GNUTLS)
-
 endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
