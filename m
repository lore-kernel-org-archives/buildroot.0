Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7E05C678DB
	for <buildroot@archiver.kernel.org>; Sat,  4 Mar 2023 13:05:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5EEC560757;
	Sat,  4 Mar 2023 13:05:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5EEC560757
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id edjNvoF0AJ5W; Sat,  4 Mar 2023 13:05:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 52F3F60692;
	Sat,  4 Mar 2023 13:05:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 52F3F60692
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 478921BF3E3
 for <buildroot@lists.busybox.net>; Sat,  4 Mar 2023 13:05:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 219B041635
 for <buildroot@lists.busybox.net>; Sat,  4 Mar 2023 13:05:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 219B041635
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XtK0klzm-fx6 for <buildroot@lists.busybox.net>;
 Sat,  4 Mar 2023 13:05:01 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2372B41634
 for <buildroot@buildroot.org>; Sat,  4 Mar 2023 13:05:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2372B41634
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1052586106; Sat,  4 Mar 2023 13:05:01 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 4 Mar 2023 13:57:35 +0100
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 500cc1f46f048febd6fe3dd2c3a5e61f9926dbec
X-Git-Newrev: 58d46a4373806d6193f256b589d22f85dd45c18a
X-Patchwork-Hint: ignore
Message-Id: <20230304130501.1052586106@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] docs/manual: add
 'menuconfig' to out-of-tree examples
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

commit: https://git.buildroot.net/buildroot/commit/?id=58d46a4373806d6193f256b589d22f85dd45c18a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

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
(cherry picked from commit c77e31e0b360fffbd893807ccfbc4f35bf2558d1)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 docs/manual/common-usage.txt | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/docs/manual/common-usage.txt b/docs/manual/common-usage.txt
index 9ba87a8339..b60b6d7f53 100644
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
