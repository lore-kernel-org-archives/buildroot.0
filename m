Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDBF6FF6E74
	for <buildroot@archiver.kernel.org>; Tue, 17 Mar 2026 20:35:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8E6EC407C7;
	Tue, 17 Mar 2026 20:35:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qnUVxxlZYDI3; Tue, 17 Mar 2026 20:35:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A960941033
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773779732;
	bh=WF4OlnpxyLoQoHETdorWg2QvJX8G8svqLASEmifZD0U=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=kko+afWKA9vXS1D4zoRgttQ0KNYuDmrgq/2+1729t1rI5zu5OghdAqytlxRtcrwkK
	 4LJg9oxGCc3+pIAWBqM5X45PCUkXD7zzkUT3S5shfAmewRgWVc0kTBvy7Ik1qx/HJT
	 u+QS02xW0ja18iI4qYUFiAjfWwFYgAXzI0e1dgDi9Vz+DrmiWXsv6bIMM6FP21JaG5
	 6ypwiUtPHifwiwqAMptFwf8DSuOidxtbQl6uGrqmj8Msiq244VCh765coiBSohjxpY
	 MbLyQrT1hn/ZLr+ULgzZdN3gq0RtZp6Bo6obGROUxpzuaHN4IcTBjtL/2KwXSYNxuY
	 C03Ik8PZQKKNg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A960941033;
	Tue, 17 Mar 2026 20:35:32 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id C91C53DB
 for <buildroot@buildroot.org>; Tue, 17 Mar 2026 20:35:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AF26241033
 for <buildroot@buildroot.org>; Tue, 17 Mar 2026 20:35:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FTFKNUItvyUB for <buildroot@buildroot.org>;
 Tue, 17 Mar 2026 20:35:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 057F0407C7
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 057F0407C7
 for <buildroot@buildroot.org>; Tue, 17 Mar 2026 20:35:28 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2B0BF87394; Tue, 17 Mar 2026 20:35:27 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 17 Mar 2026 21:34:25 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a21946562b8d099f9de2cc560b747a711b234669
X-Git-Newrev: 4cc0e959ffa9e5c57aacaaa3d868252a21f62c99
X-Patchwork-Hint: ignore
Message-Id: <20260317203527.2B0BF87394@busybox.osuosl.org>
Subject: [Buildroot] [git commit] CHANGES: update for 2025.11.3
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/4cc0e959ffa9e5c57aacaaa3d868252a21f62c99
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
(cherry picked from commit 91f60590fdacb13faeeee7dd50d089cf84bbe5a3)
---
 CHANGES | 58 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 58 insertions(+)

diff --git a/CHANGES b/CHANGES
index 3742c7422d..17ce1fdec4 100644
--- a/CHANGES
+++ b/CHANGES
@@ -101,6 +101,64 @@
 	- How can I make the 'en_US' locale by default?
 	  https://gitlab.com/buildroot.org/buildroot/-/issues/161
 
+2025.11.3, released March 17, 2026
+
+	Important / security related fixes:
+
+	botan: CVE-2024-50382, CVE-2024-50383
+	c-ares: CVE-2025-62408
+        clamav: CVE-2026-20031
+	containerd: CVE-2024-25621, CVE-2024-40635, CVE-2025-47291,
+	  CVE-2025-64329
+	cups: CVE-2025-58436, CVE-2025-61915
+	exiv2: CVE-2026-25884, CVE-2026-27596, CVE-2026-27631
+	fluidsynth: CVE-2025-56225
+	freerdp: CVE-2024-32661, CVE-2026-23530, CVE-2026-23531,
+	  CVE-2026-23532, CVE-2026-23533, CVE-2026-23534, CVE-2026-23948,
+	  CVE-2026-24675, CVE-2026-24676, CVE-2026-24679, CVE-2026-24681,
+	  CVE-2026-24682, CVE-2026-24683
+	freetype: CVE-2026-23865
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
+	python-multipart: CVE-2026-24486
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
+	Updated / fixed packages: botan, c-ares, clamav, containerd, cups,
+	  docker, dtc, exiv2, faketime, flashbench, freerdp, freetype,
+	  graphicsmagick, igmpproxy, imagemagick, jasper, libsoup3, libssh,
+	  libtpms, libvips, libvirt, libzlib, mpir, mupdf, netsnmp, patch, poco,
+	  postgresql, python3, python-multipart, qemu, rtl_433, samba4, snort,
+	  squid, tinyproxy, util-linux, vim, webkitgtk, wireshark, wmctrl,
+	  wpewebkit
+
+	Removed packages: qemu (cris target), python3 (ossaudiodev)
+
 2025.11.2, released February 20, 2026
 
 	avahi: CVE-2021-3468, CVE-2023-38469, CVE-2023-38470, CVE-2023-38471,
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
