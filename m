Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09A74C02197
	for <buildroot@archiver.kernel.org>; Sat, 14 Sep 2024 14:00:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CE9E042459;
	Sat, 14 Sep 2024 14:00:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0PKyv3POLAOR; Sat, 14 Sep 2024 14:00:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A5ED742488
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A5ED742488;
	Sat, 14 Sep 2024 14:00:42 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 36A701BF3F9
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 14:00:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DCF5B406F6
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 14:00:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6MM5cY7MXxVs for <buildroot@lists.busybox.net>;
 Sat, 14 Sep 2024 14:00:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DA11840715
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id DA11840715
 for <buildroot@buildroot.org>; Sat, 14 Sep 2024 14:00:13 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D639782B64; Sat, 14 Sep 2024 14:00:13 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 14 Sep 2024 15:54:39 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2465cdb48ac0b3c720e736656e1776affa7bad4c
X-Git-Newrev: b185bfccbfcbf6804f52b374ee8be0ae4bd7f071
X-Patchwork-Hint: ignore
Message-Id: <20240914140013.D639782B64@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/make: fix accidentally typo
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

commit: https://git.buildroot.net/buildroot/commit/?id=b185bfccbfcbf6804f52b374ee8be0ae4bd7f071
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/make/make.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/make/make.mk b/package/make/make.mk
index e194e15873..1d1a976eb4 100644
--- a/package/make/make.mk
+++ b/package/make/make.mk
@@ -23,7 +23,7 @@ HOST_MAKE_DEPENDENCIES = host-pkgconf
 HOST_MAKE_CONF_OPTS = --without-guile
 
 # Configure host-make binary to be 'host-make' to ensure it isn't
-# accidently used by packages when they invoke recursive / sub-make.
+# accidentally used by packages when they invoke recursive / sub-make.
 HOST_MAKE_CONF_OPTS += --program-prefix=host-
 
 $(eval $(autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
