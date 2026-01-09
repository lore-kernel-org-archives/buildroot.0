Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CE4CD2F32D
	for <buildroot@archiver.kernel.org>; Tue, 13 Jan 2026 19:40:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DDBBD83E0E;
	Tue, 13 Jan 2026 19:40:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MsCs4PpBr61Q; Tue, 13 Jan 2026 19:40:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B4A8983E06
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768333252;
	bh=2pTICb8T2UtoT+JddiTjfN88dgwY7ZuP/Q7oUj69TNg=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=VnlkTYTk7P9h7R7AgARJ9wivMIwVTEF6nmFb2epjvfK16hhKVmzPBezzqDY2A5mus
	 YYue7Tu2pZmVJKNvkBDm+8LYQVjq9AifZYPq5hwiNfodmbOSr6BwLZDEqQcvAddmsA
	 TLCeCyaVDk1NPOz7v8ghH/Gvi2xHOIKfETz06H8xrV3+ZPr/SuQn8NsJ8IFfjtAnqO
	 FLy86A0LPWBKM0B+6NzLlX78gFoUGQCU3gtuB3DZ3kGKXu5h3VQy1JacO09YlL82JR
	 UDLSSEia2D22NZusyA9jNPYdUadjoSh5pgsJyy+wZuJ0kBK/14RluiExbEF/5Byw7w
	 60XGNGbmPETZw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B4A8983E06;
	Tue, 13 Jan 2026 19:40:52 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 29C17231
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:40:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 53FD8406E5
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:40:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lp6IOxtYsq96 for <buildroot@buildroot.org>;
 Tue, 13 Jan 2026 19:40:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 93945406DF
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 93945406DF
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:40:32 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 920138267D; Tue, 13 Jan 2026 19:40:32 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 9 Jan 2026 16:04:27 +0100
X-Git-Refname: refs/heads/2025.11.x
X-Git-Oldrev: c4958f7b985fa035da30c42b988a8202764baf99
X-Git-Newrev: a43ad685df16d25940d836ddf5bc3a88c90c3eb3
X-Patchwork-Hint: ignore
Message-Id: <20260113194032.920138267D@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.11.x] package/freerdp: remove
 stale IGNORE_CVES
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

commit: https://git.buildroot.net/buildroot/commit/?id=a43ad685df16d25940d836ddf5bc3a88c90c3eb3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.11.x

The NVD DB is now correctly tracking the vulnerability starting version
3.0 (see [1]). The IGNORE_CVES entry introduced in [2] is then no longer
needed.

[1] https://nvd.nist.gov/vuln/detail/CVE-2025-4478
[2] f741e8f6e6 package/freerdp: ignore CVE-2025-4478

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit b3007ebcaf4736dde948a43ea6f8abee6b83c8c5)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/freerdp/freerdp.mk | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/package/freerdp/freerdp.mk b/package/freerdp/freerdp.mk
index 391b9a4675..3a1ba61621 100644
--- a/package/freerdp/freerdp.mk
+++ b/package/freerdp/freerdp.mk
@@ -13,10 +13,6 @@ FREERDP_LICENSE = Apache-2.0
 FREERDP_LICENSE_FILES = LICENSE
 FREERDP_CPE_ID_VENDOR = freerdp
 
-# As explained on https://github.com/FreeRDP/FreeRDP/pull/11573#issuecomment-2904160524,
-# the affected code is new with 3.x, was not there on 2.x
-FREERDP_IGNORE_CVES += CVE-2025-4478
-
 FREERDP_INSTALL_STAGING = YES
 
 FREERDP_CONF_OPTS = -DWITH_MANPAGES=OFF -Wno-dev -DWITH_GSTREAMER_0_10=OFF
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
