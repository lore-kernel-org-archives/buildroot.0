Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BD53FF6E72
	for <buildroot@archiver.kernel.org>; Tue, 17 Mar 2026 20:35:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1FD6661518;
	Tue, 17 Mar 2026 20:35:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6zPErOA6m3Vq; Tue, 17 Mar 2026 20:35:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A27EA61509
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773779730;
	bh=MobS1WCWrVgMyXF2QO5rCAxstaJ+OXfPQVzRFyCLfT8=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=WFzx4ll3oILfRCPgy9PydmAxcfs5LPu/n6U/9OKAaifSESCT4pLkyIGKhFB6CAdO5
	 YKrhSSTr+6gzh0RhuJqTBpc+vUQs4xrsgsqt10pecZimskqOZsD7g1ce1y02I3cO7m
	 tyr1QWNEXlkzTwa3BjO5bALzS8IxsQ08ODkYhcSk/Ufg1jG/NYPD5kq0i+IvEuNha9
	 ps33Izw23GOB0YS/CmESrz984EopaLxjG7tNfa48KZMwYvHm1RUAXL0VUZLdVlULLj
	 qPpufa52/5vRzw4vvR3sKZu5qtXcowCyH9nkhwCBtdif+t+ZusyG8aHgSJNz0e+I1p
	 sTkykSm8YrqZw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A27EA61509;
	Tue, 17 Mar 2026 20:35:30 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id C69723DA
 for <buildroot@buildroot.org>; Tue, 17 Mar 2026 20:35:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B80EA4019E
 for <buildroot@buildroot.org>; Tue, 17 Mar 2026 20:35:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ER6JOfnflnwU for <buildroot@buildroot.org>;
 Tue, 17 Mar 2026 20:35:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E212540183
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id E212540183
 for <buildroot@buildroot.org>; Tue, 17 Mar 2026 20:35:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 113B7874EB; Tue, 17 Mar 2026 20:35:27 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 17 Mar 2026 21:33:14 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b6cd84644360e8fc59e074b3baffaaa685f6c64a
X-Git-Newrev: a21946562b8d099f9de2cc560b747a711b234669
X-Patchwork-Hint: ignore
Message-Id: <20260317203527.113B7874EB@busybox.osuosl.org>
Subject: [Buildroot] [git commit] CHANGES: update for 2025.02.12
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/a21946562b8d099f9de2cc560b747a711b234669
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
(cherry picked from commit 8e3c43d9cc44d3a8197574d83d199843aa3d2076)
---
 CHANGES | 54 ++++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 54 insertions(+)

diff --git a/CHANGES b/CHANGES
index 257c3ee8bc..3742c7422d 100644
--- a/CHANGES
+++ b/CHANGES
@@ -931,6 +931,60 @@
 	- netsnmp: unexpected header length in /proc/net/snmp...
 	  https://gitlab.com/buildroot.org/buildroot/-/issues/110
 
+2025.02.12, released March 17, 2026
+
+	Important / security related fixes:
+
+	botan: CVE-2024-50382, CVE-2024-50383
+	c-ares: CVE-2025-62408
+	containerd: CVE-2024-25621, CVE-2024-40635, CVE-2025-47291,
+	  CVE-2025-64329
+	cups: CVE-2025-58436, CVE-2025-61915
+	exiv2: CVE-2026-25884, CVE-2026-27596, CVE-2026-27631
+	fluidsynth: CVE-2025-56225
+	freerdp: CVE-2024-32661, CVE-2026-23530, CVE-2026-23531,
+	  CVE-2026-23532, CVE-2026-23533, CVE-2026-23534, CVE-2026-23948,
+	  CVE-2026-24675, CVE-2026-24676, CVE-2026-24679, CVE-2026-24681,
+	  CVE-2026-24682, CVE-2026-24683
+	graphicsmagick, CVE-2025-27796
+	igmpproxy: CVE-2025-50681
+	imagemagick: CVE-2026-22770, CVE-2026-23874, CVE-2026-23876,
+	  CVE-2026-24481, CVE-2026-25638, CVE-2026-25794, CVE-2026-25795,
+	  CVE-2026-25796, CVE-2026-25798, CVE-2026-25799, CVE-2026-25897,
+	  CVE-2026-25989, CVE-2026-26066, CVE-2026-26283, CVE-2026-26284,
+	  CVE-2026-26983
+	jasper: CVE-2025-8836, CVE-2025-8837
+	libsoup3: CVE-2025-14523
+	libssh: CVE-2025-14821, CVE-2026-0964, CVE-2026-0965, CVE-2026-0966,
+	  CVE-2026-0967, CVE-2026-0968
+	libtpms: CVE-2026-21444
+	mupdf: CVE-2026-25556
+	netsnmp: CVE-2025-68615
+	patch: CVE-2018-6952, CVE-2019-20633
+	postgresql: CVE-2026-2003, CVE-2026-2004, CVE-2026-2005, CVE-2026-2006
+	rtl_433: CVE-2025-34450
+	squid: CVE-2025-62168
+	tinyproxy: CVE-2025-63938
+	vim: CVE-2026-25749, CVE-2026-26269
+	wpewebkit: CVE-2025-31273, CVE-2025-31278, CVE-2025-43211,
+	  CVE-2025-43212, CVE-2025-43216, CVE-2025-43227, CVE-2025-43228,
+	  CVE-2025-43240, CVE-2025-43265, CVE-2025-43272, CVE-2025-43342,
+	  CVE-2025-43343, CVE-2025-43356, CVE-2025-43368, CVE-2025-6558
+
+	Infrastructure updates/fixes:
+
+	linux: make license option visible for _CUSTOM_VERSION as well
+	support/testing/run-tests: fix Debian testing/unstable
+
+	Updated / fixed packages: botan, c-ares, containerd, cups, dtc, exiv2,
+	  faketime, flashbench, fluidsynth, freerdp, graphicsmagick, igmpproxy,
+	  imagemagick, jasper, libsoup3, libssh, libtpms, libvips, libvirt,
+	  libzlib, mupdf, netsnmp, patch, poco, postgresql, python-multipart,
+	  qemu, rtl_433, squid, tinyproxy, util-linux, vim, webkitgtk, wmctrl,
+	  wpewebkit
+
+	Removed packages: qemu (cris target)
+
 2025.02.11, released February 20, 2026
 
 	avahi: CVE-2021-3468, CVE-2023-38469, CVE-2023-38470, CVE-2023-38471,
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
