Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56199D41C27
	for <buildroot@archiver.kernel.org>; Wed, 13 Nov 2024 09:54:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CFB7D8057F;
	Wed, 13 Nov 2024 09:54:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XqLF0Qm-OprM; Wed, 13 Nov 2024 09:54:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C339380582
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C339380582;
	Wed, 13 Nov 2024 09:54:32 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 175C1E2E
 for <buildroot@buildroot.org>; Wed, 13 Nov 2024 09:54:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0315840B03
 for <buildroot@buildroot.org>; Wed, 13 Nov 2024 09:53:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pIATlloESnjV for <buildroot@buildroot.org>;
 Wed, 13 Nov 2024 09:53:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8832940AFE
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8832940AFE
 for <buildroot@buildroot.org>; Wed, 13 Nov 2024 09:53:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 785398621E; Wed, 13 Nov 2024 09:53:51 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 13 Nov 2024 09:29:59 +0100
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: c8198f6e0f464c135c24b78928408a38a2d7c35d
X-Git-Newrev: 484e0336244f728c50a9259114e83ed1adb0aabc
X-Patchwork-Hint: ignore
Message-Id: <20241113095351.785398621E@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/ntp: remove the
 obsolete patch
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

commit: https://git.buildroot.net/buildroot/commit/?id=484e0336244f728c50a9259114e83ed1adb0aabc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

0001-nano.patch: both MOD_NANO and MOD_TAI were added to glibc 2.12
on 2011-03-30 in commit 83fe108b0a9bc4f2deb14695bb0c8b2011e79f28.
They were added to musl 0.7.5 in commit f5ba2bc9c on 2011-03-18. And
they were added to uClibc 1.0.23 in commit 2d8ea0524b on 2017-03-17. We
consider all of these old enough to assume they always exist.

Renumber the remaining patches.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
(cherry picked from commit eee73d0cc0a9fe9373ad72851276a528e5e829da)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .checkpackageignore                                |  3 +--
 package/ntp/0001-nano.patch                        | 28 ----------------------
 ...back.patch => 0001-ntp-syscalls-fallback.patch} |  0
 ...k.patch => 0002-fix-pthread-detach-check.patch} |  0
 4 files changed, 1 insertion(+), 30 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 62ba818026..b620280e16 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -889,8 +889,7 @@ package/norm/0001-protolib-drop-linux-version-check.patch Upstream
 package/norm/0002-Use-print-as-function-call-for-Python3-compatibility.patch Upstream
 package/norm/0003-Fix-mixed-tabs-spaces-in-protolib-wscript.patch Upstream
 package/nss-pam-ldapd/S45nslcd EmptyLastLine Indent Shellcheck Variables
-package/ntp/0001-nano.patch Upstream
-package/ntp/0002-ntp-syscalls-fallback.patch Upstream
+package/ntp/0001-ntp-syscalls-fallback.patch Upstream
 package/ntp/S49ntp.in Variables
 package/ntpsec/0001-wscript-remove-checks-for-bsd-string.h-fixes-host-co.patch Upstream
 package/numactl/0001-link-with-latomic-if-needed-again.patch Upstream
diff --git a/package/ntp/0001-nano.patch b/package/ntp/0001-nano.patch
deleted file mode 100644
index bce3478261..0000000000
--- a/package/ntp/0001-nano.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-Fixes issues with glibc header files, see
-http://bugs.gentoo.org/show_bug.cgi?id=270483
-
-Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
-
-Rebase to apply cleanly.
-
-Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
-
-
-diff -purN a/include/ntp_syscall.h b/include/ntp_syscall.h
---- a/include/ntp_syscall.h	2015-02-11 08:42:37.794576469 -0500
-+++ b/include/ntp_syscall.h	2015-02-11 08:43:03.216957279 -0500
-@@ -10,6 +10,14 @@
- # include <sys/timex.h>
- #endif
- 
-+#if defined(ADJ_NANO) && !defined(MOD_NANO)
-+#define MOD_NANO ADJ_NANO
-+#endif
-+
-+#if defined(ADJ_TAI) && !defined(MOD_TAI)
-+#define MOD_TAI ADJ_TAI
-+#endif
-+
- #ifndef NTP_SYSCALLS_LIBC
- # ifdef NTP_SYSCALLS_STD
- #  define ntp_adjtime(t)	syscall(SYS_ntp_adjtime, (t))
diff --git a/package/ntp/0002-ntp-syscalls-fallback.patch b/package/ntp/0001-ntp-syscalls-fallback.patch
similarity index 100%
rename from package/ntp/0002-ntp-syscalls-fallback.patch
rename to package/ntp/0001-ntp-syscalls-fallback.patch
diff --git a/package/ntp/0003-fix-pthread-detach-check.patch b/package/ntp/0002-fix-pthread-detach-check.patch
similarity index 100%
rename from package/ntp/0003-fix-pthread-detach-check.patch
rename to package/ntp/0002-fix-pthread-detach-check.patch
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
