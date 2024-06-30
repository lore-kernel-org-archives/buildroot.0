Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F308DC27C4F
	for <buildroot@archiver.kernel.org>; Sun, 30 Jun 2024 09:29:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B2CC8408DC;
	Sun, 30 Jun 2024 09:29:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sFHh54-p_KaF; Sun, 30 Jun 2024 09:29:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CE363408EC
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id CE363408EC;
	Sun, 30 Jun 2024 09:28:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E58631BF976
 for <buildroot@lists.busybox.net>; Sun, 30 Jun 2024 09:28:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CF65D40565
 for <buildroot@lists.busybox.net>; Sun, 30 Jun 2024 09:28:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id w5yx4JaZTv37 for <buildroot@lists.busybox.net>;
 Sun, 30 Jun 2024 09:28:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A1D9F40544
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id A1D9F40544
 for <buildroot@buildroot.org>; Sun, 30 Jun 2024 09:28:50 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 85B8E83621; Sun, 30 Jun 2024 09:28:50 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 30 Jun 2024 11:22:44 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d09597bbaeaff551d8968dd17f85f2f65ffa515e
X-Git-Newrev: b5080088ceda1e4873e5408e1961dec7b844a607
X-Patchwork-Hint: ignore
Message-Id: <20240630092850.85B8E83621@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libyuv: update patches to be
 applied with fuzz 0
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

commit: https://git.buildroot.net/buildroot/commit/?id=b5080088ceda1e4873e5408e1961dec7b844a607
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit 8f88a644ed "support/scripts/apply-patches.sh: set the maximum
fuzz factor to 0" reduced the fuzz factor.

Due to this change, libyuv fails to build with output:

    Applying 0001-i386-sse2.patch using patch:
    patching file include/libyuv/scale_row.h
    Hunk #1 FAILED at 33.
    1 out of 1 hunk FAILED -- saving rejects to file include/libyuv/scale_row.h.rej

Rebase the patch to fix the problem.

Fixes:
http://autobuild.buildroot.net/results/8ca446ee4bd657a661894dec66f45aa02b6a7325/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/libyuv/0001-i386-sse2.patch | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libyuv/0001-i386-sse2.patch b/package/libyuv/0001-i386-sse2.patch
index b8ecb34d0f..2380bbc973 100644
--- a/package/libyuv/0001-i386-sse2.patch
+++ b/package/libyuv/0001-i386-sse2.patch
@@ -5,7 +5,7 @@ Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
 diff -uNr libyuv-1411.org/include/libyuv/scale_row.h libyuv-1411/include/libyuv/scale_row.h
 --- libyuv-1411.org/include/libyuv/scale_row.h	2015-05-22 23:39:21.000000000 +0200
 +++ libyuv-1411/include/libyuv/scale_row.h	2015-05-25 12:35:17.000000000 +0200
-@@ -33,7 +33,7 @@
+@@ -55,7 +55,7 @@
  
  // The following are available on all x86 platforms:
  #if !defined(LIBYUV_DISABLE_X86) && \
@@ -13,4 +13,4 @@ diff -uNr libyuv-1411.org/include/libyuv/scale_row.h libyuv-1411/include/libyuv/
 +    (defined(_M_IX86) || defined(__x86_64__) || (defined(__i386__) && defined(__SSE2__)))
  #define HAS_FIXEDDIV1_X86
  #define HAS_FIXEDDIV_X86
- #define HAS_SCALEADDROWS_SSE2
+ #define HAS_SCALEADDROW_SSE2
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
