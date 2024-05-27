Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C652C25B74
	for <buildroot@archiver.kernel.org>; Mon, 27 May 2024 06:04:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 49C82608D1;
	Mon, 27 May 2024 06:04:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EdIhg1DcP6id; Mon, 27 May 2024 06:04:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F232560846
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id F232560846;
	Mon, 27 May 2024 06:03:59 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8939B1D1879
 for <buildroot@lists.busybox.net>; Mon, 27 May 2024 06:03:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 09562405BE
 for <buildroot@lists.busybox.net>; Mon, 27 May 2024 06:03:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Pi9gwkGVNGVX for <buildroot@lists.busybox.net>;
 Mon, 27 May 2024 06:03:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 430D240607
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 430D240607
 for <buildroot@buildroot.org>; Mon, 27 May 2024 06:03:33 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E5A937FB48; Mon, 27 May 2024 06:03:32 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 27 May 2024 07:57:37 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: baaf5f569f8115c25d54198631eddcbc4710f766
X-Git-Newrev: 47bc873569d40d776093750dff5646abb686a3b3
X-Patchwork-Hint: ignore
Message-Id: <20240527060332.E5A937FB48@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/suricata:
 security bump to version 6.0.19
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
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

commit: https://git.buildroot.net/buildroot/commit/?id=47bc873569d40d776093750dff5646abb686a3b3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

Fixes:
 - CVE-2024-23839 - Critical severity
 - CVE-2024-23836 - Critical severity
 - CVE-2024-23835 - High severity
 - CVE-2024-24568 - Moderate severity
 - CVE-2024-28870 - HIGH
 - CVE-2024-32663 CRITICAL (HIGH for 6.0.x)
 - CVE-2024-32664 CRITICAL (HIGH for 7.0.x)
 - CVE-2024-32867 MODERATE

https://forum.suricata.io/t/suricata-7-0-3-and-6-0-16-released/4468
https://forum.suricata.io/t/suricata-7-0-4-and-6-0-17-released/4534
https://forum.suricata.io/t/suricata-6-0-18-released/4539
https://forum.suricata.io/t/suricata-7-0-5-and-6-0-19-released/4617

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit a8e60c4600f42212cb8c42e5b288d6406bb80db4)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/suricata/suricata.hash | 2 +-
 package/suricata/suricata.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/suricata/suricata.hash b/package/suricata/suricata.hash
index 41befa61b9..58ab0d93b0 100644
--- a/package/suricata/suricata.hash
+++ b/package/suricata/suricata.hash
@@ -1,5 +1,5 @@
 # Locally computed:
-sha256  1bd546149ac6671c2476d520a38eab7755e10c3080fd2ec2dc8624b0cf89ee75  suricata-6.0.15.tar.gz
+sha256  98c812faef466d337f107f13ae37843f1c719942b93832d70f1a2fd7ee1b5c2c  suricata-6.0.19.tar.gz
 
 # Hash for license files:
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/suricata/suricata.mk b/package/suricata/suricata.mk
index 5b52635328..2083e0caba 100644
--- a/package/suricata/suricata.mk
+++ b/package/suricata/suricata.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SURICATA_VERSION = 6.0.15
+SURICATA_VERSION = 6.0.19
 SURICATA_SITE = https://www.openinfosecfoundation.org/download
 SURICATA_LICENSE = GPL-2.0
 SURICATA_LICENSE_FILES = COPYING LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
