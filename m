Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3ABEC4332F
	for <buildroot@archiver.kernel.org>; Thu, 29 Dec 2022 09:06:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7B15160D4D;
	Thu, 29 Dec 2022 09:06:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7B15160D4D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tUFRhgHIVgW4; Thu, 29 Dec 2022 09:06:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id BA59A60C31;
	Thu, 29 Dec 2022 09:06:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BA59A60C31
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4BE271BF393
 for <buildroot@lists.busybox.net>; Thu, 29 Dec 2022 09:05:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 26EFC4016D
 for <buildroot@lists.busybox.net>; Thu, 29 Dec 2022 09:05:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 26EFC4016D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WKm7r6cPg2Bl for <buildroot@lists.busybox.net>;
 Thu, 29 Dec 2022 09:05:43 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id F203940201
 for <buildroot@buildroot.org>; Thu, 29 Dec 2022 09:05:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F203940201
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DE45986FEB; Thu, 29 Dec 2022 09:05:42 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 29 Dec 2022 10:03:40 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7589bafecd9153d2d7d31978b245e184098753d2
X-Git-Newrev: cdb77d0b86ca7e62b61d7f7e7947af591fe47e71
X-Patchwork-Hint: ignore
Message-Id: <20221229090542.DE45986FEB@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gr-osmosdr: bump to version 0.2.4
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

commit: https://git.buildroot.net/buildroot/commit/?id=cdb77d0b86ca7e62b61d7f7e7947af591fe47e71
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This bump will fix the following build failure raised since bump of
gnuradio to version 3.10.4.0 in commit
e37c110bead8b7b35cd97915673fa785ccb39f2d thanks to
https://github.com/osmocom/gr-osmosdr/commit/159885f9e67101834c100ceb7affc122e3f98bac:

/home/autobuild/autobuild/instance-20/output-1/build/gr-osmosdr-0.2.3/lib/source_impl.cc: In static member function 'static osmosdr::source::sptr osmosdr::source::make(const string&)':
/home/autobuild/autobuild/instance-20/output-1/build/gr-osmosdr-0.2.3/lib/source_impl.cc:105:36: error: could not convert 'gnuradio::get_initial_sptr(T*) [with T = source_impl]()' from 'std::shared_ptr<source_impl>' to 'osmosdr::source::sptr' {aka 'boost::shared_ptr<osmosdr::source>'}
  105 |   return gnuradio::get_initial_sptr( new source_impl(args) );
      |          ~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~
      |                                    |
      |                                    std::shared_ptr<source_impl>

https://github.com/osmocom/gr-osmosdr/releases/tag/v0.2.4

Fixes:
 - http://autobuild.buildroot.org/results/5af61d6fb8f8c5d5f91c74a6ef66800236d7bf12

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/gr-osmosdr/gr-osmosdr.hash | 2 +-
 package/gr-osmosdr/gr-osmosdr.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/gr-osmosdr/gr-osmosdr.hash b/package/gr-osmosdr/gr-osmosdr.hash
index 95f1137e38..b5ac50c4ed 100644
--- a/package/gr-osmosdr/gr-osmosdr.hash
+++ b/package/gr-osmosdr/gr-osmosdr.hash
@@ -1,3 +1,3 @@
 # Locally calculated:
-sha256  11b1eb13725ced5ded9121a10aaf7bccf2430c5c69d020791408219968665b71  gr-osmosdr-0.2.3.tar.gz
+sha256  28b6f2768aee7b397b227e9e70822e28de3b4c5362a5d14646a0948a48094a63  gr-osmosdr-0.2.4.tar.gz
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/gr-osmosdr/gr-osmosdr.mk b/package/gr-osmosdr/gr-osmosdr.mk
index 870db60c55..89907c1baa 100644
--- a/package/gr-osmosdr/gr-osmosdr.mk
+++ b/package/gr-osmosdr/gr-osmosdr.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GR_OSMOSDR_VERSION = 0.2.3
+GR_OSMOSDR_VERSION = 0.2.4
 GR_OSMOSDR_SITE = $(call github,osmocom,gr-osmosdr,v$(GR_OSMOSDR_VERSION))
 GR_OSMOSDR_LICENSE = GPL-3.0+
 GR_OSMOSDR_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
