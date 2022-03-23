Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 656F4C433EF
	for <buildroot@archiver.kernel.org>; Wed, 23 Mar 2022 21:42:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1389140FD4;
	Wed, 23 Mar 2022 21:42:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id y9Kva3vhdG0I; Wed, 23 Mar 2022 21:42:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id CA08240278;
	Wed, 23 Mar 2022 21:42:11 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 831481BF9C8
 for <buildroot@lists.busybox.net>; Wed, 23 Mar 2022 21:40:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 80B77419E3
 for <buildroot@lists.busybox.net>; Wed, 23 Mar 2022 21:40:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RPpfkHOEm6Ze for <buildroot@lists.busybox.net>;
 Wed, 23 Mar 2022 21:40:24 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id DBE3241919
 for <buildroot@buildroot.org>; Wed, 23 Mar 2022 21:40:24 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id F26F685659; Wed, 23 Mar 2022 21:31:24 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 23 Mar 2022 22:18:12 +0100
X-Git-Refname: refs/heads/2021.11.x
X-Git-Oldrev: 5997ee004d2c3c22e48dfeb7d18c4ead4f76c547
X-Git-Newrev: 75ecaa43e0bddb4d562378c33aec11c881a8cd99
X-Patchwork-Hint: ignore
Message-Id: <20220323213124.F26F685659@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.11.x] package/libcurl: fix
 libgsasl support
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

commit: https://git.buildroot.net/buildroot/commit/?id=75ecaa43e0bddb4d562378c33aec11c881a8cd99
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.11.x

Contrary to the helptext
https://github.com/curl/curl/blob/master/configure.ac#L152

the configure option is called --with-libgsasl:
https://github.com/curl/curl/blob/master/configure.ac#L1989

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Acked-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit 4b98d8bba7c1358938f8930a0167abe7a3f6c521)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libcurl/libcurl.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libcurl/libcurl.mk b/package/libcurl/libcurl.mk
index a70ebe4113..4ff193d62e 100644
--- a/package/libcurl/libcurl.mk
+++ b/package/libcurl/libcurl.mk
@@ -128,9 +128,9 @@ endif
 
 ifeq ($(BR2_PACKAGE_LIBGSASL),y)
 LIBCURL_DEPENDENCIES += libgsasl
-LIBCURL_CONF_OPTS += --with-gsasl
+LIBCURL_CONF_OPTS += --with-libgsasl
 else
-LIBCURL_CONF_OPTS += --without-gsasl
+LIBCURL_CONF_OPTS += --without-libgsasl
 endif
 
 ifeq ($(BR2_PACKAGE_LIBCURL_COOKIES_SUPPORT),y)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
