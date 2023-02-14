Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15A8FC61DA4
	for <buildroot@archiver.kernel.org>; Tue, 14 Feb 2023 17:09:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B713240B9D;
	Tue, 14 Feb 2023 17:09:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B713240B9D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JvpkHwvMXsLu; Tue, 14 Feb 2023 17:09:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8DE3440BB4;
	Tue, 14 Feb 2023 17:09:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8DE3440BB4
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3660B1BF4DB
 for <buildroot@lists.busybox.net>; Tue, 14 Feb 2023 17:08:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 10D3740BB2
 for <buildroot@lists.busybox.net>; Tue, 14 Feb 2023 17:08:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 10D3740BB2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vfP08im3jLTg for <buildroot@lists.busybox.net>;
 Tue, 14 Feb 2023 17:08:48 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4234940B6E
 for <buildroot@buildroot.org>; Tue, 14 Feb 2023 17:08:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4234940B6E
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 31BA785E19; Tue, 14 Feb 2023 17:08:48 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 14 Feb 2023 17:16:17 +0100
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: b712193b425d5bc36b621af43f4c667fdab62004
X-Git-Newrev: f7d8ba50f6ca38dceb7f57658d302317d81817b8
X-Patchwork-Hint: ignore
Message-Id: <20230214170848.31BA785E19@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/openvpn: get rid
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

commit: https://git.buildroot.net/buildroot/commit/?id=f7d8ba50f6ca38dceb7f57658d302317d81817b8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

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
