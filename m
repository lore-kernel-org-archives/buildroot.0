Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BCB6C636D6
	for <buildroot@archiver.kernel.org>; Tue, 21 Feb 2023 00:31:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2199542D0E;
	Tue, 21 Feb 2023 00:31:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2199542D0E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GDgUQlLiLLu7; Tue, 21 Feb 2023 00:31:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0B0424F0DA;
	Tue, 21 Feb 2023 00:31:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0B0424F0DA
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7842A1BF27E
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 21:00:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4B698417E6
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4B698417E6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hBIAdJBEfFmQ for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:52:53 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6154E417C3
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:52:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6154E417C3
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5B606828C8; Mon, 20 Feb 2023 20:52:53 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 7 Feb 2023 18:10:35 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: cf92dcfaa92f6564830d10d4e18ae00fd8102ab2
X-Git-Newrev: 17481bd0bf6abff260ccc579974b813050f91d4e
X-Patchwork-Hint: ignore
Message-Id: <20230220205253.5B606828C8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/uclibc: pass
 $(TARGET_DEBUGGING) flags
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

commit: https://git.buildroot.net/buildroot/commit/?id=17481bd0bf6abff260ccc579974b813050f91d4e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

In order to have debugging symbols in uClibc, let's pass
$(TARGET_DEBUGGING) in UCLIBC_EXTRA_CFLAGS.

Signed-off-by: Ben Wolsieffer <Ben.Wolsieffer@hefring.com>
[Thomas: extracted from
https://patchwork.ozlabs.org/project/buildroot/patch/20220803200629.3172370-1-Ben.Wolsieffer@hefring.com/
and split into its own independent patch.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/uclibc/uclibc.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/uclibc/uclibc.mk b/package/uclibc/uclibc.mk
index d2baffc95e..342d841087 100644
--- a/package/uclibc/uclibc.mk
+++ b/package/uclibc/uclibc.mk
@@ -375,7 +375,7 @@ endif
 # Commands
 #
 
-UCLIBC_EXTRA_CFLAGS = $(TARGET_ABI)
+UCLIBC_EXTRA_CFLAGS = $(TARGET_ABI) $(TARGET_DEBUGGING)
 
 # uClibc-ng does not build with LTO, so explicitly disable it
 # when using a compiler that may have support for LTO
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
