Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B3B9C43327
	for <buildroot@archiver.kernel.org>; Thu,  2 Jul 2026 06:45:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CA9E240EB1;
	Thu,  2 Jul 2026 06:45:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Z7ccSDYrhM3Z; Thu,  2 Jul 2026 06:45:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EC00240EE8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782974710;
	bh=6+29wxnse8n1/Zsla7/9pzndXH1dtQBCmDPF5XBBMHI=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ihKmcEhHe57+f4D5siMXMWiPUDXBf0QsmkMFM4ykt9AyazXOTV4HCfQy8Xqncjxsf
	 zvS9Cz/2ZgAnjmrx+/6hBCoADbZT1IJALZYtWO+Ve8amhxiMbdKXTmO7hwBl9ynvgy
	 ZyUbzrzl5YaAl4HOkma4A5nxRY+NUvGwAwoD+mk7ZjZbhChe06zYpv5ajiIr+pdDCq
	 PMVjvqSwaiJxbToW+M8AzkwasLCb6I5cI76WY+M66CDurXP8vENDLzXYz9Jxy4kdta
	 WKGObYzHKR2GPjcenFDYjBmJ7tlDRK0fEkACPk/oSkuf6V0LOb/2Ibv6Hh36QZ46Ih
	 TpkukzJICHeGQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id EC00240EE8;
	Thu,  2 Jul 2026 06:45:09 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 4FA8E4B5
 for <buildroot@buildroot.org>; Thu,  2 Jul 2026 06:45:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4C8AF40EB1
 for <buildroot@buildroot.org>; Thu,  2 Jul 2026 06:45:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id y7veySoLsDM9 for <buildroot@buildroot.org>;
 Thu,  2 Jul 2026 06:45:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A5C0740EA8
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id A5C0740EA8
 for <buildroot@buildroot.org>; Thu,  2 Jul 2026 06:45:07 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DFAE8880A1; Thu,  2 Jul 2026 06:44:38 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 2 Jul 2026 08:29:45 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8a66e2f197c850f23689087c468308559cd9b8a6
X-Git-Newrev: a8e8fc2fa453060093c6651ef81409bf4cae9788
X-Patchwork-Hint: ignore
Message-Id: <20260702064438.DFAE8880A1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] boot/opensbi: Bump to v1.8.1
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/a8e8fc2fa453060093c6651ef81409bf4cae9788
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

v1.8 release notes:

  https://github.com/riscv-software-src/opensbi/releases/tag/v1.8
  https://github.com/riscv-software-src/opensbi/releases/tag/v1.8.1

Signed-off-by: Joel Stanley <jms@oss.tenstorrent.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 boot/opensbi/Config.in    | 4 ++--
 boot/opensbi/opensbi.hash | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/boot/opensbi/Config.in b/boot/opensbi/Config.in
index 986e380b48..6e26da6344 100644
--- a/boot/opensbi/Config.in
+++ b/boot/opensbi/Config.in
@@ -19,7 +19,7 @@ choice
 	  Select the specific OpenSBI version you want to use
 
 config BR2_TARGET_OPENSBI_LATEST_VERSION
-	bool "1.7"
+	bool "Latest version (1.8.1)"
 
 config BR2_TARGET_OPENSBI_CUSTOM_VERSION
 	bool "Custom version"
@@ -57,7 +57,7 @@ endif
 
 config BR2_TARGET_OPENSBI_VERSION
 	string
-	default "1.7" if BR2_TARGET_OPENSBI_LATEST_VERSION
+	default "1.8.1" if BR2_TARGET_OPENSBI_LATEST_VERSION
 	default BR2_TARGET_OPENSBI_CUSTOM_VERSION_VALUE \
 		if BR2_TARGET_OPENSBI_CUSTOM_VERSION
 	default "custom" if BR2_TARGET_OPENSBI_CUSTOM_TARBALL
diff --git a/boot/opensbi/opensbi.hash b/boot/opensbi/opensbi.hash
index c82d2de236..661f08189e 100644
--- a/boot/opensbi/opensbi.hash
+++ b/boot/opensbi/opensbi.hash
@@ -1,3 +1,3 @@
 # locally computed
-sha256  2cf856a4e5e2e052948ddb54ba48232b1f698b7f52e0374fc7d17d51e8c8f7ce  opensbi-1.7.tar.gz
+sha256  fb1ae61a85e966322101acb1c982f84d9eaafc4de7dd474a7d7546d9bb321c6f  opensbi-1.8.1.tar.gz
 sha256  82d13fb1bf6bb162629deeea9eb9c117e74548d3b707e478967691fe79a68e21  COPYING.BSD
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
