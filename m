Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C57B6CFD2F6
	for <buildroot@archiver.kernel.org>; Thu, 27 Nov 2025 20:36:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8681961BE0;
	Thu, 27 Nov 2025 20:36:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HMtGbT9Xfyb3; Thu, 27 Nov 2025 20:36:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1D4EB61BC8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1D4EB61BC8;
	Thu, 27 Nov 2025 20:36:40 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 069292A9
 for <buildroot@buildroot.org>; Thu, 27 Nov 2025 20:36:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0292961AB5
 for <buildroot@buildroot.org>; Thu, 27 Nov 2025 20:36:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hq0etsABZIZn for <buildroot@buildroot.org>;
 Thu, 27 Nov 2025 20:36:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 51EE061ABA
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 51EE061ABA
 for <buildroot@buildroot.org>; Thu, 27 Nov 2025 20:36:03 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 50CDF8355B; Thu, 27 Nov 2025 20:36:03 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 26 Nov 2025 09:44:22 +0100
X-Git-Refname: refs/heads/2025.08.x
X-Git-Oldrev: e70c5a4f0c10dabf8de837bfee67259f0fcc8845
X-Git-Newrev: a9b4636a627c546156b9a32b8523de0829d32585
X-Patchwork-Hint: ignore
Message-Id: <20251127203603.50CDF8355B@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.08.x] package/sane-backends:
 fix build with gcc >= 15.x
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=a9b4636a627c546156b9a32b8523de0829d32585
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.08.x

Fixes:
https://autobuild.buildroot.net/results/296/2961e7aa23d66e7cf364c2caeafc1c226ccd48d9/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 016993bd9ab334f4419cbb9b2e9c383e7554d4df)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 ...0002-sm3600.h-Fix-build-with-standard-C23.patch | 38 ++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/package/sane-backends/0002-sm3600.h-Fix-build-with-standard-C23.patch b/package/sane-backends/0002-sm3600.h-Fix-build-with-standard-C23.patch
new file mode 100644
index 0000000000..287de48285
--- /dev/null
+++ b/package/sane-backends/0002-sm3600.h-Fix-build-with-standard-C23.patch
@@ -0,0 +1,38 @@
+From 90815a9f2576c2428287a500cab6caeddb80f9a8 Mon Sep 17 00:00:00 2001
+From: Zdenek Dohnal <zdohnal@redhat.com>
+Date: Wed, 5 Feb 2025 13:19:11 +0100
+Subject: [PATCH] sm3600.h: Fix build with standard C23
+
+bool, true and false are keywords in the standard C23 - the sm3600
+backend defines them on its own, which is forbidden with the new
+standard.
+
+The patch adds ifdef guards for the affected typedef - the old code
+will be used for older standards, C23 will define TBool as bool.
+
+Upstream: https://gitlab.com/sane-project/backends/-/commit/90815a9f2576c2428287a500cab6caeddb80f9a8
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ backend/sm3600.h | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/backend/sm3600.h b/backend/sm3600.h
+index 2ecbeb236..5d8a8d809 100644
+--- a/backend/sm3600.h
++++ b/backend/sm3600.h
+@@ -77,7 +77,11 @@ Start: 2.4.2001
+ 
+ /* ====================================================================== */
+ 
++#if !defined(__STDC_VERSION__) || __STDC_VERSION__ < 202311L
+ typedef enum { false, true } TBool;
++#else
++typedef bool TBool;
++#endif /* GCC < 15 */
+ 
+ typedef SANE_Status TState;
+ 
+-- 
+GitLab
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
