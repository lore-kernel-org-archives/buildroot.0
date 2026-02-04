Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1521AE9D417
	for <buildroot@archiver.kernel.org>; Wed,  4 Feb 2026 16:59:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C53C5606CB;
	Wed,  4 Feb 2026 16:59:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id om-bYKSZ0xkj; Wed,  4 Feb 2026 16:59:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BA373607B3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770224342;
	bh=INmiqjwuwT0mLVqKQeQnfl6ku8KZ7PTwuPjw2X74F9Q=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=mXoFKP2m2e9Orz0n8KZjfMW6Sb2QmquIYbqv1RnWhMFkwmIenD+oOk5eQqiSLFXGr
	 Zk1P0Gd5pnfTtbp1JOng4yunFnxCFjqoaJ22UPkidMUrDg30WYEQGyzaqjcfWCqONY
	 PB5Hjykasn2boP3gHA1MTb1pI6ueod7SYBYt6cSfPyS0vZjmlGmLlqF7DnK5XF5veo
	 PxUJtHv9fY/krM3qwKbU+ZFYetWk0dlOAQTJgJiAv+rYhK0/T1/kJNl28Tpag9tbeQ
	 93dzQwEOciNoVsw7cr4M9GlopnF906I8yfZFv7e0fPTeLlRznQy6nak096awQQxyiv
	 pbnNpOzBHHTPg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id BA373607B3;
	Wed,  4 Feb 2026 16:59:01 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id C4DC7173
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 16:58:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AB1FA60AD3
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 16:58:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LJ5Z6NxK0cre for <buildroot@buildroot.org>;
 Wed,  4 Feb 2026 16:58:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CD435606CB
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id CD435606CB
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 16:58:58 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 787FF8696C; Wed,  4 Feb 2026 16:58:58 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 4 Feb 2026 17:54:17 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c10c9c2283b731f59620172ba882f6ac070eb9c5
X-Git-Newrev: 026c635508cf9518b20cfd76350a01b2d0f57a5c
X-Patchwork-Hint: ignore
Message-Id: <20260204165858.787FF8696C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/uclibc: rename
 UCLIBC_INSTALL_UTILS_STAGING to UCLIBC_INSTALL_HOST_UTILS
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/026c635508cf9518b20cfd76350a01b2d0f57a5c
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

The UCLIBC_INSTALL_UTILS_STAGING is really badly named, as it doesn't
install anything to STAGING_DIR. Instead, it installs the host variant
of ldd and ldconfig into $(HOST_DIR)/bin. Therefore, rename it to
UCLIBC_INSTALL_HOST_UTILS.

This is important as a follow-up commit will re-introduce a
UCLIBC_INSTALL_UTILS_STAGING variable which really installs things
into STAGING_DIR.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/uclibc/uclibc.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/uclibc/uclibc.mk b/package/uclibc/uclibc.mk
index e1cf12fa68..dea5445b16 100644
--- a/package/uclibc/uclibc.mk
+++ b/package/uclibc/uclibc.mk
@@ -463,7 +463,7 @@ endef
 
 # STATIC has no ld* tools, only getconf
 ifeq ($(BR2_STATIC_LIBS),)
-define UCLIBC_INSTALL_UTILS_STAGING
+define UCLIBC_INSTALL_HOST_UTILS
 	$(INSTALL) -D -m 0755 $(@D)/utils/ldd.host $(HOST_DIR)/bin/ldd
 	ln -sf ldd $(HOST_DIR)/bin/$(GNU_TARGET_NAME)-ldd
 	$(INSTALL) -D -m 0755 $(@D)/utils/ldconfig.host $(HOST_DIR)/bin/ldconfig
@@ -478,7 +478,7 @@ define UCLIBC_INSTALL_STAGING_CMDS
 		DEVEL_PREFIX=/usr/ \
 		RUNTIME_PREFIX=/ \
 		install_runtime install_dev
-	$(UCLIBC_INSTALL_UTILS_STAGING)
+	$(UCLIBC_INSTALL_HOST_UTILS)
 endef
 
 # Checks to give errors that the user can understand
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
