Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 422F4EC873A
	for <buildroot@archiver.kernel.org>; Thu,  7 Sep 2023 15:31:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D138A8385D;
	Thu,  7 Sep 2023 15:31:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D138A8385D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qSDlz7iF3Pln; Thu,  7 Sep 2023 15:31:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 193CA83C88;
	Thu,  7 Sep 2023 15:31:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 193CA83C88
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 394C31BF313
 for <buildroot@lists.busybox.net>; Thu,  7 Sep 2023 14:53:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EB4CC41DF9
 for <buildroot@lists.busybox.net>; Thu,  7 Sep 2023 14:51:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EB4CC41DF9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yU0it1rZSP25 for <buildroot@lists.busybox.net>;
 Thu,  7 Sep 2023 14:51:37 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id C0EBE41D9D
 for <buildroot@buildroot.org>; Thu,  7 Sep 2023 14:51:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C0EBE41D9D
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A9CA4869E0; Thu,  7 Sep 2023 14:51:31 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 22 Aug 2023 20:06:56 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4b8fddb060fbc2b8d5e92b2065ec44de2f1ff3c2
X-Git-Newrev: 67ff42ac4a98e4c0cbcb60c8e6cf7652f3c84027
X-Patchwork-Hint: ignore
Message-Id: <20230907145131.A9CA4869E0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libassuan: remove stale hash
 comment
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=67ff42ac4a98e4c0cbcb60c8e6cf7652f3c84027
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit 0e19425c774fd ("package/libassuan: bump to version 2.5.6") moved
the sha256 hash below a link that provides the hash directly. The key
check comment now appears to refer to license hashes, which does not
make sense.

Remove the redundant key check comment.

Cc: Julien Olivain <ju.o@free.fr>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libassuan/libassuan.hash | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/package/libassuan/libassuan.hash b/package/libassuan/libassuan.hash
index 89e3fea956..084a09848c 100644
--- a/package/libassuan/libassuan.hash
+++ b/package/libassuan/libassuan.hash
@@ -1,8 +1,6 @@
 # From https://www.gnupg.org/download/integrity_check.html
 sha1  b1e8754dbf89b3a3eb175f5df75048dbca1fce57  libassuan-2.5.6.tar.bz2
 sha256  e9fd27218d5394904e4e39788f9b1742711c3e6b41689a31aa3380bd5aa4f426  libassuan-2.5.6.tar.bz2
-# Locally calculated after checking signature
-# https://www.gnupg.org/ftp/gcrypt/libassuan/libassuan-2.5.6.tar.bz2.sig
-# using key D8692123C4065DEA5E0F3AB5249B39D24F25E3B6
+# Locally calculated
 sha256  a9bdde5616ecdd1e980b44f360600ee8783b1f99b8cc83a2beb163a0a390e861  COPYING.LIB
 sha256  fc82ca8b6fdb18d4e3e85cfd8ab58d1bcd3f1b29abe782895abd91d64763f8e7  COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
