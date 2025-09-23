Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04F8DCAC5A7
	for <buildroot@archiver.kernel.org>; Tue, 23 Sep 2025 16:35:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BA99140D65;
	Tue, 23 Sep 2025 16:35:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id t2kmF_VZBQaQ; Tue, 23 Sep 2025 16:35:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C238640D56
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C238640D56;
	Tue, 23 Sep 2025 16:35:46 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id E7648129
 for <buildroot@buildroot.org>; Tue, 23 Sep 2025 16:35:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E4CD840884
 for <buildroot@buildroot.org>; Tue, 23 Sep 2025 16:35:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id n9VR64JDiFKa for <buildroot@buildroot.org>;
 Tue, 23 Sep 2025 16:35:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 16C61400D6
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 16C61400D6
 for <buildroot@buildroot.org>; Tue, 23 Sep 2025 16:35:45 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 04B81862C4; Tue, 23 Sep 2025 16:35:45 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 23 Sep 2025 18:34:41 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5f63c441f8f23d09b14df79b2a28f27f905d7427
X-Git-Newrev: 89fd61a127796813f50a1e77076fec3251aa4109
X-Patchwork-Hint: ignore
Message-Id: <20250923163545.04B81862C4@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/cups: security bump to v2.4.14
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

commit: https://git.buildroot.net/buildroot/commit/?id=89fd61a127796813f50a1e77076fec3251aa4109
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

See the release notes:

- https://github.com/OpenPrinting/cups/releases/tag/v2.4.13
- https://github.com/OpenPrinting/cups/releases/tag/v2.4.14

This fixes the following vulnerabilities:
- CVE-2025-58060:
    OpenPrinting CUPS is an open source printing system for Linux and
    other Unix-like operating systems. In versions 2.4.12 and earlier,
    when the `AuthType` is set to anything but `Basic`, if the request
    contains an `Authorization: Basic ...` header, the password is not
    checked. This results in authentication bypass. Any configuration that
    allows an `AuthType` that is not `Basic` is affected. Version 2.4.13
    fixes the issue.
    https://www.cve.org/CVERecord?id=CVE-2025-58060

- CVE-2025-58364:
    OpenPrinting CUPS is an open source printing system for Linux and
    other Unix-like operating systems. In versions 2.4.12 and earlier, an
    unsafe deserialization and validation of printer attributes causes
    null dereference in the libcups library. This is a remote DoS
    vulnerability available in local subnet in default configurations. It
    can cause the cups & cups-browsed to crash, on all the machines in
    local network who are listening for printers (so by default for all
    regular linux machines). On systems where the vulnerability
    CVE-2024-47176 (cups-filters 1.x/cups-browsed 2.x vulnerability) was
    not fixed, and the firewall on the machine does not reject incoming
    communication to IPP port, and the machine is set to be available to
    public internet, attack vector "Network" is possible. The current
    versions of CUPS and cups-browsed projects have the attack vector
    "Adjacent" in their default configurations. Version 2.4.13 contains a
    patch for CVE-2025-58364.
    https://www.cve.org/CVERecord?id=CVE-2025-58364

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/cups/cups.hash | 2 +-
 package/cups/cups.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/cups/cups.hash b/package/cups/cups.hash
index e363a761eb..a200a82deb 100644
--- a/package/cups/cups.hash
+++ b/package/cups/cups.hash
@@ -1,4 +1,4 @@
 # Locally calculated:
-sha256  b1dde191a4ae2760c47220c82ca6155a28c382701e6c1a0159d1054990231d59  cups-2.4.12-source.tar.gz
+sha256  660288020dd6f79caf799811c4c1a3207a48689899ac2093959d70a3bdcb7699  cups-2.4.14-source.tar.gz
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
 sha256  977206f041b9a6f47ac00531e1242c0fab7063da71178f8d868b167b70866b6d  NOTICE
diff --git a/package/cups/cups.mk b/package/cups/cups.mk
index 21fe6a7c5e..e6de671174 100644
--- a/package/cups/cups.mk
+++ b/package/cups/cups.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CUPS_VERSION = 2.4.12
+CUPS_VERSION = 2.4.14
 CUPS_SOURCE = cups-$(CUPS_VERSION)-source.tar.gz
 CUPS_SITE = https://github.com/OpenPrinting/cups/releases/download/v$(CUPS_VERSION)
 CUPS_LICENSE = Apache-2.0 with GPL-2.0/LGPL-2.0 exception
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
