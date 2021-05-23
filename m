Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73BEBC4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 22:42:37 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 39E2560F56
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 22:42:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 39E2560F56
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 12D3A83D28;
	Tue,  3 Aug 2021 22:42:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LjVi9l1BT-jq; Tue,  3 Aug 2021 22:42:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4DE5B83D39;
	Tue,  3 Aug 2021 22:42:34 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C04A91BF9AA
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:11:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3792D404C9
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:09:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QhHu2xy_Wvkj for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:09:53 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id C5DFE4058E
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:09:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 24C5188523; Tue,  3 Aug 2021 21:09:44 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 23 May 2021 11:16:50 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: bf85592a46fbe244b5620baae02a9cf067ad1c23
X-Git-Newrev: eb6017fabe09fbb654b153414aba332d78002bd7
X-Patchwork-Hint: ignore
Message-Id: <20210803210944.24C5188523@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/vlc: fix build with
 latest live555
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=eb6017fabe09fbb654b153414aba332d78002bd7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Fix build failure with live555 raised since commit
6ad1c7f12e57ab7c6f022470e0aacec442d14267

Fixes:
 - http://autobuild.buildroot.org/results/83170984f96238756c45bf1f4e542363afafd45f

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 ...ess-live555.cpp-fix-build-with-live555-20.patch | 36 ++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/package/vlc/0010-modules-access-live555.cpp-fix-build-with-live555-20.patch b/package/vlc/0010-modules-access-live555.cpp-fix-build-with-live555-20.patch
new file mode 100644
index 0000000000..5f046648d4
--- /dev/null
+++ b/package/vlc/0010-modules-access-live555.cpp-fix-build-with-live555-20.patch
@@ -0,0 +1,36 @@
+From eba390d13ec4089cd6b9d8687ab3f8905b9d3ac8 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sat, 22 May 2021 22:56:04 +0200
+Subject: [PATCH] modules/access/live555.cpp: fix build with live555 >=
+ 2020.12.11
+
+Since live555-2020.12.11, connectionEndpointAddress() member function
+use a "struct sockaddr_storage" in preparation for eventual support of
+IPv6: http://www.live555.com/liveMedia/public/changelog.txt
+
+Fixes:
+ - http://autobuild.buildroot.org/results/83170984f96238756c45bf1f4e542363afafd45f
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ modules/access/live555.cpp | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/modules/access/live555.cpp b/modules/access/live555.cpp
+index 9d6e01ae32..32a6c294eb 100644
+--- a/modules/access/live555.cpp
++++ b/modules/access/live555.cpp
+@@ -850,7 +850,9 @@ static int SessionsSetup( demux_t *p_demux )
+             if( !p_sys->b_multicast )
+             {
+                 /* We need different rollover behaviour for multicast */
+-                p_sys->b_multicast = IsMulticastAddress( sub->connectionEndpointAddress() );
++                struct sockaddr_storage tempAddr;
++                sub->getConnectionEndpointAddress( tempAddr );
++                p_sys->b_multicast = IsMulticastAddress( tempAddr );
+             }
+ 
+             tk = (live_track_t*)malloc( sizeof( live_track_t ) );
+-- 
+2.30.2
+
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
