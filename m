Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5AB8D5C0F9
	for <buildroot@archiver.kernel.org>; Tue, 16 Dec 2025 09:04:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6A00F80A50;
	Tue, 16 Dec 2025 09:04:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KLDfaDL0vj2n; Tue, 16 Dec 2025 09:04:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8542080A74
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765875878;
	bh=4t//BAYUtzPmAMKdWaOFQ8iq2ovgMGDMQFqESgJjvAc=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=MuUSvPrHRmprioSjRqF1s2Xmh38JU5pKVLuecUy8KJl56JxGxAA50BVZKb68yQAxx
	 d5SH/Lz3p1UoLZzDHyPG1GnjWg90aHkVMkQAs2vtauJATFkVg4i2IkXhNfjC6e7JEN
	 oWbv3IecrHyz4anAiPYzzEE9PP7YCzHpw19w7imJuNYyZ+uCQ8pAxGKlE44IC8AyTy
	 YEwyN3EE2G6oOB/pphnQAoHasmLPzPB/3KM+r0WlQUMjEjUOk8j6jZku87TLBKSnM3
	 wyi04eB1keIoz9fGEtFg879w0xEaQGT9idSrg38ShsPZR349W1ZaSEDnA9dcRoK1d6
	 G83BcdsCFCI1w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8542080A74;
	Tue, 16 Dec 2025 09:04:38 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id ACB35372
 for <buildroot@buildroot.org>; Tue, 16 Dec 2025 09:04:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9EF3840448
 for <buildroot@buildroot.org>; Tue, 16 Dec 2025 09:04:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ud9wK4VkUmqp for <buildroot@buildroot.org>;
 Tue, 16 Dec 2025 09:04:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AB69D40248
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id AB69D40248
 for <buildroot@buildroot.org>; Tue, 16 Dec 2025 09:04:36 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9BD3886FE3; Tue, 16 Dec 2025 09:04:36 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 16 Dec 2025 10:03:44 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5ae304d96cb7c4df040ba1bdfedfb09b3d5a3417
X-Git-Newrev: df26e939636610e2d5aac5dc35265f8d334c40eb
X-Patchwork-Hint: ignore
Message-Id: <20251216090436.9BD3886FE3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/cli11: bump version to 2.6.1
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=df26e939636610e2d5aac5dc35265f8d334c40eb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes: https://github.com/CLIUtils/CLI11/releases

Updated license hash due to copyright year and version bumps:
https://github.com/CLIUtils/CLI11/commits/v2.6.1/LICENSE

Fixes CMake 4 build issue:

  https://autobuild.buildroot.net/results/2d70c8e9721b2c6e2f80099fc926a8b47e35bcfd/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/cli11/cli11.hash | 4 ++--
 package/cli11/cli11.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/cli11/cli11.hash b/package/cli11/cli11.hash
index 42ab5d1311..787e9535c0 100644
--- a/package/cli11/cli11.hash
+++ b/package/cli11/cli11.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  aac0ab42108131ac5d3344a9db0fdf25c4db652296641955720a4fbe52334e22  cli11-2.3.2.tar.gz
-sha256  4110754959bd99e0ebc34001ed0402ff5f371364e83f9db6d1e230d02368984f  LICENSE
+sha256  377691f3fac2b340f12a2f79f523c780564578ba3d6eaf5238e9f35895d5ba95  cli11-2.6.1.tar.gz
+sha256  3a70a5dffdaefe4c434660a8270f679ae18dd3c34208fb0b461a665bfcfe3e97  LICENSE
diff --git a/package/cli11/cli11.mk b/package/cli11/cli11.mk
index 349c14fe60..b47e531f05 100644
--- a/package/cli11/cli11.mk
+++ b/package/cli11/cli11.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CLI11_VERSION = 2.3.2
+CLI11_VERSION = 2.6.1
 CLI11_SITE = $(call github,CLIUtils,CLI11,v$(CLI11_VERSION))
 CLI11_LICENSE = BSD-3-Clause
 CLI11_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
