Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26E22E77197
	for <buildroot@archiver.kernel.org>; Thu,  9 Jan 2025 15:12:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D4A47835CF;
	Thu,  9 Jan 2025 15:12:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KvCdXhRQbwyZ; Thu,  9 Jan 2025 15:12:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2741B835BA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2741B835BA;
	Thu,  9 Jan 2025 15:12:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id D43EF940
 for <buildroot@buildroot.org>; Thu,  9 Jan 2025 15:12:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B35FB40FD1
 for <buildroot@buildroot.org>; Thu,  9 Jan 2025 15:12:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6_UTY8LNXCz1 for <buildroot@buildroot.org>;
 Thu,  9 Jan 2025 15:12:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1828:2000:679::23; helo=helium.openadk.org;
 envelope-from=wbx@openadk.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org F26D240FD0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F26D240FD0
Received: from helium.openadk.org (helium.openadk.org
 [IPv6:2a00:1828:2000:679::23])
 by smtp2.osuosl.org (Postfix) with ESMTPS id F26D240FD0
 for <buildroot@buildroot.org>; Thu,  9 Jan 2025 15:12:10 +0000 (UTC)
Received: by helium.openadk.org (Postfix, from userid 1000)
 id 16A383520859; Thu,  9 Jan 2025 16:12:05 +0100 (CET)
Date: Thu, 9 Jan 2025 16:12:04 +0100
From: Waldemar Brodkorb <wbx@openadk.org>
To: buildroot@buildroot.org
Message-ID: <Z3/nRFjjatiNygaG@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
X-Operating-System: Linux 5.10.0-32-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1736435525; bh=qj4YdAmgrSclU/5oqNxIDvFr8SI+RmW/C4wtXP/eDlc=;
 h=Date:From:To:Subject:From;
 b=guJxOrGQkR8VE3kHn1XXnUgmOrLUj2ni6sdqp60VU+9TdbAAZ89JrS3aZ8VxS+fIb
 2atNLG8SLAVDKHaeE2Tk1EGvprh3u73atxSj0YppDTV1EJdEL4HMe4IYlvMIHRXGyh
 EDIlgGgyk34O6wUxXA6EHWTtHfX69R5DYFw7gyBh/ONXOPHnAX0vMvUihpw40xgFi9
 wDPwZtVpFvTMbG7xTDRenB0OJPsrBbGXHBum0XpOuX6/Wj58h4FFGDC2LgOkSW+ZHj
 yMxsuQ/JPa7mdxcvTxmHQxeAbmts1CDUDmNdVxFsYMxj5lAw+JEXPsL4PdMCusl+zw
 O99dnVLHDYk3g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=openadk.org
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=openadk.org header.i=@openadk.org header.a=rsa-sha256
 header.s=2022 header.b=guJxOrGQ
Subject: [Buildroot] [PATCH] package/bind: update to 9.18.32
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

See here for a ChangeLog:
https://downloads.isc.org/isc/bind9/9.18.32/doc/arm/html/notes.html#notes-for-bind-9-18-32

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 package/bind/bind.hash | 6 +++---
 package/bind/bind.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/bind/bind.hash b/package/bind/bind.hash
index abcbf0a938..fd83196e5a 100644
--- a/package/bind/bind.hash
+++ b/package/bind/bind.hash
@@ -1,4 +1,4 @@
-# Verified from https://ftp.isc.org/isc/bind9/9.18.31/bind-9.18.31.tar.xz.asc
-# with key 706B6C28620E76F91D11F7DF510A642A06C52CEC
-sha256  51b258969275c5206ef745a5aac03dbe98f1c8031fefed378d53597e7987b1b3  bind-9.18.31.tar.xz
+# Verified from https://ftp.isc.org/isc/bind9/9.18.32/bind-9.18.32.tar.xz.asc
+# with key D99CCEAF879747014F038D63182E23579462EFAA
+sha256  dc840cdf9d54578d98400f2edf7008b1b33a1721be6e490eb1e42d0d11d9cff4  bind-9.18.32.tar.xz
 sha256  9734825d67a3ac967b2c2f7c9a83c9e5db1c2474dbe9599157c3a4188749ebd4  COPYRIGHT
diff --git a/package/bind/bind.mk b/package/bind/bind.mk
index 52b1e56c40..aa3c3222f5 100644
--- a/package/bind/bind.mk
+++ b/package/bind/bind.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BIND_VERSION = 9.18.31
+BIND_VERSION = 9.18.32
 BIND_SOURCE= bind-$(BIND_VERSION).tar.xz
 BIND_SITE = https://ftp.isc.org/isc/bind9/$(BIND_VERSION)
 # bind does not support parallel builds.
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
