Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F3C1E77180
	for <buildroot@archiver.kernel.org>; Sat, 14 Dec 2024 09:00:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0530D410D2;
	Sat, 14 Dec 2024 09:00:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Yw-EBKxDWSRK; Sat, 14 Dec 2024 09:00:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8AC2041197
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8AC2041197;
	Sat, 14 Dec 2024 09:00:21 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 56E0FCD
 for <buildroot@buildroot.org>; Sat, 14 Dec 2024 09:00:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A637040207
 for <buildroot@buildroot.org>; Sat, 14 Dec 2024 09:00:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lRUc_JHRFo6f for <buildroot@buildroot.org>;
 Sat, 14 Dec 2024 09:00:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7E9AE40287
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7E9AE40287
 for <buildroot@buildroot.org>; Sat, 14 Dec 2024 09:00:03 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 63FBC86F0C; Sat, 14 Dec 2024 09:00:03 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 14 Dec 2024 09:53:44 +0100
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 029fc4fb3af7805e2afaac8687ba2d36506eb619
X-Git-Newrev: 76d7d1f1b97ddd115b96d810d8e55ca70f5fdedc
X-Patchwork-Hint: ignore
Message-Id: <20241214090003.63FBC86F0C@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/nettle: update
 _SITE to use BR2_GNU_MIRROR
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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

commit: https://git.buildroot.net/buildroot/commit/?id=76d7d1f1b97ddd115b96d810d8e55ca70f5fdedc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

The nettle package is distributed on the GNU project servers. See [1]
and [2]. Buildroot has the BR2_GNU_MIRROR configuration which can
be used for that purpose. See [3].

For consistency with all other GNU packages, this commit updates
the _SITE to use BR2_GNU_MIRROR.

Note: the nettle _SITE was updated to ftp.gnu.org in commit [4].

[1] https://www.lysator.liu.se/~nisse/nettle/
[2] https://www.gnu.org/prep/ftp.html
[3] https://gitlab.com/buildroot.org/buildroot/-/blob/2024.08.2/Config.in#L286
[4] https://gitlab.com/buildroot.org/buildroot/-/commit/92f0ef5eaa74af28b2b7b7abbe021bce2aba4875

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
(cherry picked from commit 9ccc0f5642cf173bcc8d51f778331acfea9dbde8)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/nettle/nettle.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/nettle/nettle.mk b/package/nettle/nettle.mk
index 20f755cc98..0af15ac942 100644
--- a/package/nettle/nettle.mk
+++ b/package/nettle/nettle.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 NETTLE_VERSION = 3.9.1
-NETTLE_SITE = https://ftp.gnu.org/gnu/nettle
+NETTLE_SITE = $(BR2_GNU_MIRROR)/nettle
 NETTLE_DEPENDENCIES = host-m4 gmp
 NETTLE_INSTALL_STAGING = YES
 NETTLE_LICENSE = Dual GPL-2.0+/LGPL-3.0+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
