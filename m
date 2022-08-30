Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46AF0ECAAD1
	for <buildroot@archiver.kernel.org>; Tue, 30 Aug 2022 16:20:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E83DF60FFD;
	Tue, 30 Aug 2022 16:20:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E83DF60FFD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fO0itTDsh1mG; Tue, 30 Aug 2022 16:20:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1F16C60FEB;
	Tue, 30 Aug 2022 16:20:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1F16C60FEB
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7F67B1BF3A8
 for <buildroot@lists.busybox.net>; Tue, 30 Aug 2022 16:15:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7369540BC6
 for <buildroot@lists.busybox.net>; Tue, 30 Aug 2022 16:15:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7369540BC6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Y8iCyBsPSj2E for <buildroot@lists.busybox.net>;
 Tue, 30 Aug 2022 16:15:11 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 40A7340BCE
 for <buildroot@buildroot.org>; Tue, 30 Aug 2022 16:15:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 40A7340BCE
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 8C1CA880E2; Tue, 30 Aug 2022 16:00:07 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 30 Aug 2022 18:09:27 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: dd0e1dede47c53199693696c4b9467147576f5b5
X-Git-Newrev: 2bcc94e808da90db08a73216ee1cdcda4f1eef6f
X-Patchwork-Hint: ignore
Message-Id: <20220830160007.8C1CA880E2@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/jack2: disable
 example tools
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

commit: https://git.buildroot.net/buildroot/commit/?id=2bcc94e808da90db08a73216ee1cdcda4f1eef6f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Disable example tools (enabled by default since bump to version 1.9.20
in commit 26ca7fec041836c31f29c5566365fe40eb552bca and
https://github.com/jackaudio/jack2/commit/508d95a97e0cdfad2e8c7d6cdd478741fdba2c87)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit d4ab37a333f9b84db5c975342234e953d986a6b4)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
