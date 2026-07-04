Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7266C43458
	for <buildroot@archiver.kernel.org>; Sat,  4 Jul 2026 16:24:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 95D1E40908;
	Sat,  4 Jul 2026 16:24:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id daq8viYb9oPr; Sat,  4 Jul 2026 16:24:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F2867408B6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783182255;
	bh=EUPJY9zyHdJV2N19tmEoesYqPjL5JTPUBPYoRsZKY18=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=EPHkFZsaGoLyMO+Sx/2x4oSkhA5Q4AdOKASUcmw7cAAq6auk1TxhFCNIYTCQt2FTC
	 EjsU3O5sbEYi82GD878hSRWlgnANTo4STSTQYl1JSNUpjdrsIOAgAKQvgWTrWtsudA
	 4ySEJVlzTdZKpx2+/DZ3XQsgrjAdR/UB8gkFCFyiqA9mvy28/cQ6eLX5QOTDSsP6Jq
	 lSkE7QruxH7QEHIQV6a83toYvM6qjx+Dhr2H+26PAVahLVhDtWHKHnSRldwVv4aKKN
	 sAbofpwj9+2yzONZ+mh1hLm17OnV9IwGz+tOvLq8Bb1CkY8tWwvHzJIb0NhyQ06pYx
	 xHEz/9YXHgWvw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id F2867408B6;
	Sat,  4 Jul 2026 16:24:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id BC863316
 for <buildroot@buildroot.org>; Sat,  4 Jul 2026 16:24:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AEF8680F51
 for <buildroot@buildroot.org>; Sat,  4 Jul 2026 16:24:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FVBvbj1g_vni for <buildroot@buildroot.org>;
 Sat,  4 Jul 2026 16:24:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EFD1980F36
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id EFD1980F36
 for <buildroot@buildroot.org>; Sat,  4 Jul 2026 16:24:12 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 090DB883FF; Sat,  4 Jul 2026 16:23:43 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 4 Jul 2026 18:16:51 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e224289c147f316704c3672899f9964c5f1cdd9c
X-Git-Newrev: 56940f0620025509d141da6dfca01a714a18392d
X-Patchwork-Hint: ignore
Message-Id: <20260704162343.090DB883FF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/openvpn: security bump version to
 2.7.5
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/56940f0620025509d141da6dfca01a714a18392d
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/OpenVPN/openvpn/blob/v2.7.5/Changes.rst

Fixes CVE-2026-11771, CVE-2026-12932, CVE-2026-12996, CVE-2026-13117,
CVE-2026-13122, CVE-2026-13379 & CVE-2026-13698.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/openvpn/openvpn.hash | 2 +-
 package/openvpn/openvpn.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/openvpn/openvpn.hash b/package/openvpn/openvpn.hash
index 438212a4bb..651f430534 100644
--- a/package/openvpn/openvpn.hash
+++ b/package/openvpn/openvpn.hash
@@ -1,3 +1,3 @@
 # Locally calculated after checking signature
-sha256  18db05f3d5eee3663db1914590044e5f96ff5cd47b6e7846c6a350806c23dbce  openvpn-2.7.4.tar.gz
+sha256  c6864b3c7d4e059c7d6ce22d1b5fa646c8b379a06af872eeb9792b6083a44ac4  openvpn-2.7.5.tar.gz
 sha256  edaef632cbb643e4e7a221717a6c441a4c1a7c918e6e4d56debc3d8739b233f6  COPYRIGHT.GPL
diff --git a/package/openvpn/openvpn.mk b/package/openvpn/openvpn.mk
index 68f0d30e4c..d5fd308e63 100644
--- a/package/openvpn/openvpn.mk
+++ b/package/openvpn/openvpn.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPENVPN_VERSION = 2.7.4
+OPENVPN_VERSION = 2.7.5
 OPENVPN_SITE = https://swupdate.openvpn.net/community/releases
 OPENVPN_DEPENDENCIES = host-pkgconf libcap-ng
 OPENVPN_LICENSE = GPL-2.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
