Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 273A4E83834
	for <buildroot@archiver.kernel.org>; Mon, 16 Feb 2026 20:53:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C787D6059F;
	Mon, 16 Feb 2026 20:53:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rHCVx5kuOHZU; Mon, 16 Feb 2026 20:53:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E30E660615
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771275205;
	bh=knOhVSpThY1fYdH8S0se30/2uYkPnO+5qn/PvJFt+UA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=YTDnPe8liJBSCfvqa+EYz/fG8OxM0cpUDCnhC+LxX4g7foCPl4vH/c2lzKgYO+Lxx
	 IEDbvPB9mhloWDUtBYLkFNRBJLgbi+VB0A97s1Am0hPmt7wx1iQyqbfWABrq2ZMr6v
	 hcPLXdmK1+qSqyniy5l/wHsGYPBEtwnwE99aNIg6rWv9mWSh5dak8LeiYrVz5aPejO
	 CTDdiZDDqUbdbmt3wF1vzvIUz76GihOAfHnsGkzQl3JrNanoUL3t7/d9QQ2KKmf0t/
	 bRF0dSRqKbYib+j/REyLa6IWbK6jX0wr+TBude4VE51Rk00rH77xIettHp79ZynYHt
	 /KCKRKeABBcYw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E30E660615;
	Mon, 16 Feb 2026 20:53:24 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1984835B
 for <buildroot@buildroot.org>; Mon, 16 Feb 2026 20:53:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 06F0683C72
 for <buildroot@buildroot.org>; Mon, 16 Feb 2026 20:53:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iXe_i9bjcHCn for <buildroot@buildroot.org>;
 Mon, 16 Feb 2026 20:53:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4674F83C6C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4674F83C6C
 for <buildroot@buildroot.org>; Mon, 16 Feb 2026 20:53:22 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 325A486F48; Mon, 16 Feb 2026 20:53:22 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 16 Feb 2026 21:37:53 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3b52fe6f2e0feb72e745991a1ad4645ffdc55713
X-Git-Newrev: 388b9b5965c32e90caf5991b81d95e451b5a2165
X-Patchwork-Hint: ignore
Message-Id: <20260216205322.325A486F48@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/skopeo: bump to 1.22.0
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/388b9b5965c32e90caf5991b81d95e451b5a2165
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Release notes:
https://github.com/containers/skopeo/releases/tag/v1.22.0

Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/skopeo/skopeo.hash | 2 +-
 package/skopeo/skopeo.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/skopeo/skopeo.hash b/package/skopeo/skopeo.hash
index 4a1bcfa0f1..72b5b07801 100644
--- a/package/skopeo/skopeo.hash
+++ b/package/skopeo/skopeo.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  f76eeddf697a3cc7a872e3077ab4d0fdbebe9f3c6171462e3e9feb84368b3fac  skopeo-1.21.0-go2.tar.gz
+sha256  dc9aa749973b10d3c2672d2839e61bac75cf32d5e5106463420b83653c9df3ff  skopeo-1.22.0-go2.tar.gz
 sha256  716a8b80635c394681e652823e1e42e411ad2d254e1f202403422d74f4b0b106  LICENSE
diff --git a/package/skopeo/skopeo.mk b/package/skopeo/skopeo.mk
index d534a04813..2dcad871df 100644
--- a/package/skopeo/skopeo.mk
+++ b/package/skopeo/skopeo.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SKOPEO_VERSION = 1.21.0
+SKOPEO_VERSION = 1.22.0
 SKOPEO_SITE = $(call github,containers,skopeo,v$(SKOPEO_VERSION))
 
 SKOPEO_LICENSE = Apache-2.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
