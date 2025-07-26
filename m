Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA932C87FCA
	for <buildroot@archiver.kernel.org>; Sat, 26 Jul 2025 11:44:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 70AE740F19;
	Sat, 26 Jul 2025 11:44:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WgTHaECAKSeC; Sat, 26 Jul 2025 11:44:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 21EA5411EB
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 21EA5411EB;
	Sat, 26 Jul 2025 11:44:08 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 3E14D198
 for <buildroot@buildroot.org>; Sat, 26 Jul 2025 11:44:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6E7B240080
 for <buildroot@buildroot.org>; Sat, 26 Jul 2025 11:44:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ls8WV9PiT9WN for <buildroot@buildroot.org>;
 Sat, 26 Jul 2025 11:44:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7430F40151
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7430F40151
 for <buildroot@buildroot.org>; Sat, 26 Jul 2025 11:44:03 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5E48386A33; Sat, 26 Jul 2025 11:44:03 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 26 Jul 2025 13:32:18 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2c20a2541c9a9883d00bc39a5711fa312d915758
X-Git-Newrev: 8ee654b28e0ccd06e25f8409d553c865d2a978d0
X-Patchwork-Hint: ignore
Message-Id: <20250726114403.5E48386A33@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libcurl: remove configure option
 --disable-ntlm-wb
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=8ee654b28e0ccd06e25f8409d553c865d2a978d0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Upstream removed this configure option in version 8.8.0:
https://github.com/curl/curl/commit/50def7c881ba560ab6e0235990e8f07fa69f4bc8
which was added to buildroot with commit
50bdb2a3b7ace71065dc0b8a81bebc173f84a8c4.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/libcurl/libcurl.mk | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/package/libcurl/libcurl.mk b/package/libcurl/libcurl.mk
index e390c9d1bf..114ff3d70b 100644
--- a/package/libcurl/libcurl.mk
+++ b/package/libcurl/libcurl.mk
@@ -15,17 +15,11 @@ LIBCURL_LICENSE_FILES = COPYING
 LIBCURL_CPE_ID_VENDOR = haxx
 LIBCURL_INSTALL_STAGING = YES
 
-# We disable NTLM delegation to winbinds ntlm_auth ('--disable-ntlm-wb')
-# support because it uses fork(), which doesn't work on non-MMU platforms.
-# Moreover, this authentication method is probably almost never used (see
-# https://curl.se/docs/manpage.html#--ntlm), so disable NTLM support overall.
-#
 # Likewise, there is no compiler on the target, so libcurl-option (to
 # generate C code) isn't very useful
 LIBCURL_CONF_OPTS = \
 	--disable-manual \
 	--disable-ntlm \
-	--disable-ntlm-wb \
 	--with-random=/dev/urandom \
 	--disable-curldebug \
 	--disable-libcurl-option \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
