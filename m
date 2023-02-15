Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4818C636CC
	for <buildroot@archiver.kernel.org>; Wed, 15 Feb 2023 21:32:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 201EB4177E;
	Wed, 15 Feb 2023 21:32:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 201EB4177E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CyAyo_WbA83w; Wed, 15 Feb 2023 21:32:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E7E394175F;
	Wed, 15 Feb 2023 21:32:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E7E394175F
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 35A031BF3A0
 for <buildroot@lists.busybox.net>; Wed, 15 Feb 2023 21:32:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0FCFA40C39
 for <buildroot@lists.busybox.net>; Wed, 15 Feb 2023 21:32:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0FCFA40C39
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VWgX7SEGH0CL for <buildroot@lists.busybox.net>;
 Wed, 15 Feb 2023 21:32:12 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id E1F73400CC
 for <buildroot@buildroot.org>; Wed, 15 Feb 2023 21:32:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E1F73400CC
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C420185EA0; Wed, 15 Feb 2023 21:32:11 +0000 (UTC)
From: Arnout Vandecappelle <arnout@mind.be>
To: buildroot@buildroot.org
Date: Wed, 15 Feb 2023 22:28:58 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 854314d15361dc3b69b97ee29d483ee920b9098f
X-Git-Newrev: c77e31e0b360fffbd893807ccfbc4f35bf2558d1
X-Patchwork-Hint: ignore
Message-Id: <20230215213211.C420185EA0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] docs/manual: add 'menuconfig' to
 out-of-tree examples
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

commit: https://git.buildroot.net/buildroot/commit/?id=c77e31e0b360fffbd893807ccfbc4f35bf2558d1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

If the examples given for launching an out-of-tree build are executed
as-is, this will result in the error message

    Please configure Buildroot first (e.g. "make menuconfig")

Even if "make menuconfig" was run before, it's still not going to work
because the out-of-tree build doesn't use the in-tree .config.

Therefore, the example really should start with some config option.
Since "make menuconfig" is used in most other examples of creating a
config, use that here as well. Extend both examples with "menuconfig".

Reported-by: AndreiCherniaev <dungeonlords789@yandex.ru>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 docs/manual/common-usage.txt | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/docs/manual/common-usage.txt b/docs/manual/common-usage.txt
index 9abd3799dd..bc78f4a871 100644
--- a/docs/manual/common-usage.txt
+++ b/docs/manual/common-usage.txt
@@ -30,13 +30,13 @@ the Linux kernel. To use it, add +O=<directory>+ to the make command
 line:
 
 --------------------
- $ make O=/tmp/build
+ $ make O=/tmp/build menuconfig
 --------------------
 
 Or:
 
 --------------------
- $ cd /tmp/build; make O=$PWD -C path/to/buildroot
+ $ cd /tmp/build; make O=$PWD -C path/to/buildroot menuconfig
 --------------------
 
 All the output files will be located under +/tmp/build+. If the +O+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
