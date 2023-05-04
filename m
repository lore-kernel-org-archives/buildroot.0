Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDA97C7EE21
	for <buildroot@archiver.kernel.org>; Thu,  4 May 2023 11:28:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 848F5615DD;
	Thu,  4 May 2023 11:28:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 848F5615DD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oPKKty5BGPwP; Thu,  4 May 2023 11:28:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id AB302615D0;
	Thu,  4 May 2023 11:28:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AB302615D0
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 474B81BF863
 for <buildroot@lists.busybox.net>; Thu,  4 May 2023 11:28:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2ED6880E63
 for <buildroot@lists.busybox.net>; Thu,  4 May 2023 11:28:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2ED6880E63
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2ZKI5KGpn7Hn for <buildroot@lists.busybox.net>;
 Thu,  4 May 2023 11:28:30 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 44E3480E46
 for <buildroot@buildroot.org>; Thu,  4 May 2023 11:28:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 44E3480E46
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3536685C90; Thu,  4 May 2023 11:28:30 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 4 May 2023 13:26:20 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 7d8b699c292dce2ea1f73b12adf8fa62ed8e5a44
X-Git-Newrev: 6e67c566d2555837f9c32c31695079ae6a4318ef
X-Patchwork-Hint: ignore
Message-Id: <20230504112830.3536685C90@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/tcpdump: bump to
 version 4.99.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=6e67c566d2555837f9c32c31695079ae6a4318ef
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit aa2b795b2e48663cb2924a35e22fb47071ef9531)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/tcpdump/Config.in    | 2 +-
 package/tcpdump/tcpdump.hash | 4 ++--
 package/tcpdump/tcpdump.mk   | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/tcpdump/Config.in b/package/tcpdump/Config.in
index 8b54c603df..7429471362 100644
--- a/package/tcpdump/Config.in
+++ b/package/tcpdump/Config.in
@@ -4,7 +4,7 @@ config BR2_PACKAGE_TCPDUMP
 	help
 	  A tool for network monitoring and data acquisition.
 
-	  http://www.tcpdump.org/
+	  https://www.tcpdump.org/
 
 if BR2_PACKAGE_TCPDUMP
 
diff --git a/package/tcpdump/tcpdump.hash b/package/tcpdump/tcpdump.hash
index 1990aa797b..a950d3fa66 100644
--- a/package/tcpdump/tcpdump.hash
+++ b/package/tcpdump/tcpdump.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature at
-# https://www.tcpdump.org/release/tcpdump-4.99.1.tar.gz.sig
+# https://www.tcpdump.org/release/tcpdump-4.99.2.tar.gz.sig
 # using key 1F166A5742ABB9E0249A8D30E089DEF1D9C15D0D
-sha256  79b36985fb2703146618d87c4acde3e068b91c553fb93f021a337f175fd10ebe  tcpdump-4.99.1.tar.gz
+sha256  f4304357d34b79d46f4e17e654f1f91f9ce4e3d5608a1badbd53295a26fb44d5  tcpdump-4.99.2.tar.gz
 sha256  8a54594d257e14a5260ac770f1633516cb51e3fc28c40136ce2697014eda7afd  LICENSE
diff --git a/package/tcpdump/tcpdump.mk b/package/tcpdump/tcpdump.mk
index 7741c3b58e..c38d46e2cd 100644
--- a/package/tcpdump/tcpdump.mk
+++ b/package/tcpdump/tcpdump.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TCPDUMP_VERSION = 4.99.1
+TCPDUMP_VERSION = 4.99.2
 TCPDUMP_SITE = https://www.tcpdump.org/release
 TCPDUMP_LICENSE = BSD-3-Clause
 TCPDUMP_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
