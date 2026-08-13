Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82B96C5B572
	for <buildroot@archiver.kernel.org>; Fri, 14 Aug 2026 13:22:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 50A1C81372;
	Fri, 14 Aug 2026 13:22:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id n0TCrrwf1MQb; Fri, 14 Aug 2026 13:22:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 77DF1814DB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786713724;
	bh=al48g3YpGiQz23F2a70kGvHfFeS/K4K3RZcpnlVa8hA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=NbYVPgoeK0eGxDI3ok6gglGmikdc+VfOx/qkTWr0GsqUilJGQvh0/E4D+wNWyjU1B
	 NlRoA4vwJuJ8zfCWSINWPVWIJoC9X7l2j2FwnHENRr09At0EjrJJUGC/pq9RztesHD
	 iB51X8Zg6QjGS9j5pZXxPDTylWNeuVkl2hFucYO8LpLMh2CGI7/mmIJcvEJuG6J1os
	 RX+Teft3JmtBNMTHpioNnLm/wwNO6Y3i+OZKG3ZD8UhEo//6XNDu0/Vkk0G8u1CjD+
	 H7IfXE71NJAYhNskxGwYamMVWWsi9+fOIipPUwlXEnEmdYYCIybd411qpLdQVJkRPu
	 m/bSEWJSAN4Jw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 77DF1814DB;
	Fri, 14 Aug 2026 13:22:04 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id BA05D139B
 for <buildroot@buildroot.org>; Fri, 14 Aug 2026 13:21:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A0FDE608BB
 for <buildroot@buildroot.org>; Fri, 14 Aug 2026 13:21:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id h3pI_tQ_0J53 for <buildroot@buildroot.org>;
 Fri, 14 Aug 2026 13:21:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6E126607EC
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6E126607EC
 for <buildroot@buildroot.org>; Fri, 14 Aug 2026 13:21:24 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7242C8D66C; Fri, 14 Aug 2026 13:20:34 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 13 Aug 2026 16:03:39 +0200
X-Git-Refname: refs/heads/2026.05.x
X-Git-Oldrev: 479722a5bc9c1127d7c4223ebbfa9498092fb1ee
X-Git-Newrev: f86590655af122c6e7c678eb349f0997d50942d3
X-Patchwork-Hint: ignore
Message-Id: <20260814132034.7242C8D66C@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.05.x] package/librsvg: update
 project URL
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/f86590655af122c6e7c678eb349f0997d50942d3
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.05.x

wiki.gnome.org has a big deprecation warning saying "All information
on this site is out of date and should not be used." Point at the
librsvg project on gitlab.gnome.org instead.

Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit c01426fe964207a60ece28704e060495731b4f91)
Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 package/librsvg/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/librsvg/Config.in b/package/librsvg/Config.in
index d74359dfc9..9f5c2f388e 100644
--- a/package/librsvg/Config.in
+++ b/package/librsvg/Config.in
@@ -19,7 +19,7 @@ config BR2_PACKAGE_LIBRSVG
 	  The rsvg library is an efficient renderer for Scalable
 	  Vector Graphics (SVG) pictures.
 
-	  https://wiki.gnome.org/Projects/LibRsvg
+	  https://gitlab.gnome.org/GNOME/librsvg
 
 comment "librsvg needs a toolchain w/ wchar, threads, C++, gcc >= 4.9"
 	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
