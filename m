Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BAF7D0D151
	for <buildroot@archiver.kernel.org>; Wed,  7 Jan 2026 18:01:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4CA9280AB2;
	Wed,  7 Jan 2026 18:01:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AXGyw6j_ENRM; Wed,  7 Jan 2026 18:01:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8A65881186
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767808874;
	bh=u0y8Z6cDlBgrmJONEwoYjV1WnkOu0SAUpNt9jtZxZJg=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=PxI2MQF4Ms/ajtOhg9XeWkbu1QPXT4nRmPA7b39cjh7tAujTpGt0TAN/Vi5nI7/kp
	 vtLBY6Bsjj5OOSjlkSw3+OKt0FwgHNmMy9H3pYv6plqo1ih0R/+bGNC7hGvCoFjneB
	 IiW58t78LwZzyuCUSVwR/5bnM2wm/GS6O9tQKW7dFI37PVIiJWuHvxrnti976QstZx
	 9t+FEgzNgblDoGetBihZwV931nvmGe/QQOPQRXsmrt83tOgzra1oPSu7BZF3Gsa1f1
	 byzZ1BJ/T2QBmbqNs4+CN1S7l2zfAzd7hgL4XJOXvPK/pqBm0eo6Kwu9yXmJXxR4O6
	 s6r3yW4ioWeuw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8A65881186;
	Wed,  7 Jan 2026 18:01:14 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 91AFC9ED
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 18:01:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 838DC6083D
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 18:01:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bKcGm6NkIm5m for <buildroot@buildroot.org>;
 Wed,  7 Jan 2026 18:01:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A4D3D60643
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id A4D3D60643
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 18:01:10 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9FC2C881EA; Wed,  7 Jan 2026 18:01:10 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 24 Dec 2025 15:13:11 +0100
X-Git-Refname: refs/heads/2025.11.x
X-Git-Oldrev: 808cb9040341715468ad558691afd4228dcb9c56
X-Git-Newrev: 286173ff2ce5efa4b3d0aeec1e513a350df86d7e
X-Patchwork-Hint: ignore
Message-Id: <20260107180110.9FC2C881EA@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.11.x] package/tzdata: bump to
 2025c
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

commit: https://git.buildroot.net/buildroot/commit/?id=286173ff2ce5efa4b3d0aeec1e513a350df86d7e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.11.x

Release Notes:
https://lists.iana.org/hyperkitty/list/tz-announce@iana.org/thread/TAGXKYLMAQRZRFTERQ33CEKOW7KRJVAK/

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 5cda56f05e4b258d3ef16f77c454293e28f5fc62)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/tzdata/tzdata.hash | 4 ++--
 package/tzdata/tzdata.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/tzdata/tzdata.hash b/package/tzdata/tzdata.hash
index a1629066ce..fcf7bffd24 100644
--- a/package/tzdata/tzdata.hash
+++ b/package/tzdata/tzdata.hash
@@ -1,4 +1,4 @@
-# https://lists.iana.org/hyperkitty/list/tz-announce@iana.org/thread/6JVHNHLB6I2WAYTQ75L6KEPEQHFXAJK3/
-sha512  7d83741f3cae81fac8131994b43c55b6da7328df18b706e5ee40e9b3212bc506e6f8fc90988b18da424ed59eff69bce593f2783b7b5f18eb483a17aeb94258d6  tzdata2025b.tar.gz
+# https://lists.iana.org/hyperkitty/list/tz-announce@iana.org/thread/TAGXKYLMAQRZRFTERQ33CEKOW7KRJVAK/
+sha512  1e33f7212fd0ae2ad3c16e68f0c1fc7a6ad26a126b8406c379a5768d79604c6a816054bd0fe3a63228d70cd6a1fc2b1bae2a9f8014e102d3727eb9d21affa1f1  tzdata2025c.tar.gz
 # Locally computed:
 sha256  0613408568889f5739e5ae252b722a2659c02002839ad970a63dc5e9174b27cf  LICENSE
diff --git a/package/tzdata/tzdata.mk b/package/tzdata/tzdata.mk
index 32607268d8..a7b6dd8f65 100644
--- a/package/tzdata/tzdata.mk
+++ b/package/tzdata/tzdata.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TZDATA_VERSION = 2025b
+TZDATA_VERSION = 2025c
 TZDATA_SOURCE = tzdata$(TZDATA_VERSION).tar.gz
 TZDATA_SITE = https://www.iana.org/time-zones/repository/releases
 TZDATA_SELINUX_MODULES = tzdata
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
