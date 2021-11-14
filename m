Return-Path: <SRS0=+oVz=QB=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 071FCC433F5
	for <buildroot@archiver.kernel.org>; Sun, 14 Nov 2021 21:25:00 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5167161056
	for <buildroot@archiver.kernel.org>; Sun, 14 Nov 2021 21:24:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5167161056
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1307140001;
	Sun, 14 Nov 2021 21:24:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iCmd5dKdxCpU; Sun, 14 Nov 2021 21:24:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 22AEE400DD;
	Sun, 14 Nov 2021 21:24:57 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id AB31F1BF34D
 for <buildroot@lists.busybox.net>; Sun, 14 Nov 2021 21:24:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 957DF4011B
 for <buildroot@lists.busybox.net>; Sun, 14 Nov 2021 21:24:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eZra_ikzUVkF for <buildroot@lists.busybox.net>;
 Sun, 14 Nov 2021 21:24:54 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8BC9040001
 for <buildroot@buildroot.org>; Sun, 14 Nov 2021 21:24:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 650778D368; Sun, 14 Nov 2021 21:20:47 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 14 Nov 2021 22:23:03 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 146787b9bfcbd8b3b1f197384ee974a15d0d4390
X-Git-Newrev: 0e83706aa1a02e9ba294796ba52f7bebee909ad7
X-Patchwork-Hint: ignore
Message-Id: <20211114212047.650778D368@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mksh: use plain HTTP in download
 and license links
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

commit: https://git.buildroot.net/buildroot/commit/?id=0e83706aa1a02e9ba294796ba52f7bebee909ad7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The server does not support TLS v1.2, causing dowloads to fall back to
sources.buildroot.net. Mail sent to the project owner bounces, so it
looks like this issue will not be solved anytime soon.

Switch to HTTP, like was done in commit 399ad854cc21 (package/mksh:
fix project URL in Config.in) for the homepage, and rely on our hashes
to verify the integrity and authenticity of the download.

Signed-off-by: Carlos Santos <unixmania@gmail.com>
[yann.morin.1998@free.fr: slight rewording in the commit message]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/mksh/mksh.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/mksh/mksh.mk b/package/mksh/mksh.mk
index 386b1bd016..c4818e8692 100644
--- a/package/mksh/mksh.mk
+++ b/package/mksh/mksh.mk
@@ -6,8 +6,8 @@
 
 MKSH_VERSION = 59c
 MKSH_SOURCE = mksh-R$(MKSH_VERSION).tgz
-MKSH_SITE = https://www.mirbsd.org/MirOS/dist/mir/mksh
-# For MirOS License see https://www.mirbsd.org/TaC-mksh.txt
+MKSH_SITE = http://www.mirbsd.org/MirOS/dist/mir/mksh
+# For MirOS License see http://www.mirbsd.org/TaC-mksh.txt
 MKSH_LICENSE = MirOS, ISC
 MKSH_LICENSE_FILES = mksh.1
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
