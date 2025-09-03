Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BD56CA1009
	for <buildroot@archiver.kernel.org>; Wed,  3 Sep 2025 16:23:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3AA4E4233B;
	Wed,  3 Sep 2025 16:23:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 90VAfWTq9SJT; Wed,  3 Sep 2025 16:23:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 516E24231E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 516E24231E;
	Wed,  3 Sep 2025 16:23:36 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id EB5C02BA8
 for <buildroot@buildroot.org>; Wed,  3 Sep 2025 16:23:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E7F6340D51
 for <buildroot@buildroot.org>; Wed,  3 Sep 2025 16:23:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hMAeWDw2SIKD for <buildroot@buildroot.org>;
 Wed,  3 Sep 2025 16:23:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3F9F840C47
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3F9F840C47
 for <buildroot@buildroot.org>; Wed,  3 Sep 2025 16:23:16 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3A2F987EA7; Wed,  3 Sep 2025 16:23:14 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 3 Sep 2025 18:19:28 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f19d98eee2dae8511c95302beaf88208e2767b3c
X-Git-Newrev: fa4148d45a0e4bed3c8444c6ebc41bb7444580c7
X-Patchwork-Hint: ignore
Message-Id: <20250903162314.3A2F987EA7@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/wipe: autoreconf to fix configure
 with >= gcc-15
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

commit: https://git.buildroot.net/buildroot/commit/?id=fa4148d45a0e4bed3c8444c6ebc41bb7444580c7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes https://autobuild.buildroot.net/results/9d4e2f156d76e2acc83e3a25adb5e5cf0705e7c6/

configure:781: checking whether the C compiler (/home/buildroot/instance-0/output-1/host/bin/armeb-buildroot-linux-gnueabi-gcc -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Og -g0 -D_FORTIFY_SOURCE=1 ) works
configure:797: /home/buildroot/instance-0/output-1/host/bin/armeb-buildroot-linux-gnueabi-gcc -o conftest -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Og -g0 -D_FORTIFY_SOURCE=1 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  conftest.c  1>&5
configure:794:1: error: return type defaults to 'int' [-Wimplicit-int]
  794 | main(){return(0);}
      | ^~~~
configure: failed program was:

 #line 792 "configure"
 #include "confdefs.h"

 main(){return(0);}

Wipe uses a very old configure script where the compile checks are missing
the return type on main(), breaking the configure step with >= gcc-15.

As a workaround, use AUTORECONF to regenerate the configure script.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/wipe/wipe.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/wipe/wipe.mk b/package/wipe/wipe.mk
index 83a8c87587..f6134ba55b 100644
--- a/package/wipe/wipe.mk
+++ b/package/wipe/wipe.mk
@@ -9,6 +9,8 @@ WIPE_SITE = http://downloads.sourceforge.net/project/wipe/wipe/$(WIPE_VERSION)
 WIPE_SOURCE = wipe-$(WIPE_VERSION).tar.bz2
 WIPE_LICENSE = GPL-2.0+
 WIPE_LICENSE_FILES = LICENSE
+# configure script not compatible with >= gcc-15
+WIPE_AUTORECONF = YES
 
 define WIPE_INSTALL_TARGET_CMDS
 	$(INSTALL) -D -m 0755 $(@D)/wipe $(TARGET_DIR)/usr/bin/wipe
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
