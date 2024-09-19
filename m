Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8ADDCE8D5F
	for <buildroot@archiver.kernel.org>; Thu, 19 Sep 2024 09:17:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B95C741BF5;
	Thu, 19 Sep 2024 09:17:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IzWZA8sG7_ie; Thu, 19 Sep 2024 09:17:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2F4DE41BE5
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2F4DE41BE5;
	Thu, 19 Sep 2024 09:17:34 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 17CFD1BF4DA
 for <buildroot@lists.busybox.net>; Thu, 19 Sep 2024 09:16:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BE357615C2
 for <buildroot@lists.busybox.net>; Thu, 19 Sep 2024 09:16:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id s7HxBwZsT7Om for <buildroot@lists.busybox.net>;
 Thu, 19 Sep 2024 09:16:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C1591615DE
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id C1591615DE
 for <buildroot@buildroot.org>; Thu, 19 Sep 2024 09:16:06 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BECEF83C6C; Thu, 19 Sep 2024 09:16:06 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 19 Sep 2024 11:04:40 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: ae67a5adbd21099d86ce586d0a422283a5ac3835
X-Git-Newrev: 1cfaea9c7a365603eadfc1f755932ec0f6fba4c8
X-Patchwork-Hint: ignore
Message-Id: <20240919091606.BECEF83C6C@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/bcache-tools: fix
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

commit: https://git.buildroot.net/buildroot/commit/?id=1cfaea9c7a365603eadfc1f755932ec0f6fba4c8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

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
