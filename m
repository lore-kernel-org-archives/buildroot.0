Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2286C5475B
	for <buildroot@archiver.kernel.org>; Fri,  1 Mar 2024 19:00:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BB8868277E;
	Fri,  1 Mar 2024 19:00:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ky5NCy2GMrBt; Fri,  1 Mar 2024 19:00:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5D14E821B9
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5D14E821B9;
	Fri,  1 Mar 2024 19:00:16 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0FFC21BF354
 for <buildroot@lists.busybox.net>; Fri,  1 Mar 2024 19:00:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E616741E0B
 for <buildroot@lists.busybox.net>; Fri,  1 Mar 2024 19:00:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8LJEcdlY-qpb for <buildroot@lists.busybox.net>;
 Fri,  1 Mar 2024 19:00:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 290B741E0F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 290B741E0F
 for <buildroot@buildroot.org>; Fri,  1 Mar 2024 19:00:12 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 13B1587F51; Fri,  1 Mar 2024 19:00:12 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 1 Mar 2024 19:55:17 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: dee6974d729da81f80d310df262436a6136164a0
X-Git-Newrev: 31f4bf275da4ba349eed0fe2581ba8bdeae59daa
X-Patchwork-Hint: ignore
Message-Id: <20240301190012.13B1587F51@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/newlib-bare-metal: fix legal-info
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

commit: https://git.buildroot.net/buildroot/commit/?id=31f4bf275da4ba349eed0fe2581ba8bdeae59daa
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Hash of COPYING.NEWLIB is wrong since the addition of the package in
commit 3b95ff658bf4859eb5cffd28cbbedd1826fad9a6:

ERROR: COPYING.NEWLIB has wrong sha256 hash:
ERROR: expected: 422aa40293093fb54fc66e692a0d68fd0b24ed5602e5d1d33ad05ba3909057e9
ERROR: got     : 9a59b4ee3af067045fe0ea78786201c42d54756fe48cbccf44f3dfc398474717

Fixes: 3b95ff658bf4859eb5cffd28cbbedd1826fad9a6
 - No autobuilder failures (yet)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/newlib-bare-metal/newlib-bare-metal.hash | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/newlib-bare-metal/newlib-bare-metal.hash b/package/newlib-bare-metal/newlib-bare-metal.hash
index f8c553cf86..827925373e 100644
--- a/package/newlib-bare-metal/newlib-bare-metal.hash
+++ b/package/newlib-bare-metal/newlib-bare-metal.hash
@@ -5,4 +5,4 @@ sha256  0c166a39e1bf0951dfafcd68949fe0e4b6d3658081d6282f39aeefc6310f2f13  newlib
 sha256  231f7edcc7352d7734a96eef0b8030f77982678c516876fcb81e25b32d68564c  COPYING
 sha256  a9bdde5616ecdd1e980b44f360600ee8783b1f99b8cc83a2beb163a0a390e861  COPYING.LIB
 sha256  f3b7f3e4426b1fa6f60198dae7adfedd94b77b28db2d108adc0253575011e0ff  COPYING.LIBGLOSS
-sha256  422aa40293093fb54fc66e692a0d68fd0b24ed5602e5d1d33ad05ba3909057e9  COPYING.NEWLIB
+sha256  9a59b4ee3af067045fe0ea78786201c42d54756fe48cbccf44f3dfc398474717  COPYING.NEWLIB
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
