Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE99BD2F32D
	for <buildroot@archiver.kernel.org>; Tue, 13 Jan 2026 19:41:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AE79483E88;
	Tue, 13 Jan 2026 19:41:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0eSe_2a3Fqmn; Tue, 13 Jan 2026 19:41:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BA8908350A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768333272;
	bh=wqPAFiA/erZag+K6fg7X1hfx+j1WMyQow+3r1MlKrAc=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=gb9UYfgAqPcO/w7m+GYZbg+ndcMF+QI7vRKmsPiTWJl3hyn7EagONmJUryYpAiZCA
	 QYiLugLVUJKjVP1e/Cw1vGHnwb5ZpVvyuc9FXd+o9N4Pp4MV3qBJ28bhqbDMiHCSBt
	 2LXSrxGzrSJmlbyHSMkcmNezLsqksMIpV8U6h/WIIRhCqNLuT1J8vbCQUiIwaTe0e9
	 ZxlqGk79X3MyjrFF32N7WaXkfr/X3ZfRP9IXhGmoKqQ8fZm5kF7jugc7d7za2JAsSy
	 tnoNtg4cHBihUP2SyGVZMlDHbefekDnkqEISydHLyhIRbvbHzJN1MJB9Y6AzePmopp
	 ditlkVf6tFoJA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id BA8908350A;
	Tue, 13 Jan 2026 19:41:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0D535231
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:40:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3A05482FD5
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:40:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ywEbQLsmz6rV for <buildroot@buildroot.org>;
 Tue, 13 Jan 2026 19:40:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6FFCB82F9B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6FFCB82F9B
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:40:33 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6D6188256D; Tue, 13 Jan 2026 19:40:33 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 9 Jan 2026 16:23:33 +0100
X-Git-Refname: refs/heads/2025.11.x
X-Git-Oldrev: 21868726d38ca2cfc17cd0bfcab5b97f032f8d1c
X-Git-Newrev: ba8965f72dc59bbcff6695e0a8fd0f0afe2bf30f
X-Patchwork-Hint: ignore
Message-Id: <20260113194033.6D6188256D@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.11.x]
 package/x11r7/xlib_libxshmfence: set shared-memory-dir
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=ba8965f72dc59bbcff6695e0a8fd0f0afe2bf30f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.11.x

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
(cherry picked from commit cb79eee7fe6f5e8e5e31474dba47dc054fabfa02)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
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
