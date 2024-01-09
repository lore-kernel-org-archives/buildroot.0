Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B727C47073
	for <buildroot@archiver.kernel.org>; Tue,  9 Jan 2024 13:10:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D846C4085E;
	Tue,  9 Jan 2024 13:10:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D846C4085E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id azhEcdyDwD0B; Tue,  9 Jan 2024 13:10:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1C3FE41BB9;
	Tue,  9 Jan 2024 13:10:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1C3FE41BB9
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6BCD21BF30E
 for <buildroot@lists.busybox.net>; Tue,  9 Jan 2024 13:09:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 37D6A8128A
 for <buildroot@lists.busybox.net>; Tue,  9 Jan 2024 13:09:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 37D6A8128A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RCgIzLC1NrgD for <buildroot@lists.busybox.net>;
 Tue,  9 Jan 2024 13:09:18 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 21C2481755
 for <buildroot@buildroot.org>; Tue,  9 Jan 2024 13:09:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 21C2481755
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0E5AD84F5C; Tue,  9 Jan 2024 13:09:18 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 9 Jan 2024 13:51:21 +0100
X-Git-Refname: refs/heads/2023.11.x
X-Git-Oldrev: f72c3292dcfeb04813803af4859a8be489dbdee5
X-Git-Newrev: 5f24ed88e0f707714c82938eb6e684b319dca2d3
X-Patchwork-Hint: ignore
Message-Id: <20240109130918.0E5AD84F5C@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.11.x] .checkpackageignore: stop
 ignoring ShellCheck issues in google-breakpad
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

commit: https://git.buildroot.net/buildroot/commit/?id=5f24ed88e0f707714c82938eb6e684b319dca2d3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.11.x

The issues have been fixed by commit
f1089391a83aa63b6977e65970451365f10dc66a ("package/google-breakpad/gen-syms.sh:
fix shellcheck warnings")

Fixes:

  https://gitlab.com/buildroot.org/buildroot/-/jobs/5815132933

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 9212a719a5c3078048737d56596442e5ac7120a4)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .checkpackageignore | 1 -
 1 file changed, 1 deletion(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index c172750ba7..d7e9a2ee08 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -515,7 +515,6 @@ package/gob2/0001-dont-include-from-prefix.patch Upstream
 package/gobject-introspection/0001-disable-tests.patch Upstream
 package/gobject-introspection/0002-Add-rpath-links-to-ccompiler.patch Upstream
 package/gobject-introspection/0003-giscanner-ignore-error-return-codes-from-ldd-wrapper.patch Upstream
-package/google-breakpad/gen-syms.sh Shellcheck
 package/gpm/0001-Added-musl-support-to-libgpm-and-the-daemon.patch Upstream
 package/gpm/0002-Install-unversioned-solibrary.patch Upstream
 package/gpm/0003-src-Makefile.in-Really-install-unversioned-solibrary.patch Upstream
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
