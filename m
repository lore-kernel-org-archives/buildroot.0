Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECAF0CE8D61
	for <buildroot@archiver.kernel.org>; Thu, 19 Sep 2024 09:16:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B4CF941524;
	Thu, 19 Sep 2024 09:16:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id V1ya32UYZL47; Thu, 19 Sep 2024 09:16:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E004E4144C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E004E4144C;
	Thu, 19 Sep 2024 09:16:10 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4A8E91BF4DA
 for <buildroot@lists.busybox.net>; Thu, 19 Sep 2024 09:15:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 05C6B849C2
 for <buildroot@lists.busybox.net>; Thu, 19 Sep 2024 09:14:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 62A8HpRcId-x for <buildroot@lists.busybox.net>;
 Thu, 19 Sep 2024 09:14:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 26DEF8472A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 26DEF8472A
 for <buildroot@buildroot.org>; Thu, 19 Sep 2024 09:14:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2426283C66; Thu, 19 Sep 2024 09:14:52 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 19 Sep 2024 11:03:16 +0200
X-Git-Refname: refs/heads/2024.08.x
X-Git-Oldrev: 923a6df874afd1dca8c9b3a26132fa568350f017
X-Git-Newrev: dbc9de026b3423832e721740bf39369f1d323195
X-Patchwork-Hint: ignore
Message-Id: <20240919091452.2426283C66@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.08.x] package/bcache-tools: fix
 compatibility typo
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

commit: https://git.buildroot.net/buildroot/commit/?id=dbc9de026b3423832e721740bf39369f1d323195
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.08.x

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 4c046460d2b120816478b4ae82793e7617e80f7c)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0001-Don-t-inline-crc64-for-gcc-5-compatability.patch             | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/bcache-tools/0001-Don-t-inline-crc64-for-gcc-5-compatability.patch b/package/bcache-tools/0001-Don-t-inline-crc64-for-gcc-5-compatability.patch
index 1a437a84fb..bd3358c207 100644
--- a/package/bcache-tools/0001-Don-t-inline-crc64-for-gcc-5-compatability.patch
+++ b/package/bcache-tools/0001-Don-t-inline-crc64-for-gcc-5-compatability.patch
@@ -1,4 +1,4 @@
-Don't inline crc64 for gcc-5 compatability
+Don't inline crc64 for gcc-5 compatibility
 
 This patch is backported from Debian and it fixes the following error:
 
@@ -11,7 +11,7 @@ Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
 
 From: David Mohr <david@mcbf.net>
 Date: Tue, 26 May 2015 20:34:31 -0600
-Subject: Don't inline crc64 for gcc-5 compatability
+Subject: Don't inline crc64 for gcc-5 compatibility
 
 Forwarded: http://article.gmane.org/gmane.linux.kernel.bcache.devel/2919
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
