Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B99B0C43602
	for <buildroot@archiver.kernel.org>; Fri,  3 Jul 2026 14:28:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8E6C182664;
	Fri,  3 Jul 2026 14:28:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ze6JbMxe1nzg; Fri,  3 Jul 2026 14:28:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EEED88272A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783088925;
	bh=oV1MoNTp84JwfTQ09lyDIn+6envho2fi2IMcFaudaUs=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Wf6jWisgQvK7+i221TdY3hdjfj1dZTg2dbmxcReU2+ZLwDJeQ8VPatDoPSH7q6XiL
	 6/oo9MGDdRF8sKZ1rbpnCueaaol669ceTXjyHzO0WsvZYXJkrAvnmziKjk1/xy/I47
	 bgoEat8b5oEdg1ra80nUP7SSDMDkAtAlyyS85sNdYZtAs9Ar2hj3DCUFmYx46EWFw+
	 p0vDa+aY/3+KAte3YSHe63Z4Dd3uPvahdSr8+PoaHbHUQEvON54stkrOM5T4tEpEyB
	 FBVjOV+uwo/bo+vlJi7dOK7nSqTQS5cX3Hbs+u8bdgsm//5Cxahd4x00Wr1h2Y1aws
	 unULZ0WuZ8ivg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id EEED88272A;
	Fri,  3 Jul 2026 14:28:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id A7596363
 for <buildroot@buildroot.org>; Fri,  3 Jul 2026 14:28:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 99E1E40EA8
 for <buildroot@buildroot.org>; Fri,  3 Jul 2026 14:28:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lLyvkxxpVtr8 for <buildroot@buildroot.org>;
 Fri,  3 Jul 2026 14:28:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A0B9441178
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id A0B9441178
 for <buildroot@buildroot.org>; Fri,  3 Jul 2026 14:28:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 42228883A2; Fri,  3 Jul 2026 14:27:58 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 2 Jul 2026 21:33:03 +0200
X-Git-Refname: refs/heads/2026.05.x
X-Git-Oldrev: 9b6388b486734c853968a89f11a40754abcd4ecd
X-Git-Newrev: bd47a97aeab687fc085ca7e477727c7b810859c6
X-Patchwork-Hint: ignore
Message-Id: <20260703142758.42228883A2@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.05.x] package/util-linux: allow
 musl build for login/runuser/su
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/bd47a97aeab687fc085ca7e477727c7b810859c6
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.05.x

Buildroot commit f89ca996b6deb660b53c33196b8b309fac659bf9 fixed the
build of linux-pam with musl in 2020 but did not remove the restric-
tions in place for login/runuser/su which were added earlier with
these commits:

login (2015): 25ecd24579f293ef4fcc6847094c4af39f4113af
runuser (2017): 09860f354ae0824cfead384e994d3f119e22b851
su (2017): c6488923fb785ac11f6ec78e53db5da22203b178

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
(cherry picked from commit 91d356ee7e85016e659fece19c9cd660b3cb4787)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/util-linux/Config.in | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/package/util-linux/Config.in b/package/util-linux/Config.in
index 3df149b3de..e6ee4c3ced 100644
--- a/package/util-linux/Config.in
+++ b/package/util-linux/Config.in
@@ -210,17 +210,15 @@ config BR2_PACKAGE_UTIL_LINUX_LOGIN
 	depends on BR2_ENABLE_LOCALE # linux-pam
 	depends on BR2_USE_WCHAR # linux-pam
 	depends on !BR2_STATIC_LIBS # linux-pam
-	depends on !BR2_TOOLCHAIN_USES_MUSL # linux-pam
 	depends on BR2_USE_MMU # fork(), linux-pam
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # linux-pam
 	select BR2_PACKAGE_LINUX_PAM
 	help
 	  Begin a session on the system
 
-comment "login needs a uClibc or glibc toolchain w/ wchar, locale, dynamic library, gcc >= 4.9"
+comment "login needs a toolchain w/ wchar, locale, dynamic library, gcc >= 4.9"
 	depends on !(BR2_ENABLE_LOCALE && BR2_USE_WCHAR) \
 		|| BR2_STATIC_LIBS \
-		|| BR2_TOOLCHAIN_USES_MUSL \
 		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
 
 config BR2_PACKAGE_UTIL_LINUX_LOSETUP
@@ -366,7 +364,6 @@ config BR2_PACKAGE_UTIL_LINUX_RUNUSER
 	bool "runuser"
 	depends on (BR2_ENABLE_LOCALE && BR2_USE_WCHAR) # linux-pam
 	depends on !BR2_STATIC_LIBS
-	depends on !BR2_TOOLCHAIN_USES_MUSL # linux-pam
 	depends on BR2_USE_MMU # fork(), linux-pam
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # linux-pam
 	select BR2_PACKAGE_LINUX_PAM
@@ -375,10 +372,9 @@ config BR2_PACKAGE_UTIL_LINUX_RUNUSER
 	  to ask for a password, because it may be executed by the root
 	  user only)
 
-comment "runuser needs a uClibc or glibc toolchain w/ wchar, locale, dynamic library, gcc >= 4.9"
+comment "runuser needs a toolchain w/ wchar, locale, dynamic library, gcc >= 4.9"
 	depends on !(BR2_ENABLE_LOCALE && BR2_USE_WCHAR) \
 		|| BR2_STATIC_LIBS \
-		|| BR2_TOOLCHAIN_USES_MUSL \
 		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
 
 config BR2_PACKAGE_UTIL_LINUX_SCHEDUTILS
@@ -411,17 +407,15 @@ config BR2_PACKAGE_UTIL_LINUX_SU
 	bool "su"
 	depends on (BR2_ENABLE_LOCALE && BR2_USE_WCHAR) # linux-pam
 	depends on !BR2_STATIC_LIBS
-	depends on !BR2_TOOLCHAIN_USES_MUSL # linux-pam
 	depends on BR2_USE_MMU # fork(), linux-pam
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # linux-pam
 	select BR2_PACKAGE_LINUX_PAM
 	help
 	  Run a command with substitute user and group ID
 
-comment "su needs a uClibc or glibc toolchain w/ wchar, locale, dynamic library, gcc >= 4.9"
+comment "su needs a toolchain w/ wchar, locale, dynamic library, gcc >= 4.9"
 	depends on !(BR2_ENABLE_LOCALE && BR2_USE_WCHAR) \
 		|| BR2_STATIC_LIBS \
-		|| BR2_TOOLCHAIN_USES_MUSL \
 		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
 
 config BR2_PACKAGE_UTIL_LINUX_SULOGIN
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
