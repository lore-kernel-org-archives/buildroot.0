Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43AB3C61DB9
	for <buildroot@archiver.kernel.org>; Fri, 28 Aug 2026 11:55:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EF2154081C;
	Fri, 28 Aug 2026 11:55:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id l-h0AV_EqA0e; Fri, 28 Aug 2026 11:55:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787918148;
	bh=aiujorlMqxPjT8+M8OtE643H8Pm2wD1vhsN5/G6iYuc=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=ID+HR3iTJoeHu6aSO96w38FZFIY8CfiJAoubnueY5reb+xRhmAuOByWnC9JE0XQ2R
	 oNzBg4VQazWp5QI128ymvLUKzVMBlIfrgHZq4NVejpTopF05XSlJHUsMJ4Qs+jwND7
	 V+gQ3aBZ8QZFrQzqsT0mWAeTU3JVw9J8MeyH4rv1XTe/4sIOzmtKxSGzY3IRp4/tNF
	 gP5EqdXjMK6ULI6JjrT8ZGFWjb++a+PoyJIe9vVhPpQg06p1mxyjpqoW/F796fp37x
	 mbRXX0dpJoDnpx5AOsPdmMDHgTo93PwTISihj9stNgHDWEzRcAp8P/hFXTpbxHWNrm
	 1D6BxRivvbbew==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 95F7140825;
	Fri, 28 Aug 2026 11:55:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 746C8105
 for <buildroot@buildroot.org>; Fri, 28 Aug 2026 11:55:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5AD794081C
 for <buildroot@buildroot.org>; Fri, 28 Aug 2026 11:55:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XNxAlczTEoht for <buildroot@buildroot.org>;
 Fri, 28 Aug 2026 11:55:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id BDB53407FE
 for <buildroot@buildroot.org>; Fri, 28 Aug 2026 11:55:46 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B93F7921E3; Fri, 28 Aug 2026 11:54:49 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 28 Aug 2026 13:46:32 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 323f7e8492c87e1b761dbbc7d98fe0c535bd71da
X-Git-Newrev: 7e6e19e97bda5fd399df9bb6d393a523b32ea2e3
X-Patchwork-Hint: ignore
Message-Id: <20260828115449.B93F7921E3@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/harfbuzz: bump version
 to 14.4.0
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/7e6e19e97bda5fd399df9bb6d393a523b32ea2e3
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/next

https://github.com/harfbuzz/harfbuzz/blob/14.4.0/NEWS

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/harfbuzz/harfbuzz.hash | 4 ++--
 package/harfbuzz/harfbuzz.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/harfbuzz/harfbuzz.hash b/package/harfbuzz/harfbuzz.hash
index 3d7540f788..f8ee98e172 100644
--- a/package/harfbuzz/harfbuzz.hash
+++ b/package/harfbuzz/harfbuzz.hash
@@ -1,4 +1,4 @@
-# From https://github.com/harfbuzz/harfbuzz/releases/tag/14.3.1
-sha256  9dae9538aae2ffdf70cec31f2c27bf68e2aaeeae3112688467697d5faf6194f7  harfbuzz-14.3.1.tar.xz
+# From https://github.com/harfbuzz/harfbuzz/releases/tag/14.4.0
+sha256  2357ed966c6ced7bfa720b0640c0231065af01158fbea215093ffa15aed44371  harfbuzz-14.4.0.tar.xz
 # Locally computed
 sha256  ba8f810f2455c2f08e2d56bb49b72f37fcf68f1f4fade38977cfd7372050ad64  COPYING
diff --git a/package/harfbuzz/harfbuzz.mk b/package/harfbuzz/harfbuzz.mk
index 909629d7d0..184253949e 100644
--- a/package/harfbuzz/harfbuzz.mk
+++ b/package/harfbuzz/harfbuzz.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-HARFBUZZ_VERSION = 14.3.1
+HARFBUZZ_VERSION = 14.4.0
 HARFBUZZ_SITE = https://github.com/harfbuzz/harfbuzz/releases/download/$(HARFBUZZ_VERSION)
 HARFBUZZ_SOURCE = harfbuzz-$(HARFBUZZ_VERSION).tar.xz
 HARFBUZZ_LICENSE = MIT, ISC (ucdn library)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
