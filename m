Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 444A5C636D3
	for <buildroot@archiver.kernel.org>; Sat,  4 Feb 2023 14:36:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id AA17340523;
	Sat,  4 Feb 2023 14:36:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AA17340523
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nTkHfJuZd5Ur; Sat,  4 Feb 2023 14:36:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id ED17B4049F;
	Sat,  4 Feb 2023 14:36:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ED17B4049F
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 307B91BF425
 for <buildroot@lists.busybox.net>; Sat,  4 Feb 2023 14:36:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 18ABD4049F
 for <buildroot@lists.busybox.net>; Sat,  4 Feb 2023 14:36:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 18ABD4049F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id c_PSXbKnwwZt for <buildroot@lists.busybox.net>;
 Sat,  4 Feb 2023 14:36:33 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8F0F840283
 for <buildroot@buildroot.org>; Sat,  4 Feb 2023 14:36:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8F0F840283
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 76B5E83483; Sat,  4 Feb 2023 14:36:33 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 4 Feb 2023 15:30:48 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 13de1138f89909890e945b6e433e64ebbaab01ff
X-Git-Newrev: 28ca1da23433d58112304c191c319ac11edc5d77
X-Patchwork-Hint: ignore
Message-Id: <20230204143633.76B5E83483@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/openvpn: get rid of -e in
 S60openvpn shebang
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

commit: https://git.buildroot.net/buildroot/commit/?id=28ca1da23433d58112304c191c319ac11edc5d77
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The -e switch makes the script terminate on error from
start-stop-daemon, rendering unreachable the code that checks the exit
status.

There is no need in the -e switch in the first place either, as the
script takes care of errors handling.

Signed-off-by: Sergey Organov <sorganov@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
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
