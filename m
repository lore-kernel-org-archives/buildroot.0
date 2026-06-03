Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16D59CD6E57
	for <buildroot@archiver.kernel.org>; Wed,  3 Jun 2026 20:06:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F26CE84801;
	Wed,  3 Jun 2026 20:06:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TT0kCbttiUc7; Wed,  3 Jun 2026 20:06:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E1283847EB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780517194;
	bh=4mMXNwdXfJ6uID8VtIpQSuj42xsA5Og9GbDTxmgjcoI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=fzwymiJOLe0CEog2c9WZQLTezN/cvUjKya4LoDRNhjv+ERXBaKrRevlRxRLgi82lN
	 gh4o04M+gpZkb4SR9kUXBI6MbcRUG/7lLa8e55f/djisRbjkxaDNSmQwtw3AVKSSaW
	 7dZyHOlALQHqaV22lmK6whqfOuGFum2zziTvRnDsbvwhNlcLsTSNAGBDZESNAodQD+
	 ix1EeTTQQLrv6BeFUCV2JYzC7VXjoBRHvURgDBrsI9xrbk6dOLPKul2tiG2L/y9bOd
	 fs44Ah6axEt6qddaVQiYgk38MnTqA9OHnC0EhuhZb6OxsfIytL6/tw2+vOFSKVByne
	 8+pufGfRAVtiw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E1283847EB;
	Wed,  3 Jun 2026 20:06:33 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 4873BDE
 for <buildroot@buildroot.org>; Wed,  3 Jun 2026 20:06:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3972E427E0
 for <buildroot@buildroot.org>; Wed,  3 Jun 2026 20:06:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id alQuWohOo862 for <buildroot@buildroot.org>;
 Wed,  3 Jun 2026 20:06:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 61CC141E0B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 61CC141E0B
 for <buildroot@buildroot.org>; Wed,  3 Jun 2026 20:06:32 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4FC308799E; Wed,  3 Jun 2026 20:06:17 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 3 Jun 2026 22:05:14 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 831335ac71c8fd366c1dbbc34a9a11d26f32df97
X-Git-Newrev: 50bc0b5fdad80d3f1bf8bb6796b6fffe0b986503
X-Patchwork-Hint: ignore
Message-Id: <20260603200617.4FC308799E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/docker-cli: bump version to 28.3.3
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/50bc0b5fdad80d3f1bf8bb6796b6fffe0b986503
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

For consistency with docker-engine. Release notes:

https://github.com/docker/cli/issues?q=is%3Aclosed+milestone%3A28.3.3

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/docker-cli/docker-cli.hash | 2 +-
 package/docker-cli/docker-cli.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/docker-cli/docker-cli.hash b/package/docker-cli/docker-cli.hash
index 34d77bb137..1424f95752 100644
--- a/package/docker-cli/docker-cli.hash
+++ b/package/docker-cli/docker-cli.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  b65cd415e63be23fcaa63107bc47a762173a06c84fb78b1575edc5443bb39867  docker-cli-28.3.2-go2.tar.gz
+sha256  172dca437abb36485275a8d43550db90b6878bcc676fc0b73a67a57a15026cff  docker-cli-28.3.3-go2.tar.gz
 sha256  2d81ea060825006fc8f3fe28aa5dc0ffeb80faf325b612c955229157b8c10dc0  LICENSE
diff --git a/package/docker-cli/docker-cli.mk b/package/docker-cli/docker-cli.mk
index abe0aac348..8d1b8f1bbe 100644
--- a/package/docker-cli/docker-cli.mk
+++ b/package/docker-cli/docker-cli.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DOCKER_CLI_VERSION = 28.3.2
+DOCKER_CLI_VERSION = 28.3.3
 DOCKER_CLI_SITE = $(call github,docker,cli,v$(DOCKER_CLI_VERSION))
 
 DOCKER_CLI_LICENSE = Apache-2.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
