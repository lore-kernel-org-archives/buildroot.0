Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF265EDF023
	for <buildroot@archiver.kernel.org>; Fri, 13 Feb 2026 09:11:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7A5EC40C2C;
	Fri, 13 Feb 2026 09:11:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IMaWBN75BokQ; Fri, 13 Feb 2026 09:11:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7FA7940549
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770973895;
	bh=0eqZa/ibKi8oG9K83E/k9506g89tnaayXElKeQDtbzk=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=FFw6Xij1n8A3iKySxTTXHpkeBUF+38UpVkHw7DMueKIRSOVJ5z+KK7xsi1UXsEij5
	 N9srzLBOqJiDrb39AWUsLUkAAXvhE08R57p4BkD0XZdLeB8/UAcYR0NXRId8lIqLvW
	 /OmOiS9aRWvYU5woqsPsoXlgr1mSnhqs2XsvuABS/BCZf+ug3SJnP8egNu/Eb9qTui
	 oiTHsOMWoMTKQqY1Ddt08biYQV2nrc3X9PPPRcEIC4hWlvQR4L+Wi6O198Wp9YGmsL
	 8kZF+IA3UrrxBNpWW+JvP0D9qPOxSSWI7+xLV+TgJLZ4p0EL2C7CCIT1W6DLCG8L+Y
	 rPNhzG2Ni6POg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7FA7940549;
	Fri, 13 Feb 2026 09:11:35 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 3A8F6EC
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 09:11:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1C95E83E02
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 09:11:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ng-4Jmgwyt5M for <buildroot@buildroot.org>;
 Fri, 13 Feb 2026 09:11:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 214CA83DEB
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 214CA83DEB
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 09:11:32 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 00D078464B; Fri, 13 Feb 2026 09:11:31 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 13 Feb 2026 09:45:21 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7c85f3adf4a844967a1f6f3d585e911861e98297
X-Git-Newrev: 60d00e3548e0060bd819e2efcee28f206f01f713
X-Patchwork-Hint: ignore
Message-Id: <20260213091132.00D078464B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/avahi: update _SITE
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/60d00e3548e0060bd819e2efcee28f206f01f713
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

The github repository lathiat/avahi now redirect to avahi/avahi.

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/avahi/avahi.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/avahi/avahi.mk b/package/avahi/avahi.mk
index 1efc05c025..9074b374f6 100644
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
