Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4442C678D5
	for <buildroot@archiver.kernel.org>; Tue,  7 Mar 2023 09:05:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3927C8196A;
	Tue,  7 Mar 2023 09:05:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3927C8196A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8ElT9pZnr9Xk; Tue,  7 Mar 2023 09:05:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 91EBA81947;
	Tue,  7 Mar 2023 09:05:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 91EBA81947
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B0E081BF2BC
 for <buildroot@lists.busybox.net>; Tue,  7 Mar 2023 09:05:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 89DE381947
 for <buildroot@lists.busybox.net>; Tue,  7 Mar 2023 09:05:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 89DE381947
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id U7uftM-BAxLF for <buildroot@lists.busybox.net>;
 Tue,  7 Mar 2023 09:05:15 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 40DFE81919
Received: from mail.tkos.co.il (mail.tkos.co.il [84.110.109.230])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 40DFE81919
 for <buildroot@busybox.net>; Tue,  7 Mar 2023 09:05:15 +0000 (UTC)
Received: from tarshish.tkos.co.il (unknown [10.0.8.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.tkos.co.il (Postfix) with ESMTPS id 8BF44440F55;
 Tue,  7 Mar 2023 11:00:35 +0200 (IST)
To: buildroot@busybox.net
Date: Tue,  7 Mar 2023 11:04:55 +0200
Message-Id: <6a6f76bfb81e83d1ac5e694e87d7faf7f34397bf.1678179895.git.baruch@tkos.co.il>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=tkos.co.il; s=default; t=1678179635;
 bh=sWvL0J+vAMrUqujbd8E4uW4IKVrKp38EbAhCVGkjjtA=;
 h=From:To:Cc:Subject:Date:From;
 b=pmNwuQjkBcC7hasMzgv9OX7TS+ICtj6SuFD6a4XlbIHTjYYt/9xQa1lzgWWk5djfy
 Ndcj6otpokwuQHEh0+U+zfZVKdxGDL9/9l6lg8qre+CokFILeReX5EaEW5SQTG9V41
 XdPZXyuGLHdIoga288+/qNUgbF/5Ig9cN/rJfWdLoxuUJ5b+EHgMh8lkH1b0x/QiWe
 gCgxAAAaDslhPt/ShtJI22u35OgqpMJwvfRjrOD9ZcBE++KB/3FLBs1sZfG2oZcOwb
 YB5ugBWdToZl56oI4HLs3GZJrtTmIvxgKTwAh9p1HhHwjhQNle+BElBFR7w6N53XVE
 HCWgNYLufWSZA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=tkos.co.il header.i=@tkos.co.il
 header.a=rsa-sha256 header.s=default header.b=pmNwuQjk
Subject: [Buildroot] [PATCH] libpcap: bump to version 1.10.3
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Baruch Siach via buildroot <buildroot@buildroot.org>
Reply-To: Baruch Siach <baruch@tkos.co.il>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/libpcap/libpcap.hash | 4 ++--
 package/libpcap/libpcap.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libpcap/libpcap.hash b/package/libpcap/libpcap.hash
index b87d9d04ef3a..270fd8869dac 100644
--- a/package/libpcap/libpcap.hash
+++ b/package/libpcap/libpcap.hash
@@ -1,6 +1,6 @@
 # Locally calculated after checking pgp signature
-# https://www.tcpdump.org/release/libpcap-1.10.2.tar.gz.sig
-sha256  db6d79d4ad03b8b15fb16c42447d093ad3520c0ec0ae3d331104dcfb1ce77560  libpcap-1.10.2.tar.gz
+# https://www.tcpdump.org/release/libpcap-1.10.3.tar.gz.sig
+sha256  2a8885c403516cf7b0933ed4b14d6caa30e02052489ebd414dc75ac52e7559e6  libpcap-1.10.3.tar.gz
 
 # Hash for license file:
 sha256  8a54594d257e14a5260ac770f1633516cb51e3fc28c40136ce2697014eda7afd  LICENSE
diff --git a/package/libpcap/libpcap.mk b/package/libpcap/libpcap.mk
index 173207de63ca..d4292ae9a3fb 100644
--- a/package/libpcap/libpcap.mk
+++ b/package/libpcap/libpcap.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBPCAP_VERSION = 1.10.2
+LIBPCAP_VERSION = 1.10.3
 LIBPCAP_SITE = https://www.tcpdump.org/release
 LIBPCAP_LICENSE = BSD-3-Clause
 LIBPCAP_LICENSE_FILES = LICENSE
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
