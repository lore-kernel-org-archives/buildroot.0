Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C042C282EC
	for <buildroot@archiver.kernel.org>; Tue, 11 Mar 2025 21:49:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AC4BD40331;
	Tue, 11 Mar 2025 21:49:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HimGqKIzqx7d; Tue, 11 Mar 2025 21:49:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 79DDC4065F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 79DDC4065F;
	Tue, 11 Mar 2025 21:49:37 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 6409C1DA
 for <buildroot@buildroot.org>; Tue, 11 Mar 2025 21:49:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 589DF80EB7
 for <buildroot@buildroot.org>; Tue, 11 Mar 2025 21:49:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GjFZxVVyUZDt for <buildroot@buildroot.org>;
 Tue, 11 Mar 2025 21:49:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 1175280EB2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1175280EB2
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1175280EB2
 for <buildroot@buildroot.org>; Tue, 11 Mar 2025 21:49:34 +0000 (UTC)
Received: from tuxedoOT.fritz.box (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id D48792C89074
 for <buildroot@buildroot.org>; Tue, 11 Mar 2025 22:49:31 +0100 (CET)
To: buildroot@buildroot.org
Date: Tue, 11 Mar 2025 22:49:30 +0100
Message-ID: <20250311214931.1558872-1-buildroot@bubu1.eu>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1741729771; bh=BWEP7NK4k4oDrurj/FsZ5vUVzfOSCVt1jvkTc7uN0R0=;
 h=From:To:Subject:Date;
 b=T6MdRqZHuYma4NHezVDG0XCosBOncD6riMqAP3snqMec30ElyNOsX5M83UKVZIeR0
 /K6elgETS7OWg9f7REcitA/pwTk2EVjZKPjgBVCHmumvnfYkh3zfWWu44AqhzcB+lc
 8fuQj1LhkUibWh1tVD+edRrBcuZzKzi37Oz+4ah47/NttZsIvKhzZPLpi4KziBk2CP
 g4ISfTg0KRSMbtlrxsvLSmk8hxJannS7mzsamV4q+RxZchNkb2D6M7Ko/1pVuvA8NM
 OwuZHgl6MhZk5/H9YaUUioZ0DvbwpijIR+pnKY7v8u/k4JWqsMX8xI+FFGlvMqRm/8
 HVVCB2BWHRGxw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bubu1.eu header.i=@bubu1.eu header.a=rsa-sha256
 header.s=bubu header.b=T6MdRqZH
Subject: [Buildroot] [PATCH] package/libedit: bump to 20250104-3.1
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
From: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Reply-To: Marcus Hoffmann <buildroot@bubu1.eu>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Changelog:

2025-01-04 Jess Thrysoee

   * all: sync with upstream source

2024-08-08 Jess Thrysoee

   * all: sync with upstream source

   * doc/Makefile.am: fix regression. Name all manpage links as el_*
	(e.g. el_history.3) to avoid conflicts.
	Reported by Zopolis4

2024-05-17 Jess Thrysoee

   * all: sync with upstream source

Upstream changes are theoretically viewable at [1] but not
in a very readable form.

[1] http://cvsweb.netbsd.org/bsdweb.cgi/src/lib/libedit

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
---
 package/libedit/libedit.hash | 2 +-
 package/libedit/libedit.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libedit/libedit.hash b/package/libedit/libedit.hash
index c2ed7f773f..08eb889ee2 100644
--- a/package/libedit/libedit.hash
+++ b/package/libedit/libedit.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  4ee8182b6e569290e7d1f44f0f78dac8716b35f656b76528f699c69c98814dad  libedit-20230828-3.1.tar.gz
+sha256  23792701694550a53720630cd1cd6167101b5773adddcb4104f7345b73a568ac  libedit-20250104-3.1.tar.gz
 sha256  9da6c9c74987a36c84302982799d17d2f748ba1c1c0c471425716173c1d07649  COPYING
diff --git a/package/libedit/libedit.mk b/package/libedit/libedit.mk
index 98e29a9b1a..9b480958d3 100644
--- a/package/libedit/libedit.mk
+++ b/package/libedit/libedit.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBEDIT_VERSION = 20230828-3.1
+LIBEDIT_VERSION = 20250104-3.1
 LIBEDIT_SITE = https://www.thrysoee.dk/editline
 LIBEDIT_INSTALL_STAGING = YES
 LIBEDIT_DEPENDENCIES = ncurses
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
