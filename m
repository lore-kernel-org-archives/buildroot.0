Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 397AAD0D157
	for <buildroot@archiver.kernel.org>; Wed,  7 Jan 2026 18:02:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7A785413F8;
	Wed,  7 Jan 2026 18:02:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Luhf_cS53vmC; Wed,  7 Jan 2026 18:02:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 084F1413C6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767808938;
	bh=R7FRiGLGz1ru6ilMp6z7bQLG7D50ImM3PDVVCbCAH8A=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=RxItuP5heSPCH5Lptnw6H1N9X4fWHc3La6V7CIr3JZ3CQ2zPeRSlivCFfD9KcF+r3
	 HfJbI9Rp6zMqIogqiarzItyk6H91tAFel4puNJHRNIJ2EAtRWkjus7ep8PpdylacqE
	 3kNbD3DYIJdCNWsW6cobuOCblOfH4AfupN9gkOdeI/lRTNs67XXR8Ip5OYdKuRLCya
	 Zu8ESgkWkq25RNhLWfv0tJeod1OPeMZyy1BjPiefg6y1cT095dh5Ra0p0FfpCzDgKT
	 NnO3bx3bnllU5FnaXscwzfgIm+WDimpWyLi9X81k+45DiU8woEPaLdwWcsFFxAEiD/
	 Nshx8Q0P4NYkQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 084F1413C6;
	Wed,  7 Jan 2026 18:02:18 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0EFE69ED
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 18:01:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 83FB440B78
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 18:01:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nmK9T-_BCaxB for <buildroot@buildroot.org>;
 Wed,  7 Jan 2026 18:01:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1819140A06
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1819140A06
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 18:01:13 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 169F98039B; Wed,  7 Jan 2026 18:01:13 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 6 Jan 2026 08:55:09 +0100
X-Git-Refname: refs/heads/2025.11.x
X-Git-Oldrev: 9b4ab2209695ce8512eb268d321d8b0bfe7bffd3
X-Git-Newrev: c7684b92f67509c82c884972e3fbf0604223985b
X-Patchwork-Hint: ignore
Message-Id: <20260107180113.169F98039B@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.11.x] package/matchbox-panel:
 fix build with GCC 14.x
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=c7684b92f67509c82c884972e3fbf0604223985b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.11.x

No autobuild errors recorded due to download errors with dependencies.

Patch not sent anymore, original project has no updates since 2010:
https://git.yoctoproject.org/matchbox-panel

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit e235a191dd8bd6d5bdb9434352deae86953cfa49)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/matchbox-panel/0004-fix-build.patch | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/package/matchbox-panel/0004-fix-build.patch b/package/matchbox-panel/0004-fix-build.patch
new file mode 100644
index 0000000000..bed7e84b1f
--- /dev/null
+++ b/package/matchbox-panel/0004-fix-build.patch
@@ -0,0 +1,16 @@
+Description: fix FTBFS with stricter GCC flags
+
+Upstream: https://sources.debian.org/src/matchbox-panel/0.9.3%2Bgit20100816-2/debian/patches/fix-build
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+
+Index: matchbox-panel-0.9.3+git20100816/src/msg.h
+===================================================================
+--- matchbox-panel-0.9.3+git20100816.orig/src/msg.h	2020-06-16 16:04:57.000000000 +0100
++++ matchbox-panel-0.9.3+git20100816/src/msg.h	2024-08-09 11:22:54.986036009 +0100
+@@ -17,5 +17,6 @@
+ void msg_handle_events(MBPanel *d, XEvent *e);
+ void msg_handle_timeouts(MBPanel *d);
+ void msg_cancel(MBPanel *d, XClientMessageEvent *e);
++Bool msg_set_timeout (MBPanel *d, struct timeval *tv, struct timeval **tvp);
+ 
+ #endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
