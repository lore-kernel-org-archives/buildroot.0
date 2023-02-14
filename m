Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FD1BC61DA4
	for <buildroot@archiver.kernel.org>; Tue, 14 Feb 2023 17:07:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id AB0A740B81;
	Tue, 14 Feb 2023 17:07:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AB0A740B81
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ik5Kq3h3_VAx; Tue, 14 Feb 2023 17:07:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E67C54056F;
	Tue, 14 Feb 2023 17:07:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E67C54056F
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0938F1BF4DB
 for <buildroot@lists.busybox.net>; Tue, 14 Feb 2023 17:07:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D7F6640B6D
 for <buildroot@lists.busybox.net>; Tue, 14 Feb 2023 17:07:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D7F6640B6D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id txXZW4Gc2LeJ for <buildroot@lists.busybox.net>;
 Tue, 14 Feb 2023 17:07:33 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 24AB44056F
 for <buildroot@buildroot.org>; Tue, 14 Feb 2023 17:07:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 24AB44056F
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1155185D7A; Tue, 14 Feb 2023 17:07:33 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 14 Feb 2023 17:16:28 +0100
X-Git-Refname: refs/heads/2022.11.x
X-Git-Oldrev: a512389e210629e93f09ab0094c0171aa4af8d7d
X-Git-Newrev: dd7ca9147a0afc04a6d0d9346141245878b39339
X-Patchwork-Hint: ignore
Message-Id: <20230214170733.1155185D7A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.11.x] package/openvpn: get rid
 of -e in S60openvpn shebang
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

commit: https://git.buildroot.net/buildroot/commit/?id=dd7ca9147a0afc04a6d0d9346141245878b39339
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.11.x

The -e switch makes the script terminate on error from
start-stop-daemon, rendering unreachable the code that checks the exit
status.

There is no need in the -e switch in the first place either, as the
script takes care of errors handling.

Signed-off-by: Sergey Organov <sorganov@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 28ca1da23433d58112304c191c319ac11edc5d77)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/openvpn/S60openvpn | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/openvpn/S60openvpn b/package/openvpn/S60openvpn
index f097cf11ec..00156c80db 100644
--- a/package/openvpn/S60openvpn
+++ b/package/openvpn/S60openvpn
@@ -1,4 +1,4 @@
-#!/bin/sh -e
+#!/bin/sh
 #
 # Original version by Robert Leslie
 # <rob@mars.org>, edited by iwj and cs
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
