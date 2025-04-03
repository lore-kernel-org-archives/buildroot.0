Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99C6AC3600C
	for <buildroot@archiver.kernel.org>; Thu,  3 Apr 2025 19:22:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4E36441442;
	Thu,  3 Apr 2025 19:22:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yu8u6qzTRiAl; Thu,  3 Apr 2025 19:22:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7F3934128B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7F3934128B;
	Thu,  3 Apr 2025 19:22:07 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id B6E34119
 for <buildroot@buildroot.org>; Thu,  3 Apr 2025 19:22:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9D5DD41364
 for <buildroot@buildroot.org>; Thu,  3 Apr 2025 19:22:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZJ-rI1QUgIHl for <buildroot@buildroot.org>;
 Thu,  3 Apr 2025 19:22:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 99294412C9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 99294412C9
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 99294412C9
 for <buildroot@buildroot.org>; Thu,  3 Apr 2025 19:22:05 +0000 (UTC)
Received: from home.juju.sh (unknown [82.64.214.120])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 7B839B005C1;
 Thu,  3 Apr 2025 21:22:02 +0200 (CEST)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Cc: Julien Olivain <ju.o@free.fr>
Date: Thu,  3 Apr 2025 21:21:57 +0200
Message-ID: <20250403192157.145639-1-ju.o@free.fr>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1743708123;
 bh=J2WVTao+C8rKCQen0nHniIA1uYamlA7CxVoSDNA25vU=;
 h=From:To:Cc:Subject:Date:From;
 b=pGMYLVvzFGRkm9nOWTQDgFUPisTabucfxeA9/vRtKsAu+Aj8NIbKGDT0VvBo+t5hD
 tXx6hNiWW+x7aFg1HJadEJljZ5G/VlEghd59QXH1g3IEKHoRodPvHafIhmjgICwhUN
 402ntuxe6d1UvEJCr274E4AgUA55jlb+EcByd0hGauKlfBrLyJTOcGfmqMfVPmC1iD
 MOxdQfbkqeZxifsoTq10bVhLDNPIQPlfEp5DidaLmN/DxzDe8wkhV99DKQO55slTnT
 5ru2t5EHf647KxI9ZHl5yaB+6vOYkBAFX5YIHf2+BRbxT3V1DQPIDUgSyECMWFzuWI
 OFkfYv1Cs1Lng==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=pGMYLVvz
Subject: [Buildroot] [PATCH 1/1] package/tmux: bump to version 3.5a
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

For change log, see [1].

This commit adds the dependency to host-bison, which is needed since
upstream commit [2], included since version 3.4. The optional dependency
to jemalloc is also added, introduced since upstream commit [3],
included since version 3.5.

[1] https://github.com/tmux/tmux/blob/3.5a/CHANGES
[2] https://github.com/tmux/tmux/commit/00812c9053a0b1067f833925b726086a67d8528d
[3] https://github.com/tmux/tmux/commit/3c2621b41b9e1466d2b06718a0a8514f5d10ded9

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
Patch tested in:
https://gitlab.com/jolivain/buildroot/-/jobs/9619369240
---
 package/tmux/tmux.hash |  2 +-
 package/tmux/tmux.mk   | 11 +++++++++--
 2 files changed, 10 insertions(+), 3 deletions(-)

diff --git a/package/tmux/tmux.hash b/package/tmux/tmux.hash
index b5c0fe58d0..c4eb508d78 100644
--- a/package/tmux/tmux.hash
+++ b/package/tmux/tmux.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  e4fd347843bd0772c4f48d6dde625b0b109b7a380ff15db21e97c11a4dcdf93f  tmux-3.3a.tar.gz
+sha256  16216bd0877170dfcc64157085ba9013610b12b082548c7c9542cc0103198951  tmux-3.5a.tar.gz
 sha256  c031bd37f464c534277814f6aa38686fa023d094261d57fd2545ad592bb53ccd  COPYING
diff --git a/package/tmux/tmux.mk b/package/tmux/tmux.mk
index 533a82bbad..4cceeabfc5 100644
--- a/package/tmux/tmux.mk
+++ b/package/tmux/tmux.mk
@@ -4,12 +4,19 @@
 #
 ################################################################################
 
-TMUX_VERSION = 3.3a
+TMUX_VERSION = 3.5a
 TMUX_SITE = https://github.com/tmux/tmux/releases/download/$(TMUX_VERSION)
 TMUX_LICENSE = ISC
 TMUX_LICENSE_FILES = COPYING
 TMUX_CPE_ID_VALID = YES
-TMUX_DEPENDENCIES = libevent ncurses host-pkgconf
+TMUX_DEPENDENCIES = host-bison libevent ncurses host-pkgconf
+
+ifeq ($(BR2_PACKAGE_JEMALLOC),y)
+TMUX_DEPENDENCIES += jemalloc
+TMUX_CONF_OPTS += --enable-jemalloc
+else
+TMUX_CONF_OPTS += --disable-jemalloc
+endif
 
 ifeq ($(BR2_PACKAGE_SYSTEMD),y)
 TMUX_DEPENDENCIES += systemd
-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
