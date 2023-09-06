Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08C86EE14D3
	for <buildroot@archiver.kernel.org>; Wed,  6 Sep 2023 19:25:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B3DFA41589;
	Wed,  6 Sep 2023 19:25:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B3DFA41589
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Rf09HdwYJWou; Wed,  6 Sep 2023 19:24:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 05703415A1;
	Wed,  6 Sep 2023 19:24:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 05703415A1
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 139E01BF46D
 for <buildroot@lists.busybox.net>; Wed,  6 Sep 2023 19:24:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EAF7C611C7
 for <buildroot@lists.busybox.net>; Wed,  6 Sep 2023 19:24:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EAF7C611C7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id a04g9AVfYtL7 for <buildroot@lists.busybox.net>;
 Wed,  6 Sep 2023 19:24:55 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3E72060FE1
 for <buildroot@buildroot.org>; Wed,  6 Sep 2023 19:24:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3E72060FE1
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1F836869A5; Wed,  6 Sep 2023 19:24:55 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 6 Sep 2023 21:20:13 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0ef48995a14389a2d8a40fa47ba0d0a731903fc5
X-Git-Newrev: 79c7a67a4cbc93cdff3f70797b7a24fb09d17b11
X-Patchwork-Hint: ignore
Message-Id: <20230906192455.1F836869A5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/dt: fix Kconfig package URL
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

commit: https://git.buildroot.net/buildroot/commit/?id=79c7a67a4cbc93cdff3f70797b7a24fb09d17b11
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The old package URL is no longer working. This commit updates it to
the one advertised at [1].

[1] https://github.com/RobinTMiller/dt/blob/b30eb7a123cfba900f26ceda413ea8ae49c3817e/html/dt.html#L33

Signed-off-by: Julien Olivain <ju.o@free.fr>
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
