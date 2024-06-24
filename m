Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DAA8C2BD09
	for <buildroot@archiver.kernel.org>; Mon, 24 Jun 2024 20:02:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2BEFB608F4;
	Mon, 24 Jun 2024 20:02:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id d2KwGBwypdI8; Mon, 24 Jun 2024 20:02:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1D20560B3A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1D20560B3A;
	Mon, 24 Jun 2024 20:02:56 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1703E1BF473
 for <buildroot@lists.busybox.net>; Mon, 24 Jun 2024 20:02:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 64BD581EA0
 for <buildroot@lists.busybox.net>; Mon, 24 Jun 2024 20:02:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4F4NqVuACz5r for <buildroot@lists.busybox.net>;
 Mon, 24 Jun 2024 20:02:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8313881F1E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8313881F1E
 for <buildroot@buildroot.org>; Mon, 24 Jun 2024 20:02:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8059782B63; Mon, 24 Jun 2024 20:02:26 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 24 Jun 2024 21:54:39 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2d23a97a791e874bee86bc5dbcf9949aa467fc3c
X-Git-Newrev: db589f9df5587e37f1ba2c2654e8e693f88f4d74
X-Patchwork-Hint: ignore
Message-Id: <20240624200226.8059782B63@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/qemu: update the patches to be
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=db589f9df5587e37f1ba2c2654e8e693f88f4d74
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This commit allows the package patches to be applied with fuzz factor 0.
The fuzz factor specifies how many lines of the patch can be inexactly
matched, so the value 0 requires all lines to be exactly matched.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 ...01-tests-fp-meson-don-t-build-fp-bench-test-if-fenv.h-i.patch | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/qemu/0001-tests-fp-meson-don-t-build-fp-bench-test-if-fenv.h-i.patch b/package/qemu/0001-tests-fp-meson-don-t-build-fp-bench-test-if-fenv.h-i.patch
index b7e41d6f23..f9e523a627 100644
--- a/package/qemu/0001-tests-fp-meson-don-t-build-fp-bench-test-if-fenv.h-i.patch
+++ b/package/qemu/0001-tests-fp-meson-don-t-build-fp-bench-test-if-fenv.h-i.patch
@@ -1,4 +1,4 @@
-From b4a692f46135af1011bf0adbfeb19abf354ca191 Mon Sep 17 00:00:00 2001
+From d6fea3c321c7eb18e6dd151f5d4b0cc46b77bcc0 Mon Sep 17 00:00:00 2001
 From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
 Date: Tue, 30 Apr 2024 09:40:55 +0200
 Subject: [PATCH] tests/fp/meson: don't build fp-bench test if fenv.h is
@@ -14,18 +14,19 @@ find at the following link.
 Link: https://lists.nongnu.org/archive/html/qemu-devel/2021-03/msg00492.html
 Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
 Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
+[Dario: make the patch to be applied with fuzz factor 0]
 Upstream: https://patchwork.ozlabs.org/project/qemu-devel/patch/20240430164752.645521-1-dario.binacchi@amarulasolutions.com/
 ---
  tests/fp/meson.build | 14 ++++++++------
  1 file changed, 8 insertions(+), 6 deletions(-)
 
 diff --git a/tests/fp/meson.build b/tests/fp/meson.build
-index cbc17392d678..cd052667e940 100644
+index 114b4b483ea7..0e1237be54ed 100644
 --- a/tests/fp/meson.build
 +++ b/tests/fp/meson.build
 @@ -126,12 +126,14 @@ test('fp-test-mulAdd', fptest,
             ['f16_mulAdd', 'f32_mulAdd', 'f64_mulAdd', 'f128_mulAdd'],
-      suite: ['softfloat-slow', 'softfloat-ops-slow', 'slow'], timeout: 90)
+      suite: ['softfloat-slow', 'softfloat-ops-slow', 'slow'], timeout: 180)
  
 -executable(
 -  'fp-bench',
@@ -45,5 +46,5 @@ index cbc17392d678..cd052667e940 100644
  fptestlog2 = executable(
    'fp-test-log2',
 -- 
-2.43.0
+2.34.1
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
