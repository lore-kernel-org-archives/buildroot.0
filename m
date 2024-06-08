Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F04D9C25B76
	for <buildroot@archiver.kernel.org>; Sat,  8 Jun 2024 19:16:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C71528479E;
	Sat,  8 Jun 2024 19:16:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id l0KaB6ouYJIT; Sat,  8 Jun 2024 19:16:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7787E84C07
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7787E84C07;
	Sat,  8 Jun 2024 19:16:50 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 588B11BF407
 for <buildroot@lists.busybox.net>; Sat,  8 Jun 2024 19:15:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8176640376
 for <buildroot@lists.busybox.net>; Sat,  8 Jun 2024 19:15:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dlW9B8JVzt9i for <buildroot@lists.busybox.net>;
 Sat,  8 Jun 2024 19:15:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9786D403B8
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9786D403B8
 for <buildroot@buildroot.org>; Sat,  8 Jun 2024 19:15:01 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 925AE8614C; Sat,  8 Jun 2024 19:15:01 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 8 Jun 2024 20:08:43 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 38a28aff85ff0fbbd42c212fe90132adff577843
X-Git-Newrev: f9af06dcffeee322b6dc41f5aced788cc4de8286
X-Patchwork-Hint: ignore
Message-Id: <20240608191501.925AE8614C@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/nfacct: use
 https:// reference for .hash file
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

commit: https://git.buildroot.net/buildroot/commit/?id=f9af06dcffeee322b6dc41f5aced788cc4de8286
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

ftp.netfilter.org no longer provides ftp, so use the https:// url from
_SITE.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit d58b1dfa6d1f4de11cec35aeea11b1b05da7a184)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
