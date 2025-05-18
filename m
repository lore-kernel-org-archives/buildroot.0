Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAB57C3ABC9
	for <buildroot@archiver.kernel.org>; Sun, 18 May 2025 14:00:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4327781E8E;
	Sun, 18 May 2025 14:00:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4xZFSaEVvhpg; Sun, 18 May 2025 14:00:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6E05881E88
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6E05881E88;
	Sun, 18 May 2025 14:00:52 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 622FD1BA
 for <buildroot@buildroot.org>; Sun, 18 May 2025 14:00:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4808840873
 for <buildroot@buildroot.org>; Sun, 18 May 2025 14:00:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IgLtxh05r7zG for <buildroot@buildroot.org>;
 Sun, 18 May 2025 14:00:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6C08740855
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6C08740855
 for <buildroot@buildroot.org>; Sun, 18 May 2025 14:00:50 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 67CB187128; Sun, 18 May 2025 14:00:50 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 18 May 2025 16:00:33 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a0a39842e609cc01915b93d7954e3992a2287359
X-Git-Newrev: 3a43be7df48148774e1a3f6623d2b4d7eb282197
X-Patchwork-Hint: ignore
Message-Id: <20250518140050.67CB187128@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/execline: remove -D_GNU_SOURCE
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============4609190371288567649=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4609190371288567649==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=3a43be7df48148774e1a3f6623d2b4d7eb282197
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

execline is written against POSIX C and automatically sets
-D_POSIX_C_SOURCE=200809L and -D_XOPEN_SOURCE=700. uclibc had a bug
consistent with the error reported in the commit that added
-D_GNU_SOURCE[1], but it has since been fixed[2].

[1]: see commit 106e43e303 ("package/execline: fix uclibc build")
[2]: https://cgit.uclibc-ng.org/cgi/cgit/uclibc-ng.git/commit/?id=354129807db12c792696b74d0cd38f2c5d2fd704

Signed-off-by: J. Neuschäfer <j.neuschaefer@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/execline/execline.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/execline/execline.mk b/package/execline/execline.mk
index 4d9b668819..9f602cf60a 100644
--- a/package/execline/execline.mk
+++ b/package/execline/execline.mk
@@ -12,7 +12,6 @@ EXECLINE_INSTALL_STAGING = YES
 EXECLINE_DEPENDENCIES = skalibs
 
 EXECLINE_CONF_OPTS = \
-	CFLAGS="$(TARGET_CFLAGS) -D_GNU_SOURCE" \
 	--with-sysdeps=$(STAGING_DIR)/usr/lib/skalibs/sysdeps \
 	--with-include=$(STAGING_DIR)/include \
 	--with-dynlib=$(STAGING_DIR)/lib \

--===============4609190371288567649==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4609190371288567649==--
