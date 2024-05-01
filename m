Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50DBAC4345F
	for <buildroot@archiver.kernel.org>; Wed,  1 May 2024 20:46:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 14141417AF;
	Wed,  1 May 2024 20:46:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MikUBPMfDTPN; Wed,  1 May 2024 20:46:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4DA1D41833
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4DA1D41833;
	Wed,  1 May 2024 20:46:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4CFEE1BF983
 for <buildroot@lists.busybox.net>; Wed,  1 May 2024 20:46:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 372F040712
 for <buildroot@lists.busybox.net>; Wed,  1 May 2024 20:46:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id K0NSLQgsBRia for <buildroot@lists.busybox.net>;
 Wed,  1 May 2024 20:46:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 17F7E40580
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 17F7E40580
 for <buildroot@buildroot.org>; Wed,  1 May 2024 20:46:17 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 086F0864D1; Wed,  1 May 2024 20:46:17 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 1 May 2024 22:06:37 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 05a4e5d5a5a4c6f9fabcf65bb1b46840dc305e29
X-Git-Newrev: 4d9a3f1a32e743fd5bb267442be98b4e0a2d0e14
X-Patchwork-Hint: ignore
Message-Id: <20240501204617.086F0864D1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/iperf: bump to version 2.2.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=4d9a3f1a32e743fd5bb267442be98b4e0a2d0e14
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For release note, see after the file list at:
https://sourceforge.net/projects/iperf2/files/

Note: the md5 file hash is also added, because it is published on
download page.

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/iperf/iperf.hash | 5 +++--
 package/iperf/iperf.mk   | 2 +-
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/iperf/iperf.hash b/package/iperf/iperf.hash
index eb6088649d..e4d40d5940 100644
--- a/package/iperf/iperf.hash
+++ b/package/iperf/iperf.hash
@@ -1,6 +1,7 @@
 # From https://sourceforge.net/projects/iperf2/files/
-sha1  e7b669c2e8747df95b59956e83ff53d3971d7a5f  iperf-2.1.9.tar.gz
+md5  34bb6ac1abeb801bf3f729794dc5ac36  iperf-2.2.0.tar.gz
+sha1  bcbd101ab36f3faacaab1a765a96806ca49a1495  iperf-2.2.0.tar.gz
 
 # Locally computed:
-sha256  5c0771aab00ef14520013aef01675977816e23bb8f5d9fde016f90eb2f1be788  iperf-2.1.9.tar.gz
+sha256  16810a9575e4c6dd65e4a18ab5df3cdac6730b3c832cf080a8990f132f68364a  iperf-2.2.0.tar.gz
 sha256  5f9f5c4feca3347c3b3c0ada8b16b4e6b698aac4e6f016a24adf61a5915336d1  COPYING
diff --git a/package/iperf/iperf.mk b/package/iperf/iperf.mk
index 1347f766d1..303614668a 100644
--- a/package/iperf/iperf.mk
+++ b/package/iperf/iperf.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IPERF_VERSION = 2.1.9
+IPERF_VERSION = 2.2.0
 IPERF_SITE = https://downloads.sourceforge.net/project/iperf2
 IPERF_LICENSE = MIT-like
 IPERF_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
