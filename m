Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F6F9CD98E4
	for <buildroot@archiver.kernel.org>; Tue, 16 Jun 2026 16:59:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1005E6172F;
	Tue, 16 Jun 2026 16:59:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DcRtXOMlc4gy; Tue, 16 Jun 2026 16:59:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1A59661766
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781629176;
	bh=5qJYCRR2C+1dMCgGW6rWvylCiynBCyq+iysNkWahnLc=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=cLCt6keLl/E0vyXbGoRwhQtPE8fHIIPTHxmrRSB9h+5A7tUT2u0sgmndBpjFG9wHl
	 1ie4qOSB0G4lLi3Ek/cIDEtcBZaHdDKRcGfepS+u0wsmcK8SguvRs81QwUhmfDHmGf
	 SSeLYq6HtUAZda3+hSmZR2g6wlgVTgh8Z7BymcdPusSOU8fksKpdFCL7Cl4lezDGC/
	 HRlUY0SSO7+tiMmxnf6FTfKvW4iW7ttByV8UimX8TvumbtorB6HoH4Va+wpFKZfKu6
	 H3rqZvza33ni0oXsfjk7ychdXiqkC+9hR1PmQovre9gMoxed94RRVeqtMBwf+V9ZYA
	 C85KO1iGUe7BQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1A59661766;
	Tue, 16 Jun 2026 16:59:36 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id D67BD42A
 for <buildroot@buildroot.org>; Tue, 16 Jun 2026 16:59:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BC6B761766
 for <buildroot@buildroot.org>; Tue, 16 Jun 2026 16:59:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fpjtmUsbWCiN for <buildroot@buildroot.org>;
 Tue, 16 Jun 2026 16:59:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ECA806172F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id ECA806172F
 for <buildroot@buildroot.org>; Tue, 16 Jun 2026 16:59:33 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B14FD80DA5; Tue, 16 Jun 2026 16:59:12 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 16 Jun 2026 18:52:23 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2dc34a18e74a1b12e02d0fb8b3b5433b983f5355
X-Git-Newrev: 63dfdedd51cdd65a2444623de8197a39340c1e35
X-Patchwork-Hint: ignore
Message-Id: <20260616165912.B14FD80DA5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/strace: bump version to 7.1
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/63dfdedd51cdd65a2444623de8197a39340c1e35
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/strace/strace/releases/tag/v7.1

Switched to sha256 tarball hash provided by upstream.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/strace/strace.hash | 7 +++----
 package/strace/strace.mk   | 2 +-
 2 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/package/strace/strace.hash b/package/strace/strace.hash
index ad164dfa5c..8df107c948 100644
--- a/package/strace/strace.hash
+++ b/package/strace/strace.hash
@@ -1,6 +1,5 @@
-# Locally calculated after checking signature with RSA key from
-# https://raw.githubusercontent.com/strace/strace/refs/tags/v7.0/GPG-KEY
-# https://strace.io/files/7.0/strace-7.0.tar.xz.asc
-sha256  6c92419be3f2ec560b31728a4652217c59864c8642ba7b1b3771b1b013ad074b  strace-7.0.tar.xz
+# From https://github.com/strace/strace/releases/tag/v7.1
+sha256  81743ecf2a5b44186b2f5038afdc8beda7e5c70aed15b4fbfbcc6e9ece24490f  strace-7.1.tar.xz
+# Locally computed
 sha256  b897cf6bb865cdd72f49fba6ca7b66ad075b9bc51d3cf372923220ce18b5350f  COPYING
 sha256  7c379436436a562834aa7d2f5dcae1f80a25230fa74201046ca1fba4367d39aa  LGPL-2.1-or-later
diff --git a/package/strace/strace.mk b/package/strace/strace.mk
index 5f39bba1bd..a0688939ca 100644
--- a/package/strace/strace.mk
+++ b/package/strace/strace.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-STRACE_VERSION = 7.0
+STRACE_VERSION = 7.1
 STRACE_SOURCE = strace-$(STRACE_VERSION).tar.xz
 STRACE_SITE = https://github.com/strace/strace/releases/download/v$(STRACE_VERSION)
 STRACE_LICENSE = LGPL-2.1+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
