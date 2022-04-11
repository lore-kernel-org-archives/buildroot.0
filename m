Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71D7DC433EF
	for <buildroot@archiver.kernel.org>; Mon, 11 Apr 2022 07:17:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 143B583E6B;
	Mon, 11 Apr 2022 07:17:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AZimpiahF7CZ; Mon, 11 Apr 2022 07:17:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1B4DB831F5;
	Mon, 11 Apr 2022 07:17:16 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 644581BF9B5
 for <buildroot@lists.busybox.net>; Mon, 11 Apr 2022 07:16:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5307B4157F
 for <buildroot@lists.busybox.net>; Mon, 11 Apr 2022 07:16:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vcgTVzP8thqI for <buildroot@lists.busybox.net>;
 Mon, 11 Apr 2022 07:16:33 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 734074155B
 for <buildroot@buildroot.org>; Mon, 11 Apr 2022 07:16:33 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 29DAA8396A; Mon, 11 Apr 2022 07:06:52 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 11 Apr 2022 09:15:59 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c3ac7eb13346789f9a48e8a302fe92181ff5dde3
X-Git-Newrev: 1fe5029122c8d6aba0194d6b9b0ddcd1fde2ee8d
X-Patchwork-Hint: ignore
Message-Id: <20220411070652.29DAA8396A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/bind: security bump to version
 9.16.27
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

commit: https://git.buildroot.net/buildroot/commit/?id=1fe5029122c8d6aba0194d6b9b0ddcd1fde2ee8d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes the following security issues:

- The rules for acceptance of records into the cache have been tightened to
  prevent the possibility of poisoning if forwarders send records outside
  the configured bailiwick.  (CVE-2021-25220)

- TCP connections with keep-response-order enabled could leave the TCP
  sockets in the CLOSE_WAIT state when the client did not properly shut down
  the connection.  (CVE-2022-0396)

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/bind/bind.hash | 4 ++--
 package/bind/bind.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/bind/bind.hash b/package/bind/bind.hash
index 401e389e49..2c10a0429b 100644
--- a/package/bind/bind.hash
+++ b/package/bind/bind.hash
@@ -1,4 +1,4 @@
-# Verified from https://ftp.isc.org/isc/bind9/9.16.26/bind-9.16.26.tar.xz.asc
+# Verified from https://ftp.isc.org/isc/bind9/9.16.27/bind-9.16.27.tar.xz.asc
 # with key AADBBA5074F1402F7B69D56BC5B4EE931A9F9DFD
-sha256  70b39a5eb71650358ec9ba41da3050d32aeac0aeb4a466684b23f35affa7fb45  bind-9.16.26.tar.xz
+sha256  90902aaf104c81019d75d6f8b2f7ec40fcd249406f894b44e4a9c6b5e08bf566  bind-9.16.27.tar.xz
 sha256  daf6f1eddf5983ed664a2d125b619e56e2e93917c19d0d41c7586ea153ba2155  COPYRIGHT
diff --git a/package/bind/bind.mk b/package/bind/bind.mk
index a595baabc5..5164001ab5 100644
--- a/package/bind/bind.mk
+++ b/package/bind/bind.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BIND_VERSION = 9.16.26
+BIND_VERSION = 9.16.27
 BIND_SOURCE= bind-$(BIND_VERSION).tar.xz
 BIND_SITE = https://ftp.isc.org/isc/bind9/$(BIND_VERSION)
 # bind does not support parallel builds.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
