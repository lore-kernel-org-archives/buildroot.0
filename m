Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E57FC282C6
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 17:23:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2E3A6508CE;
	Fri, 28 Feb 2025 17:23:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CjgD0oOnUCIJ; Fri, 28 Feb 2025 17:23:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 013C450AFC
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 013C450AFC;
	Fri, 28 Feb 2025 17:23:01 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 17A531DD
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:48:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E0BF847D59
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:32:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NXqtSEF3ncl0 for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:32:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A8D5D4838E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id A8D5D4838E
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:47 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A17598017D; Fri, 28 Feb 2025 16:30:47 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sun, 23 Feb 2025 18:44:53 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 41734e00c0cc36f4df2f492e72b535a0716d4048
X-Git-Newrev: fefb6a6785ccc7fd2818158ba443bbce80628364
X-Patchwork-Hint: ignore
Message-Id: <20250228163047.A17598017D@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/pkg-autotools: remove
 redundant configs
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

commit: https://git.buildroot.net/buildroot/commit/?id=fefb6a6785ccc7fd2818158ba443bbce80628364
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Since the following commit:
https://github.com/buildroot/buildroot/commit/b07030a708293756e25edd6432ed02cc53ff758e

The following host configs are included with $$(HOST_CONFIGURE_OPTS)
	CFLAGS="$$(HOST_CFLAGS)"
	LDFLAGS="$$(HOST_LDFLAGS)"

As they are redundant, we can remove them from the autotools infrastructure.

Signed-off-by: Neal Frager <neal.frager@amd.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/pkg-autotools.mk | 2 --
 1 file changed, 2 deletions(-)

diff --git a/package/pkg-autotools.mk b/package/pkg-autotools.mk
index f17186dfe4..8ffb0e0047 100644
--- a/package/pkg-autotools.mk
+++ b/package/pkg-autotools.mk
@@ -200,8 +200,6 @@ else
 define $(2)_CONFIGURE_CMDS
 	(cd $$($$(PKG)_SRCDIR) && rm -rf config.cache; \
 	$$(HOST_CONFIGURE_OPTS) \
-	CFLAGS="$$(HOST_CFLAGS)" \
-	LDFLAGS="$$(HOST_LDFLAGS)" \
 	$$($$(PKG)_CONF_ENV) \
 	CONFIG_SITE=/dev/null \
 	./configure \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
