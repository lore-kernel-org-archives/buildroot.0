Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93AF2C433F5
	for <buildroot@archiver.kernel.org>; Mon, 21 Mar 2022 21:33:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4AFF760FD5;
	Mon, 21 Mar 2022 21:33:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AQsdissjIgeT; Mon, 21 Mar 2022 21:33:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4BF0D60FD1;
	Mon, 21 Mar 2022 21:33:43 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 129361BF239
 for <buildroot@lists.busybox.net>; Mon, 21 Mar 2022 21:33:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0F928409F4
 for <buildroot@lists.busybox.net>; Mon, 21 Mar 2022 21:33:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uJl9KGGkGBkD for <buildroot@lists.busybox.net>;
 Mon, 21 Mar 2022 21:33:32 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4960740875
 for <buildroot@buildroot.org>; Mon, 21 Mar 2022 21:33:32 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id DCDBA84EAD; Mon, 21 Mar 2022 21:24:36 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Mon, 21 Mar 2022 22:18:32 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f3476b1dedfbd6892b82e096a48199111032ba72
X-Git-Newrev: 4b98d8bba7c1358938f8930a0167abe7a3f6c521
X-Patchwork-Hint: ignore
Message-Id: <20220321212436.DCDBA84EAD@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libcurl: fix libgsasl support
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

commit: https://git.buildroot.net/buildroot/commit/?id=4b98d8bba7c1358938f8930a0167abe7a3f6c521
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Contrary to the helptext
https://github.com/curl/curl/blob/master/configure.ac#L152

the configure option is called --with-libgsasl:
https://github.com/curl/curl/blob/master/configure.ac#L1989

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Acked-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/libcurl/libcurl.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libcurl/libcurl.mk b/package/libcurl/libcurl.mk
index 20ebb4f271..4b2e52829c 100644
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
