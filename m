Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5467DEDE99F
	for <buildroot@archiver.kernel.org>; Thu, 14 Sep 2023 09:56:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0C540607A4;
	Thu, 14 Sep 2023 09:56:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0C540607A4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rfaaE9oS5rok; Thu, 14 Sep 2023 09:56:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3CAE16129D;
	Thu, 14 Sep 2023 09:56:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3CAE16129D
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 371501BF42E
 for <buildroot@lists.busybox.net>; Thu, 14 Sep 2023 09:53:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0EFE6608A6
 for <buildroot@lists.busybox.net>; Thu, 14 Sep 2023 09:53:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0EFE6608A6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ic8QhM9YP-O5 for <buildroot@lists.busybox.net>;
 Thu, 14 Sep 2023 09:53:40 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id DE25961221
 for <buildroot@buildroot.org>; Thu, 14 Sep 2023 09:53:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DE25961221
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DC59E86F5A; Thu, 14 Sep 2023 09:53:40 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 14 Sep 2023 11:51:47 +0200
X-Git-Refname: refs/heads/2023.05.x
X-Git-Oldrev: a047247ad6f1fcb02652e7330e70a8247276a297
X-Git-Newrev: 81c75c6340ef2984526e6e744d1afbf4bf3ee102
X-Patchwork-Hint: ignore
Message-Id: <20230914095340.DC59E86F5A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.05.x] package/dt: fix Kconfig
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

commit: https://git.buildroot.net/buildroot/commit/?id=81c75c6340ef2984526e6e744d1afbf4bf3ee102
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.05.x

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
