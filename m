Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 736A6E784BE
	for <buildroot@archiver.kernel.org>; Sun, 28 Dec 2025 22:25:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2DAC681353;
	Sun, 28 Dec 2025 22:25:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id u9EoXDpKJQOb; Sun, 28 Dec 2025 22:25:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5269381396
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766960744;
	bh=cHl1X8nsNAZe7EC/akFP2WGMlnJWwowzKCABZoD+9aI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=eK7lw02/DK9m0GEe9Tgw0c9NkalqNbHgTNitRiX32HGjNCWFGcbPnzs4zSZTu7OPY
	 Bk/67mrmEiwrnpk/ka0pRueXKtB6SqQBLInvmhzC+pYcJgMH6bgb9g/3mfyYlEdaHs
	 as4rv7D9vwJj1cXTbB5Qf2YbbAZZN94GOUD45f+pfSw1/W74xd2AeViQ7H+GkkSqFT
	 h9bNUTEksKxri8cSgabGQOgeyWFxdbOz/af4oNgCWtyjcniCgiSvy0F+bWy/ooiR+a
	 qOjKDlsIPGt0BUoYJBYeBalq0NaSBNL+RdAYi1wiVgo+WSOWje5YOK0nIXBC6TGANZ
	 GG6NTKiztEx6Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5269381396;
	Sun, 28 Dec 2025 22:25:44 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 6CB9AB9
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 22:25:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 533C981396
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 22:25:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6gHn5duZ4Umc for <buildroot@buildroot.org>;
 Sun, 28 Dec 2025 22:25:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6B28281353
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6B28281353
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 22:25:41 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 49A0887A23; Sun, 28 Dec 2025 22:25:41 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 28 Dec 2025 23:21:28 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 43e254a646a2780e8e76171ba9318e5f5dc36fb2
X-Git-Newrev: 443307ef50e0a5b14b095178b7c8d59ad3639ab4
X-Patchwork-Hint: ignore
Message-Id: <20251228222541.49A0887A23@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/kvmtool: remove unneeded
 KVMTOOL_EXTRA_LDFLAGS
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=443307ef50e0a5b14b095178b7c8d59ad3639ab4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Buildroot commit [1] "kvmtool: bump to f77d646ba0" removed the
definition of KVMTOOL_EXTRA_LDFLAGS but forgot to remove its usage
in KVMTOOL_MAKE_OPTS.

This commit removes it since it is no longer needed.

[1] https://gitlab.com/buildroot.org/buildroot/-/commit/f20615b53e83d6263346cb038d59df8e8d6b2b74

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/kvmtool/kvmtool.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/kvmtool/kvmtool.mk b/package/kvmtool/kvmtool.mk
index f5637e5384..58ca2d3642 100644
--- a/package/kvmtool/kvmtool.mk
+++ b/package/kvmtool/kvmtool.mk
@@ -22,7 +22,7 @@ KVMTOOL_CPE_ID_VALID = YES
 # Disable -Werror, otherwise musl is not happy
 KVMTOOL_MAKE_OPTS = \
 	CROSS_COMPILE="$(TARGET_CROSS)" \
-	LDFLAGS="$(TARGET_LDFLAGS) $(KVMTOOL_EXTRA_LDFLAGS)" \
+	LDFLAGS="$(TARGET_LDFLAGS)" \
 	WERROR=0
 
 define KVMTOOL_BUILD_CMDS
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
