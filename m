Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75B85EE6428
	for <buildroot@archiver.kernel.org>; Wed, 31 Dec 2025 11:19:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AFD0681E0D;
	Wed, 31 Dec 2025 11:19:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ba4LeG3DPbGw; Wed, 31 Dec 2025 11:18:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9729581E03
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767179939;
	bh=q4HUmBbkYXt8vpc/9epBBovxfFGVHlYgBApNw+PIprI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Mlgp1bkdnmCi90EHQV9Hd8PYR6M2h+Sgbg9XJQnr/GltBZpYvOgMJxx6IrZvQFfAR
	 0Y6DS40vkTvV98rKyc7e68TS9ndAnI1knjjLIq8tV7kz++P3zsjn7GXVfxNmoX59eO
	 VoUozmGElfTk494uQZM3tF6WcOHrLPaadje40qninqvUQ54CbbtdlpFxjNEtqs7xfM
	 X/ecQVZGnCH3RCd0ySuvthCeDHG/bkUPlpEPvPEt+Wm3wX5BSsMaCyxUz2jkPVCaZ8
	 Y9HajdTuRIDwgR7wAkJo9NPM/RkR224+9c6CDqd8t9GfJjUHoGAdA0ImVmgeCg/urc
	 hZM/xfoBfyaRA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9729581E03;
	Wed, 31 Dec 2025 11:18:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 5EB21177
 for <buildroot@buildroot.org>; Wed, 31 Dec 2025 11:18:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 457C04048D
 for <buildroot@buildroot.org>; Wed, 31 Dec 2025 11:18:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id r2Aba_BPQiPu for <buildroot@buildroot.org>;
 Wed, 31 Dec 2025 11:18:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 44449403E0
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 44449403E0
 for <buildroot@buildroot.org>; Wed, 31 Dec 2025 11:18:57 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2AE6D83917; Wed, 31 Dec 2025 11:18:57 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 31 Dec 2025 12:16:59 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 02d76e151227f1b4955ce231bdc7d74d15766a96
X-Git-Newrev: cb79eee7fe6f5e8e5e31474dba47dc054fabfa02
X-Patchwork-Hint: ignore
Message-Id: <20251231111857.2AE6D83917@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/x11r7/xlib_libxshmfence: set
 shared-memory-dir
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

commit: https://git.buildroot.net/buildroot/commit/?id=cb79eee7fe6f5e8e5e31474dba47dc054fabfa02
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

libxshmfence has multiple paths available for the shared memory
directory, as some distros [0] opt to mount their tmpfs in a
non-standard location such as /run/shm rather than /dev/shm.

The default value of 'auto' will set this path to whatever the host is
using, leaking host configuration into the target. See [1].

With X configurations that depend on shared memory files for futexes,
(muvm [2] is a notable example), this results in applications silently
breaking during presentation with a blank window, as the configured
path doesn't have the required tmpfs mount.

Set this path explicitly to avoid situations where the host context
leaks into the package build, causing feature breakage.

[0] https://wiki.ubuntu.com/OneiricOcelot/ReleaseNotes?action=show&redirect=OneiricOcelot%2FTechnicalOverview#Upgrades
[1] https://gitlab.freedesktop.org/xorg/lib/libxshmfence/-/blob/libxshmfence-1.3.3/configure.ac#L144
[2] https://github.com/AsahiLinux/muvm

Signed-off-by: Joseph Kogut <joseph.kogut@gmail.com>
[Julien:
 - add link to shared memory dir detection code in commit log
 - replace "+=" by "=" in _CONF_OPTS
]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/x11r7/xlib_libxshmfence/xlib_libxshmfence.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/x11r7/xlib_libxshmfence/xlib_libxshmfence.mk b/package/x11r7/xlib_libxshmfence/xlib_libxshmfence.mk
index b8c9ebfe97..fff79c5145 100644
--- a/package/x11r7/xlib_libxshmfence/xlib_libxshmfence.mk
+++ b/package/x11r7/xlib_libxshmfence/xlib_libxshmfence.mk
@@ -12,4 +12,7 @@ XLIB_LIBXSHMFENCE_LICENSE_FILES = COPYING
 XLIB_LIBXSHMFENCE_INSTALL_STAGING = YES
 XLIB_LIBXSHMFENCE_DEPENDENCIES = host-pkgconf xorgproto
 
+# default 'auto' leaks context from host
+XLIB_LIBXSHMFENCE_CONF_OPTS = --with-shared-memory-dir=/dev/shm
+
 $(eval $(autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
