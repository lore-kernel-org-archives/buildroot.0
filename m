Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58D92C433EF
	for <buildroot@archiver.kernel.org>; Mon, 27 Dec 2021 19:14:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E421360A8B;
	Mon, 27 Dec 2021 19:14:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wTgg_OYQhhkw; Mon, 27 Dec 2021 19:14:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3831460A80;
	Mon, 27 Dec 2021 19:14:12 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 28C361BF386
 for <buildroot@lists.busybox.net>; Mon, 27 Dec 2021 19:14:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 243B34016D
 for <buildroot@lists.busybox.net>; Mon, 27 Dec 2021 19:14:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fOdL9VVvoFWt for <buildroot@lists.busybox.net>;
 Mon, 27 Dec 2021 19:14:10 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2AC1E40131
 for <buildroot@buildroot.org>; Mon, 27 Dec 2021 19:14:10 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 72F5782B7B; Mon, 27 Dec 2021 19:08:24 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Mon, 27 Dec 2021 20:13:52 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5ba36c687b5980848e3a7209d7c4ad26713a9c9e
X-Git-Newrev: b032faa4019b60b34fd96df0a46ee7308e1fe074
X-Patchwork-Hint: ignore
Message-Id: <20211227190824.72F5782B7B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/binutils: fix an OpenRISC binutils
 2.37 patch
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

commit: https://git.buildroot.net/buildroot/commit/?id=b032faa4019b60b34fd96df0a46ee7308e1fe074
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When binutils 2.37 was introduced in commit
62f0232980c8168631b29f27edf612af8109c691 ("package/binutils: add
version 2.37"), the patch
0008-or1k-fix-pc-relative-relocation-against-dynamic-on-P.patch was
not properly updated. Indeed, between binutils 2.36 and 2.37, binutils
has switched to using the standard "bool" type, so instead of using
TRUE/FALSE, true/false must be used.

With this change, the binutils patch matches the one that was merged
upstream.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Reviewed-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 .../0004-or1k-fix-pc-relative-relocation-against-dynamic-on-P.patch     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/binutils/2.37/0004-or1k-fix-pc-relative-relocation-against-dynamic-on-P.patch b/package/binutils/2.37/0004-or1k-fix-pc-relative-relocation-against-dynamic-on-P.patch
index 779baeab63..0d18321ee1 100644
--- a/package/binutils/2.37/0004-or1k-fix-pc-relative-relocation-against-dynamic-on-P.patch
+++ b/package/binutils/2.37/0004-or1k-fix-pc-relative-relocation-against-dynamic-on-P.patch
@@ -46,7 +46,7 @@ index 32063ab0289..67252394173 100644
 +	      _bfd_error_handler
 +		(_("%pB: pc-relative relocation against dynamic symbol %s"),
 +		 input_bfd, name);
-+	      ret_val = FALSE;
++	      ret_val = false;
 +	      bfd_set_error (bfd_error_bad_value);
 +	    }
 +	  break;
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
