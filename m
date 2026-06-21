Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50D4ACD98F0
	for <buildroot@archiver.kernel.org>; Sun, 21 Jun 2026 19:35:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 158A785DD5;
	Sun, 21 Jun 2026 19:35:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id frYFJNgN_TtM; Sun, 21 Jun 2026 19:35:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3235285DB7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782070527;
	bh=VUKKHcU/kkS1cH9+V51HdFEENjeEMo2UzP7SsKAD+1g=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=b9pEfvPZ3Iyp3LKzbp/Df9e8UgTzdzosBBIPfasDzw2Humm7lHbbbfoJ1nRi51YLh
	 4Mu4AK/dWCp7CojS3UyazXH7mEHYLP3G6UBrX4rHdSomu7th9sb1OvNB33j4RBM6Ck
	 6LBD2akvqQKi4ZT5mWh0Crw/sus4SzOF9tzpLJ+yZEw0qs/YpGFgRmrMHvv8ASH6pQ
	 sgM6rkms2OMJ35WvAVPCVXRmiisKOgIHSs1c6YN7dBFZP+jShPwF8kgfVBVFerbsMR
	 XrjzDiizw0cwRMYtb37tHvochCWH1IWfOhzgmBK0EmEq8+lmJkmi+bcUFbFqvhOaH5
	 ETaS7u1M9izag==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3235285DB7;
	Sun, 21 Jun 2026 19:35:27 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 04ACFF4
 for <buildroot@buildroot.org>; Sun, 21 Jun 2026 19:35:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DEA2C4EC31
 for <buildroot@buildroot.org>; Sun, 21 Jun 2026 19:35:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NGAtK1teb5-3 for <buildroot@buildroot.org>;
 Sun, 21 Jun 2026 19:35:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2B2604EC23
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2B2604EC23
 for <buildroot@buildroot.org>; Sun, 21 Jun 2026 19:35:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 69B04838E4; Sun, 21 Jun 2026 19:35:01 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 21 Jun 2026 21:33:59 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 183c52448d77586aeba30ca9e5b1b7a9342b144c
X-Git-Newrev: 113def36967926e6a401cf4ec3cdcdfbd6423cfd
X-Patchwork-Hint: ignore
Message-Id: <20260621193501.69B04838E4@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/passt: needs headers >= 5.9
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/113def36967926e6a401cf4ec3cdcdfbd6423cfd
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Upstream passt only documents runtime dependencies; and they advertise
being able to run on kernel 3.8 or later. However, they do not document
the build dependencies.

Since 2025_06_11.0293c6f, upstream requires kernel headers >= 5.9, as
they make use of linux/close_range.h, only introduced in 5.9.

Add a dependency to kernel headers, and propagate it to podman's passt
backend.

Fixes: 6a192b0d282cb85ff4272e26df082f5eacd8e3a6

Cc: Yann E. MORIN <yann.morin@orange.com>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/passt/Config.in  | 6 +++---
 package/podman/Config.in | 6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/passt/Config.in b/package/passt/Config.in
index a93a088670..fca1dff7c5 100644
--- a/package/passt/Config.in
+++ b/package/passt/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_PASST
 	bool "passt"
-	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_0
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_9
 	help
 	  passt: Plug A Simple Socket Transport
 	  pasta: Pack A Subtle Tap Abstraction
@@ -19,5 +19,5 @@ config BR2_PACKAGE_PASST
 
 	  https://passt.top/passt/about/
 
-comment "passt needs a toolchain w/ headers >= 5.0"
-	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_0
+comment "passt needs a toolchain w/ headers >= 5.9"
+	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_9
diff --git a/package/podman/Config.in b/package/podman/Config.in
index a6554a3ddc..7884171380 100644
--- a/package/podman/Config.in
+++ b/package/podman/Config.in
@@ -72,11 +72,11 @@ choice
 
 config BR2_PACKAGE_PODMAN_NET_PASST
 	bool "passt/pasta"
-	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_0  # passt
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_9  # passt
 	select BR2_PACKAGE_PASST  # runtime
 
-comment "passt/pasta backend needs a toolchain w/ headers >= 5.0"
-	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_0
+comment "passt/pasta backend needs a toolchain w/ headers >= 5.9"
+	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_9
 
 config BR2_PACKAGE_PODMAN_NET_SLIRP4NETNS
 	bool "slirp4netns"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
