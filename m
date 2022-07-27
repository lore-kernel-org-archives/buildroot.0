Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0B05C04A68
	for <buildroot@archiver.kernel.org>; Wed, 27 Jul 2022 14:48:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 692A160DDF;
	Wed, 27 Jul 2022 14:48:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 692A160DDF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9Bdl7TKHuMA6; Wed, 27 Jul 2022 14:48:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7D20B60ACE;
	Wed, 27 Jul 2022 14:48:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7D20B60ACE
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B19501BF9D1
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 14:46:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E495D41551
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 14:46:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E495D41551
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JjkMBQtGFprX for <buildroot@lists.busybox.net>;
 Wed, 27 Jul 2022 14:46:12 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id E9EEE41517
 for <buildroot@buildroot.org>; Wed, 27 Jul 2022 14:46:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E9EEE41517
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id AF5E086692; Wed, 27 Jul 2022 14:32:25 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 27 Jul 2022 16:44:10 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 166ea61fb4400f9d1b23a89a7a2c1c6fbee62327
X-Git-Newrev: d4ab37a333f9b84db5c975342234e953d986a6b4
X-Patchwork-Hint: ignore
Message-Id: <20220727143225.AF5E086692@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/jack2: disable example tools
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

commit: https://git.buildroot.net/buildroot/commit/?id=d4ab37a333f9b84db5c975342234e953d986a6b4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Disable example tools (enabled by default since bump to version 1.9.20
in commit 26ca7fec041836c31f29c5566365fe40eb552bca and
https://github.com/jackaudio/jack2/commit/508d95a97e0cdfad2e8c7d6cdd478741fdba2c87)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/jack2/jack2.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/jack2/jack2.mk b/package/jack2/jack2.mk
index 73f723aef0..9e56dcdfd8 100644
--- a/package/jack2/jack2.mk
+++ b/package/jack2/jack2.mk
@@ -12,7 +12,7 @@ JACK2_CPE_ID_VENDOR = jackaudio
 JACK2_DEPENDENCIES = alsa-lib
 JACK2_INSTALL_STAGING = YES
 
-JACK2_CONF_OPTS = --alsa
+JACK2_CONF_OPTS = --alsa --example-tools=no
 
 ifeq ($(BR2_PACKAGE_LIBEXECINFO),y)
 JACK2_DEPENDENCIES += libexecinfo
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
