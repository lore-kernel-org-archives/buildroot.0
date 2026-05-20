Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D94ACD4F3D
	for <buildroot@archiver.kernel.org>; Wed, 20 May 2026 19:41:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D53B6418CB;
	Wed, 20 May 2026 19:41:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6gjxREkYbKFR; Wed, 20 May 2026 19:41:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B8743418C9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1779306087;
	bh=nE/kGWwIhdmFjWPBjaGOYE+DPtnklQ8AUM1nIh9q9sM=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=aoYC6zJU9un7exs+XQaavmxqKn4jsU78V0ck/5B92ZOWBxe7tic8MJN9XalindtBv
	 lsE80frgqqzdKFugC8v23tHhYvP8vPCZSWPAY5UfuNo6g5tJdoUE1KGU7Xn8zf7UFc
	 yUINtHnn3wIgGDjjtpj6X3doKONGZp/cZx1dzRe7RjeyOOg25bN0INNk2YwnOs5O9z
	 Jul6sATtGHPM2tPrhx3FiKOsUyfQFEl37+efzyPK54BwpR/rBKQx+n4yDZwxRK7sxo
	 YmQNutDC8eK3yHSLkJ7JvGLBt7W1e23YS5zss05yOwGhjlsjUBuu4v7uGGsKjAtqx0
	 nXZrq7M4f6HoQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B8743418C9;
	Wed, 20 May 2026 19:41:27 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 60417265
 for <buildroot@buildroot.org>; Wed, 20 May 2026 19:41:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 51F7B40D1C
 for <buildroot@buildroot.org>; Wed, 20 May 2026 19:41:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 88ee6WucOOCg for <buildroot@buildroot.org>;
 Wed, 20 May 2026 19:41:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9327940D16
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9327940D16
 for <buildroot@buildroot.org>; Wed, 20 May 2026 19:41:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4E3B78693D; Wed, 20 May 2026 19:41:17 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 20 May 2026 21:40:00 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5528e00b10c5b98356550585324f775db2e4ea02
X-Git-Newrev: 8215cb491becdd8df95412cde556ae80169ccdf3
X-Patchwork-Hint: ignore
Message-Id: <20260520194117.4E3B78693D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/shadowsocks-libev: fix missing
 const
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
Content-Type: multipart/mixed; boundary="===============0319401095240275541=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0319401095240275541==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/8215cb491becdd8df95412cde556ae80169ccdf3
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Fixes: https://autobuild.buildroot.org/results/f1a/f1a83cce6216135a96611cc4e4eaa5766ebd730c

output/build/shadowsocks-libev-v3.3.6/src/netutils.c:278:28: error: initialization discards ‘const’ qualifier from pointer target type [-Werror=discarded-qualifiers]
  278 |         char *next_dot   = strchr(label, '.');

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
---
 .../0001-Fix-build-with-gcc13.patch                | 41 ++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/package/shadowsocks-libev/0001-Fix-build-with-gcc13.patch b/package/shadowsocks-libev/0001-Fix-build-with-gcc13.patch
new file mode 100644
index 0000000000..6bae81434a
--- /dev/null
+++ b/package/shadowsocks-libev/0001-Fix-build-with-gcc13.patch
@@ -0,0 +1,41 @@
+From 59a6aca7597c46cd1d079631d3061d952fbd0d6e Mon Sep 17 00:00:00 2001
+From: Hillwood Yang <hillwood@opensuse.org>
+Date: Tue, 5 May 2026 14:39:10 +0800
+Subject: [PATCH] Fix build with gcc13
+
+Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
+Upstream: https://github.com/shadowsocks/shadowsocks-libev/pull/3038
+---
+ src/acl.c      | 2 +-
+ src/netutils.c | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/src/acl.c b/src/acl.c
+index 1efc1aa..c77bbd7 100644
+--- a/src/acl.c
++++ b/src/acl.c
+@@ -57,7 +57,7 @@ static void
+ parse_addr_cidr(const char *str, char *host, int *cidr)
+ {
+     int ret = -1;
+-    char *pch;
++    const char *pch;
+ 
+     pch = strchr(str, '/');
+     while (pch != NULL) {
+diff --git a/src/netutils.c b/src/netutils.c
+index 8c7329a..35b2dc1 100644
+--- a/src/netutils.c
++++ b/src/netutils.c
+@@ -275,7 +275,7 @@ validate_hostname(const char *hostname, const int hostname_len)
+     const char *label = hostname;
+     while (label < hostname + hostname_len) {
+         size_t label_len = hostname_len - (label - hostname);
+-        char *next_dot   = strchr(label, '.');
++        const char *next_dot = strchr(label, '.');
+         if (next_dot != NULL)
+             label_len = next_dot - label;
+ 
+-- 
+2.53.0
+

--===============0319401095240275541==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0319401095240275541==--
