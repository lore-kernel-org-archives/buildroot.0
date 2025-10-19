Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17A36CCD184
	for <buildroot@archiver.kernel.org>; Sun, 19 Oct 2025 12:07:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DDA7D40A8B;
	Sun, 19 Oct 2025 12:07:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id v85SywrRlJGn; Sun, 19 Oct 2025 12:07:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2A56D40905
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2A56D40905;
	Sun, 19 Oct 2025 12:07:48 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 1B8471CD
 for <buildroot@buildroot.org>; Sun, 19 Oct 2025 12:07:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0DBD140A91
 for <buildroot@buildroot.org>; Sun, 19 Oct 2025 12:07:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4R2hjXvCxGsH for <buildroot@buildroot.org>;
 Sun, 19 Oct 2025 12:07:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2103A40A78
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2103A40A78
 for <buildroot@buildroot.org>; Sun, 19 Oct 2025 12:07:45 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 09AFD87542; Sun, 19 Oct 2025 12:07:45 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 19 Oct 2025 14:05:41 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 622e8683ae12f2cf933717f6781ebcd282cdb353
X-Git-Newrev: f37c48faf62cdd337bc9733e74cb46544dbdeea9
X-Patchwork-Hint: ignore
Message-Id: <20251019120745.09AFD87542@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/qt6/qt6multimedia: add dependency
 to qt6svg for examples
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

commit: https://git.buildroot.net/buildroot/commit/?id=f37c48faf62cdd337bc9733e74cb46544dbdeea9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Buildroot commit 553c55e9bd3cfa05cb84fa4cdfc5d25d51c3486b added the
qt6multimedia package including an option to build examples which
contains a dependency to qt6svg without selecting the package in
Config.in.

Fixes:
https://autobuild.buildroot.org/results/c94670cf255a1a6975e99d7b22a159f7fdc6f850/

    Makefile:578: *** qt6svg is in the dependency chain of qt6multimedia
    that has added it to its _DEPENDENCIES variable without selecting it
    or depending on it from Config.in.  Stop.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/qt6/qt6multimedia/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/qt6/qt6multimedia/Config.in b/package/qt6/qt6multimedia/Config.in
index f64f60a004..8cdd95f3e8 100644
--- a/package/qt6/qt6multimedia/Config.in
+++ b/package/qt6/qt6multimedia/Config.in
@@ -25,6 +25,7 @@ config BR2_PACKAGE_QT6MULTIMEDIA_ALSA
 
 config BR2_PACKAGE_QT6MULTIMEDIA_EXAMPLES
 	bool "examples"
+	select BR2_PACKAGE_QT6SVG
 	help
 	  This option enables the Qt6 Multimedia examples.
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
