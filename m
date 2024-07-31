Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B40FAC3DA64
	for <buildroot@archiver.kernel.org>; Wed, 31 Jul 2024 16:55:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8695681CE1;
	Wed, 31 Jul 2024 16:55:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id h44WWnVMO2pJ; Wed, 31 Jul 2024 16:55:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 816D68136B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 816D68136B;
	Wed, 31 Jul 2024 16:55:55 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id F16F01BF983
 for <buildroot@lists.busybox.net>; Wed, 31 Jul 2024 16:55:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EC1C0409C7
 for <buildroot@lists.busybox.net>; Wed, 31 Jul 2024 16:55:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WV9NnVKWVZZr for <buildroot@lists.busybox.net>;
 Wed, 31 Jul 2024 16:55:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E157340959
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id E157340959
 for <buildroot@buildroot.org>; Wed, 31 Jul 2024 16:55:45 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CEDF78379E; Wed, 31 Jul 2024 16:55:45 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 31 Jul 2024 18:33:18 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 7e0a94b70fcd4e50bc66d137381dbfc540c840da
X-Git-Newrev: 50911222d2462a8aed6c5d4f6835d98b650c4f18
X-Patchwork-Hint: ignore
Message-Id: <20240731165545.CEDF78379E@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/qt5/qt5webkit:
 fix patch fuzz
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

commit: https://git.buildroot.net/buildroot/commit/?id=50911222d2462a8aed6c5d4f6835d98b650c4f18
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

Commit 8f88a644ed7d6 ("support/scripts/apply-patches.sh: set the maximum
fuzz factor to 0") reduced the fuzz factor.

Due to this change, qt5webkit fails to build with output:

    Applying 0004-Remove-invalid-g_object-declarations-to-fix-build-wi.patch using patch:
    patching file Source/WTF/wtf/glib/GRefPtr.h
    Hunk #1 FAILED at 29.
    1 out of 1 hunk FAILED -- saving rejects to file Source/WTF/wtf/glib/GRefPtr.h.rej

This commit refreshes the package patch on the current package version.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 6d0cce7dab6cbfad02edd27254b548948612432e)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0004-Remove-invalid-g_object-declarations-to-fix-build-wi.patch   | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/qt5/qt5webkit/0004-Remove-invalid-g_object-declarations-to-fix-build-wi.patch b/package/qt5/qt5webkit/0004-Remove-invalid-g_object-declarations-to-fix-build-wi.patch
index 48605e4fe4..e3a1faec9c 100644
--- a/package/qt5/qt5webkit/0004-Remove-invalid-g_object-declarations-to-fix-build-wi.patch
+++ b/package/qt5/qt5webkit/0004-Remove-invalid-g_object-declarations-to-fix-build-wi.patch
@@ -8,6 +8,8 @@ g_object_ref_sink is defined as a macro meanwhile and so the build fails.
 Just remove the declarations, glib.h is included anyway.
 Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
 [Retrieved from: https://github.com/qtwebkit/qtwebkit/pull/1058]
+[Dario: make the patch to be applied with fuzz factor 0]
+Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
 ---
  Source/WTF/wtf/glib/GRefPtr.h | 3 ---
  1 file changed, 3 deletions(-)
@@ -17,8 +19,8 @@ index 06133d82cb35..d9a1d2f145f5 100644
 --- a/Source/WTF/wtf/glib/GRefPtr.h
 +++ b/Source/WTF/wtf/glib/GRefPtr.h
 @@ -29,9 +29,6 @@
+ #include <wtf/RefPtr.h>
  #include <algorithm>
- #include <glib.h>
  
 -extern "C" void g_object_unref(gpointer);
 -extern "C" gpointer g_object_ref_sink(gpointer);
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
