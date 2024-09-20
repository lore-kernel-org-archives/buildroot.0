Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70BBECF58E5
	for <buildroot@archiver.kernel.org>; Fri, 20 Sep 2024 07:53:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 21FD740620;
	Fri, 20 Sep 2024 07:53:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RycKwGfyXfiB; Fri, 20 Sep 2024 07:53:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6D45C41352
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6D45C41352;
	Fri, 20 Sep 2024 07:53:35 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3FE901BF982
 for <buildroot@lists.busybox.net>; Fri, 20 Sep 2024 07:53:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2DBF4607B4
 for <buildroot@lists.busybox.net>; Fri, 20 Sep 2024 07:53:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id K17c94JZzU1r for <buildroot@lists.busybox.net>;
 Fri, 20 Sep 2024 07:53:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6F83860730
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6F83860730
 for <buildroot@buildroot.org>; Fri, 20 Sep 2024 07:53:30 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5B74D83E73; Fri, 20 Sep 2024 07:53:30 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 20 Sep 2024 09:41:30 +0200
X-Git-Refname: refs/heads/2024.08.x
X-Git-Oldrev: 090890c5f7ff1cf970995ba6be50ccc1f0fad67f
X-Git-Newrev: 7e31c9deac00f59d99aa545f5939bba73a0020ca
X-Patchwork-Hint: ignore
Message-Id: <20240920075330.5B74D83E73@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.08.x] package/qt6/qt6svg: host
 variant depends on host-qt6base
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

commit: https://git.buildroot.net/buildroot/commit/?id=7e31c9deac00f59d99aa545f5939bba73a0020ca
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.08.x

Without this, building just host-qt6svg fails.

Signed-off-by: Christian Hitz <christian.hitz@bbv.ch>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 480d667a1907f84630bf061537c14fdb73a33eda)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/qt6/qt6svg/qt6svg.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/qt6/qt6svg/qt6svg.mk b/package/qt6/qt6svg/qt6svg.mk
index a9d7eaef51..08570c7f9c 100644
--- a/package/qt6/qt6svg/qt6svg.mk
+++ b/package/qt6/qt6svg/qt6svg.mk
@@ -36,5 +36,8 @@ QT6SVG_DEPENDENCIES = \
 	host-pkgconf \
 	qt6base
 
+HOST_QT6SVG_DEPENDENCIES = \
+	host-qt6base
+
 $(eval $(cmake-package))
 $(eval $(host-cmake-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
