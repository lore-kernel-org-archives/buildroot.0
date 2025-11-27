Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64175CFD2F6
	for <buildroot@archiver.kernel.org>; Thu, 27 Nov 2025 20:28:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 903B660B3C;
	Thu, 27 Nov 2025 20:28:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BCzCTloA3dVR; Thu, 27 Nov 2025 20:28:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CA35660D74
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id CA35660D74;
	Thu, 27 Nov 2025 20:28:15 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 4D9EA967
 for <buildroot@buildroot.org>; Thu, 27 Nov 2025 20:28:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3471E40581
 for <buildroot@buildroot.org>; Thu, 27 Nov 2025 20:28:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id s9SQGSk8YRAo for <buildroot@buildroot.org>;
 Thu, 27 Nov 2025 20:28:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 480C44057E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 480C44057E
 for <buildroot@buildroot.org>; Thu, 27 Nov 2025 20:28:13 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2932186006; Thu, 27 Nov 2025 20:28:13 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 27 Nov 2025 21:22:11 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c0abf446307bb9b495d296b8845177dff5824b2b
X-Git-Newrev: 6ed4181759b23450ccc803ad228ab2ca291147e0
X-Patchwork-Hint: ignore
Message-Id: <20251127202813.2932186006@busybox.osuosl.org>
Subject: [Buildroot] [git commit] {linux,
 linux-headers}: fix hash for kernel 6.6.117
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=6ed4181759b23450ccc803ad228ab2ca291147e0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Buildroot commit 59479ae646767f22914335301dcec6fbeb313755 added a wrong
hash for kernel 6.6.117.

Fixes:
https://autobuild.buildroot.org/results/5aa65e053b827e4d5c21d4cc06f439f1dd093053/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 linux/linux.hash | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/linux/linux.hash b/linux/linux.hash
index 943b3dc9f4..a01162c3b5 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,7 +1,7 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
 sha256  6d08803b953c509df48d44d3281ed392524321d8bb353eb21c0555790c8f8e06  linux-6.17.9.tar.xz
 sha256  a1d2cd7327f10eec022615c1bb12c06439bd110d2020164be97f698f43ca58be  linux-6.12.59.tar.xz
-sha256  a8fbffe691974a3bf6a21d34eefad71a64c2a1fcc4513218356f1a87e390788b  linux-6.1.117.tar.xz
+sha256  643b31079222fdbda70cfdd0b68c514f05a3926104be4762a4685f62818b43d1  linux-6.6.117.tar.xz
 sha256  ad068bfdb604ec0f4f7de385c8e7ab944008aa78a4aeeca94f53206e6726bfda  linux-6.1.158.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
 sha256  83157953598b026fb721c906c60dfdfd8e986f25ecb9910f3504f690e2770e05  linux-5.15.196.tar.xz
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
