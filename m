Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C00BACE8D6B
	for <buildroot@archiver.kernel.org>; Mon, 17 Nov 2025 19:51:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 95AE64116C;
	Mon, 17 Nov 2025 19:51:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cGhAyrMbsv3j; Mon, 17 Nov 2025 19:51:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 572B14133D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 572B14133D;
	Mon, 17 Nov 2025 19:51:48 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 95A70158
 for <buildroot@buildroot.org>; Mon, 17 Nov 2025 19:51:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D3EF4408A4
 for <buildroot@buildroot.org>; Mon, 17 Nov 2025 19:51:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ay2v_RrOKWsN for <buildroot@buildroot.org>;
 Mon, 17 Nov 2025 19:51:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E5D7E408C6
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id E5D7E408C6
 for <buildroot@buildroot.org>; Mon, 17 Nov 2025 19:51:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E2CE8848E6; Mon, 17 Nov 2025 19:51:26 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 5 Nov 2025 17:07:53 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: f1ef6df574a87a45ab461d79f65d653e9294b544
X-Git-Newrev: 467ef7001323d8893048d32e6af9d89a12e59295
X-Patchwork-Hint: ignore
Message-Id: <20251117195126.E2CE8848E6@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/webkitgtk:
 disable internal ccache configuration
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

commit: https://git.buildroot.net/buildroot/commit/?id=467ef7001323d8893048d32e6af9d89a12e59295
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

WebKit's auto-configured ccache results in 100% cache misses.
Disable WebKit's internal ccache setup [1] since Buildroot
already manages the ccache in toolchain/toolchain-wrapper.c.

[1] https://github.com/WebKit/WebKit/blob/webkitgtk-2.50.1/Source/cmake/WebKitCCache.cmake

Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>
Acked-by: Adrian Perez de Castro <aperez@igalia.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 37d270262585709225a865c7a9ad6d7cd9008f39)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/webkitgtk/webkitgtk.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/webkitgtk/webkitgtk.mk b/package/webkitgtk/webkitgtk.mk
index cb66641e3d..80854c0d7b 100644
--- a/package/webkitgtk/webkitgtk.mk
+++ b/package/webkitgtk/webkitgtk.mk
@@ -19,6 +19,10 @@ WEBKITGTK_DEPENDENCIES = host-ruby host-python3 host-gperf host-unifdef \
 
 WEBKITGTK_CMAKE_BACKEND = ninja
 
+# Buildroot adds support for ccache through its
+# toolchain-wrapper, so tell webkitgtk not to mess with it.
+WEBKITGTK_CONF_ENV = WK_USE_CCACHE=NO
+
 WEBKITGTK_CONF_OPTS = \
 	-DENABLE_API_TESTS=OFF \
 	-DENABLE_DOCUMENTATION=OFF \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
