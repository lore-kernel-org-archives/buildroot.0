Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39A70FCC066
	for <buildroot@archiver.kernel.org>; Fri,  6 Mar 2026 19:52:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0AA75613BA;
	Fri,  6 Mar 2026 19:52:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id p10EjvCqP_Af; Fri,  6 Mar 2026 19:52:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2A6CB613C1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772826746;
	bh=WPY3ZEP2hq2W+D7kJU28U8ZUoisHla5K0/NoMECHnJE=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Wlsvn4rQjQtliIgzatlQGV6OF8QBT1Lme14cNq4QV8/oMeKSUca9DR+qXnl23J4Eu
	 OBxIfCj3/+vavzULkX9FRTUA3D/WcFY8xd+rMImiLvwsklrXQaV5wpgve9tELbtKRN
	 XuwJAs9BDeKs7M5EhjdOeNDvicb35YMyzlSOxym3hasy3V5yYi8OKI+nqlpxKBNL7r
	 llxnkn4juWiWkj6FRSRXZw0ScVv7x9Xgn40E2N+wUcA4R66SznCRLIxEp07fpmL8pl
	 Qp/L7nal+fWAwP3qQ1jTX7ui5hKVPvdk68RouB7NZnfThXYeESYd1u8Shpi+0q5jd9
	 H85TY30tQdefw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2A6CB613C1;
	Fri,  6 Mar 2026 19:52:26 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 75AE9223
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 19:52:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5BB42613C1
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 19:52:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bgOv1RMyLB7i for <buildroot@buildroot.org>;
 Fri,  6 Mar 2026 19:52:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8313E613BA
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8313E613BA
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 19:52:22 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8C53886834; Fri,  6 Mar 2026 19:52:22 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 6 Mar 2026 13:47:25 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 4bfacb70abdeecf8d763921f9493b4f43ec8b1ce
X-Git-Newrev: bb808fcc50981a27d644b0b4db9bb8511f299fcf
X-Patchwork-Hint: ignore
Message-Id: <20260306195222.8C53886834@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/cups: security
 bump to v2.4.16
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/bb808fcc50981a27d644b0b4db9bb8511f299fcf
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

For more information on the version bump, see:
  - https://github.com/OpenPrinting/cups/blob/v2.4.16/CHANGES.md
  - https://github.com/OpenPrinting/cups/releases/tag/v2.4.16
  - https://github.com/OpenPrinting/cups/releases/tag/v2.4.15

Fixes the following vulnerabilities:

- CVE-2025-58436:
    OpenPrinting CUPS is an open source printing system for Linux and
    other Unix-like operating systems. Prior to version 2.4.15, a client
    that connects to cupsd but sends slow messages, e.g. only one byte per
    second, delays cupsd as a whole, such that it becomes unusable by
    other clients.

For more information, see
  - https://www.cve.org/CVERecord?id=CVE-2025-58436
  - https://github.com/OpenPrinting/cups/commit/40008d76a001babbb9beb9d9d74b01a86fb6ddb4

- CVE-2025-61915:
    OpenPrinting CUPS is an open source printing system for Linux and
    other Unix-like operating systems. Prior to version 2.4.15, a user in
    the lpadmin group can use the cups web ui to change the config and
    insert a malicious line. Then the cupsd process which runs as root
    will parse the new config and cause an out-of-bound write.

For more information, see
  - https://www.cve.org/CVERecord?id=CVE-2025-61915
  - https://github.com/OpenPrinting/cups/commit/db8d560262c22a21ee1e55dfd62fa98d9359bcb0

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit ea79b66ab2bc62a8e2e02b510dbf56c6aecb8725)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/cups/cups.hash | 2 +-
 package/cups/cups.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/cups/cups.hash b/package/cups/cups.hash
index a200a82deb..7c08a68c10 100644
--- a/package/cups/cups.hash
+++ b/package/cups/cups.hash
@@ -1,4 +1,4 @@
 # Locally calculated:
-sha256  660288020dd6f79caf799811c4c1a3207a48689899ac2093959d70a3bdcb7699  cups-2.4.14-source.tar.gz
+sha256  0339587204b4f9428dd0592eb301dec0bf9ea6ea8dce5d9690d56be585aba92d  cups-2.4.16-source.tar.gz
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
 sha256  977206f041b9a6f47ac00531e1242c0fab7063da71178f8d868b167b70866b6d  NOTICE
diff --git a/package/cups/cups.mk b/package/cups/cups.mk
index e6de671174..d3e6094c67 100644
--- a/package/cups/cups.mk
+++ b/package/cups/cups.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CUPS_VERSION = 2.4.14
+CUPS_VERSION = 2.4.16
 CUPS_SOURCE = cups-$(CUPS_VERSION)-source.tar.gz
 CUPS_SITE = https://github.com/OpenPrinting/cups/releases/download/v$(CUPS_VERSION)
 CUPS_LICENSE = Apache-2.0 with GPL-2.0/LGPL-2.0 exception
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
