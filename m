Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6641D2F35C
	for <buildroot@archiver.kernel.org>; Tue, 13 Jan 2026 19:37:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9E01B83CEA;
	Tue, 13 Jan 2026 19:37:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dGfy-ZWXwB10; Tue, 13 Jan 2026 19:37:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 31BE383D09
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768333047;
	bh=lmpafS8VgfSsJAtOQ6/ChZrwsOaHwvbvBZs0nJCxXYA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=A5x9UgUdGZqeM+FHR0UYiDKUGWR0fuLo99XN/QCLrqs9/4544SDk8m4E9RzaLqXFI
	 YKWjo12lpBpCGN4q8xnYiRa2Gn1C3M8mRXmuL672QMxt4iNY3fL0ReyIvrG/MONcfH
	 pLrL5eCNY7TSicT7uWCxDlPpnYkHxDQB9ThshhUz4ax+6dvkT3XsKdda1a+PE8NOdL
	 ljKkLP2K3Kau+HUJJI6yhn/muzljjxKIlyDDeBADJMQKb+Y/Pt4g2zYuWypSPAWMUF
	 r2L8ZmD8jNLAVWp6ANv4f8HqUsovxR+3u6Jm0o0lPp8+gPf5dxPNsb4qMJtg7i5la7
	 hjBzK+9NuAhzw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 31BE383D09;
	Tue, 13 Jan 2026 19:37:27 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 30CBE231
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:36:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B49D440543
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:36:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AYlhBwSL_kYF for <buildroot@buildroot.org>;
 Tue, 13 Jan 2026 19:36:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ACF1340177
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id ACF1340177
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:36:18 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9DFA286184; Tue, 13 Jan 2026 19:36:18 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 9 Jan 2026 16:23:31 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 9a4ef6c282363bc9d349b177596e2b064223f30d
X-Git-Newrev: 1e177c568cbc29e61ec83fd96340defda897f6ba
X-Patchwork-Hint: ignore
Message-Id: <20260113193618.9DFA286184@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x]
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

commit: https://git.buildroot.net/buildroot/commit/?id=1e177c568cbc29e61ec83fd96340defda897f6ba
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

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
