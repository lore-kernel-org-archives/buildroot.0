Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13A8AC5DF70
	for <buildroot@archiver.kernel.org>; Sun, 16 Aug 2026 22:20:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C969640680;
	Sun, 16 Aug 2026 22:20:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8vTYabPOSxaO; Sun, 16 Aug 2026 22:20:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B91164066C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786918832;
	bh=dslSYG+ZI3fdf9Hwg3wH59iML1Obl1wmpCqrsdmJTiE=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=WhEuHIi99HIFqFUfQMcfdZf4beSu7Xks1YQTWuGXVg5SivR5ESBbFx0WM9GBKd/Eq
	 6glHqLNmCDM0i6AKCIAjqzUm2o1YNjn06jNVbyB+jgCjtK1yMAFx5gjXLzPuViaJvK
	 IYXeiU3OSMsjdBqt+QZ8i7gm0E4Fg62hS+nZY4E1lUm+KkRIq4JE6j6vSoqcwDMuP/
	 dOzVOs5uUfbPI3hlQQnh8+TbfA92sDvILaiMCoK0tGxVKoW/7bQllIPl0a9SdmMPh4
	 q7itEiQet87bkoWMftvenenysBi0lZgx16k2F1cbpSnrcufaFa7YDV9N2U1uPDqg0K
	 LCBfx7bPDaR2w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B91164066C;
	Sun, 16 Aug 2026 22:20:32 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 672A223F
 for <buildroot@buildroot.org>; Sun, 16 Aug 2026 22:20:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5949A6061A
 for <buildroot@buildroot.org>; Sun, 16 Aug 2026 22:20:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id o8NhnMpGg6IZ for <buildroot@buildroot.org>;
 Sun, 16 Aug 2026 22:20:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AE27D6061F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id AE27D6061F
 for <buildroot@buildroot.org>; Sun, 16 Aug 2026 22:20:30 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7F02B8DB16; Sun, 16 Aug 2026 22:19:39 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 17 Aug 2026 00:08:24 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a9ac8fb74b8e5d9b9ad6c1655bd4b1bc74279cee
X-Git-Newrev: 64aa4f2db3126de5c3b7f46a434cf1af9603886c
X-Patchwork-Hint: ignore
Message-Id: <20260816221939.7F02B8DB16@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/docker-cli: bump version to 28.5.2
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/64aa4f2db3126de5c3b7f46a434cf1af9603886c
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

For consistency with docker-engine. Release notes:
https://github.com/docker/cli/issues?q=is%3Aclosed+milestone%3A28.4.0
https://github.com/docker/cli/issues?q=is%3Aclosed+milestone%3A28.5.1
https://github.com/docker/cli/issues?q=is%3Aclosed+milestone%3A28.5.2

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/docker-cli/docker-cli.hash | 2 +-
 package/docker-cli/docker-cli.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/docker-cli/docker-cli.hash b/package/docker-cli/docker-cli.hash
index 1424f95752..06758086bd 100644
--- a/package/docker-cli/docker-cli.hash
+++ b/package/docker-cli/docker-cli.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  172dca437abb36485275a8d43550db90b6878bcc676fc0b73a67a57a15026cff  docker-cli-28.3.3-go2.tar.gz
+sha256  5864ccdfceef3a9e8ddb29b4a555d5b82a551b5258067aac164b6156c6cfdc08  docker-cli-28.5.2-go2.tar.gz
 sha256  2d81ea060825006fc8f3fe28aa5dc0ffeb80faf325b612c955229157b8c10dc0  LICENSE
diff --git a/package/docker-cli/docker-cli.mk b/package/docker-cli/docker-cli.mk
index 8d1b8f1bbe..8ca74af7d0 100644
--- a/package/docker-cli/docker-cli.mk
+++ b/package/docker-cli/docker-cli.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DOCKER_CLI_VERSION = 28.3.3
+DOCKER_CLI_VERSION = 28.5.2
 DOCKER_CLI_SITE = $(call github,docker,cli,v$(DOCKER_CLI_VERSION))
 
 DOCKER_CLI_LICENSE = Apache-2.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
