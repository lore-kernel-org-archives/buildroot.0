Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4ABEDC7EE24
	for <buildroot@archiver.kernel.org>; Mon,  5 Jun 2023 20:59:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C822D411A1;
	Mon,  5 Jun 2023 20:59:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C822D411A1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0w_TTjgdxE6o; Mon,  5 Jun 2023 20:59:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id EB38840514;
	Mon,  5 Jun 2023 20:59:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EB38840514
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E1B311BF3A1
 for <buildroot@lists.busybox.net>; Mon,  5 Jun 2023 20:59:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BAB5260ACF
 for <buildroot@lists.busybox.net>; Mon,  5 Jun 2023 20:59:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BAB5260ACF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LITKUMMDWZ86 for <buildroot@lists.busybox.net>;
 Mon,  5 Jun 2023 20:59:22 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id AABEC60625
 for <buildroot@buildroot.org>; Mon,  5 Jun 2023 20:59:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AABEC60625
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 994FF86CA9; Mon,  5 Jun 2023 20:59:22 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 5 Jun 2023 22:37:00 +0200
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: 96bc3c58cd0132ff5bae5b7f30b3dc9495e6f04d
X-Git-Newrev: 2246f8f10ba104f7c3ccd24fa3402815664a0f78
X-Patchwork-Hint: ignore
Message-Id: <20230605205922.994FF86CA9@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/pkg-utils.mk:
 make kconfig set/disable operations quiet
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

commit: https://git.buildroot.net/buildroot/commit/?id=2246f8f10ba104f7c3ccd24fa3402815664a0f78
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

In a previous commit [1], the use of `KCONFIG_ENABLE_OPT` was tweaked in
a way which no longer generates a default output unless the quiet flag
is unset (`Q=`). The use of `KCONFIG_SET_OPT` and `KCONFIG_DISABLE_OPT`
does not apply a quiet operation. In order to make all these kernel
configuration defines operate in a consistent way, adjusting both
`KCONFIG_SET_OPT` and `KCONFIG_DISABLE_OPT` to be default-quiet as well.

[1]: 66d2ff25bad813659ed4541b3f4c6c2a09455bd7

Signed-off-by: James Knight <james.d.knight@live.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit c110bb17ade18f446dd663c984dc3ef48b20fc64)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/pkg-utils.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/pkg-utils.mk b/package/pkg-utils.mk
index 0945e6ed31..530638566c 100644
--- a/package/pkg-utils.mk
+++ b/package/pkg-utils.mk
@@ -34,9 +34,9 @@ define KCONFIG_ENABLE_OPT
 	fi
 endef
 # KCONFIG_SET_OPT (option, value [, file])
-KCONFIG_SET_OPT     = $(call KCONFIG_MUNGE_DOT_CONFIG, $(1), $(1)=$(2), $(3))
+KCONFIG_SET_OPT     = $(Q)$(call KCONFIG_MUNGE_DOT_CONFIG, $(1), $(1)=$(2), $(3))
 # KCONFIG_DISABLE_OPT  (option [, file])
-KCONFIG_DISABLE_OPT = $(call KCONFIG_MUNGE_DOT_CONFIG, $(1), $(SHARP_SIGN) $(1) is not set, $(2))
+KCONFIG_DISABLE_OPT = $(Q)$(call KCONFIG_MUNGE_DOT_CONFIG, $(1), $(SHARP_SIGN) $(1) is not set, $(2))
 
 # Helper functions to determine the name of a package and its
 # directory from its makefile directory, using the $(MAKEFILE_LIST)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
