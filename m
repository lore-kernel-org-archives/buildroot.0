Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FB6BC35FFA
	for <buildroot@archiver.kernel.org>; Wed, 19 Mar 2025 22:45:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B2B9860625;
	Wed, 19 Mar 2025 22:45:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UO4fSo98JtOp; Wed, 19 Mar 2025 22:45:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B250461008
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B250461008;
	Wed, 19 Mar 2025 22:45:11 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id C75CF16E
 for <buildroot@buildroot.org>; Wed, 19 Mar 2025 22:45:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C0C9882AF8
 for <buildroot@buildroot.org>; Wed, 19 Mar 2025 22:45:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id q9Whfs_tDHUr for <buildroot@buildroot.org>;
 Wed, 19 Mar 2025 22:45:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C759D82AED
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id C759D82AED
 for <buildroot@buildroot.org>; Wed, 19 Mar 2025 22:45:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id AFE8B881AD; Wed, 19 Mar 2025 22:45:08 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Wed, 19 Mar 2025 23:44:10 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f786d9d3b81977fa2c6483ed7bfca1950f0117c9
X-Git-Newrev: c9958ed8fb0686ac69b636e7f57cf9b20979cc59
X-Patchwork-Hint: ignore
Message-Id: <20250319224508.AFE8B881AD@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mpd: fix Config.in symbol typo
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=c9958ed8fb0686ac69b636e7f57cf9b20979cc59
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit [1] introduced a typo in the Config.in symbol
BR2_HOST_GCC_AT_LEAST_10. This generates check-symbol failures
such as [2].

This commit fixes the issue by fixing the typo.

[1] https://gitlab.com/buildroot.org/buildroot/-/commit/25af5a3b3aa3480ee10158e55c280d675430442a
[2] https://gitlab.com/buildroot.org/buildroot/-/jobs/9464458162

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/mpd/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/mpd/Config.in b/package/mpd/Config.in
index 6bf745b30b..7ce0d8b7eb 100644
--- a/package/mpd/Config.in
+++ b/package/mpd/Config.in
@@ -439,5 +439,5 @@ comment "mpd needs a toolchain w/ C++, threads, wchar, host-gcc 10, gcc 12, head
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || \
 		!BR2_TOOLCHAIN_HAS_THREADS || \
 		!BR2_TOOLCHAIN_GCC_AT_LEAST_12 || \
-		!BR2_THOST_GCC_AT_LEAST_10 || \
+		!BR2_HOST_GCC_AT_LEAST_10 || \
 		!BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_6
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
