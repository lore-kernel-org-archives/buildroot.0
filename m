Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79E52CD6E4F
	for <buildroot@archiver.kernel.org>; Fri, 29 May 2026 08:26:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4FB5983BC1;
	Fri, 29 May 2026 08:26:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3z5LtFgAapJk; Fri, 29 May 2026 08:26:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 804B883BCE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780043170;
	bh=Ops+lfBZOFJCprd6FGSU/nl5pD1tPeab+vyXpdN4MiE=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=kEguKae2s71fH6Y5Eeu8ZnL25sDYZxon0wqX1Rxl0JwMkyMypZtSq/V54/ITjh144
	 XdrA2+1oY1unSIL4gQGEMKxPPfFr+G18+zCLIcFpJswp9ztLBWbYuHmnRElAaoi4RO
	 Y7JiKTUri5BrLkLUX0ggzfyA96HZenQGEiA+RqiS2FcDgFcuhH9WCotWtzfCwSkYi5
	 kdKA1rVOOxFQ1lkN0sn3MheULZbWcni8LEaiqbh2Vk3kUtQ+ZO/kcGGmQVR0SgQg0r
	 0IRsRswrhE6oPKkl+w/afxktQFXDy/0HX7H0ee3ZSzy2sjDAqe2fsWfhOLADSHB08r
	 aJX/t0OdlWMYw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 804B883BCE;
	Fri, 29 May 2026 08:26:10 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0318228E
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:25:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 684D941F8B
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:25:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WQdL_NDqwYtH for <buildroot@buildroot.org>;
 Fri, 29 May 2026 08:25:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 77C0D41F7E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 77C0D41F7E
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:25:19 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1798187334; Fri, 29 May 2026 08:25:07 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 28 May 2026 11:46:26 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: da9f08285bed22896335c4e8fb8edd1f725ef7f8
X-Git-Newrev: ec4feb89ab57c8bc167f334cc3eed3541754286e
X-Patchwork-Hint: ignore
Message-Id: <20260529082507.1798187334@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/imagemagick:
 security bump version to 7.1.2-23
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/ec4feb89ab57c8bc167f334cc3eed3541754286e
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

https://github.com/ImageMagick/Website/blob/main/ChangeLog.md#712-23---2026-05-17

Fixes the following CVEs:
CVE-2026-42326, CVE-2026-45031, CVE-2026-45358, CVE-2026-45359,
CVE-2026-45624, CVE-2026-45664, CVE-2026-46520, CVE-2026-46521,
CVE-2026-46522, CVE-2026-46523, CVE-2026-46557 & CVE-2026-46559.
[copied list of CVEs from
 https://www.news.de/technik/859626214/imagemagick-gefaehrdet-it-sicherheitshinweis-vom-bsi-und-bug-report-bekannte-schwachstellen-und-sicherheitsluecken/1/]

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
(cherry picked from commit 4e14863c9433f01bc02bb33933d86d8938b40cd7)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/imagemagick/imagemagick.hash | 2 +-
 package/imagemagick/imagemagick.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/imagemagick/imagemagick.hash b/package/imagemagick/imagemagick.hash
index a308cd1f06..fa46fc7cde 100644
--- a/package/imagemagick/imagemagick.hash
+++ b/package/imagemagick/imagemagick.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  91ffe35706ef01d0fc9630e3a81b168b9bdb10b5e1e0b0983c287063cce21210  imagemagick-7.1.2-19.tar.gz
+sha256  f129f7d87fc21da453d032dd291b80ea13faf2497f13ef8279d97759ed7d5c46  imagemagick-7.1.2-23.tar.gz
 sha256  131447ad0099069beaa32acf1700716eea294a5bdf936d8211d7026b1849e5d4  LICENSE
diff --git a/package/imagemagick/imagemagick.mk b/package/imagemagick/imagemagick.mk
index d88323ca2d..e08f0a803c 100644
--- a/package/imagemagick/imagemagick.mk
+++ b/package/imagemagick/imagemagick.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IMAGEMAGICK_VERSION = 7.1.2-19
+IMAGEMAGICK_VERSION = 7.1.2-23
 IMAGEMAGICK_SITE = $(call github,ImageMagick,ImageMagick,$(IMAGEMAGICK_VERSION))
 IMAGEMAGICK_LICENSE = Apache-2.0
 IMAGEMAGICK_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
