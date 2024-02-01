Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24785C47DDB
	for <buildroot@archiver.kernel.org>; Thu,  1 Feb 2024 11:03:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C695F4044A;
	Thu,  1 Feb 2024 11:03:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C695F4044A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id J2qZHpTAse31; Thu,  1 Feb 2024 11:03:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id ACD8F404CF;
	Thu,  1 Feb 2024 11:03:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ACD8F404CF
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 19D921BF2AB
 for <buildroot@lists.busybox.net>; Thu,  1 Feb 2024 11:03:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E5BC181ABA
 for <buildroot@lists.busybox.net>; Thu,  1 Feb 2024 11:03:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E5BC181ABA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 24nL49o4wPSx for <buildroot@lists.busybox.net>;
 Thu,  1 Feb 2024 11:03:45 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 262F6818DC
 for <buildroot@buildroot.org>; Thu,  1 Feb 2024 11:03:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 262F6818DC
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 11E3F866FE; Thu,  1 Feb 2024 11:03:45 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 1 Feb 2024 12:00:58 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3ffb716da34a4c2c87fe47f6cce7b718d5217354
X-Git-Newrev: 0694cef47b4942447fa8532f55e11e5fcae48f2b
X-Patchwork-Hint: ignore
Message-Id: <20240201110345.11E3F866FE@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/cpio: fix tar.bz2 hash
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

commit: https://git.buildroot.net/buildroot/commit/?id=0694cef47b4942447fa8532f55e11e5fcae48f2b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit b0306d94b29d6f5e08735db0448019f9f4e4234b forgot to update
cpio-2.13.tar.bz2 to cpio-2.14.tar.bz2

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/cpio/cpio.hash | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/cpio/cpio.hash b/package/cpio/cpio.hash
index 20fd9392e7..c67fbc1f61 100644
--- a/package/cpio/cpio.hash
+++ b/package/cpio/cpio.hash
@@ -1,6 +1,6 @@
 # From https://lists.gnu.org/archive/html/info-gnu/2023-05/msg00001.html
 sha1  cbac50a61079b6f3bdcf9ffe42171d9257cfe877  cpio-2.14.tar.bz2
 # Locally calculated after checking pgp signature
-sha256  fcdc15d60f7267a6fc7efcd6b9db7b6c8966c4f2fbbb964c24d41336fd3f2c12  cpio-2.13.tar.bz2
+sha256  fcdc15d60f7267a6fc7efcd6b9db7b6c8966c4f2fbbb964c24d41336fd3f2c12  cpio-2.14.tar.bz2
 # Locally calculated
 sha256  fc82ca8b6fdb18d4e3e85cfd8ab58d1bcd3f1b29abe782895abd91d64763f8e7  COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
