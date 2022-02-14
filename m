Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDD62C433F5
	for <buildroot@archiver.kernel.org>; Mon, 14 Feb 2022 16:57:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6C7B2827DD;
	Mon, 14 Feb 2022 16:57:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4DHEUPsEOJSV; Mon, 14 Feb 2022 16:57:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A4C3682974;
	Mon, 14 Feb 2022 16:57:09 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9F9E01BF383
 for <buildroot@lists.busybox.net>; Mon, 14 Feb 2022 16:57:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7DA9E414E6
 for <buildroot@lists.busybox.net>; Mon, 14 Feb 2022 16:57:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id R2t6JYw_ia8V for <buildroot@lists.busybox.net>;
 Mon, 14 Feb 2022 16:57:07 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id DCA55410A6
 for <buildroot@buildroot.org>; Mon, 14 Feb 2022 16:57:07 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 0C93A81E89; Mon, 14 Feb 2022 16:49:32 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Mon, 14 Feb 2022 17:45:16 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 38b5f2069bbe029c62594095a02f915552dc28c2
X-Git-Newrev: 61912cc89a0ee391fdb1d79203fbf027822fa97d
X-Patchwork-Hint: ignore
Message-Id: <20220214164932.0C93A81E89@busybox.osuosl.org>
Subject: [Buildroot] [git commit] utils/docker-run: use portable bash shebang
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

commit: https://git.buildroot.net/buildroot/commit/?id=61912cc89a0ee391fdb1d79203fbf027822fa97d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

/usr/bin/bash does not exist on Ubuntu 2018.04. Use the more portable
alternative "#!/usr/bin/env bash" which we are already using in quite
a few scripts.

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
Fixes: 242e9d72e7d2 ("utils/docker-run: new script")
[yann.morin.1998@free.fr: use "#!/usr/bin/env bash", not "@!/bin/bash"]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 utils/docker-run | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/utils/docker-run b/utils/docker-run
index 0614f1325d..35153199a1 100755
--- a/utils/docker-run
+++ b/utils/docker-run
@@ -1,4 +1,4 @@
-#!/usr/bin/bash
+#!/usr/bin/env bash
 set -o errexit -o pipefail
 DIR=$(dirname "${0}")
 MAIN_DIR=$(readlink -f "${DIR}/..")
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
