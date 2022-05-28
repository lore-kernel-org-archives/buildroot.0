Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7D29C433F5
	for <buildroot@archiver.kernel.org>; Sat, 28 May 2022 19:27:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 59CD960A83;
	Sat, 28 May 2022 19:27:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nLZgt_Q07Ngm; Sat, 28 May 2022 19:27:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 78CA2610DA;
	Sat, 28 May 2022 19:27:43 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id F21711BF867
 for <buildroot@lists.busybox.net>; Sat, 28 May 2022 19:27:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E07AB40B68
 for <buildroot@lists.busybox.net>; Sat, 28 May 2022 19:27:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6dTBuPLdfBjM for <buildroot@lists.busybox.net>;
 Sat, 28 May 2022 19:27:42 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 392E940111
 for <buildroot@buildroot.org>; Sat, 28 May 2022 19:27:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id F200485DB4; Sat, 28 May 2022 19:16:12 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 28 May 2022 14:46:13 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 1dab7eb8d7996f73d2c7636d499a390cd2fbe67e
X-Git-Newrev: dd1942f46a641307c0d6bd69262c7b71c6d9a658
X-Patchwork-Hint: ignore
Message-Id: <20220528191612.F200485DB4@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/rust: add
 host-pkgconf dependency
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

commit: https://git.buildroot.net/buildroot/commit/?id=dd1942f46a641307c0d6bd69262c7b71c6d9a658
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Add host-pkgconf dependency to fix the following build failure raised
since commit 4e3be3ae9d4c9f1b0c035eee0c923a724f9a9316:

  run pkg_config fail: "Failed to run `\"/nvmedata/autobuild/instance-6/output-1/per-package/host-rust/host/bin/pkg-config\" \"--libs\" \"--cflags\" \"openssl\"`: No such file or directory (os error 2)"

Fixes:
 - http://autobuild.buildroot.org/results/b046523960079cbf85931b8f67c3b98dd07fbbda

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit 5cd13ec7654e1f34f5b4063ed0d5b15f5697bd66)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/rust/rust.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/rust/rust.mk b/package/rust/rust.mk
index cd8c87b68d..cbd4786f06 100644
--- a/package/rust/rust.mk
+++ b/package/rust/rust.mk
@@ -14,6 +14,7 @@ HOST_RUST_PROVIDES = host-rustc
 
 HOST_RUST_DEPENDENCIES = \
 	toolchain \
+	host-pkgconf \
 	host-python3 \
 	host-rust-bin \
 	host-openssl \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
