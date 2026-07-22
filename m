Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA096C4453A
	for <buildroot@archiver.kernel.org>; Wed, 22 Jul 2026 20:24:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6DC5C60896;
	Wed, 22 Jul 2026 20:24:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2PdT4aPSU9eI; Wed, 22 Jul 2026 20:24:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A46EF608A5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784751864;
	bh=J1ccdoj2rMmDP0Mi7Ne8X1sl8C3zx75wOHr9+pf9+Bw=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=rmc9g7W92tdivZxXsNA6hZKweEj1PXEiabNWrdmTm9KXUMyZXqh27mAIwGhuE5N9I
	 axm1TNFJy8F0ZH7/fmHIgK+cAbxG2pIafA3QRldRoggzAAv9spmDDIgtMy4fOK0VQi
	 NEJhenfcEmaQLu1XhD3Cg0MkttTie3cvn9/mlHgsYvcXRVpxFjWy2xlqS/qw1kIglS
	 QJluHDQAMvgW+VVVoap6SniwBrf/q1byN/7tz10Pr0/I621ytCmnk6cgky0n252SWl
	 ERaToUtT5dJZ+4yR/Oo8HMnjJ4muh8tV56DaKMDDjb93IN1I/TRuNyw/HTXmLQOdnS
	 h81OPSRYYIWJA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A46EF608A5;
	Wed, 22 Jul 2026 20:24:24 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 660EB224
 for <buildroot@buildroot.org>; Wed, 22 Jul 2026 20:24:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 58273400A6
 for <buildroot@buildroot.org>; Wed, 22 Jul 2026 20:24:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ThFEPAi4EcJs for <buildroot@buildroot.org>;
 Wed, 22 Jul 2026 20:24:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C5E59400B5
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id C5E59400B5
 for <buildroot@buildroot.org>; Wed, 22 Jul 2026 20:24:15 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id F14A28A344; Wed, 22 Jul 2026 20:23:36 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 22 Jul 2026 22:20:58 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c19a7fad93ad8fc018f326d99ad4df69c6a557cb
X-Git-Newrev: 0f80126bfe8549b2e41a50a884af55fe9872be1f
X-Patchwork-Hint: ignore
Message-Id: <20260722202336.F14A28A344@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/urandom-scripts: add license info
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/0f80126bfe8549b2e41a50a884af55fe9872be1f
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

The package is part of Buildroot and thus under GPL-2.0-or-later
unless stated otherwise, as described in COPYING.

Signed-off-by: Fiona Klute (Othermo GmbH) <fiona.klute@gmx.de>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/urandom-scripts/urandom-scripts.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/urandom-scripts/urandom-scripts.mk b/package/urandom-scripts/urandom-scripts.mk
index 89abdfff72..cc5f28d13a 100644
--- a/package/urandom-scripts/urandom-scripts.mk
+++ b/package/urandom-scripts/urandom-scripts.mk
@@ -4,6 +4,8 @@
 #
 ################################################################################
 
+URANDOM_SCRIPTS_LICENSE = GPL-2.0-or-later
+
 define URANDOM_SCRIPTS_INSTALL_INIT_SYSV
 	$(INSTALL) -D -m 0755 $(URANDOM_SCRIPTS_PKGDIR)/S01seedrng \
 		$(TARGET_DIR)/etc/init.d/S01seedrng
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
