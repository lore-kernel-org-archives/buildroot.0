Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6870C44515
	for <buildroot@archiver.kernel.org>; Fri, 17 Jul 2026 15:45:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7D7C640AC0;
	Fri, 17 Jul 2026 15:45:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pouw-8XvujZw; Fri, 17 Jul 2026 15:45:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4A0D940A4B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784303154;
	bh=qRtH5vjzA1X75lXimMqHpMMh3i/0xUs+jkhApAYov0U=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=q5RDee2LdlUAvDoVm1acQVT2Z4uvM5LTPkH3hmv5Ba3pnBg/qEy54y4BxvQeDgQSy
	 40/FN1Iv7ytf5GJjTIbL+htCW5TUOefPOinPN/C+AgfQH5EQW73WnYkTR1skeMWhFA
	 3SYFFdo+xkXruT0u2Y87V5n60nFIZZfGuXX3Zot6cSRmInVEuX7LHXv7ztsHCYJ8ly
	 5heSWrJdfbgj0ArE1A1q7Nkk2WDZgZJ6NKvBc7MAR5DQMn8PG6lQ/EAxl+YR8M8oyS
	 bXKof9ZDJSkKb9m7vkDthsZH+wVj0hNokFbYYKbZdTwoaI3vTTUBfjLAwOGFJPqPRv
	 3uNzYD94fWsHg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4A0D940A4B;
	Fri, 17 Jul 2026 15:45:54 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id EC4A8435
 for <buildroot@buildroot.org>; Fri, 17 Jul 2026 15:45:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D230960ACF
 for <buildroot@buildroot.org>; Fri, 17 Jul 2026 15:45:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zL_IXqNZM7Lo for <buildroot@buildroot.org>;
 Fri, 17 Jul 2026 15:45:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EDFFE60AC6
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id EDFFE60AC6
 for <buildroot@buildroot.org>; Fri, 17 Jul 2026 15:45:46 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BAD5A88E51; Fri, 17 Jul 2026 15:45:10 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 17 Jul 2026 11:03:09 +0200
X-Git-Refname: refs/heads/2026.05.x
X-Git-Oldrev: 1b4724a8a104f900d81b044d953a06f9e2d57123
X-Git-Newrev: e9770b9c5b108ada1289476e6c85a3c058e5d250
X-Patchwork-Hint: ignore
Message-Id: <20260717154510.BAD5A88E51@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.05.x] package/samba4: fix build
 on m68k
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/e9770b9c5b108ada1289476e6c85a3c058e5d250
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.05.x

samba4 uses very big switch statements, which causes the build to fail
on m68k, because the offsets there are only 16-bit.

We fix that by using -mlong-jump-table-offsets on m68k to use 32-bit
offsets for switch statements, but this is only available starting with
gcc 7 [0] [1].

Only one package selects samba4, mpd, but it already depends on gcc
>= 12. As such, we do not need to propagate that new dependency.

Fixes:
https://autobuild.buildroot.net/results/b60/b606da691bb462879d4f9769928b5a40b9170837/

[0] https://gcc.gnu.org/bugzilla/show_bug.cgi?id=57583#c15
[1] https://gcc.gnu.org/bugzilla/show_bug.cgi?id=57583#c16

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 053615b6a769826ff77dd0ccb1bef08a12943fdc)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/samba4/Config.in | 5 +++++
 package/samba4/samba4.mk | 5 +++++
 2 files changed, 10 insertions(+)

diff --git a/package/samba4/Config.in b/package/samba4/Config.in
index e1d3dd9bf7..59f040e96a 100644
--- a/package/samba4/Config.in
+++ b/package/samba4/Config.in
@@ -4,6 +4,10 @@ comment "samba4 needs a uClibc or glibc toolchain w/ wchar, dynamic library, NPT
 		|| BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS_NPTL
 	depends on BR2_USE_MMU
 
+comment "samba4 needs a toolchain w/ gcc >= 7"
+	depends on BR2_m68k
+	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_7
+
 config BR2_PACKAGE_SAMBA4
 	bool "samba4"
 	depends on BR2_USE_MMU # fork()
@@ -12,6 +16,7 @@ config BR2_PACKAGE_SAMBA4
 	depends on !BR2_STATIC_LIBS # cmocka, python, gnutls
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on !BR2_TOOLCHAIN_USES_MUSL
+	depends on !BR2_m68k || BR2_TOOLCHAIN_GCC_AT_LEAST_7 # m68k needs gcc >= 7.x
 	select BR2_PACKAGE_CMOCKA
 	select BR2_PACKAGE_E2FSPROGS
 	select BR2_PACKAGE_GNUTLS
diff --git a/package/samba4/samba4.mk b/package/samba4/samba4.mk
index 2d6bc80b9e..006fbff6c5 100644
--- a/package/samba4/samba4.mk
+++ b/package/samba4/samba4.mk
@@ -32,6 +32,11 @@ SAMBA4_CONF_ENV = \
 	XSLTPROC=false \
 	WAF_NO_PREFORK=1
 
+# m68k needs 32-bit offsets in switch tables to build
+ifeq ($(BR2_m68k),y)
+SAMBA4_CFLAGS += -mlong-jump-table-offsets
+endif
+
 SAMBA4_PYTHON = PYTHON="$(HOST_DIR)/bin/python3"
 ifeq ($(BR2_PACKAGE_PYTHON3),y)
 SAMBA4_PYTHON += PYTHON_CONFIG="$(STAGING_DIR)/usr/bin/python3-config"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
