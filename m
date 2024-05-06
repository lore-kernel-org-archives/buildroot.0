Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2455CC25B10
	for <buildroot@archiver.kernel.org>; Mon,  6 May 2024 19:33:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9A48180F46;
	Mon,  6 May 2024 19:33:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 78wSlrmjnIfZ; Mon,  6 May 2024 19:33:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B8F9982179
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B8F9982179;
	Mon,  6 May 2024 19:33:02 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A89451BF28B
 for <buildroot@lists.busybox.net>; Mon,  6 May 2024 19:32:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 948C740632
 for <buildroot@lists.busybox.net>; Mon,  6 May 2024 19:32:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IML58uIlOqeb for <buildroot@lists.busybox.net>;
 Mon,  6 May 2024 19:32:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 71ED440627
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 71ED440627
 for <buildroot@buildroot.org>; Mon,  6 May 2024 19:32:57 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 59F07867EA; Mon,  6 May 2024 19:32:57 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 6 May 2024 21:31:38 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: babb39c87366217ce84269ba11b29475d3d183b7
X-Git-Newrev: a8e60c4600f42212cb8c42e5b288d6406bb80db4
X-Patchwork-Hint: ignore
Message-Id: <20240506193257.59F07867EA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/suricata: security bump to version
 6.0.19
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=a8e60c4600f42212cb8c42e5b288d6406bb80db4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
