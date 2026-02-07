Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6ADCEE0AE8
	for <buildroot@archiver.kernel.org>; Sat,  7 Feb 2026 21:28:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9E1B5606BA;
	Sat,  7 Feb 2026 21:28:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9n8O3QnauIOb; Sat,  7 Feb 2026 21:28:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E072B60689
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770499716;
	bh=mFVj4FzgXyxxhh/R3GTQom4Azy96WsmzeROcJR2GmKk=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=fM+9MWn7UB0rOzq9niATsOZAlvzF0D5UUGKGlovB8HREP0gAntH62tFdA8IQKpv2A
	 uyZ9IMhQEbe5dK2SwNvEog3D7/Fh96yMctPEG6WIsEZhM7mSU7qTB+XZy4KX9G0RK5
	 xDGNXIm0OzPLZhmvf84eh9KJcynqrInNuHmbL+7QitOZ9q6jm3yQa6ap+L/mTvlzuj
	 2LcDPTDbmzMeIv6ohYJTXZZJiGfaM7KJiG73hRXR+54MonWWp8q8XHRxf/GGdCXXN8
	 /Zwb/zHvU4pjw4wLy2JFJ0Mzg06eJVF22sQwH8/oFl+YN5A84ZnEyu1JBpnRTWdM11
	 0xNDJAtErMC9g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E072B60689;
	Sat,  7 Feb 2026 21:28:35 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 79225379
 for <buildroot@buildroot.org>; Sat,  7 Feb 2026 21:28:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5B8E96068A
 for <buildroot@buildroot.org>; Sat,  7 Feb 2026 21:28:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NmjF_CoxgVCe for <buildroot@buildroot.org>;
 Sat,  7 Feb 2026 21:28:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9C81060689
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9C81060689
 for <buildroot@buildroot.org>; Sat,  7 Feb 2026 21:28:32 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7E21786A4E; Sat,  7 Feb 2026 21:28:32 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 7 Feb 2026 22:19:19 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 39e618441981da3da173c9f717c7dc5977760c95
X-Git-Newrev: 7e72901eefeab51c7f718d4c8ce0d10d08f1c657
X-Patchwork-Hint: ignore
Message-Id: <20260207212832.7E21786A4E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/shadow: ensure that SHA support is
 enabled when requested
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/7e72901eefeab51c7f718d4c8ce0d10d08f1c657
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Ensure that the SHA_CRYPT option is enabled when the system configuration is
set to SHA256/512, as otherwise passwd complains when a password is changed:

passwd
...
Invalid ENCRYPT_METHOD value: 'SHA512'.
Defaulting to DES.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/shadow/Config.in | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/shadow/Config.in b/package/shadow/Config.in
index bbbea811ce..93216bd14c 100644
--- a/package/shadow/Config.in
+++ b/package/shadow/Config.in
@@ -3,6 +3,9 @@ menuconfig BR2_PACKAGE_SHADOW
 	depends on !BR2_STATIC_LIBS
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_14
 	select BR2_PACKAGE_LIBXCRYPT if BR2_TOOLCHAIN_USES_GLIBC
+	select BR2_PACKAGE_SHADOW_SHA_CRYPT if \
+	       (BR2_TARGET_GENERIC_PASSWD_SHA256 || \
+	        BR2_TARGET_GENERIC_PASSWD_SHA512)
 	help
 	  Utilities to deal with user accounts.
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
