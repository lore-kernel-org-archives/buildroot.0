Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A0A2E9270E
	for <buildroot@archiver.kernel.org>; Sat, 27 Dec 2025 23:01:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B13AF80E6B;
	Sat, 27 Dec 2025 23:01:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5Y_4QmKbWGEg; Sat, 27 Dec 2025 23:01:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AA67D80DB8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766876512;
	bh=dFNyz56HEvEqaV1/nxKi1K6th8ysBaSSZnip6Lj1Q5c=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=MQsliz62vciDLwZ8hISjPA34ofmPJY2W3zFHgr7Gg/z1Xk90R95WXX2/GQAw9CLeT
	 6oE6KC6bAD9dXtHNL/ABEhcafpeOxQ5CS5XsZD0+lp8Aa6gQIOUBDxjwXxkKVVv+yr
	 WIHf/y7uVl1Lkx++AYTRqQAzNzkynwRSPjCGmkny4xt2ZLJTMEKncS5KBelMOT6zkX
	 v1FgOHmsFOFFJCW81jEyrjNfj5iuNtVZgfUwSbVmjcT3jLJd7wPIyr6C5aReLS4RR8
	 0MrE3aYh5XxagTezCVRgVL1cYcZaCWcRt1QjqtjsI/ItaXkPwpRrtfc8n38xNri8To
	 Dz65fJAR0Q6wg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id AA67D80DB8;
	Sat, 27 Dec 2025 23:01:52 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id AB0BDB9
 for <buildroot@buildroot.org>; Sat, 27 Dec 2025 23:01:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 91C03402C2
 for <buildroot@buildroot.org>; Sat, 27 Dec 2025 23:01:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id X0UHoEADVAaW for <buildroot@buildroot.org>;
 Sat, 27 Dec 2025 23:01:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E55CD402B8
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id E55CD402B8
 for <buildroot@buildroot.org>; Sat, 27 Dec 2025 23:01:49 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D4A608786B; Sat, 27 Dec 2025 23:01:49 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 27 Dec 2025 23:48:23 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: dab0feeae84ad8d1e4a52621b2606dab2ede0cad
X-Git-Newrev: 147236691d82b729f21abd7f6372e36736b5c703
X-Patchwork-Hint: ignore
Message-Id: <20251227230149.D4A608786B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/cutekeyboard: bump version to 1.5.0
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=147236691d82b729f21abd7f6372e36736b5c703
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For change log, see:
https://github.com/amarula/cutekeyboard/releases/tag/v1.5.0

Signed-off-by: Andrea Ricchi <andrea.ricchi@amarulasolutions.com>
[Julien: add link to change log]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/cutekeyboard/cutekeyboard.hash | 2 +-
 package/cutekeyboard/cutekeyboard.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/cutekeyboard/cutekeyboard.hash b/package/cutekeyboard/cutekeyboard.hash
index 4585996412..5800865230 100644
--- a/package/cutekeyboard/cutekeyboard.hash
+++ b/package/cutekeyboard/cutekeyboard.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  7bb9094dc8792c897dcf81caca5dfbb509ed8a851b01542a84d631adf6c62b62  cutekeyboard-1.4.0.tar.gz
+sha256  5ac0521f89ee9b7a2793150f09a77693b797301d12b8a65fe214387d8e8c0845  cutekeyboard-1.5.0.tar.gz
 sha256  bdde6ec2ae2686623c0bb414bfb8bd731b314beff2264c602116ea60dd65964d  LICENSE
diff --git a/package/cutekeyboard/cutekeyboard.mk b/package/cutekeyboard/cutekeyboard.mk
index b7085c8d7b..9a29f5df02 100644
--- a/package/cutekeyboard/cutekeyboard.mk
+++ b/package/cutekeyboard/cutekeyboard.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CUTEKEYBOARD_VERSION = 1.4.0
+CUTEKEYBOARD_VERSION = 1.5.0
 CUTEKEYBOARD_SITE = $(call github,amarula,cutekeyboard,v$(CUTEKEYBOARD_VERSION))
 CUTEKEYBOARD_DEPENDENCIES = qt5declarative qt5quickcontrols2
 CUTEKEYBOARD_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
