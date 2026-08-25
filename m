Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92017C61DB6
	for <buildroot@archiver.kernel.org>; Tue, 25 Aug 2026 08:30:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5EA11606AE;
	Tue, 25 Aug 2026 08:30:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5enRAaHs5R72; Tue, 25 Aug 2026 08:30:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787646621;
	bh=rOFfiZnPZjc9cEE9gUL/PZQ1Jlf4buWzoKbH8g/SbOo=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=QBfmTYlFMcK3SL/XM7e05f7tbYnJ+5iD/1HxYXdqRqUO8T6MC8/b9e5ABlTj/lU4i
	 /b7PwbLEpS/UBZZJ/lZPncTbH1bBR35Te1E7lnfo3M8365xOYX3jJNgxaLDwoEObBB
	 yPAD+aDlBz8cT2sjZlVjuBkvJw9DQLakutsUi7R5ylK3BZkwIt6GUTASEXqDe7Iaqm
	 Dgb6OxEJnx8eS1rBZ1eVfBcna2DctKhDZbBbopPUfecHlwCNJ72Oh1a7ZL8iGt6thF
	 1RgBECZ5HqgKLEHqMjhJTIiEZk9TCfgw5+ATIYpqY4rWeou6YUfZUsLYvhVK0stnVu
	 Rji5rY+Bbvo7A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2E00A6060B;
	Tue, 25 Aug 2026 08:30:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 2ED28118
 for <buildroot@buildroot.org>; Tue, 25 Aug 2026 08:30:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0FA88405FB
 for <buildroot@buildroot.org>; Tue, 25 Aug 2026 08:30:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wBZuHtq67Pmm for <buildroot@buildroot.org>;
 Tue, 25 Aug 2026 08:30:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 534A8405F6
 for <buildroot@buildroot.org>; Tue, 25 Aug 2026 08:30:19 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D789891474; Tue, 25 Aug 2026 08:29:23 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 25 Aug 2026 10:27:50 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 58f31377389dd2f5090e4dd69deb4d5f994f88c0
X-Git-Newrev: c782302e2fc7ed4c87e893ad291adadd3467b7f9
X-Patchwork-Hint: ignore
Message-Id: <20260825082923.D789891474@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/weston: add patch to fix with
 libdisplay-info 0.4.0
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/c782302e2fc7ed4c87e893ad291adadd3467b7f9
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Buildroot commit [1] bumped libdisplay-info to 0.4.0.
The weston version 15.0.1 in Buildroot has a strict condition on
libdisplay-info < 0.4.0. See [2].

This commit fixes the issue by adding an upstream patch which relaxes this
condition.

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/16060154054

[1] https://gitlab.com/buildroot.org/buildroot/-/commit/766d3a6e87003bda9ae7ff3f92e17b7fdced82aa
[2] https://gitlab.freedesktop.org/wayland/weston/-/blob/15.0.1/meson.build#L181

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../weston/0001-Allow-libdisplay-info-0.4.0.patch  | 28 ++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/package/weston/0001-Allow-libdisplay-info-0.4.0.patch b/package/weston/0001-Allow-libdisplay-info-0.4.0.patch
new file mode 100644
index 0000000000..8d7739e8c4
--- /dev/null
+++ b/package/weston/0001-Allow-libdisplay-info-0.4.0.patch
@@ -0,0 +1,28 @@
+From f0152f4c04d6ef21159dd5bc98700dc46ac8cb04 Mon Sep 17 00:00:00 2001
+From: Tom Pollard <tom.pollard@codethink.co.uk>
+Date: Tue, 28 Jul 2026 10:51:27 +0100
+Subject: [PATCH] Allow libdisplay-info 0.4.0
+
+Signed-off-by: Tom Pollard <tom.pollard@codethink.co.uk>
+Upstream: https://gitlab.freedesktop.org/wayland/weston/-/commit/54cd5c3354c618815addd7e1d82fc66247099136
+Signed-off-by: Julien Olivain <ju.o@free.fr>
+---
+ meson.build | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/meson.build b/meson.build
+index 79256cd6..d6ede4df 100644
+--- a/meson.build
++++ b/meson.build
+@@ -178,7 +178,7 @@ endif
+ 
+ dep_libdisplay_info = dependency(
+ 	'libdisplay-info',
+-	version: ['>= 0.2.0', '< 0.4.0'],
++	version: ['>= 0.2.0', '< 0.5.0'],
+ 	fallback: ['display-info', 'di_dep'],
+ 	default_options: [
+ 		'werror=false',
+-- 
+2.55.0
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
