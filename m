Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0844BCD5BD0
	for <buildroot@archiver.kernel.org>; Sat, 30 May 2026 20:31:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CC7EA4293F;
	Sat, 30 May 2026 20:31:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DeednMT-CBNh; Sat, 30 May 2026 20:31:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E8C0342940
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780173112;
	bh=RPb0O1ArqZ832ncO1unLfUceCLneTxv5W27zQeSIw8k=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=hu4k9ojmT97IxR1t+eL4yM0B5yxu/S54g8Q53dv1L3eGg2ez3hIC9vfpav4eln4e2
	 rekexsjs54CkuR/TUs0ZGjwgkqApjI7QP9QzPG9RftDUlQs3bvzSXIoQN55a6uGOED
	 Hje5xsD5ScysVBcHfEVVcleV3i23chB8f3u6Yu8Ki0aqM2uWbnymntK06A7pUzJUr5
	 iGCYqeTqTwXTDVKvwDbTz5tEnwVURmC8jI9prQCk3WxYoty1WgYHt5EkOi8qb+HjrD
	 3itreoFQWsvA/b2+qUiPRVYsf5HkJxfBMAz0DRh8k3+XkV9t8279jRbn8HvCGnG3/k
	 154JqKWYMq/zw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E8C0342940;
	Sat, 30 May 2026 20:31:51 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id B444EF4
 for <buildroot@buildroot.org>; Sat, 30 May 2026 20:31:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A65866F5D7
 for <buildroot@buildroot.org>; Sat, 30 May 2026 20:31:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zvdnLOhqFJ2n for <buildroot@buildroot.org>;
 Sat, 30 May 2026 20:31:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B78606F5D6
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id B78606F5D6
 for <buildroot@buildroot.org>; Sat, 30 May 2026 20:31:46 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 91D668758C; Sat, 30 May 2026 20:31:33 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 30 May 2026 22:31:25 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 13a0129b0a5732f3b134737c6b70a349165580a2
X-Git-Newrev: e139c3692580e40aff8e54672bc585ed2b79a67e
X-Patchwork-Hint: ignore
Message-Id: <20260530203133.91D668758C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/php: propagate postgresql
 dependencies properly
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/e139c3692580e40aff8e54672bc585ed2b79a67e
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Commit 9e7172ceac1e93a7167031a50edbff813c4b4774 bumped postgresql and
had to disable postgresql on Sparc. This dependency was unfortunately
not properly propagated to BR2_PACKAGE_PHP_EXT_PDO_POSTGRESQL, causing
the following Kconfig warning:

WARNING: unmet direct dependencies detected for BR2_PACKAGE_POSTGRESQL
  Depends on [n]: BR2_USE_MMU [=y] && !BR2_sparc [=y] && BR2_USE_WCHAR [=y] && BR2_ENABLE_LOCALE [=y] && BR2_TOOLCHAIN_HAS_THREADS_NPTL [=y] && !BR2_STATIC_LIBS [=n] && !BR2_OPTIMIZE_FAST [=n]
  Selected by [y]:
  - BR2_PACKAGE_PHP_EXT_PDO_POSTGRESQL [=y] && BR2_PACKAGE_PHP [=y] && BR2_PACKAGE_PHP_EXT_PDO [=y] && BR2_USE_MMU [=y] && BR2_USE_WCHAR [=y] && BR2_ENABLE_LOCALE [=y] && BR2_TOOLCHAIN_HAS_THREADS_NPTL [=y] && !BR2_STATIC_LIBS [=n] && !BR2_OPTIMIZE_FAST [=n]

We fix this by properly propagating the dependency.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/php/Config.ext | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/php/Config.ext b/package/php/Config.ext
index 8948ff3484..c96ce5f34a 100644
--- a/package/php/Config.ext
+++ b/package/php/Config.ext
@@ -169,6 +169,7 @@ config BR2_PACKAGE_PHP_EXT_PDO_MYSQL
 config BR2_PACKAGE_PHP_EXT_PDO_POSTGRESQL
 	bool "PostgreSQL"
 	depends on BR2_USE_MMU # postgresql
+	depends on !BR2_sparc # postgresql
 	depends on BR2_USE_WCHAR # postgresql
 	depends on BR2_ENABLE_LOCALE # postgresql
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # postgresql
@@ -180,6 +181,7 @@ config BR2_PACKAGE_PHP_EXT_PDO_POSTGRESQL
 
 comment "PostgreSQL drivers need a toolchain w/ wchar, dynamic library"
 	depends on BR2_USE_MMU
+	depends on !BR2_sparc
 	depends on BR2_STATIC_LIBS || !BR2_USE_WCHAR
 
 comment "PostgreSQL drivers can't be built with Optimize for fast"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
