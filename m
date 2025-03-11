Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CD37C28B2F
	for <buildroot@archiver.kernel.org>; Tue, 11 Mar 2025 22:22:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0D21F40D48;
	Tue, 11 Mar 2025 22:22:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0M4sk8lv1bDe; Tue, 11 Mar 2025 22:22:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C2FCF40D8E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C2FCF40D8E;
	Tue, 11 Mar 2025 22:22:53 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id E12051DA
 for <buildroot@buildroot.org>; Tue, 11 Mar 2025 22:22:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C492A40E46
 for <buildroot@buildroot.org>; Tue, 11 Mar 2025 22:22:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bf1RKGZDyg-y for <buildroot@buildroot.org>;
 Tue, 11 Mar 2025 22:22:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C8AAD401AF
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id C8AAD401AF
 for <buildroot@buildroot.org>; Tue, 11 Mar 2025 22:22:50 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id AF9BE87C46; Tue, 11 Mar 2025 22:22:50 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Tue, 11 Mar 2025 23:18:56 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ae884111d27d3c9fd22383fc1b4bb61ed7f075fd
X-Git-Newrev: 8ea3365b61045d3e41adf79b474993dbb28b7a00
X-Patchwork-Hint: ignore
Message-Id: <20250311222250.AF9BE87C46@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libcdio: needs host-pkgconf
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

commit: https://git.buildroot.net/buildroot/commit/?id=8ea3365b61045d3e41adf79b474993dbb28b7a00
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

With commit
https://github.com/libcdio/libcdio/commit/1f94664f766ef66b992e1c53a5e817a37988d894
upstream added a mandatory dependency to pkgconf in version 2.1.1.

Buildroot bumped libcdio with 920f45bd244166c8401dd05e054fc894eba143bf,
a backport is not needed.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/libcdio/libcdio.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libcdio/libcdio.mk b/package/libcdio/libcdio.mk
index b84ae27759..d4b277a15b 100644
--- a/package/libcdio/libcdio.mk
+++ b/package/libcdio/libcdio.mk
@@ -12,6 +12,7 @@ LIBCDIO_LICENSE = GPL-3.0+
 LIBCDIO_LICENSE_FILES = COPYING
 LIBCDIO_CPE_ID_VENDOR = gnu
 LIBCDIO_CONF_OPTS = --disable-example-progs --disable-cddb
+LIBCDIO_DEPENDENCIES = host-pkgconf
 
 ifeq ($(BR2_ENABLE_LOCALE),)
 LIBCDIO_DEPENDENCIES += libiconv
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
