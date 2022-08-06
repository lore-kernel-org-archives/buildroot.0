Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1107C19F2D
	for <buildroot@archiver.kernel.org>; Sat,  6 Aug 2022 15:53:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5433B408F9;
	Sat,  6 Aug 2022 15:53:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5433B408F9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tasGAM4GWI7m; Sat,  6 Aug 2022 15:53:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 11AC740359;
	Sat,  6 Aug 2022 15:53:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 11AC740359
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6BABC1BF5A8
 for <buildroot@lists.busybox.net>; Sat,  6 Aug 2022 15:53:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3FDCA404E5
 for <buildroot@lists.busybox.net>; Sat,  6 Aug 2022 15:53:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3FDCA404E5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7IqQbmx2KF1y for <buildroot@lists.busybox.net>;
 Sat,  6 Aug 2022 15:53:16 +0000 (UTC)
X-Greylist: delayed 00:07:02 by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F15B9400DB
Received: from smtpcmd0766.aruba.it (smtpcmd0766.aruba.it [62.149.156.66])
 by smtp2.osuosl.org (Postfix) with ESMTP id F15B9400DB
 for <buildroot@buildroot.org>; Sat,  6 Aug 2022 15:53:15 +0000 (UTC)
Received: from localhost.localdomain ([86.32.63.136])
 by Aruba Outgoing Smtp  with ESMTPSA
 id KM0AoCJboHDAJKM0BocLMH; Sat, 06 Aug 2022 17:46:11 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Sat,  6 Aug 2022 17:46:10 +0200
Message-Id: <20220806154610.4106492-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfAcSlv+S9VMrzrGYmQT+t4v/seJwX+MkOiJGHxJXn4HqgX7uJVSklMot/nYFOj/oXeKnqQR7+3TE84D3N3XrArCdcH5MclU7Dd8sFkfTdTA6KAVMkqp8
 0lasz0b0rFyoDC7eApmZY/xIgHul09h+p2u0f4h6XL1L+9slepFsrZ6SGTXpmH+Cl5eVfXgsi6Z7dbNRhi+Vl+MHQhK3CoeNC6D3OSufIJoZWqfDHyTWKbjb
 CViPAfryDVpSTaiPM0bQCsv1CQgj7AVaN8PSs/4KSkA=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1659800771; bh=JHKrtiEZQijo/GNUTrHwIGfMnFxYdB/0z3HSX9igtRo=;
 h=From:To:Subject:Date:MIME-Version;
 b=SRx0BjgzTkoXbzgzTOiXfqpBSLsgH5C+sop9ffwrme27uWLhKJqpVkklwbiSUYuM0
 aa/NRyLnwjZVKmE4ReNLWZfY5T4Wtd7+6vcqzuKyNVOR3FoLrHqGQZRH5OCQy6B6u7
 XOfQNLkbxyo+Fd3HU5i0ZpVq01g6PDD1+2ZL0kXuwTNVX1tqYe30+sHSNr7XTm/877
 ap1GGab4q6oYB3ATDPkS6vLX6n+ux3FmzBSntgztB6XL/EzmZ8/ZgPrDrSwnFoW67U
 /wHWVtqMC3kk4Mg4oY4ySvHE/HnR9K82HQ3lB5MC3DJW3MIIBmUqXM3E814BsnmVIB
 1Z66lpJf/AjNg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=SRx0Bjgz
Subject: [Buildroot] [PATCH] package/cryptsetup: fix host building trying to
 call asciidoctor
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

While bumping version I've fixed build failure due to missing host
asciidoctor by passing --disable-asciidoc to CRYPTSETUP_CONF_OPTS but that
is missing in HOST_CRYPTSETUP_CONF_OPTS and this leads the same build
failure of target building. So let's fix it by adding --disable-asciidoc
to host HOST_CRYPTSETUP_CONF_OPTS too.

Fixes:
http://autobuild.buildroot.net/results/0c1/0c1a6a8e59653afaa09303550f74475b4a3898bf/build-end.log

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/cryptsetup/cryptsetup.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/cryptsetup/cryptsetup.mk b/package/cryptsetup/cryptsetup.mk
index 01902c3f6a..4a52bb62dd 100644
--- a/package/cryptsetup/cryptsetup.mk
+++ b/package/cryptsetup/cryptsetup.mk
@@ -65,7 +65,8 @@ HOST_CRYPTSETUP_CONF_OPTS = --with-crypto_backend=openssl \
 	--disable-kernel_crypto \
 	--disable-ssh-token \
 	--enable-blkid \
-	--with-tmpfilesdir=no
+	--with-tmpfilesdir=no \
+	--disable-asciidoc
 
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
