Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D12F5C64EC4
	for <buildroot@archiver.kernel.org>; Sat,  4 Mar 2023 13:03:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 71E2260655;
	Sat,  4 Mar 2023 13:03:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 71E2260655
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VQRAtBDL3JWL; Sat,  4 Mar 2023 13:03:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6340E605EA;
	Sat,  4 Mar 2023 13:03:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6340E605EA
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 286A11BF239
 for <buildroot@lists.busybox.net>; Sat,  4 Mar 2023 13:03:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 00858404B4
 for <buildroot@lists.busybox.net>; Sat,  4 Mar 2023 13:03:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 00858404B4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id U_Ybw4rLsl_x for <buildroot@lists.busybox.net>;
 Sat,  4 Mar 2023 13:03:53 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id D9BF34049A
 for <buildroot@buildroot.org>; Sat,  4 Mar 2023 13:03:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D9BF34049A
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C57EC860FE; Sat,  4 Mar 2023 13:03:53 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 4 Mar 2023 13:57:24 +0100
X-Git-Refname: refs/heads/2022.11.x
X-Git-Oldrev: 1a0906f3cb570a52da3b538a475d95e9fdbf09d4
X-Git-Newrev: 4d7b942fce6024af6e61c82e1cca19e65145c558
X-Patchwork-Hint: ignore
Message-Id: <20230304130353.C57EC860FE@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.11.x] docs/manual: add
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

commit: https://git.buildroot.net/buildroot/commit/?id=4d7b942fce6024af6e61c82e1cca19e65145c558
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.11.x

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
