Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E364BCAC5BB
	for <buildroot@archiver.kernel.org>; Fri, 10 Oct 2025 06:23:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AD7F560BED;
	Fri, 10 Oct 2025 06:23:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Myois-hN_fJf; Fri, 10 Oct 2025 06:23:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CB8C36141D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id CB8C36141D;
	Fri, 10 Oct 2025 06:23:57 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0A33B226
 for <buildroot@buildroot.org>; Fri, 10 Oct 2025 06:23:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EE44A61425
 for <buildroot@buildroot.org>; Fri, 10 Oct 2025 06:23:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UkJW7CFt6u78 for <buildroot@buildroot.org>;
 Fri, 10 Oct 2025 06:23:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 323AB60BED
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 323AB60BED
 for <buildroot@buildroot.org>; Fri, 10 Oct 2025 06:23:55 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2171D86E8A; Fri, 10 Oct 2025 06:23:55 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 10 Oct 2025 08:09:42 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7cb0419b92f5f35ca830e8c60d8080dd17f1dfb5
X-Git-Newrev: ab2fc8d88fd117546442b7c10aac59498a7579ad
X-Patchwork-Hint: ignore
Message-Id: <20251010062355.2171D86E8A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/suricata: security bump to v6.0.20
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=ab2fc8d88fd117546442b7c10aac59498a7579ad
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The v6.0.20 is the last patch level version bump of suricata version 6.
This version is now EOL since July 2024 and other new vulnerabilities
apply to this package.

For more details on the version bump, see:
  - https://suricata.io/2024/06/27/suricata-7-0-6-and-6-0-20-released/
  - https://github.com/OISF/suricata/releases/tag/suricata-6.0.20

Fixes the following vulnerabilities:

- CVE-2024-37151

    Mishandling of multiple fragmented packets using the same IP ID
    value can lead to packet reassembly failure, which can lead to
    policy bypass. When using af-packet, enable `defrag` to reduce the
    scope of the problem.

For more information, see:
  - https://nvd.nist.gov/vuln/detail/CVE-2024-37151

- CVE-2024-38535

    Suricata can run out of memory when parsing crafted HTTP/2 traffic.

For more information, see:
  - https://nvd.nist.gov/vuln/detail/CVE-2024-38535

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/suricata/suricata.hash | 2 +-
 package/suricata/suricata.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/suricata/suricata.hash b/package/suricata/suricata.hash
index 58ab0d93b0..ea5ba01dc0 100644
--- a/package/suricata/suricata.hash
+++ b/package/suricata/suricata.hash
@@ -1,5 +1,5 @@
 # Locally computed:
-sha256  98c812faef466d337f107f13ae37843f1c719942b93832d70f1a2fd7ee1b5c2c  suricata-6.0.19.tar.gz
+sha256  c1515754924b618914fcb3cb98873af49996b920f2389a1998f89604f227a807  suricata-6.0.20.tar.gz
 
 # Hash for license files:
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/suricata/suricata.mk b/package/suricata/suricata.mk
index e60ed2fce8..8840853054 100644
--- a/package/suricata/suricata.mk
+++ b/package/suricata/suricata.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SURICATA_VERSION = 6.0.19
+SURICATA_VERSION = 6.0.20
 SURICATA_SITE = https://www.openinfosecfoundation.org/download
 SURICATA_LICENSE = GPL-2.0
 SURICATA_LICENSE_FILES = COPYING LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
