Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84789C25B76
	for <buildroot@archiver.kernel.org>; Sat,  8 Jun 2024 19:16:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 57C6E84BEB;
	Sat,  8 Jun 2024 19:16:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id faT5HKgPnrVz; Sat,  8 Jun 2024 19:16:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0F5FE849CE
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0F5FE849CE;
	Sat,  8 Jun 2024 19:16:47 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 116BE1BF407
 for <buildroot@lists.busybox.net>; Sat,  8 Jun 2024 19:15:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 24FC441461
 for <buildroot@lists.busybox.net>; Sat,  8 Jun 2024 19:15:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id s-D4CjQ2DlMp for <buildroot@lists.busybox.net>;
 Sat,  8 Jun 2024 19:15:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0B40D4099C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0B40D4099C
 for <buildroot@buildroot.org>; Sat,  8 Jun 2024 19:15:01 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 055C7814F1; Sat,  8 Jun 2024 19:15:01 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 8 Jun 2024 20:07:31 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 8e95fe54dce40b41052afe611caae5fbaba5af37
X-Git-Newrev: 3779f0c5225fa6c1ff1ae0eabb8480334d8f8a51
X-Patchwork-Hint: ignore
Message-Id: <20240608191501.055C7814F1@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x]
 package/libnetfilter_acct: use https:// reference for .hash file
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

commit: https://git.buildroot.net/buildroot/commit/?id=3779f0c5225fa6c1ff1ae0eabb8480334d8f8a51
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

ftp.netfilter.org no longer provides ftp, so use the https:// url from
_SITE.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit af4038d0ce70534c31825068dee708c44c088b93)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libnetfilter_acct/libnetfilter_acct.hash | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libnetfilter_acct/libnetfilter_acct.hash b/package/libnetfilter_acct/libnetfilter_acct.hash
index a72d83fb28..da9e1a3264 100644
--- a/package/libnetfilter_acct/libnetfilter_acct.hash
+++ b/package/libnetfilter_acct/libnetfilter_acct.hash
@@ -1,4 +1,4 @@
-# From ftp://ftp.netfilter.org/pub/libnetfilter_acct/libnetfilter_acct-1.0.3.tar.bz2.{md5sum,sha1sum}
+# From https://www.netfilter.org/projects/libnetfilter_acct/files/libnetfilter_acct-1.0.3.tar.bz2.{md5sum,sha1sum}
 md5  814b2972b2f5c740ff87510bc109168b  libnetfilter_acct-1.0.3.tar.bz2
 sha1  4b9073e4aa989b0f000c8da1ab01b22fceed52b2  libnetfilter_acct-1.0.3.tar.bz2
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
