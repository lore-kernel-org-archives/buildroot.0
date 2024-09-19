Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29E16CE8D5F
	for <buildroot@archiver.kernel.org>; Thu, 19 Sep 2024 09:18:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CC3A4432DF;
	Thu, 19 Sep 2024 09:18:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kyRIHT3Du5Cv; Thu, 19 Sep 2024 09:18:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D6015432E0
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D6015432E0;
	Thu, 19 Sep 2024 09:18:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 262EB1BF4DA
 for <buildroot@lists.busybox.net>; Thu, 19 Sep 2024 09:16:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 072A8849CA
 for <buildroot@lists.busybox.net>; Thu, 19 Sep 2024 09:16:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xD-h6dOaykQ6 for <buildroot@lists.busybox.net>;
 Thu, 19 Sep 2024 09:16:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 35703849DF
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 35703849DF
 for <buildroot@buildroot.org>; Thu, 19 Sep 2024 09:16:07 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 32EEB7FC62; Thu, 19 Sep 2024 09:16:07 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 19 Sep 2024 11:04:49 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: d7a0fcf4aced2fe0d7423c05a89f080e443109a9
X-Git-Newrev: 1de8bd900678358c9ed689944671f071acbff6f8
X-Patchwork-Hint: ignore
Message-Id: <20240919091607.32EEB7FC62@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/erlang: fix
 inadvertently typo
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

commit: https://git.buildroot.net/buildroot/commit/?id=1de8bd900678358c9ed689944671f071acbff6f8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 9c70f31956312c5d64baf80f2fb198012c922bd4)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/erlang/erlang.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/erlang/erlang.mk b/package/erlang/erlang.mk
index 84d2f4e898..f9956d4468 100644
--- a/package/erlang/erlang.mk
+++ b/package/erlang/erlang.mk
@@ -48,7 +48,7 @@ ERLANG_CONF_ENV += erl_xcomp_sysroot=$(STAGING_DIR)
 ERLANG_CONF_OPTS = --without-javac
 
 # Force ERL_TOP to the downloaded source directory. This prevents
-# Erlang's configure script from inadvertantly using files from
+# Erlang's configure script from inadvertently using files from
 # a version of Erlang installed on the host.
 ERLANG_CONF_ENV += ERL_TOP=$(@D)
 HOST_ERLANG_CONF_ENV += ERL_TOP=$(@D)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
