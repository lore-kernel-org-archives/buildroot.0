Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9361C433F5
	for <buildroot@archiver.kernel.org>; Tue, 25 Jan 2022 17:06:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8B8C940256;
	Tue, 25 Jan 2022 17:06:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YehCGiHDc8lN; Tue, 25 Jan 2022 17:06:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8B3E34029F;
	Tue, 25 Jan 2022 17:06:23 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id DF5941BF990
 for <buildroot@lists.busybox.net>; Tue, 25 Jan 2022 17:06:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CEB9E41526
 for <buildroot@lists.busybox.net>; Tue, 25 Jan 2022 17:06:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id V3uqqiKb9PYe for <buildroot@lists.busybox.net>;
 Tue, 25 Jan 2022 17:06:10 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1D51140262
 for <buildroot@buildroot.org>; Tue, 25 Jan 2022 17:06:10 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 4DA30827A0; Tue, 25 Jan 2022 16:59:19 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 25 Jan 2022 17:33:39 +0100
X-Git-Refname: refs/heads/2021.11.x
X-Git-Oldrev: 8021a9feca97e14f5143fc339930298ebf12de4c
X-Git-Newrev: a059006a1b8c2c8d4f1e04819031308a08e87898
X-Patchwork-Hint: ignore
Message-Id: <20220125165919.4DA30827A0@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.11.x] package/binutils: fix an
 OpenRISC binutils 2.37 patch
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

commit: https://git.buildroot.net/buildroot/commit/?id=a059006a1b8c2c8d4f1e04819031308a08e87898
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.11.x

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
(cherry picked from commit b032faa4019b60b34fd96df0a46ee7308e1fe074)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
