Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77048C77B75
	for <buildroot@archiver.kernel.org>; Mon,  8 May 2023 18:22:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 00C00844EB;
	Mon,  8 May 2023 18:22:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 00C00844EB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Su82X8ZfjgAd; Mon,  8 May 2023 18:22:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id AA15D84410;
	Mon,  8 May 2023 18:22:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AA15D84410
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 12C981BF342
 for <buildroot@lists.busybox.net>; Mon,  8 May 2023 18:22:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EDF946FF00
 for <buildroot@lists.busybox.net>; Mon,  8 May 2023 18:22:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EDF946FF00
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TvNpyWDnQ0UO for <buildroot@lists.busybox.net>;
 Mon,  8 May 2023 18:22:22 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 230D46153E
 for <buildroot@buildroot.org>; Mon,  8 May 2023 18:22:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 230D46153E
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0FE8C86107; Mon,  8 May 2023 18:22:22 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Mon, 8 May 2023 20:21:21 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d2f45dea4c4e3548c8938d69acb254c902bdd928
X-Git-Newrev: 3caf10cb0c384d189e800bc23b7d01b9c0c6a62c
X-Patchwork-Hint: ignore
Message-Id: <20230508182222.0FE8C86107@busybox.osuosl.org>
Subject: [Buildroot] [git commit] DEVELOPERS: remove entry for
 optee-benchmark
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

commit: https://git.buildroot.net/buildroot/commit/?id=3caf10cb0c384d189e800bc23b7d01b9c0c6a62c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

optee-benchmark package was removed in commit cf39b596e7
("package/optee-benchmark: remove deprecated package") but forgot to
remove the associated DEVELOPERS file entry.

Using the get-developers script on any file generates a warning,
for example:

    utils/get-developers DEVELOPERS
    WARNING: 'package/optee-benchmark/' doesn't match any file, line 865
    git send-email --to buildroot@buildroot.org

This commit fixes the issue by removing the entry.

Cc: Etienne Carriere <etienne.carriere@linaro.org>
Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 DEVELOPERS | 1 -
 1 file changed, 1 deletion(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index 5658dfa14b..efb2907d1b 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -862,7 +862,6 @@ F:	package/python-kiwisolver/
 
 N:	Etienne Carriere <etienne.carriere@linaro.org>
 F:	boot/optee-os/
-F:	package/optee-benchmark/
 F:	package/optee-client/
 F:	package/optee-examples/
 F:	package/optee-test/
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
