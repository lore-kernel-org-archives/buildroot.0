Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4097C636D6
	for <buildroot@archiver.kernel.org>; Tue, 21 Feb 2023 02:01:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 53CE07010B;
	Tue, 21 Feb 2023 02:01:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 53CE07010B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6_x3EnhKBBTL; Tue, 21 Feb 2023 02:01:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 825D270135;
	Tue, 21 Feb 2023 02:01:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 825D270135
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1F4FD1BF2B1
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 21:06:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8ADE970041
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:53:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8ADE970041
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZaVJ_4ek52co for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:53:00 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id CC6FF7002B
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:53:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CC6FF7002B
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CAC2981979; Mon, 20 Feb 2023 20:53:00 +0000 (UTC)
From: Arnout Vandecappelle <arnout@mind.be>
To: buildroot@buildroot.org
Date: Wed, 15 Feb 2023 22:28:58 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 854314d15361dc3b69b97ee29d483ee920b9098f
X-Git-Newrev: c77e31e0b360fffbd893807ccfbc4f35bf2558d1
X-Patchwork-Hint: ignore
Message-Id: <20230220205300.CAC2981979@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] docs/manual: add 'menuconfig'
 to out-of-tree examples
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
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

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
