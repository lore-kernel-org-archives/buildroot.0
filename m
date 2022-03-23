Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FF3DC433F5
	for <buildroot@archiver.kernel.org>; Wed, 23 Mar 2022 21:44:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3C62840FF1;
	Wed, 23 Mar 2022 21:44:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 226K1e8XHPCe; Wed, 23 Mar 2022 21:44:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5F1E3403F7;
	Wed, 23 Mar 2022 21:44:03 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5609A1BF489
 for <buildroot@lists.busybox.net>; Wed, 23 Mar 2022 21:40:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B7FA5841FD
 for <buildroot@lists.busybox.net>; Wed, 23 Mar 2022 21:40:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uPyoIZOdvuqV for <buildroot@lists.busybox.net>;
 Wed, 23 Mar 2022 21:40:34 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2012A847A6
 for <buildroot@buildroot.org>; Wed, 23 Mar 2022 21:40:34 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 3A2D0856EC; Wed, 23 Mar 2022 21:31:34 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 23 Mar 2022 22:16:34 +0100
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: b9adf86d9b64c32acfb9e2a1b0c1567b06ab8fe6
X-Git-Newrev: de5f4568c015e2adc82eab3fc007802c3a87ed24
X-Patchwork-Hint: ignore
Message-Id: <20220323213134.3A2D0856EC@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/libcurl: fix
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

commit: https://git.buildroot.net/buildroot/commit/?id=de5f4568c015e2adc82eab3fc007802c3a87ed24
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

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
