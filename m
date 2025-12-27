Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7596D0D151
	for <buildroot@archiver.kernel.org>; Wed,  7 Jan 2026 18:01:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8DCE08116E;
	Wed,  7 Jan 2026 18:01:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ekrBeABFK1BR; Wed,  7 Jan 2026 18:01:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AA6FF813ED
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767808882;
	bh=VyQUhiCRzh3PCxpkiS2nwRhnBHCYVrRPhtcLvMabkYI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=KT6HmqrnWCKPrJkkHfnV5lrq9lp61bSG76Hx4OHlnT3vEPNIEWe7aWfz76ZG5dkrf
	 /LCpMpuipgswVNJmWXuMIfrypwxOLjC6jjo+QReCqe0yrkJzwh9HY/hrHFEmzagtnG
	 TMfTjoTdOfBFfcBVHWZYs/bBJ8rSK0poQpDeUWPx61az0T7I/GPg+vM6anHIMcPIZ/
	 EWGI7BHsYlD4lXPLAVmx3QfQ4Iu22UT/QLV4aA3505yjhNipxxFTv1ct9DLHbruKoC
	 LetWDOx+jjXgGou0JfOZ64lMy9JDrzfqdWP4PUYckVaFs4LaOZoxPToyft+vZydLDJ
	 v2q5VbKvhn3KA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id AA6FF813ED;
	Wed,  7 Jan 2026 18:01:22 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 17736A58
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 18:01:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 94ADE60643
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 18:01:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NTTlsXKk9qqY for <buildroot@buildroot.org>;
 Wed,  7 Jan 2026 18:01:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DDAA7607D9
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id DDAA7607D9
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 18:01:10 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D163D873D4; Wed,  7 Jan 2026 18:01:10 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 27 Dec 2025 16:31:03 +0100
X-Git-Refname: refs/heads/2025.11.x
X-Git-Oldrev: cff225bfb39d20f5a077480f8e3d3423d3ae485a
X-Git-Newrev: 792d1b901152e0f8c89263dd459f13be8232c70a
X-Patchwork-Hint: ignore
Message-Id: <20260107180110.D163D873D4@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.11.x] package/cage: properly
 propagate wlroots dependencies
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

commit: https://git.buildroot.net/buildroot/commit/?id=792d1b901152e0f8c89263dd459f13be8232c70a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.11.x

Commit 00fb3a57cbaedb8df43f75f0e891423c1ef7d8c6 added a wlroots ->
libgbm dependency, but forgot to propagate it to package/cage.

Fixes:

  https://autobuild.buildroot.net/results/dc185c3d4886e9cfd9e6f46b50b864e5b2f28605/

Cc: Raphael Pavlidis <raphael.pavlidis@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Reviewed-by: Adrian Perez de Castro <aperez@igalia.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 3d7261b27a9cb47c25602061333bea632ad80c2c)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/cage/Config.in | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/cage/Config.in b/package/cage/Config.in
index 4f823c768c..95c68732ed 100644
--- a/package/cage/Config.in
+++ b/package/cage/Config.in
@@ -1,6 +1,7 @@
-comment "cage needs udev, EGL and OpenGL ES support"
+comment "cage needs udev, EGL, OpenGL ES and GBM support"
 	depends on !BR2_PACKAGE_HAS_LIBEGL || \
 		!BR2_PACKAGE_HAS_LIBGLES || \
+		!BR2_PACKAGE_HAS_LIBGBM || \
 		!BR2_PACKAGE_HAS_UDEV
 
 comment "cage needs a toolchain w/ threads, dynamic library"
@@ -13,6 +14,7 @@ config BR2_PACKAGE_CAGE
 	depends on BR2_TOOLCHAIN_HAS_THREADS # wlroots
 	depends on BR2_PACKAGE_HAS_LIBEGL # wlroots
 	depends on BR2_PACKAGE_HAS_LIBGLES # wlroots
+	depends on BR2_PACKAGE_HAS_LIBGBM # wlroots
 	depends on BR2_PACKAGE_HAS_UDEV # wlroots
 	select BR2_PACKAGE_WLROOTS
 	help
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
