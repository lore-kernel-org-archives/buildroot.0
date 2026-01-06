Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9194AD0D14B
	for <buildroot@archiver.kernel.org>; Wed,  7 Jan 2026 18:03:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6766C416D2;
	Wed,  7 Jan 2026 18:03:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BQlh5Xdn30QF; Wed,  7 Jan 2026 18:03:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 789AC416E8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767809016;
	bh=OuB0gmseXSfBh2yBKEEKskxByQCv8f5MiueD81alqf0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=hVIk9P+gir3qyadmkviZsMAkc46LGeEQr4sI2iGOVMaLrYlkKR0Ns0/vAaz2nYqPY
	 60Stp7D2PN26fKxfROSNCyeMJTiObsiQOLZAYky3dnaeK2pgsQPYgXkv7Jl4w7uomT
	 uYgll2zZUWe7beRJM9HQ01Cbx6hPi+8OO16qqSmy2y4ZmyGVciSHB9UOPywnbL1SZM
	 tSVvFVbDWSzNtyRlxNvZvp3qHU3XUlTl9us749KqTTUDsO7Y7M2xHm5cYGAg0u2DLH
	 3EedjL/1e5gVKb9ATuRNOvt0r6K2uav20LZpC2ylu8mKYVcynJIORz8XUPqvazycKB
	 0aOev7pV87ARw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 789AC416E8;
	Wed,  7 Jan 2026 18:03:36 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 08A149ED
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 18:01:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5B7E280EF8
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 18:01:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4DUuV722dXRh for <buildroot@buildroot.org>;
 Wed,  7 Jan 2026 18:01:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6B1CF813ED
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6B1CF813ED
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 18:01:15 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6990E80333; Wed,  7 Jan 2026 18:01:15 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 6 Jan 2026 09:04:23 +0100
X-Git-Refname: refs/heads/2025.11.x
X-Git-Oldrev: 350261e5b9534271ac5a6f4803ac85714cf157cd
X-Git-Newrev: 7405e400234e9199dfa527fb3378d005273b95b7
X-Patchwork-Hint: ignore
Message-Id: <20260107180115.6990E80333@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.11.x] package/tinyxml: add CVE
 trailer in patch
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

commit: https://git.buildroot.net/buildroot/commit/?id=7405e400234e9199dfa527fb3378d005273b95b7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.11.x

Since Buildroot commit [1] the patches that fixes a security
vulnerability needs to reference the fixed vulnerability.

This patch adds the relevant information to the patch header
and adds the `Upstream` trailer.

[1] 1167d0ff3d docs/manual: mention CVE trailer

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 7b8c58ae03f87e047c14585b16de19c66b8344c8)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 .checkpackageignore                                                   | 1 -
 .../tinyxml/0001-In-stamp-always-advance-the-pointer-if-p-0xef.patch  | 4 ++--
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 704f916ea0..870d7b0c49 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -1028,7 +1028,6 @@ package/ti-utils/0001-plt.h-fix-build-with-gcc-10.patch lib_patch.Upstream
 package/tinyalsa/0001-include-time.h-before-asound.h.patch lib_patch.Upstream
 package/tinycompress/0001-wave-add-time.h-missing-header-inclusion.patch lib_patch.Upstream
 package/tinydtls/0001-sha2-sha2.c-fix-build-on-big-endian.patch lib_patch.Upstream
-package/tinyxml/0001-In-stamp-always-advance-the-pointer-if-p-0xef.patch lib_patch.Upstream
 package/transmission/S92transmission Shellcheck lib_sysv.ConsecutiveEmptyLines lib_sysv.Indent lib_sysv.Variables
 package/triggerhappy/S10triggerhappy Shellcheck lib_sysv.Indent lib_sysv.Variables
 package/trousers/0001-Check-if-the-compiler-understands-pie-and-relro-options.patch lib_patch.Upstream
diff --git a/package/tinyxml/0001-In-stamp-always-advance-the-pointer-if-p-0xef.patch b/package/tinyxml/0001-In-stamp-always-advance-the-pointer-if-p-0xef.patch
index ea0f6476c8..1da613c205 100644
--- a/package/tinyxml/0001-In-stamp-always-advance-the-pointer-if-p-0xef.patch
+++ b/package/tinyxml/0001-In-stamp-always-advance-the-pointer-if-p-0xef.patch
@@ -8,8 +8,8 @@ by two non-zero bytes. In case of malformed input (0xef should be
 the start byte of a three byte character) this leads to an infinite
 loop. (CVE-2021-42260)
 
-[Retrieved (and backported) from:
-https://sourceforge.net/p/tinyxml/git/merge-requests/1]
+CVE: CVE-2021-42260
+Upstream: https://sourceforge.net/p/tinyxml/git/merge-requests/1
 Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 ---
  tinyxmlparser.cpp | 6 ++++++
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
