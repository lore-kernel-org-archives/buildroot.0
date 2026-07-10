Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB7C9C43458
	for <buildroot@archiver.kernel.org>; Fri, 10 Jul 2026 16:30:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 993FA60A40;
	Fri, 10 Jul 2026 16:30:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 58RWKcT1Bs3g; Fri, 10 Jul 2026 16:30:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BFF22605DF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783701023;
	bh=cvHwEbe6AWBs3wUACA2VaWmAVF538I05Jv2pSSsq/fs=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=DwQa7E1CUmXP0IEXuM9JuoHaqOB3eRw4xBpBZ28frzmZbYZPu4G3GJf4z3oiazGo5
	 0bCXH9qnXICKT6meJwreOanViPvZbcCH+tBawXLSB1EfydSX6Ta5BPC/sGB5NlIs6k
	 XP3tfAuZQvR69QuprW3IPaUinbq50l1xTrHBnLhWIi+p+9d6gP2KQKb/eRDChdu6/c
	 PhLOspH0m5+na1i87NXUZ/ME34VULLkKEjqbSBtc+4lmlbXE3+yYLXXHCerkvW4y0C
	 XuoqOrIofTci2jh+s4+3enUir1PhWO1FDg24paoDWM8c/Xh696ivKhdLHfOm6edui/
	 Cb4ohSAf7tiBA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id BFF22605DF;
	Fri, 10 Jul 2026 16:30:23 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id B261A2FE
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 16:30:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A49FB80FEF
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 16:30:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hr_UnaiiYOYc for <buildroot@buildroot.org>;
 Fri, 10 Jul 2026 16:30:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CD92580F24
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id CD92580F24
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 16:30:21 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E861B8869C; Fri, 10 Jul 2026 16:29:48 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 10 Jul 2026 18:29:09 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c804ebff5502eac6e7d84129bfb2becc400898c6
X-Git-Newrev: d1111db6fc1b96579d799acba3edc177de9dc7a9
X-Patchwork-Hint: ignore
Message-Id: <20260710162948.E861B8869C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/acl: security bump version to 2.4.0
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/d1111db6fc1b96579d799acba3edc177de9dc7a9
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://lists.nongnu.org/archive/html/acl-devel/2026-06/msg00000.html

Fixes CVE-2026-54369, CVE-2026-54370 and CVE-2026-54371.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/acl/acl.hash | 2 +-
 package/acl/acl.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/acl/acl.hash b/package/acl/acl.hash
index a6094fb985..bca535af59 100644
--- a/package/acl/acl.hash
+++ b/package/acl/acl.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-sha256  97203a72cae99ab89a067fe2210c1cbf052bc492b479eca7d226d9830883b0bd  acl-2.3.2.tar.xz
+sha256  e661131456d2708a01c614a0f400e11d7d1bfaeb6f3e74b75bb980b72f0161a3  acl-2.4.0.tar.xz
 
 # Locally calculated
 sha256  a45a845012742796534f7e91fe623262ccfb99460a2bd04015bd28d66fba95b8  doc/COPYING
diff --git a/package/acl/acl.mk b/package/acl/acl.mk
index 6ae0581ef5..f311526be6 100644
--- a/package/acl/acl.mk
+++ b/package/acl/acl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ACL_VERSION = 2.3.2
+ACL_VERSION = 2.4.0
 ACL_SOURCE = acl-$(ACL_VERSION).tar.xz
 ACL_SITE = https://download.savannah.nongnu.org/releases/acl
 ACL_LICENSE = GPL-2.0+ (programs), LGPL-2.1+ (libraries)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
