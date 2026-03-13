Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EC4B105F79E
	for <buildroot@archiver.kernel.org>; Sat, 14 Mar 2026 08:00:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CD71961031;
	Sat, 14 Mar 2026 08:00:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0ASfG-js1vVn; Sat, 14 Mar 2026 08:00:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F24736100D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773475239;
	bh=UHnVj2SoM1nSDm6XUBLJul4o7lQpufE3EFgGxdET4L4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=VRAIFQj6hQttXalwkJMUjg71qRlqKbSHx//wwt1hhLq1S6csmPCbuyn0UhdMmPPfW
	 7i0UgTasxOE/J+7X5NgZxehP8xENyUPSQzJkjOXNSV9LvrgP2Ok6cYVh8PrVs6/fre
	 jlYgkz4B7CRHHR2xPsK0ruHo4+e0oeJgSnFluh9TYQl2svDeVbzvZmKL1Oy7amgFBP
	 equ2/4XTikOGKtdQxhYvb9YD/TvWyFzTq/MKOcMvVEFaJn0XAb226vGWxEJi5UVY5h
	 AsoyAhDvgBwtQ3LpNL5yF8HvBwBZ99PaPmF2rm8kaZifjcI6T7RQTdNTLRx3QomrNd
	 AP1uZL8NEnDAA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id F24736100D;
	Sat, 14 Mar 2026 08:00:38 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 031781B4
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 08:00:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9AE7861009
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 08:00:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 40Zcs6M2LN4G for <buildroot@buildroot.org>;
 Sat, 14 Mar 2026 08:00:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B211B6101C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id B211B6101C
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 08:00:09 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E873485EE5; Sat, 14 Mar 2026 08:00:09 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 13 Mar 2026 16:09:54 +0100
X-Git-Refname: refs/heads/2025.11.x
X-Git-Oldrev: f829c4f7468de4404186098f862e16f0ec711819
X-Git-Newrev: d7e87b8b6ef1adc0aad5c2f1d9bd383b4021744c
X-Patchwork-Hint: ignore
Message-Id: <20260314080009.E873485EE5@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.11.x] DEVELOPERS: remove Bernd
 Kuhls from libldns
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/d7e87b8b6ef1adc0aad5c2f1d9bd383b4021744c
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.11.x

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 156e2be96cedf904d973748b8ac5d4423a0f74e6)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 DEVELOPERS | 1 -
 1 file changed, 1 deletion(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index 41c985633d..5ceb0eb7cb 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -422,7 +422,6 @@ F:	package/libhdhomerun/
 F:	package/libheif/
 F:	package/libid3tag/
 F:	package/libilbc/
-F:	package/libldns/
 F:	package/libmicrohttpd/
 F:	package/libminiupnpc/
 F:	package/libmspack/
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
