Return-Path: <SRS0=Sygv=QE=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67F65C433EF
	for <buildroot@archiver.kernel.org>; Wed, 17 Nov 2021 22:40:37 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 310C361B5F
	for <buildroot@archiver.kernel.org>; Wed, 17 Nov 2021 22:40:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 310C361B5F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 05DE260625;
	Wed, 17 Nov 2021 22:40:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mnLTfFr-mH_P; Wed, 17 Nov 2021 22:40:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5B46C605EC;
	Wed, 17 Nov 2021 22:40:35 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id EF9ED1BF2FA
 for <buildroot@lists.busybox.net>; Wed, 17 Nov 2021 22:37:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DF0264011D
 for <buildroot@lists.busybox.net>; Wed, 17 Nov 2021 22:37:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CYVBlWpeUOQw for <buildroot@lists.busybox.net>;
 Wed, 17 Nov 2021 22:37:39 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0A3C5400D0
 for <buildroot@buildroot.org>; Wed, 17 Nov 2021 22:37:39 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id DF6738D6B2; Wed, 17 Nov 2021 22:33:24 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 17 Nov 2021 23:32:53 +0100
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: 2a824ae39d563822d736a377dcd397c03d031426
X-Git-Newrev: 4059ebe90205dc1dc74f0de9945ca5c69552f4f5
X-Patchwork-Hint: ignore
Message-Id: <20211117223324.DF6738D6B2@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] package/mksh: use plain
 HTTP in download and license links
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

commit: https://git.buildroot.net/buildroot/commit/?id=4059ebe90205dc1dc74f0de9945ca5c69552f4f5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

The server does not support TLS v1.2, causing dowloads to fall back to
sources.buildroot.net. Mail sent to the project owner bounces, so it
looks like this issue will not be solved anytime soon.

Switch to HTTP, like was done in commit 399ad854cc21 (package/mksh:
fix project URL in Config.in) for the homepage, and rely on our hashes
to verify the integrity and authenticity of the download.

Signed-off-by: Carlos Santos <unixmania@gmail.com>
[yann.morin.1998@free.fr: slight rewording in the commit message]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 0e83706aa1a02e9ba294796ba52f7bebee909ad7)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
