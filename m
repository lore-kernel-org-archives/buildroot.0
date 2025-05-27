Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00E21C5B543
	for <buildroot@archiver.kernel.org>; Wed,  4 Jun 2025 18:28:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C3DF440CBD;
	Wed,  4 Jun 2025 18:28:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DwFXfKHfMvsd; Wed,  4 Jun 2025 18:28:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1135140C7A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1135140C7A;
	Wed,  4 Jun 2025 18:28:47 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 4E1EE1A6
 for <buildroot@buildroot.org>; Wed,  4 Jun 2025 18:28:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9A009401AD
 for <buildroot@buildroot.org>; Wed,  4 Jun 2025 18:28:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sYHj8lMKY45N for <buildroot@buildroot.org>;
 Wed,  4 Jun 2025 18:28:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ED45E403A8
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id ED45E403A8
 for <buildroot@buildroot.org>; Wed,  4 Jun 2025 18:27:58 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EB7C7876DC; Wed,  4 Jun 2025 18:27:58 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 27 May 2025 18:50:47 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: c4fcbe1a85ee96936b5079a936c0810bf12fbaba
X-Git-Newrev: 0a0600590fd732ba5e6484d55c90499549503e95
X-Patchwork-Hint: ignore
Message-Id: <20250604182758.EB7C7876DC@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/execline: remove
 -D_GNU_SOURCE
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
Content-Type: multipart/mixed; boundary="===============8099745187736836216=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8099745187736836216==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=0a0600590fd732ba5e6484d55c90499549503e95
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

execline is written against POSIX C and automatically sets
-D_POSIX_C_SOURCE=200809L and -D_XOPEN_SOURCE=700. uclibc had a bug
consistent with the error reported in the commit that added
-D_GNU_SOURCE[1], but it has since been fixed[2].

[1]: see commit 106e43e303 ("package/execline: fix uclibc build")
[2]: https://cgit.uclibc-ng.org/cgi/cgit/uclibc-ng.git/commit/?id=354129807db12c792696b74d0cd38f2c5d2fd704

Signed-off-by: J. Neuschäfer <j.neuschaefer@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 3a43be7df48148774e1a3f6623d2b4d7eb282197)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/execline/execline.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/execline/execline.mk b/package/execline/execline.mk
index 922fc7b5af..fccc20b77a 100644
--- a/package/execline/execline.mk
+++ b/package/execline/execline.mk
@@ -12,7 +12,6 @@ EXECLINE_INSTALL_STAGING = YES
 EXECLINE_DEPENDENCIES = skalibs
 
 EXECLINE_CONF_OPTS = \
-	CFLAGS="$(TARGET_CFLAGS) -D_GNU_SOURCE" \
 	--prefix=/ \
 	--with-sysdeps=$(STAGING_DIR)/lib/skalibs/sysdeps \
 	--with-include=$(STAGING_DIR)/include \

--===============8099745187736836216==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8099745187736836216==--
