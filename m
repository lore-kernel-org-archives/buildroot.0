Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E08D7C6FD1F
	for <buildroot@archiver.kernel.org>; Tue,  2 Apr 2024 20:10:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9E649406D8;
	Tue,  2 Apr 2024 20:10:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GiM1CZz2-7pZ; Tue,  2 Apr 2024 20:10:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 612AA40873
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 612AA40873;
	Tue,  2 Apr 2024 20:10:44 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 14BE91BF30C
 for <buildroot@lists.busybox.net>; Tue,  2 Apr 2024 20:10:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0233640648
 for <buildroot@lists.busybox.net>; Tue,  2 Apr 2024 20:10:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oXS4kANdBfjo for <buildroot@lists.busybox.net>;
 Tue,  2 Apr 2024 20:10:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 25CB7400C1
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 25CB7400C1
 for <buildroot@buildroot.org>; Tue,  2 Apr 2024 20:10:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1D1DB8456C; Tue,  2 Apr 2024 20:10:42 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 2 Apr 2024 22:09:27 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4ee858808d132fe7d290abbdad7d1f38b47e8b6f
X-Git-Newrev: 13607926f1e24a0df34eccf0a9caed1ef78267ef
X-Patchwork-Hint: ignore
Message-Id: <20240402201042.1D1DB8456C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] .checkpackageignore: regenerate for lvm2
 patches
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

commit: https://git.buildroot.net/buildroot/commit/?id=13607926f1e24a0df34eccf0a9caed1ef78267ef
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit 4cbac9f70609e676887ad242c65e02b3cf827176 removed 2 lvm2 patches
and renamed the two remaining ones, but forgot to update
.checkpackageignore. Do so now.

Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 .checkpackageignore | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 449e94fd39..1b336ce7a3 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -769,10 +769,8 @@ package/luasyslog/0001-remove-AX_LUA_LIBS.patch lib_patch.Upstream
 package/luasyslog/0002-build-ax_lua.m4-fix-cross-compilation.patch lib_patch.Upstream
 package/lugaru/0001-ImageIO-fix-invalid-conversion.patch lib_patch.Upstream
 package/lugaru/0002-Fix-mismatched-usage-length-build-fail-on-g.patch lib_patch.Upstream
-package/lvm2/0001-clang-possible-better-compilation-with-musl-c.patch lib_patch.Upstream
-package/lvm2/0002-mm-preallocate-memory-only-with-glibc.patch lib_patch.Upstream
-package/lvm2/0003-cmdline-use-freopen-to-reopen-standard-streams.patch lib_patch.Upstream
-package/lvm2/0004-log-use-freopen-to-reopen-standard-streams.patch lib_patch.Upstream
+package/lvm2/0001-cmdline-use-freopen-to-reopen-standard-streams.patch lib_patch.Upstream
+package/lvm2/0002-log-use-freopen-to-reopen-standard-streams.patch lib_patch.Upstream
 package/lz4/0001-build-Support-BUILD_SHARED-no.patch lib_patch.Upstream
 package/lzma/0001-Remove-static-from-LDFLAGS.patch lib_patch.Upstream
 package/lzop/0001-allow-overriding-modification-time.patch lib_patch.Upstream
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
