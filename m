Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8481DC54E67
	for <buildroot@archiver.kernel.org>; Fri, 15 Mar 2024 19:24:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 36E9A60FD8;
	Fri, 15 Mar 2024 19:24:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9nwS-B3T51LF; Fri, 15 Mar 2024 19:24:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DABC060FB8
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id DABC060FB8;
	Fri, 15 Mar 2024 19:23:58 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id AF9DA1BF990
 for <buildroot@lists.busybox.net>; Fri, 15 Mar 2024 19:23:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A18144193B
 for <buildroot@lists.busybox.net>; Fri, 15 Mar 2024 19:23:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6315ftGvyegn for <buildroot@lists.busybox.net>;
 Fri, 15 Mar 2024 19:23:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E97BC41939
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id E97BC41939
 for <buildroot@buildroot.org>; Fri, 15 Mar 2024 19:23:41 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E5003846F5; Fri, 15 Mar 2024 19:23:41 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 15 Mar 2024 20:20:12 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0a0b522b23fdadeafbca904a56047b8cf35760df
X-Git-Newrev: 355ceb893078b4e1d458a3367fc2c989911fefe1
X-Patchwork-Hint: ignore
Message-Id: <20240315192341.E5003846F5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libkrb5: force arm mode instead of
 Thumb mode
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0477970398788483830=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0477970398788483830==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=355ceb893078b4e1d458a3367fc2c989911fefe1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure in Thumb mode:

/tmp/ccdzbA2E.s:845: Error: selected processor does not support `mcr p15,0,r2,c7,c10,5' in Thumb mode

Fixes:
 - http://autobuild.buildroot.org/results/08be1fa0fee0f05818cd78d4718caa3476c570ae

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Reviewed-by: André Zwing <nerv@dawncrow.de>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/libkrb5/libkrb5.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/libkrb5/libkrb5.mk b/package/libkrb5/libkrb5.mk
index 62a34b2379..c58763eddd 100644
--- a/package/libkrb5/libkrb5.mk
+++ b/package/libkrb5/libkrb5.mk
@@ -33,6 +33,13 @@ LIBKRB5_CONF_OPTS = \
 	--without-tcl \
 	--disable-rpath
 
+# libkrb5 has some assembly function that is not present in Thumb mode:
+# Error: selected processor does not support `mcr p15,0,r2,c7,c10,5' in Thumb mode
+# so, we desactivate Thumb mode
+ifeq ($(BR2_ARM_INSTRUCTIONS_THUMB),y)
+LIBKRB5_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -marm"
+endif
+
 # Enabling static and shared at the same time is not supported
 ifeq ($(BR2_SHARED_STATIC_LIBS),y)
 LIBKRB5_CONF_OPTS += --disable-static

--===============0477970398788483830==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0477970398788483830==--
