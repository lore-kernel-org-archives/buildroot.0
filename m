Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D504C4332F
	for <buildroot@archiver.kernel.org>; Sat,  4 Nov 2023 15:13:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2201440A98;
	Sat,  4 Nov 2023 15:13:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2201440A98
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id F1Km4WKpcccJ; Sat,  4 Nov 2023 15:13:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 14FD340A65;
	Sat,  4 Nov 2023 15:13:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 14FD340A65
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9E1251BF869
 for <buildroot@lists.busybox.net>; Sat,  4 Nov 2023 15:11:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6ACBF41BD4
 for <buildroot@lists.busybox.net>; Sat,  4 Nov 2023 15:11:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6ACBF41BD4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Fg75Xh6zJ0wG for <buildroot@lists.busybox.net>;
 Sat,  4 Nov 2023 15:11:26 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 46D3241BCD
 for <buildroot@buildroot.org>; Sat,  4 Nov 2023 15:11:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 46D3241BCD
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2F96E8666D; Sat,  4 Nov 2023 15:11:26 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 4 Nov 2023 16:10:12 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 245b13a0778ec6ad061555b0b994e7649ef01006
X-Git-Newrev: 7f0926343effa8bb88c01a531725a8c283fa2399
X-Patchwork-Hint: ignore
Message-Id: <20231104151126.2F96E8666D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mono: enable selinux module
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=7f0926343effa8bb88c01a531725a8c283fa2399
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/mono/mono.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/mono/mono.mk b/package/mono/mono.mk
index b88f2b379e..aead85bac0 100644
--- a/package/mono/mono.mk
+++ b/package/mono/mono.mk
@@ -7,6 +7,7 @@
 MONO_VERSION = 6.12.0.182
 MONO_SITE = http://download.mono-project.com/sources/mono
 MONO_SOURCE = mono-$(MONO_VERSION).tar.xz
+MONO_SELINUX_MODULES = mono
 MONO_LICENSE = GPL-2.0 or MIT (compiler, tools), MIT (libs) or commercial
 MONO_LICENSE_FILES = LICENSE mcs/COPYING \
 	external/Newtonsoft.Json/Tools/7-zip/copying.txt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
