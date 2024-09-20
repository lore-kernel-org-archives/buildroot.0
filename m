Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41B31C78820
	for <buildroot@archiver.kernel.org>; Fri, 20 Sep 2024 10:36:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0C2A342C11;
	Fri, 20 Sep 2024 10:36:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OXJdMk3fR1cK; Fri, 20 Sep 2024 10:36:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D90F342CFC
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D90F342CFC;
	Fri, 20 Sep 2024 10:36:25 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 15A3F1BF599
 for <buildroot@lists.busybox.net>; Fri, 20 Sep 2024 10:36:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 91C0942B90
 for <buildroot@lists.busybox.net>; Fri, 20 Sep 2024 10:36:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Yfy06weH0fyn for <buildroot@lists.busybox.net>;
 Fri, 20 Sep 2024 10:36:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CC77442BBE
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id CC77442BBE
 for <buildroot@buildroot.org>; Fri, 20 Sep 2024 10:36:06 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B949184124; Fri, 20 Sep 2024 10:36:06 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 20 Sep 2024 12:33:39 +0200
X-Git-Refname: refs/heads/2024.08.x
X-Git-Oldrev: 40afb3d5b52cd49efbd13f9f894ccfb87d7b2b79
X-Git-Newrev: ba222b59766de993c4329de82ac4414e5bd32b8b
X-Patchwork-Hint: ignore
Message-Id: <20240920103606.B949184124@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.08.x] package/make: fix
 accidentally typo
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

commit: https://git.buildroot.net/buildroot/commit/?id=ba222b59766de993c4329de82ac4414e5bd32b8b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.08.x

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit b185bfccbfcbf6804f52b374ee8be0ae4bd7f071)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
