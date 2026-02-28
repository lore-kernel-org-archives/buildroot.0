Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14BEBFEE4E9
	for <buildroot@archiver.kernel.org>; Sat, 28 Feb 2026 10:54:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A63CD418E9;
	Sat, 28 Feb 2026 10:54:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NpIth1KZVn8U; Sat, 28 Feb 2026 10:54:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C538C418A8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772276063;
	bh=amn1qo3sBukwAMpskIuziX8YbGfEY7nlVgCy2HvF/eI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=s625q3KBpFnFbLgxxEBgFznxp182MzsB8GAZqHaT7vnMEA8izU8uPWeQO6GwdmN2n
	 awkKsQ2yBjaq6gMjJ55+kHJ1sAqZXULWCOubpgHV7OpwHMX5+97vt7eNSkGSgrNfG3
	 dx4klhEd99xQkarCYNhTLrDyjZqMhleMd5aWAh86lhXBBh4fkosNoZzsYyL/7yo+Mz
	 vlSB2FaP5kkeDxaPbUp2I5iaYZQW5FmuCw5ZwwDe6iZdbURB+nBYFEMIMPBLbscSLT
	 8msmtq+eKuysbtsSRXD9ajOo9oBewTSF3rNBaMiolHHdpPhRjoyJakmkUac80BJmjF
	 Spbc/R+rqvWUg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C538C418A8;
	Sat, 28 Feb 2026 10:54:23 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id ACF7C18D
 for <buildroot@buildroot.org>; Sat, 28 Feb 2026 10:54:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9EAC060EB2
 for <buildroot@buildroot.org>; Sat, 28 Feb 2026 10:54:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ymR1xwKSNKjR for <buildroot@buildroot.org>;
 Sat, 28 Feb 2026 10:54:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D9B606087B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id D9B606087B
 for <buildroot@buildroot.org>; Sat, 28 Feb 2026 10:54:21 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C524B856A7; Sat, 28 Feb 2026 10:54:21 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 28 Feb 2026 11:22:16 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f54e7d710c6dd7d46702304ec8d7ea9e7a8252ec
X-Git-Newrev: f47b624a12d38f23809c0d82c94588c3a3d26d16
X-Patchwork-Hint: ignore
Message-Id: <20260228105421.C524B856A7@busybox.osuosl.org>
Subject: [Buildroot] [git commit] {linux, linux-headers}: bump 6.{18,
 19}.x series
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/f47b624a12d38f23809c0d82c94588c3a3d26d16
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 linux/{6.19.3 => 6.19.5}                   | 0
 linux/Config.in                            | 2 +-
 linux/from-6.17/linux.hash                 | 4 ++--
 package/linux-headers/{6.18.13 => 6.18.15} | 0
 package/linux-headers/{6.19.3 => 6.19.5}   | 0
 package/linux-headers/Config.in.host       | 4 ++--
 6 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/linux/6.19.3 b/linux/6.19.5
similarity index 100%
rename from linux/6.19.3
rename to linux/6.19.5
diff --git a/linux/Config.in b/linux/Config.in
index 73a8059523..32b74f817d 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -141,7 +141,7 @@ config BR2_LINUX_KERNEL_CUSTOM_REPO_GIT_SUBMODULES
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "6.19.3" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "6.19.5" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "5.10.246-cip66" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "5.10.246-cip66-rt29" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
diff --git a/linux/from-6.17/linux.hash b/linux/from-6.17/linux.hash
index 8f4d558e8d..20618f4da0 100644
--- a/linux/from-6.17/linux.hash
+++ b/linux/from-6.17/linux.hash
@@ -1,6 +1,6 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  0e474968adfcbee32916fd01a89d8ccfd1168d8d32569e76a5c664c793198ebe  linux-6.19.3.tar.xz
-sha256  ed2c3c55fd38e6836c094fce356f2567f9516130b73354a29857960368c5687f  linux-6.18.13.tar.xz
+sha256  95ae05c8c709e353c0e8506c072efc5598d85b8b7b564a1ebac7ee8345042ffa  linux-6.19.5.tar.xz
+sha256  7c716216c3c4134ed0de69195701e677577bbcdd3979f331c182acd06bf2f170  linux-6.18.15.tar.xz
 
 # Licenses hashes
 sha256  fb5a425bd3b3cd6071a3a9aff9909a859e7c1158d54d32e07658398cd67eb6a0  COPYING
diff --git a/package/linux-headers/6.18.13 b/package/linux-headers/6.18.15
similarity index 100%
rename from package/linux-headers/6.18.13
rename to package/linux-headers/6.18.15
diff --git a/package/linux-headers/6.19.3 b/package/linux-headers/6.19.5
similarity index 100%
rename from package/linux-headers/6.19.3
rename to package/linux-headers/6.19.5
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 4745ff148e..f8364d0c7b 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -469,8 +469,8 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "6.1.164"	if BR2_KERNEL_HEADERS_6_1
 	default "6.6.127"	if BR2_KERNEL_HEADERS_6_6
 	default "6.12.74"	if BR2_KERNEL_HEADERS_6_12
-	default "6.18.13"	if BR2_KERNEL_HEADERS_6_18
-	default "6.19.3"	if BR2_KERNEL_HEADERS_6_19
+	default "6.18.15"	if BR2_KERNEL_HEADERS_6_18
+	default "6.19.5"	if BR2_KERNEL_HEADERS_6_19
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
