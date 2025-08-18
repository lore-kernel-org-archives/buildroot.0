Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95583CA0EE4
	for <buildroot@archiver.kernel.org>; Mon, 18 Aug 2025 13:25:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4AF5F41E1B;
	Mon, 18 Aug 2025 13:25:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tZeh8Qa0FPgZ; Mon, 18 Aug 2025 13:25:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 65D1441E01
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 65D1441E01;
	Mon, 18 Aug 2025 13:25:08 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id C53D075
 for <buildroot@buildroot.org>; Mon, 18 Aug 2025 13:25:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id ABC224178F
 for <buildroot@buildroot.org>; Mon, 18 Aug 2025 13:25:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id duW0f6Dup1J7 for <buildroot@buildroot.org>;
 Mon, 18 Aug 2025 13:25:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.21;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 1551A41759
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1551A41759
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1551A41759
 for <buildroot@buildroot.org>; Mon, 18 Aug 2025 13:25:03 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from haruka.home.arpa ([85.22.106.73]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MPogF-1v9G2Q0diF-00Rt1c; Mon, 18
 Aug 2025 15:25:01 +0200
To: buildroot@buildroot.org
Cc: Christian Stewart <christian@aperture.us>,
 "Fiona Klute (WIWA)" <fiona.klute@gmx.de>
Date: Mon, 18 Aug 2025 15:24:36 +0200
Message-ID: <20250818132436.338635-1-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-Provags-ID: V03:K1:uElIrNPwau5SPd1evK/WSyz903ZFZL7GVOpaSL1FfMPL9WISjvQ
 xzkMD18GFrCt+BH1oFg0LWYhWEHvRIMPoMRBG5/KU6g1MmteM+YEy3jl3A4NiAi93OO0bG7
 cIyDI0OdQUrL+qy9NSmuP0iI4Tf4mM4CKkjyQ9eD7v5s+xGp/TXTY1w/R877xz36lbc9yUF
 3uUq+o+ISj13pcqc+icVg==
UI-OutboundReport: notjunk:1;M01:P0:8aN8CmI5GPk=;oXE7LUbE3TlcIPVv0EYNB7yFaUS
 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
 qFOoMzQ=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1755523501; x=1756128301; i=fiona.klute@gmx.de;
 bh=m4o1a7eIcyYLzbOMJBK+Qg3OL+clA4Cz3e5HN0RtSkg=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
 MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=kh+GC/Tir0u1FzxsR9TEQsXtKSzektBgNhXvxD48xqEfAFufqM5tNILxSfJYs+jx
 GMNd5aE5msFGNT8JJU844BDBZZ85cRqV3sorXufe6Elk2FCobtXJmL/C4w/mSbydo
 koEsmjWlDC+7FALvH1IRzVsrkSAzYlK9CHm7JGOYx5rjwGgNaHy9GGkW+R3tcj9AK
 pkaa/MN5WKiT1tq88FRVs3Y6hNCCMyLxbm+SOhebFGwnnT63cncnIrcAie7new+OT
 jT3EG0OAcJfkHUSdiNTBq6ON8GN0noVmfObgCZl32yZzHjNcn32gXJHMtfvBl+8Hy
 ieTAG4qjpGmh0xuBQQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=kh+GC/Ti
Subject: [Buildroot] [PATCH 1/1] package/docker-engine: prefer cgroup v2
 with kernel >=5.4 and no systemd
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: "Fiona Klute (WIWA)" <fiona.klute@gmx.de>

Without systemd package/docker-engine requires another way to mount
/sys/fs/cgroup, so far unconditionally provided by
BR2_PACKAGE_CGROUPFS_MOUNT for cgroup v1. However, it is preferable to
use cgroup v2 if possible. Whether Docker can use cgroup v2 depends on
the kernel version, the Docker documentation lists the requirement as
"v4.15 or later (v5.2 or later is recommended)" [1].

Select BR2_PACKAGE_CGROUPFS_V2_MOUNT instead of
BR2_PACKAGE_CGROUPFS_MOUNT if the kernel headers match the recommended
version.

[1] https://docs.docker.com/engine/containers/runmetrics/#running-docker-on-cgroup-v2

Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
---
I noticed Docker was unconditionally pulling in
BR2_PACKAGE_CGROUPFS_MOUNT while investigating a Docker warning about
memory cgroup not being available, and indeed my kernel config has
CONFIG_MEMCG enabled, but not the "highly discouraged" (to quote its
kernel config description) CONFIG_MEMCG_V1. Switching to v2 on
sufficiently recent kernels seems equally highly preferable.

I'm not sure if package/moby-buildkit should be adjusted to match so
the dependencies won't conflict. Current Buildkit definitely works
with cgroup v2, but the packaged version is fairly old.

 package/docker-engine/Config.in | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/docker-engine/Config.in b/package/docker-engine/Config.in
index 6338eeeef1..d591ee4e3b 100644
--- a/package/docker-engine/Config.in
+++ b/package/docker-engine/Config.in
@@ -7,7 +7,8 @@ config BR2_PACKAGE_DOCKER_ENGINE
 	depends on BR2_USE_MMU # containerd
 	depends on BR2_PACKAGE_LIBSECCOMP_ARCH_SUPPORTS # libseccomp
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_17 # libseccomp
-	select BR2_PACKAGE_CGROUPFS_MOUNT if !BR2_PACKAGE_SYSTEMD # runtime dependency
+	select BR2_PACKAGE_CGROUPFS_V2_MOUNT if !BR2_PACKAGE_SYSTEMD && BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4 # runtime dependency
+	select BR2_PACKAGE_CGROUPFS_MOUNT if !BR2_PACKAGE_SYSTEMD && !BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4 # runtime dependency
 	select BR2_PACKAGE_CONTAINERD # runtime dependency
 	select BR2_PACKAGE_HOST_GO
 	select BR2_PACKAGE_IPTABLES # runtime dependency
-- 
2.50.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
