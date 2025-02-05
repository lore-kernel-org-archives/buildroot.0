Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79987C02192
	for <buildroot@archiver.kernel.org>; Wed,  5 Feb 2025 08:47:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2CA7C83267;
	Wed,  5 Feb 2025 08:47:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QcIJzeKW3PJH; Wed,  5 Feb 2025 08:47:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 42AB983148
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 42AB983148;
	Wed,  5 Feb 2025 08:47:11 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 877E0CD
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 08:47:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6911282C38
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 08:47:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id u3hg8-QCYzvE for <buildroot@buildroot.org>;
 Wed,  5 Feb 2025 08:47:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9762380E9E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9762380E9E
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 08:47:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 83BB186F39; Wed,  5 Feb 2025 08:47:08 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Wed, 5 Feb 2025 09:46:51 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8ba6459ac1413afa72124bc6387a4f3ac4306914
X-Git-Newrev: b233e712073296cabfb088f02e46b4d3a4cdd436
X-Patchwork-Hint: ignore
Message-Id: <20250205084708.83BB186F39@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/glibc: fix legal-info after bump
 to 2.41
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

commit: https://git.buildroot.net/buildroot/commit/?id=b233e712073296cabfb088f02e46b4d3a4cdd436
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit 6ecab31fad12a494ec0d2a3767c736a55c80a769 bumped glibc to
version 2.41, but forgot to update the associated legal information.

Indeed, the LICENSES file has changed upstream, with a few commits
between 2.40 and 2.41:

- 2843e78b30da0aa743fdfb0ac61435c925182c04

  Adds another MIT license. We already list MIT in the licenses

- d421d36582281a62e05f96a1bfb085db9d85f40b

  Adds URL of a project included in glibc. No license change.

- 4871ab841b3bfbabdba62cc86dd6b8db84f5c134

  Drops Intel License Agreement due to IA64 removal, which was in fact
  BSD-3-Clause, but there's still BSD-3-Clause code in glibc, and this
  license is therefore still listed in GLIBC_LICENSE as it should be

- 1ed3e4468879b79492dfd453255b9318b3265843

  Updates some file locations. No license change.

- aba14403c606fdba6726f76442272d5011c52900

  Updates CORE-MATH copyright. No license change.

Fixes:

  http://autobuild.buildroot.net/results/74fb3ade56140cf8c0496f1d087f0b33ee6b6ff3/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/glibc/glibc.hash | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/glibc/glibc.hash b/package/glibc/glibc.hash
index f6d3ce6f2b..61af3d9488 100644
--- a/package/glibc/glibc.hash
+++ b/package/glibc/glibc.hash
@@ -4,4 +4,4 @@ sha256  ed2cd1f058f22f682e700c5be408975db62025a14863a5a6700ee93d5927504e  glibc-
 # Hashes for license files
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LIB
-sha256  bba29819a3e938fae92674d6a88533e10605e389da8b51cdcba0a94f6221c5bc  LICENSES
+sha256  b22a69aa3f80a5201818c66cb0df0f25f9fa13cf5861b0093a058dbd12d50dce  LICENSES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
