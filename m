Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A0D2C4332F
	for <buildroot@archiver.kernel.org>; Thu,  9 Nov 2023 21:28:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D823142099;
	Thu,  9 Nov 2023 21:28:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D823142099
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ORHLnhvSZRjQ; Thu,  9 Nov 2023 21:28:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4526D4208F;
	Thu,  9 Nov 2023 21:28:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4526D4208F
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B84F11BF312
 for <buildroot@lists.busybox.net>; Thu,  9 Nov 2023 21:28:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8F16A614BB
 for <buildroot@lists.busybox.net>; Thu,  9 Nov 2023 21:28:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8F16A614BB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pDPTcw9nsoGb for <buildroot@lists.busybox.net>;
 Thu,  9 Nov 2023 21:28:38 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id CC49461499
 for <buildroot@buildroot.org>; Thu,  9 Nov 2023 21:28:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CC49461499
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B438A86EA2; Thu,  9 Nov 2023 21:28:38 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Thu, 9 Nov 2023 22:13:28 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1c56620ee95cbcd35d37c1f20f72fb8ab65b8cd5
X-Git-Newrev: e5467ad9f5b47d0672b42f28d65a2197a65dca07
X-Patchwork-Hint: ignore
Message-Id: <20231109212838.B438A86EA2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/kmod: drop python support
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=e5467ad9f5b47d0672b42f28d65a2197a65dca07
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The python bindings provided by kmod were last updated 9 years ago.
  - They are not compatible with Python 3.12.
  - No major distribution uses this option.

Remove the option.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/kmod/kmod.mk | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/package/kmod/kmod.mk b/package/kmod/kmod.mk
index dae84611fe..d83fb85a3e 100644
--- a/package/kmod/kmod.mk
+++ b/package/kmod/kmod.mk
@@ -62,11 +62,6 @@ else
 KMOD_CONF_OPTS += --without-openssl
 endif
 
-ifeq ($(BR2_PACKAGE_PYTHON3),y)
-KMOD_DEPENDENCIES += python3
-KMOD_CONF_OPTS += --enable-python
-endif
-
 ifeq ($(BR2_PACKAGE_KMOD_TOOLS),y)
 
 # add license info for kmod tools
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
