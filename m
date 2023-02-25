Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DC85C64EC7
	for <buildroot@archiver.kernel.org>; Sat, 25 Feb 2023 09:40:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id EA90740B8A;
	Sat, 25 Feb 2023 09:40:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EA90740B8A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 450D_j55d0wM; Sat, 25 Feb 2023 09:40:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id CF976408DC;
	Sat, 25 Feb 2023 09:40:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CF976408DC
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E9B8D1BF860
 for <buildroot@lists.busybox.net>; Sat, 25 Feb 2023 09:39:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 92DFF81E68
 for <buildroot@lists.busybox.net>; Sat, 25 Feb 2023 09:39:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 92DFF81E68
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JYWhO47VClAS for <buildroot@lists.busybox.net>;
 Sat, 25 Feb 2023 09:39:24 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id CC58B81E70
 for <buildroot@buildroot.org>; Sat, 25 Feb 2023 09:39:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CC58B81E70
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BB06786922; Sat, 25 Feb 2023 09:39:24 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 25 Feb 2023 10:37:23 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 45e2aa588d7d10941032c1661b9cf1e6c52b2680
X-Git-Newrev: 656aec42d96f1286b4acb3ad0e9c84073db3c6b8
X-Patchwork-Hint: ignore
Message-Id: <20230225093924.BB06786922@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/hawktracer: bump to
 3c22b3908912e2ec727fd2ddc5dbfe7464e6b4a5
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

commit: https://git.buildroot.net/buildroot/commit/?id=656aec42d96f1286b4acb3ad0e9c84073db3c6b8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This bump will fix the following build failure with gcc >= 12:

/tmp/instance-8/output-1/build/hawktracer-2ec19d71923344148928ef45fce549eda67030a4/hawktracer.cpp: In function 'HT_Thread* ht_thread_create(ht_thread_callback_t, void*)':
/tmp/instance-8/output-1/build/hawktracer-2ec19d71923344148928ef45fce549eda67030a4/hawktracer.cpp:1006:28: error: no matching function for call to 'operator new(sizetype, std::thread*)'
 1006 |     new(&th->th) HT_Thread();
      |                            ^

https://github.com/amzn/hawktracer/compare/e53b07bc812c4cfe8f6253ddb48ac43de8fa74a8...2ec19d71923344148928ef45fce549eda67030a4

Fixes:
 - http://autobuild.buildroot.org/results/d18a1b2ee6cdcb289567ae90b2d836844427b5f6

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/hawktracer/hawktracer.hash | 2 +-
 package/hawktracer/hawktracer.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/hawktracer/hawktracer.hash b/package/hawktracer/hawktracer.hash
index 47a8b35b6b..29d00e29ec 100644
--- a/package/hawktracer/hawktracer.hash
+++ b/package/hawktracer/hawktracer.hash
@@ -1,3 +1,3 @@
 # Computed locally
-sha256  a48e26082fd644222d4a20ecfd5a34700865cf572d41b7eac5b0c8242fef9c5f  hawktracer-2ec19d71923344148928ef45fce549eda67030a4.tar.gz
+sha256  099f76d5be18ad5d714fded0c6f889f588986cdde2b31f2c0058413698a5f35c  hawktracer-3c22b3908912e2ec727fd2ddc5dbfe7464e6b4a5.tar.gz
 sha256  2f377333e64ad08ad3afec8ed6c2c96ced2a6d7d67443eb2784a931bb7b3fd59  LICENSE
diff --git a/package/hawktracer/hawktracer.mk b/package/hawktracer/hawktracer.mk
index fd635e350d..462d073755 100644
--- a/package/hawktracer/hawktracer.mk
+++ b/package/hawktracer/hawktracer.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-HAWKTRACER_VERSION = 2ec19d71923344148928ef45fce549eda67030a4
+HAWKTRACER_VERSION = 3c22b3908912e2ec727fd2ddc5dbfe7464e6b4a5
 HAWKTRACER_SITE = $(call github,amzn,hawktracer,$(HAWKTRACER_VERSION))
 HAWKTRACER_LICENSE = MIT
 HAWKTRACER_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
