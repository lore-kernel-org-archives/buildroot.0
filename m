Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8144C87FCF
	for <buildroot@archiver.kernel.org>; Thu,  7 Aug 2025 17:20:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C1FCA405C2;
	Thu,  7 Aug 2025 17:20:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DhlCw4gaac7J; Thu,  7 Aug 2025 17:20:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0F7254059D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0F7254059D;
	Thu,  7 Aug 2025 17:20:45 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 9D0C14C4
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 17:19:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 96A5540066
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 17:19:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id V_bVbMVLeAif for <buildroot@buildroot.org>;
 Thu,  7 Aug 2025 17:19:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2C93C40081
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2C93C40081
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 17:19:16 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2A0C580FCA; Thu,  7 Aug 2025 17:19:16 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 7 Aug 2025 19:09:22 +0200
X-Git-Refname: refs/heads/2025.05.x
X-Git-Oldrev: dde378c63e3899dad6400fee57eed5baae856069
X-Git-Newrev: ba2fadb3992c806a2d2ec2e392dcde78c6803387
X-Patchwork-Hint: ignore
Message-Id: <20250807171916.2A0C580FCA@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.05.x] package/libcurl: remove
 configure option --with-random
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

commit: https://git.buildroot.net/buildroot/commit/?id=ba2fadb3992c806a2d2ec2e392dcde78c6803387
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.05.x

Upstream removed this configure option in version 8.10.0:
https://github.com/curl/curl/commit/269fdd4c6ed5d837d57448ac977f6f300968df15
which was added to buildroot with commit
d68b999787a0e0838c3bb2d5966f11d8a349a49b.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit d48412b58eefc47924f7821517d77739940f81d4)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/libcurl/libcurl.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/libcurl/libcurl.mk b/package/libcurl/libcurl.mk
index 114ff3d70b..51716cd45b 100644
--- a/package/libcurl/libcurl.mk
+++ b/package/libcurl/libcurl.mk
@@ -20,7 +20,6 @@ LIBCURL_INSTALL_STAGING = YES
 LIBCURL_CONF_OPTS = \
 	--disable-manual \
 	--disable-ntlm \
-	--with-random=/dev/urandom \
 	--disable-curldebug \
 	--disable-libcurl-option \
 	--disable-ldap \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
