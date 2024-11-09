Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3567D5E373
	for <buildroot@archiver.kernel.org>; Sat,  9 Nov 2024 16:28:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 60E4A80C98;
	Sat,  9 Nov 2024 16:28:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4PQ6bdW_QLr8; Sat,  9 Nov 2024 16:28:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 71145813DA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 71145813DA;
	Sat,  9 Nov 2024 16:28:33 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 627B2D92
 for <buildroot@buildroot.org>; Sat,  9 Nov 2024 16:28:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 511A7605ED
 for <buildroot@buildroot.org>; Sat,  9 Nov 2024 16:28:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fkijFNacwGjW for <buildroot@buildroot.org>;
 Sat,  9 Nov 2024 16:28:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1CFDA605E6
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1CFDA605E6
 for <buildroot@buildroot.org>; Sat,  9 Nov 2024 16:28:30 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0AC4E81843; Sat,  9 Nov 2024 16:28:30 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 9 Nov 2024 17:23:00 +0100
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 3e801931dc28fe37359dfe36e93b2ca81aaac49b
X-Git-Newrev: 66f888250026099b21ff29dc81cdbffb0aacdcbd
X-Patchwork-Hint: ignore
Message-Id: <20241109162830.0AC4E81843@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/bind: force
 shared build
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=66f888250026099b21ff29dc81cdbffb0aacdcbd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

We got following error with --enable-static:

checking whether to build static libraries... yes
configure: error: Static linking is not supported as it disables dlopen() and certain security features (e.g. RELRO, ASLR)

Fixes:

 http://autobuild.buildroot.org/results/b55/b553898381ff0fdf5dd705fbb11b469b7564c6e6

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 7b43e248180ad3b3dd1804687bc4457f29a88137)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/bind/bind.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/bind/bind.mk b/package/bind/bind.mk
index 217c9916fd..d594ab5e39 100644
--- a/package/bind/bind.mk
+++ b/package/bind/bind.mk
@@ -33,6 +33,7 @@ BIND_CONF_OPTS = \
 	--enable-epoll \
 	--disable-doh \
 	--disable-backtrace \
+	--disable-static \
 	--with-openssl=$(STAGING_DIR)/usr
 
 BIND_DEPENDENCIES = host-pkgconf libuv openssl
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
