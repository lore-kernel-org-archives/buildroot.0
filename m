Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FC02C54EE9
	for <buildroot@archiver.kernel.org>; Fri, 16 Sep 2022 11:48:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AE073842B6;
	Fri, 16 Sep 2022 11:47:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AE073842B6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PleYOI6kWbhC; Fri, 16 Sep 2022 11:47:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B7F51842B2;
	Fri, 16 Sep 2022 11:47:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B7F51842B2
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4FC781C2744
 for <buildroot@lists.busybox.net>; Fri, 16 Sep 2022 11:46:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 44FD241CA9
 for <buildroot@lists.busybox.net>; Fri, 16 Sep 2022 11:46:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 44FD241CA9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id K9NkizRZOPVY for <buildroot@lists.busybox.net>;
 Fri, 16 Sep 2022 11:46:45 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3C0624195E
 for <buildroot@buildroot.org>; Fri, 16 Sep 2022 11:46:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3C0624195E
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 285F783CC8; Fri, 16 Sep 2022 11:46:45 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 16 Sep 2022 12:16:35 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: fcf9525dd890db93a8050eccfa4bd6eafdc5dad3
X-Git-Newrev: 052c5337c72ef729499f4695f5bd96ef2ca22d9b
X-Patchwork-Hint: ignore
Message-Id: <20220916114645.285F783CC8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/c-capnproto: use
 space after depends on
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

commit: https://git.buildroot.net/buildroot/commit/?id=052c5337c72ef729499f4695f5bd96ef2ca22d9b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

This is the only use in the tree without the space.
Do like the other 2k+ uses in the tree and add the space:
-depends on!BR2_...
+depends on !BR2_...

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 25a3085712b28f25aa9e83b6d68f5b2d75c0b6b5)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/c-capnproto/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/c-capnproto/Config.in b/package/c-capnproto/Config.in
index 41a59d7a22..c472128c3f 100644
--- a/package/c-capnproto/Config.in
+++ b/package/c-capnproto/Config.in
@@ -18,7 +18,7 @@ config BR2_PACKAGE_C_CAPNPROTO
 
 comment "c-capnproto needs host and target gcc >= 5 w/ C++14, threads, atomic, ucontext and not gcc bug 64735"
 	depends on BR2_USE_MMU
-	depends on!BR2_HOST_GCC_AT_LEAST_5 || \
+	depends on !BR2_HOST_GCC_AT_LEAST_5 || \
 		!BR2_TOOLCHAIN_GCC_AT_LEAST_5 || \
 		!BR2_INSTALL_LIBSTDCPP || \
 		!BR2_TOOLCHAIN_HAS_THREADS || \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
