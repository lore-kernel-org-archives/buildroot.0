Return-Path: <SRS0=Sygv=QE=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA9E0C433F5
	for <buildroot@archiver.kernel.org>; Wed, 17 Nov 2021 15:42:45 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 80B7D613D3
	for <buildroot@archiver.kernel.org>; Wed, 17 Nov 2021 15:42:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 80B7D613D3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4BF53606C5;
	Wed, 17 Nov 2021 15:42:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dD1C7AfNYAmE; Wed, 17 Nov 2021 15:42:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 997E26068A;
	Wed, 17 Nov 2021 15:42:43 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B9ADA1BF36B
 for <buildroot@lists.busybox.net>; Wed, 17 Nov 2021 15:42:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B70106068A
 for <buildroot@lists.busybox.net>; Wed, 17 Nov 2021 15:42:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id i53f67-9LjqD for <buildroot@lists.busybox.net>;
 Wed, 17 Nov 2021 15:42:41 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 23B0A60679
 for <buildroot@buildroot.org>; Wed, 17 Nov 2021 15:42:41 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id A38368D4A8; Wed, 17 Nov 2021 15:38:27 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 17 Nov 2021 16:25:09 +0100
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: c48d1af3f5d48c825ce8425102bd21b9666b82fb
X-Git-Newrev: 13398092dfd8120e2f8f7985f52fa0e1dddddbbd
X-Patchwork-Hint: ignore
Message-Id: <20211117153827.A38368D4A8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] package/meson: disable
 meson wrap downloads
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

commit: https://git.buildroot.net/buildroot/commit/?id=13398092dfd8120e2f8f7985f52fa0e1dddddbbd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

We don't want to allow meson to download wrap dependencies as this
bypasses buildroot's dependency resolution.

This is badly documented in the meson manual, but there is at least
an FAQ that refers to it:

    https://mesonbuild.com/FAQ.html#does-wrap-download-sources-behind-my-back

    Meson has a option called wrap-mode which can be used to disable
    wrap downloads altogether with --wrap-mode=nodownload.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
[yann.morin.1998@free.fr: add pointer to FAQ]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 12ba3563655e3ebab252e52daa6c710864fa869f)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/meson/cross-compilation.conf.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/meson/cross-compilation.conf.in b/package/meson/cross-compilation.conf.in
index 37b49eea3b..7a7ece97ae 100644
--- a/package/meson/cross-compilation.conf.in
+++ b/package/meson/cross-compilation.conf.in
@@ -17,6 +17,7 @@ c_args = [@TARGET_CFLAGS@]
 c_link_args = [@TARGET_LDFLAGS@]
 cpp_args = [@TARGET_CXXFLAGS@]
 cpp_link_args = [@TARGET_LDFLAGS@]
+wrap_mode = 'nodownload'
 
 [properties]
 needs_exe_wrapper = true
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
