Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01BF6C25B76
	for <buildroot@archiver.kernel.org>; Mon,  3 Jun 2024 09:20:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A28B6406E3;
	Mon,  3 Jun 2024 09:20:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ccim9XdqxR7f; Mon,  3 Jun 2024 09:20:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 44FB9406AC
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 44FB9406AC;
	Mon,  3 Jun 2024 09:20:13 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 474A71BF863
 for <buildroot@lists.busybox.net>; Mon,  3 Jun 2024 09:19:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 261C5401AE
 for <buildroot@lists.busybox.net>; Mon,  3 Jun 2024 09:19:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GsWJWYi8Hzwc for <buildroot@lists.busybox.net>;
 Mon,  3 Jun 2024 09:19:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5D4D3401D5
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5D4D3401D5
 for <buildroot@buildroot.org>; Mon,  3 Jun 2024 09:19:57 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4C8078798C; Mon,  3 Jun 2024 09:19:57 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Mon, 3 Jun 2024 11:03:45 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9f615dc406e20b0d07394ab1a863826c0928f016
X-Git-Newrev: 07a44a24248cfee4b44296c2634ef8e218590d37
X-Patchwork-Hint: ignore
Message-Id: <20240603091957.4C8078798C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libnetfilter_log: use https://
 reference for .hash file
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

commit: https://git.buildroot.net/buildroot/commit/?id=07a44a24248cfee4b44296c2634ef8e218590d37
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

ftp.netfilter.org no longer provides ftp, so use the https:// url from
_SITE.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/libnetfilter_log/libnetfilter_log.hash | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libnetfilter_log/libnetfilter_log.hash b/package/libnetfilter_log/libnetfilter_log.hash
index 7589284f40..1e3cea0a80 100644
--- a/package/libnetfilter_log/libnetfilter_log.hash
+++ b/package/libnetfilter_log/libnetfilter_log.hash
@@ -1,4 +1,4 @@
-# From ftp://ftp.netfilter.org/pub/libnetfilter_log/libnetfilter_log-1.0.2.tar.bz2.sha256sum
+# From https://www.netfilter.org/projects/libnetfilter_log/files/libnetfilter_log-1.0.2.tar.bz2.sha256sum
 sha256  e3f408575614d849e4726b45e90c7ebb0e6744b04859555a9ce6ec40744ffeea  libnetfilter_log-1.0.2.tar.bz2
 
 # Hash for license file:
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
