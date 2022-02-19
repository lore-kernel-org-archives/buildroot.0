Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C87AFC433F5
	for <buildroot@archiver.kernel.org>; Sat, 19 Feb 2022 21:22:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3640E408F5;
	Sat, 19 Feb 2022 21:22:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vCKg5k0On0ck; Sat, 19 Feb 2022 21:22:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7559A408F0;
	Sat, 19 Feb 2022 21:22:18 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 15CEB1BF2F7
 for <buildroot@lists.busybox.net>; Sat, 19 Feb 2022 21:22:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 03C7E408F3
 for <buildroot@lists.busybox.net>; Sat, 19 Feb 2022 21:22:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9sJ8owfKfYGL for <buildroot@lists.busybox.net>;
 Sat, 19 Feb 2022 21:22:16 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd0642.aruba.it (smtpcmd0642.aruba.it [62.149.156.42])
 by smtp4.osuosl.org (Postfix) with ESMTP id D3648408EF
 for <buildroot@buildroot.org>; Sat, 19 Feb 2022 21:22:15 +0000 (UTC)
Received: from localhost.localdomain ([146.241.188.82])
 by Aruba Outgoing Smtp  with ESMTPSA
 id LXBGn7h8rX0z7LXBGnbgQF; Sat, 19 Feb 2022 22:22:14 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1645305734; bh=xaRmVC+fsw8hkAgKoLP43rp+biFlQ+KQuos60FkEWJc=;
 h=From:To:Subject:Date:MIME-Version;
 b=g6XlyT86PJkXOretUpfTDC2lenKlMB6Qna3exM9VoVYr2AAdM/8YylouI/59H9WF/
 iBQghTJ9rp+o/HeBMbQQ9232mMSW/gggLIYw3dNhkqmfY7DbJlr+bc7WhdAAnhjMGp
 ANCLoDBdtn9MRFWnC83hYzekT6EjaEZUALqtP/+cv9wzY1i839TrRulp8MIKS2mzyz
 C0hCSDmdDCnP7bm9qGSmWHbN/LZwL1HfWqNU6CcpzXbWdj3t/mqP7Hqap4n5WGAQia
 IgMR9ZuU+dpsorVMCGEgZA0U4bcygnGrPsmiwE986ttceJESkWwWU0svcF2vNpARLj
 um3DK/CI8gOFg==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Sat, 19 Feb 2022 22:22:11 +0100
Message-Id: <20220219212211.1304441-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfDad2hySlrAzIjcUDDjIsStLRmXOsxj1Yw1t+2p0AIOOu/xGdEfimJq7gbWA5D7DPst4xVmF5slTvQ9rKu2fWzVaaoVDb7L4ZWAyXX9SBrUd/Z6f95VU
 OJRJ5oDqIEgcvaFn0tCUAv4vv6eMKM7LSplv3P+ewbOc1QaPo80gD+dgyRtbRrHAnWGueGAbVlaR5+DpzIZM9F9yx60ngruwJ+l7/OeyVGbg9du0CHERaFcc
 Lsgao8eofJVZOllsZa5ibtLKGYzvMd4Ukbnd0T2RvE6bEqyVFpd1tJLekJNxOfDq+vLDjnCSXh1pPbjF1ncYW8codN8z61BjB7B9oLv+TyA6UCbxbmw6u9C8
 fCh1GAzt
Subject: [Buildroot] [PATCH v2] manual: board support: add instructions to
 test defconfig in the official docker
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
Cc: Luca Ceresoli <luca@lucaceresoli.net>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Sometimes new boards have not been tested with official docker so let's add
instructions to do it with utils/docker-run.

Cc: Luca Ceresoli <luca@lucaceresoli.net>
Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
V1->V2:
* use the available utils/docker-run
* improve explanation as suggested by Luca Ceresoli
---
 docs/manual/adding-board-support.txt | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/docs/manual/adding-board-support.txt b/docs/manual/adding-board-support.txt
index 33ed709535..074bab7a00 100644
--- a/docs/manual/adding-board-support.txt
+++ b/docs/manual/adding-board-support.txt
@@ -46,3 +46,11 @@ create a directory +board/<manufacturer>+ and a subdirectory
 +board/<manufacturer>/<boardname>+. You can then store your patches
 and configurations in these directories, and reference them from the main
 Buildroot configuration. Refer to xref:customize[] for more details.
+
+Before submitting patches for new boards it is recommended to test it by
+building it using latest gitlab-CI docker container. To do this use
+utils/docker-run script and inside it hint:
+--------------------
+ $ make +<boardname>_defconfig+
+ $ make
+--------------------
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
