Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A09CC433FE
	for <buildroot@archiver.kernel.org>; Fri,  4 Nov 2022 07:52:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E2C224188D;
	Fri,  4 Nov 2022 07:52:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E2C224188D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bADIKjNBevFt; Fri,  4 Nov 2022 07:52:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0C0C041888;
	Fri,  4 Nov 2022 07:52:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0C0C041888
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8257D1BF399
 for <buildroot@lists.busybox.net>; Fri,  4 Nov 2022 07:51:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5BFB240BEF
 for <buildroot@lists.busybox.net>; Fri,  4 Nov 2022 07:51:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5BFB240BEF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6g1RFiFcxHtH for <buildroot@lists.busybox.net>;
 Fri,  4 Nov 2022 07:51:49 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 98EF440B56
 for <buildroot@buildroot.org>; Fri,  4 Nov 2022 07:51:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 98EF440B56
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8632C87D60; Fri,  4 Nov 2022 07:51:49 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 4 Nov 2022 08:45:45 +0100
X-Git-Refname: refs/heads/2022.08.x
X-Git-Oldrev: e0e9f8c8a542965d977982c1b74bd737d8c174af
X-Git-Newrev: 6dc13919dbc0b774b232891fe0622724ce8e92bb
X-Patchwork-Hint: ignore
Message-Id: <20221104075149.8632C87D60@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.08.x] package/uftp: bump to
 version 5.0.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=6dc13919dbc0b774b232891fe0622724ce8e92bb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.08.x

Version 5.0.1 - 8/2/2022
 - On very low speed transfers (<10Kbps) sessions would time out due to
   a very large interpacket transmission interval.  Fixed by putting a
   lower limit on the advertised GRTT of of the interpacket transmission
   interval.
 - Sending of ABORT messages on early shutdown would sometimes fail due
   to OpenSSL cleanup functions running before application cleanup.
   Changed the ordering of atexit() handlers to ensure OpenSSL cleanup
   happens last.
 - Fixed missing timestamp update when clients read CONG_CTRL messages
 - Fix to GRTT handling on server to ensure it doesn't fall below minumim.
 - Fixed bypassed checking of existing files on client for backup
 - Various logging fixes

https://sourceforge.net/projects/uftp-multicast/files/Changes.txt/download

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 744607a5cb966e3100494d9fb7f40172336c5605)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/uftp/uftp.hash | 2 +-
 package/uftp/uftp.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/uftp/uftp.hash b/package/uftp/uftp.hash
index aaebcad014..e47cba9394 100644
--- a/package/uftp/uftp.hash
+++ b/package/uftp/uftp.hash
@@ -1,3 +1,3 @@
 # Locally computed sha256
-sha256  562f71ea5a24b615eb491f5744bad01e9c2e58244c1d6252d5ae98d320d308e0  uftp-5.0.tar.gz
+sha256  f0435fbc8e9ffa125e05600cb6c7fc933d7d587f5bae41b257267be4f2ce0e61  uftp-5.0.1.tar.gz
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSE.txt
diff --git a/package/uftp/uftp.mk b/package/uftp/uftp.mk
index 1c36cb0ce6..ce865c20ec 100644
--- a/package/uftp/uftp.mk
+++ b/package/uftp/uftp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-UFTP_VERSION = 5.0
+UFTP_VERSION = 5.0.1
 UFTP_SITE = http://sourceforge.net/projects/uftp-multicast/files/source-tar
 UFTP_LICENSE = GPL-3.0+
 UFTP_LICENSE_FILES = LICENSE.txt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
