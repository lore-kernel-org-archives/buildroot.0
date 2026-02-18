Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D010E9A053
	for <buildroot@archiver.kernel.org>; Thu, 19 Feb 2026 17:25:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1386460F46;
	Thu, 19 Feb 2026 17:25:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2CSuRWrlU-PR; Thu, 19 Feb 2026 17:25:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0D76B610F4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771521945;
	bh=jpMv6XJMobNREMfEITmHIP/VEzOqnB/+/Z93/CEHUsI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=bAl/1BqnX2Alh0gMvxxcIfgDTNLsnkg1PRbGj69oOwwZ/hhYTO5sIBBgyyrVzZuyk
	 RtvOLLNejs1v4oznyAA9cJ5qjE4R5ljUgyvo+uobW1np/sTd/390my/bVKO2c8hYv6
	 idKKybL5DMPwmcIadueRTpLbhATUdfmnD4bR8OoN6OHcwg0lS8g6RiEEJcC5/P2UGH
	 pDi7AdEjC2GWPevpgYOZSy6JBmqXWgwteP2LzzzGXKYj6ZAJVZDIMx+cwRJDNKLF/b
	 k4ie9GzKrh8X3Mjr9QOlMtQfuIjHakFaxkbQngsLwt5nSe3ULhMepmkJT/XE8PH5J7
	 XPxBS1PoDyA1g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0D76B610F4;
	Thu, 19 Feb 2026 17:25:45 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1D4231CE
 for <buildroot@buildroot.org>; Thu, 19 Feb 2026 17:25:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 77C3C610DC
 for <buildroot@buildroot.org>; Thu, 19 Feb 2026 17:25:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WYdBgL6A79dK for <buildroot@buildroot.org>;
 Thu, 19 Feb 2026 17:25:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B8874610B2
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id B8874610B2
 for <buildroot@buildroot.org>; Thu, 19 Feb 2026 17:25:37 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B626B84D70; Thu, 19 Feb 2026 17:25:37 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 18 Feb 2026 19:22:37 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: bca05afec883e16ff82f252f5a1cce56b3dcd4fb
X-Git-Newrev: 1ddd7937a8a5ea3e24cdd1a1e1d3c70932acaca8
X-Patchwork-Hint: ignore
Message-Id: <20260219172537.B626B84D70@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/avahi: update
 _SITE
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/1ddd7937a8a5ea3e24cdd1a1e1d3c70932acaca8
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

The github repository lathiat/avahi now redirect to avahi/avahi.

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 60d00e3548e0060bd819e2efcee28f206f01f713)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/avahi/avahi.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/avahi/avahi.mk b/package/avahi/avahi.mk
index 1992669a92..90bc5bf5cb 100644
--- a/package/avahi/avahi.mk
+++ b/package/avahi/avahi.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 AVAHI_VERSION = 0.8
-AVAHI_SITE = https://github.com/lathiat/avahi/releases/download/v$(AVAHI_VERSION)
+AVAHI_SITE = https://github.com/avahi/avahi/releases/download/v$(AVAHI_VERSION)
 AVAHI_LICENSE = LGPL-2.1+
 AVAHI_LICENSE_FILES = LICENSE
 AVAHI_CPE_ID_VENDOR = avahi
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
