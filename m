Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE702D0D14F
	for <buildroot@archiver.kernel.org>; Wed,  7 Jan 2026 17:48:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9494840C0B;
	Wed,  7 Jan 2026 17:48:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jfIQEgFl7vM9; Wed,  7 Jan 2026 17:48:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3B8C040BE6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767808105;
	bh=3gI9KXUTUpsSUDDv5SdBISAE+oTHDrr7SsaVOAptf7M=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=kDHTaC+KNGmce6dJxmkpmkn2GidEEO80FAnHspaDZVqrbtU7/dTV8ynb9YHHU8HNe
	 Hj60SD4Mm2jT4IZZUClZVYJ1GajB3TZWNbMW7KP+5P+QM0dJ0ZI/7ulXmaq5dSSiE/
	 jt3vKjOp8gq0kY50tcn/YkOsQWun6gYXVGam91jTsb9m7VEzVWlJpprV0mkEVmPvVF
	 I3lyG0uavoNsaAXdTaldecHT1jNNiIt73XuPbmowsyaBVFvBEwmqmF/AqPCLJ175Io
	 TwERuchU9RTo56/laCmwKn1zl6NWqZvg0hz2ltiLNNQbyvKu8cPw5pmBPy7n5UpXpC
	 t+rz30U5PSdpA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3B8C040BE6;
	Wed,  7 Jan 2026 17:48:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 101CF25B
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:47:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7A9EC80AD0
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:46:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Xl4nLQAUWxVq for <buildroot@buildroot.org>;
 Wed,  7 Jan 2026 17:46:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B0B9780A93
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id B0B9780A93
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:46:40 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id AF8C788367; Wed,  7 Jan 2026 17:46:40 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 6 Jan 2026 09:16:50 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 4180214a2d5a72a09a79d5fc21fcfc2d3d5f3054
X-Git-Newrev: 205f959018f76aec885c223b0252a7d5c5c0a1f1
X-Patchwork-Hint: ignore
Message-Id: <20260107174640.AF8C788367@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/linenoise:
 security bump to version e26268de5e
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=205f959018f76aec885c223b0252a7d5c5c0a1f1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

Fixes:
CVE-2025-9810: TOCTOU in linenoiseHistorySave
https://www.cve.org/CVERecord?id=CVE-2025-9810

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 3c7cbf97d707e22d07c27894dc8ab3004ad86564)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/linenoise/linenoise.hash | 2 +-
 package/linenoise/linenoise.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/linenoise/linenoise.hash b/package/linenoise/linenoise.hash
index 9a1436eb8b..3f82ba0ff9 100644
--- a/package/linenoise/linenoise.hash
+++ b/package/linenoise/linenoise.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  1086f82fbf30b0618b1953b05d33db62c68fc7ce49391ce1374192f776fde72d  linenoise-97d2850af13c339369093b78abe5265845d78220.tar.gz
+sha256  d5e702e7e04f0fcd09393bd4c010ce2bb19b4d137e22f2dd6064e848f4a6b5b2  linenoise-e26268de5e56bfaad773786471844578fe9f7f4b.tar.gz
 sha256  efe1692aa5b869edaa0ac88f95eb0276c1125304ffc636a299db3ebbab47f62b  LICENSE
diff --git a/package/linenoise/linenoise.mk b/package/linenoise/linenoise.mk
index fd2c4c7035..05f8aa4845 100644
--- a/package/linenoise/linenoise.mk
+++ b/package/linenoise/linenoise.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LINENOISE_VERSION = 97d2850af13c339369093b78abe5265845d78220
+LINENOISE_VERSION = e26268de5e56bfaad773786471844578fe9f7f4b
 LINENOISE_SITE = $(call github,antirez,linenoise,$(LINENOISE_VERSION))
 LINENOISE_LICENSE = BSD-2-Clause
 LINENOISE_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
