Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38044E73146
	for <buildroot@archiver.kernel.org>; Mon,  2 Feb 2026 09:03:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 04E6D40836;
	Mon,  2 Feb 2026 09:03:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EjpYC0A7PfOW; Mon,  2 Feb 2026 09:03:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3172F40855
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770022982;
	bh=ruDULtwc9BpMqkBmn+RoT6pLubbhfU9ubJlFc+C2bJc=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=JIVG4+AC2vbddfEsCCTu4sGlQdXv5Johlj4JFC49sBsqHg/2f5DUNk/nBEciS98Tp
	 Xd2cxMR1WunRWK9lKPgDUqcDPgD+zc17kQuU+kAALJQznjLqGB+6Qb2leex0RsPEwC
	 uYvg5XymovwLFzdw+Maz3eu0hE9uzktNWJ+5p6p16c1qJgLkXgEzQ6jtWdeBwZWL/g
	 78Bx7kmjlEA0nGQK3XpebwA2Y+kMGeG1FWb2AhnRZ8jfb6tg3VpVw4ZY1GTcYJZCp4
	 6v1sqgdwpsYu/8VsGyDxWJT4+xmLq9Tfrz0QjKv2PzkIVuM0cQfwdYtLDv14KHu7UR
	 5QF20gUVKvZcA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3172F40855;
	Mon,  2 Feb 2026 09:03:02 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 9F3A923E
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 09:02:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8A1D940245
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 09:02:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4XaHbagBQjmp for <buildroot@buildroot.org>;
 Mon,  2 Feb 2026 09:02:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C82BA40257
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id C82BA40257
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 09:02:58 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B2B948626A; Mon,  2 Feb 2026 09:02:58 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 2 Feb 2026 10:01:42 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 07917a05db913348cc4b990e6937310f14456d34
X-Git-Newrev: fe49d5c682e3a15e265a00d978aca1f1e34174bd
X-Patchwork-Hint: ignore
Message-Id: <20260202090258.B2B948626A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/drbd-utils: drbdmon needs sync_1
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

commit: https://git.buildroot.net/buildroot/commit/?id=fe49d5c682e3a15e265a00d978aca1f1e34174bd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Buildroot commit 99585db1e896d7a75e204335af86f0725a30d357 bumped the
package from version 9.21.4 to 9.33.0.

Upstream added std::atomic to drbdmon with commit
https://github.com/LINBIT/drbd-utils/commit/3baf945732fc144043822b50a2a03daad0994d44
to version 9.25.0 causing build errors:

/home/autobuild/autobuild/instance-2/output-1/per-package/drbd-utils/host/bin/../lib/gcc/microblazeel-buildroot-linux-uclibc/14.3.0/../../../../microblazeel-buildroot-linux-uclibc/bin/ld:
 MessageLogNotification.o: in function `MessageLogNotification::query_log_changed()':
 (.text+0xe8): undefined reference to `__atomic_exchange_1'

Fixes:
https://autobuild.buildroot.net/results/741/741606000c26bc994f243b0b865d26ff25592caa/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/drbd-utils/drbd-utils.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/drbd-utils/drbd-utils.mk b/package/drbd-utils/drbd-utils.mk
index 657f9fafd8..82baba975d 100644
--- a/package/drbd-utils/drbd-utils.mk
+++ b/package/drbd-utils/drbd-utils.mk
@@ -20,7 +20,7 @@ else
 DRBD_UTILS_CONF_OPTS += --with-initscripttype=sysv
 endif
 
-ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
+ifeq ($(BR2_TOOLCHAIN_HAS_THREADS)$(BR2_TOOLCHAIN_HAS_SYNC_1),yy)
 DRBD_UTILS_CONF_OPTS += --with-drbdmon
 else
 DRBD_UTILS_CONF_OPTS += --without-drbdmon
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
