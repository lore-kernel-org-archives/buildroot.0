Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AAE7F483EC
	for <buildroot@archiver.kernel.org>; Mon, 23 Mar 2026 19:47:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0DA3F6086B;
	Mon, 23 Mar 2026 19:47:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AwUjYEh08EJw; Mon, 23 Mar 2026 19:47:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 491E660889
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774295264;
	bh=KGtE0S/6l81pL5TKC2nTTIX17Xije46ayjSx3pEUkcs=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=i+re/lATAuMxkJWcvCENOuwWw/p/ueh7Tahe8Q7sbuoHrzlK0PF60qo3L0V23FwJH
	 a/INbaXTJQ8XMedk/da/iUvuDY9jzSX1N7eHHVDLl9G5YITyDX5Eh1N9MydCRR4U5l
	 MSFta8kxgpDMqxE/SygLCcVpVb5ywhwf91uln/tY2j43xuE9bbUAMR+YCv2MWNQ6h8
	 sYOLibivmF17LCzGdx4m75MTgSze9K08411AmRUPXN+lJsIcs4DDcnjHJq7fkVo0hJ
	 rUyMISIFdJ/BtKAQLBlERTD0oH+Z+QR+Hv8gcRuXZAoR/fflxXAtKIMaGwI5tUdJ3C
	 kxaTQNLBVz8Og==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 491E660889;
	Mon, 23 Mar 2026 19:47:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0F699356
 for <buildroot@buildroot.org>; Mon, 23 Mar 2026 19:47:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4826B40C00
 for <buildroot@buildroot.org>; Mon, 23 Mar 2026 19:47:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Yf8j7eLtxHv9 for <buildroot@buildroot.org>;
 Mon, 23 Mar 2026 19:47:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C0D7140BEE
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id C0D7140BEE
 for <buildroot@buildroot.org>; Mon, 23 Mar 2026 19:47:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0BADB840A8; Mon, 23 Mar 2026 19:47:29 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 19 Mar 2026 11:56:22 +0100
X-Git-Refname: refs/heads/2026.02.x
X-Git-Oldrev: e5f300a8719a6ed4e73e234bf94a4fa5621f04c5
X-Git-Newrev: d31d4f2b69031f5d035bdf4edac81892b22baba9
X-Patchwork-Hint: ignore
Message-Id: <20260323194729.0BADB840A8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.02.x]
 board/versal2/post-image.sh: remove incorrect $BINARIES_DIR
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/d31d4f2b69031f5d035bdf4edac81892b22baba9
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.02.x

Remove incorrect $BINARIES_DIR reference from the symbolic link creation to
make a relative path and not an absolute path.

Signed-off-by: Neal Frager <neal.frager@amd.com>
Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
(cherry picked from commit 1d603b78c05e132076ef9db1cf0cb3d16fd065ac)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 board/versal2/post-image.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/board/versal2/post-image.sh b/board/versal2/post-image.sh
index 17746271e1..af50909fb1 100755
--- a/board/versal2/post-image.sh
+++ b/board/versal2/post-image.sh
@@ -3,7 +3,7 @@
 # By default U-Boot loads DTB from a file named "system.dtb", and
 # with versal2, the Linux DTB is the same as the U-Boot DTB, so
 # let's use a symlink since the DTB is the same.
-ln -fs "${BINARIES_DIR}/u-boot.dtb" "${BINARIES_DIR}/system.dtb"
+ln -fs "u-boot.dtb" "${BINARIES_DIR}/system.dtb"
 
 BOARD_DIR="$(dirname "$0")"
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
