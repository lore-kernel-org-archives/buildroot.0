Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 629ECC3DA4A
	for <buildroot@archiver.kernel.org>; Fri,  2 Aug 2024 17:50:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2E77281177;
	Fri,  2 Aug 2024 17:50:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QR0ysavn9nla; Fri,  2 Aug 2024 17:50:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 346A381186
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 346A381186;
	Fri,  2 Aug 2024 17:50:36 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 784E51BF41C
 for <buildroot@lists.busybox.net>; Fri,  2 Aug 2024 17:50:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 646E481959
 for <buildroot@lists.busybox.net>; Fri,  2 Aug 2024 17:50:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0URTAHYhRGYk for <buildroot@lists.busybox.net>;
 Fri,  2 Aug 2024 17:50:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7F55881177
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7F55881177
 for <buildroot@buildroot.org>; Fri,  2 Aug 2024 17:50:33 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7630B83B69; Fri,  2 Aug 2024 17:50:33 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 2 Aug 2024 19:48:14 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9880dba15c25ff8d1ca59a255a538b8fb881962c
X-Git-Newrev: 668867bfed9a4decd7fd74d87d742368030b9399
X-Patchwork-Hint: ignore
Message-Id: <20240802175033.7630B83B69@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/bcusdk: fixup upstream tag in
 patch 0001
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=668867bfed9a4decd7fd74d87d742368030b9399
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The patch 0001 has been submitted upstream, but the formatting of the
tag was not correct, let's fix this.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .checkpackageignore                                                 | 1 -
 package/bcusdk/0001-fd_set-requires-inclusion-of-sys-select.h.patch | 3 +--
 2 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 9d2da90aa1..0f58f9a149 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -334,7 +334,6 @@ package/bc/0003-dc-fix-exit-code-of-q-command.patch lib_patch.Upstream
 package/bc/0004-no-gen-libmath.patch lib_patch.Upstream
 package/bcache-tools/0001-Don-t-inline-crc64-for-gcc-5-compatability.patch lib_patch.Upstream
 package/bctoolbox/0001-Fix-Libs.private-flags-for-mbedtls.patch lib_patch.Upstream
-package/bcusdk/0001-fd_set-requires-inclusion-of-sys-select.h.patch lib_patch.Upstream
 package/bcusdk/0002-eibd-fix-endless-recursion-when-using-USB-backends.patch lib_patch.Upstream
 package/bearssl/0001-Fix-missing-objdir-dependency.patch lib_patch.Upstream
 package/benejson/0001-c-std.patch lib_patch.Upstream
diff --git a/package/bcusdk/0001-fd_set-requires-inclusion-of-sys-select.h.patch b/package/bcusdk/0001-fd_set-requires-inclusion-of-sys-select.h.patch
index 723de5c1a2..f89658836f 100644
--- a/package/bcusdk/0001-fd_set-requires-inclusion-of-sys-select.h.patch
+++ b/package/bcusdk/0001-fd_set-requires-inclusion-of-sys-select.h.patch
@@ -7,8 +7,7 @@ According to POSIX.1-2001, the definition fd_set and related macros is
 in <sys/select.h>, so it should be included in files using fd_set to
 make the code compatible with all standard C libraries.
 
-Submitted upstream: https://sourceforge.net/p/bcusdk/patches/3/
-
+Upstream: https://sourceforge.net/p/bcusdk/patches/3/
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 ---
  eibd/examples/common.h | 1 +
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
