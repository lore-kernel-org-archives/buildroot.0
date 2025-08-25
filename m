Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84803CA0FE7
	for <buildroot@archiver.kernel.org>; Mon, 25 Aug 2025 13:47:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DBE8984C92;
	Mon, 25 Aug 2025 13:47:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jYxD4YKcmhE0; Mon, 25 Aug 2025 13:47:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 32D4584C94
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 32D4584C94;
	Mon, 25 Aug 2025 13:47:02 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id BA262114
 for <buildroot@buildroot.org>; Mon, 25 Aug 2025 13:46:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A108C41F0C
 for <buildroot@buildroot.org>; Mon, 25 Aug 2025 13:46:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eYGRKdIA6wPn for <buildroot@buildroot.org>;
 Mon, 25 Aug 2025 13:46:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.22;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 56B4141EB1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 56B4141EB1
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 56B4141EB1
 for <buildroot@buildroot.org>; Mon, 25 Aug 2025 13:46:57 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from haruka.home.arpa ([85.22.122.97]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MKsnF-1v52Vn3n2b-00SQ1Q; Mon, 25
 Aug 2025 15:46:55 +0200
To: buildroot@buildroot.org
Date: Mon, 25 Aug 2025 15:46:31 +0200
Message-ID: <20250825134631.2405569-2-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250825134631.2405569-1-fiona.klute@gmx.de>
References: <20250825134631.2405569-1-fiona.klute@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:WeQC9YWd8abVYD28RPLMfWFePzDsrG/C4qo6/l7oMZSW+y9ueLI
 wz/fgZM4ikE/MMinrTnVCL3UILjVtTN4anx8roPzJUdNDvSLxfnZD6nfdcPIyVLrYx14Bfj
 SjgblcSjNRVZHPjZ4Mw5geNcqb13cTKxgUNFLr9nQgLHMV/7Ti+W3jmpe4x6FVKidx3htq/
 e9Fdctu5uEN23jqwofDBQ==
UI-OutboundReport: notjunk:1;M01:P0:1LBCvgf4d9Y=;LO7LZq8n9NWj4wiIG8JRxJmNRnX
 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
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1756129615; x=1756734415; i=fiona.klute@gmx.de;
 bh=c9SkXa9rMIPMtQpNK9ueLgt7xxo0QLG0TOqnsPpkhPc=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=tvFGD3SHWg1askKtcliTwdRBTIB2qeNsDctTGMOuMG9STobccIA6Cw66ID6ySogL
 HypEtv/7/atWPvImTLFLHbN4ohbQWbM0Q2kDjv9aXMEni1LnLzYZGLond6zcJUnGb
 PAcmbk91VgXNiOLbKkMM0N6jaGyDYZMQuDRS5n+tj/2CVer4eb8vBCS731p0Hba5y
 ipz3Fgg0WEeAF8Jt/TeNHoqEkQ/4GrdfMIyyxOUlV6SGgP1IgHWBDBnn6qUJHLviE
 ApPgY2hVoUbq0VFLRljFuRnQf74THo0pr7S48B390mnN7y1FdlxLNPxYNF4igNb0E
 7+BDyYdNsrMTgVfq/Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=tvFGD3SH
Subject: [Buildroot] [PATCH v2 2/2] package/docker-engine: prefer cgroup v2
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
Cc: Romain Naour <romain.naour@smile.fr>,
 Christian Stewart <christian@aperture.us>,
 "Fiona Klute \(WIWA\)" <fiona.klute@gmx.de>
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
Reviewed-by: Christian Stewart <christian@aperture.us>
---
I noticed Docker was unconditionally pulling in
BR2_PACKAGE_CGROUPFS_MOUNT while investigating a Docker warning about
memory cgroup not being available, and indeed my kernel config has
CONFIG_MEMCG enabled, but not the "highly discouraged" (to quote its
kernel config description) CONFIG_MEMCG_V1. Switching to v2 on
sufficiently recent kernels seems equally highly preferable.

An alternative could be to entirely drop cgroup v1 support, and
require a kernel with cgroup v2 support. Given that 5.4.x is currently
the oldest "longterm" series upstream that doesn't seem unreasonable,
and would allow dropping package/cgroupfs-mount once the few packages
that currently need it have been updated.

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
