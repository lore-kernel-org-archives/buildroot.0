Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26B85EB26F7
	for <buildroot@archiver.kernel.org>; Tue, 10 Feb 2026 18:34:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B42A680A87;
	Tue, 10 Feb 2026 18:34:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bkaNu0quOXLJ; Tue, 10 Feb 2026 18:34:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CC97880AD1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770748473;
	bh=+MGC4h+2sN/+7vHhq9SbNXVz3yQ858ClITBLZKGpvTQ=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Tdw4ZLrEqqMQvMfCUb6wfk1hNFvEzEC6WsKbunuA6CgIMFXE7QZS1FhMJ+uz/41P+
	 uH/S9smWTZMvp60gQ19LY29NM+Sza39Dxft1i0kxiXFQ6dAZFUYRyIfLX2XT7efcyx
	 OKsTkHLBhGOr1INSJJxHzcmCQhIlR+tHAmW2Kle2E0tuxERYHIO58XloQZpfX6J85F
	 BZQAoHRK961xk/S5KNu5ti74IhWOikVg4wgh7rNDJBPWnFRJHIplSYXkEz7k/ZheKf
	 JDOof2WO2xbfHQF+V73JV8q/1hJd8cjv/DM8cJDxxJ12X1ZxVDm9NWX4QukI/fpr0v
	 NOoE/X32rHd7g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id CC97880AD1;
	Tue, 10 Feb 2026 18:34:33 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 6963123D
 for <buildroot@buildroot.org>; Tue, 10 Feb 2026 18:34:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5A4ED4116E
 for <buildroot@buildroot.org>; Tue, 10 Feb 2026 18:34:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hXJ4rQKLryhd for <buildroot@buildroot.org>;
 Tue, 10 Feb 2026 18:34:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 94C0D41163
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 94C0D41163
 for <buildroot@buildroot.org>; Tue, 10 Feb 2026 18:34:31 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 75AB986BB8; Tue, 10 Feb 2026 18:34:31 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 10 Feb 2026 19:21:51 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5bd15ee7d488a8192ed0a12440ea49feee9c695b
X-Git-Newrev: 80cbcfaeadd2474c71112b4dc9fb0673c9152519
X-Patchwork-Hint: ignore
Message-Id: <20260210183431.75AB986BB8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/zlib-ng: bump to 2.3.3
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
From: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Reply-To: Marcus Hoffmann <buildroot@bubu1.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/80cbcfaeadd2474c71112b4dc9fb0673c9152519
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Release Notes: https://github.com/zlib-ng/zlib-ng/releases/tag/2.3.3

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
---
 package/zlib-ng/zlib-ng.hash | 2 +-
 package/zlib-ng/zlib-ng.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/zlib-ng/zlib-ng.hash b/package/zlib-ng/zlib-ng.hash
index a9f879ea18..b317906474 100644
--- a/package/zlib-ng/zlib-ng.hash
+++ b/package/zlib-ng/zlib-ng.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  6a0561b50b8f5f6434a6a9e667a67026f2b2064a1ffa959c6b2dae320161c2a8  zlib-ng-2.3.2.tar.gz
+sha256  f9c65aa9c852eb8255b636fd9f07ce1c406f061ec19a2e7d508b318ca0c907d1  zlib-ng-2.3.3.tar.gz
 sha256  6c9f0d975b41afaa34d22f55bb8986ce69e5cb7ad327cb2b28820cd425edf5ee  LICENSE.md
diff --git a/package/zlib-ng/zlib-ng.mk b/package/zlib-ng/zlib-ng.mk
index 275c5b86f0..59e4e15282 100644
--- a/package/zlib-ng/zlib-ng.mk
+++ b/package/zlib-ng/zlib-ng.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ZLIB_NG_VERSION = 2.3.2
+ZLIB_NG_VERSION = 2.3.3
 ZLIB_NG_SITE = $(call github,zlib-ng,zlib-ng,$(ZLIB_NG_VERSION))
 ZLIB_NG_LICENSE = Zlib
 ZLIB_NG_LICENSE_FILES = LICENSE.md
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
