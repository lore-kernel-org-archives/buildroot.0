Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D9AFC0218F
	for <buildroot@archiver.kernel.org>; Thu, 30 Jan 2025 13:45:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 05D0442532;
	Thu, 30 Jan 2025 13:45:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id usZGx1I4n0K5; Thu, 30 Jan 2025 13:45:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C478F4253F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C478F4253F;
	Thu, 30 Jan 2025 13:45:34 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id DEEED129
 for <buildroot@buildroot.org>; Thu, 30 Jan 2025 13:45:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BF6A842532
 for <buildroot@buildroot.org>; Thu, 30 Jan 2025 13:45:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ImVheerOWTLe for <buildroot@buildroot.org>;
 Thu, 30 Jan 2025 13:45:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1828:2000:679::23; helo=helium.openadk.org;
 envelope-from=wbx@openadk.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 97F9D42544
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 97F9D42544
Received: from helium.openadk.org (helium.openadk.org
 [IPv6:2a00:1828:2000:679::23])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 97F9D42544
 for <buildroot@buildroot.org>; Thu, 30 Jan 2025 13:45:31 +0000 (UTC)
Received: by helium.openadk.org (Postfix, from userid 1000)
 id 850F135355BA; Thu, 30 Jan 2025 14:45:25 +0100 (CET)
Date: Thu, 30 Jan 2025 14:45:25 +0100
From: Waldemar Brodkorb <wbx@openadk.org>
To: buildroot@buildroot.org
Message-ID: <Z5uCdWxT1daQ80gR@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
X-Operating-System: Linux 5.10.0-32-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1738244727; bh=h7I/203pBE8aUCKjNxFCCHP8YPPKI0XNko3ahE4hJOo=;
 h=Date:From:To:Subject:From;
 b=Oj8zvyO5AiNePs9so/lN7CQiHsFBTCsC9xRW4Hej5ptfZgEExNWrBBR8sFlfQYi73
 LW7CGMHR3QgGO9Y0tG3OOIMFnZ4pqlpHtbqUs7Hbg3G78eyS+kDCvrRz2qf07lV7rC
 74WzC2cKLEU4hHxxlP5x3zT0dbJs947/bp+8JTjoTVDeqoVVT1xMXlg/GvEpJOkeUW
 MP6PYaZFbbtWfPvePOx9VSNlyuxlIuYzxb6yCLEm93BlprybxN/lGpQq53Kf1mwfAJ
 Rh4tgss+Z3WBnM2MJmG/ZCM531OzZK+CQ8tVc+6KmJwXIHQdTeDiCT9+oaHfxwq/zy
 bRaygnmkiZToA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=openadk.org
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=openadk.org header.i=@openadk.org header.a=rsa-sha256
 header.s=2022 header.b=Oj8zvyO5
Subject: [Buildroot] [PATCH] package/bind: security update to 9.18.33
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

See here for a changelog:
https://downloads.isc.org/isc/bind9/9.18.33/doc/arm/html/notes.html#notes-for-bind-9-18-33

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 package/bind/bind.hash | 4 ++--
 package/bind/bind.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/bind/bind.hash b/package/bind/bind.hash
index fd83196e5a..50247bcf37 100644
--- a/package/bind/bind.hash
+++ b/package/bind/bind.hash
@@ -1,4 +1,4 @@
-# Verified from https://ftp.isc.org/isc/bind9/9.18.32/bind-9.18.32.tar.xz.asc
+# Verified from https://ftp.isc.org/isc/bind9/9.18.33/bind-9.18.33.tar.xz.asc
 # with key D99CCEAF879747014F038D63182E23579462EFAA
-sha256  dc840cdf9d54578d98400f2edf7008b1b33a1721be6e490eb1e42d0d11d9cff4  bind-9.18.32.tar.xz
+sha256  fb373fac5ebbc41c645160afd5a9fb451918f6c0e69ab1d9474154e2b515de40  bind-9.18.33.tar.xz
 sha256  9734825d67a3ac967b2c2f7c9a83c9e5db1c2474dbe9599157c3a4188749ebd4  COPYRIGHT
diff --git a/package/bind/bind.mk b/package/bind/bind.mk
index aa3c3222f5..350f6c6fbe 100644
--- a/package/bind/bind.mk
+++ b/package/bind/bind.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BIND_VERSION = 9.18.32
+BIND_VERSION = 9.18.33
 BIND_SOURCE= bind-$(BIND_VERSION).tar.xz
 BIND_SITE = https://ftp.isc.org/isc/bind9/$(BIND_VERSION)
 # bind does not support parallel builds.
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
