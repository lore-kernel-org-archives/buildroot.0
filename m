Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A177AC25B75
	for <buildroot@archiver.kernel.org>; Mon,  3 Jun 2024 09:21:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6DEED41467;
	Mon,  3 Jun 2024 09:21:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SEaxCBt-hSLa; Mon,  3 Jun 2024 09:21:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3908941471
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3908941471;
	Mon,  3 Jun 2024 09:21:01 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 09A331BF3EB
 for <buildroot@lists.busybox.net>; Mon,  3 Jun 2024 09:20:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3B93740670
 for <buildroot@lists.busybox.net>; Mon,  3 Jun 2024 09:19:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id td-0Q2O25Av0 for <buildroot@lists.busybox.net>;
 Mon,  3 Jun 2024 09:19:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8CF5E40683
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8CF5E40683
 for <buildroot@buildroot.org>; Mon,  3 Jun 2024 09:19:57 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8923087989; Mon,  3 Jun 2024 09:19:57 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Mon, 3 Jun 2024 11:11:23 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5438d7d8034387c79111c70fecbdee356f704854
X-Git-Newrev: d58b1dfa6d1f4de11cec35aeea11b1b05da7a184
X-Patchwork-Hint: ignore
Message-Id: <20240603091957.8923087989@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/nfacct: use https:// reference for
 .hash file
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

commit: https://git.buildroot.net/buildroot/commit/?id=d58b1dfa6d1f4de11cec35aeea11b1b05da7a184
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

ftp.netfilter.org no longer provides ftp, so use the https:// url from
_SITE.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/nfacct/nfacct.hash | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/nfacct/nfacct.hash b/package/nfacct/nfacct.hash
index aac5ce0ab8..4038ff86bc 100644
--- a/package/nfacct/nfacct.hash
+++ b/package/nfacct/nfacct.hash
@@ -1,4 +1,4 @@
-# From ftp://ftp.netfilter.org/pub/nfacct/nfacct-1.0.2.tar.bz2.{md5sum,sha1sum}
+# From https://www.netfilter.org/projects/nfacct/files/nfacct-1.0.2.tar.bz2.{md5sum,sha1sum}
 md5  94faafdaaed85ca9220c5692be8a408e  nfacct-1.0.2.tar.bz2
 sha1  17d6576778227ea93c62600d9b18ff4932963c6a  nfacct-1.0.2.tar.bz2
 # Locally computed
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
