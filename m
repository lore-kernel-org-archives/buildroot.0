Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68742EDE99E
	for <buildroot@archiver.kernel.org>; Thu, 14 Sep 2023 09:52:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0F59060D72;
	Thu, 14 Sep 2023 09:52:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0F59060D72
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Vy76Gvke_y7Y; Thu, 14 Sep 2023 09:52:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 656FE60F2D;
	Thu, 14 Sep 2023 09:52:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 656FE60F2D
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id BBE101BF990
 for <buildroot@lists.busybox.net>; Thu, 14 Sep 2023 09:52:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 96A8C41F2D
 for <buildroot@lists.busybox.net>; Thu, 14 Sep 2023 09:52:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 96A8C41F2D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vayeZwaKOH0X for <buildroot@lists.busybox.net>;
 Thu, 14 Sep 2023 09:52:30 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1B1D341F21
 for <buildroot@buildroot.org>; Thu, 14 Sep 2023 09:52:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1B1D341F21
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 12E5186F2C; Thu, 14 Sep 2023 09:52:30 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 14 Sep 2023 11:51:54 +0200
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: 1cceeecaf4307819bb5bda2d8b784337546135ee
X-Git-Newrev: ade02bab3b14c68d8ced25afbff3fd89840502f1
X-Patchwork-Hint: ignore
Message-Id: <20230914095230.12E5186F2C@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/dt: fix Kconfig
 package URL
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

commit: https://git.buildroot.net/buildroot/commit/?id=ade02bab3b14c68d8ced25afbff3fd89840502f1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

The old package URL is no longer working. This commit updates it to
the one advertised at [1].

[1] https://github.com/RobinTMiller/dt/blob/b30eb7a123cfba900f26ceda413ea8ae49c3817e/html/dt.html#L33

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 79c7a67a4cbc93cdff3f70797b7a24fb09d17b11)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/dt/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/dt/Config.in b/package/dt/Config.in
index 826a66ebd5..af20cc9bca 100644
--- a/package/dt/Config.in
+++ b/package/dt/Config.in
@@ -18,4 +18,4 @@ config BR2_PACKAGE_DT
 	  before exiting. Since verification of data is performed,
 	  dt can be thought of as a generic diagnostic tool.
 
-	  http://www.scsifaq.org/RMiller_Tools/dt.html
+	  https://github.com/RobinTMiller/dt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
