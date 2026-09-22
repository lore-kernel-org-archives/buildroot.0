Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FEBEC982FA
	for <buildroot@archiver.kernel.org>; Tue, 22 Sep 2026 17:22:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CE3C180ACC;
	Tue, 22 Sep 2026 17:22:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gSjjnq_EnbbA; Tue, 22 Sep 2026 17:22:34 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 586C680AE8
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790097754;
	b=Wtmo8QcNoR7Iy5+LA+UJJdBEt6lRfWmOzD+SMrnH7l6GhDS8HuVPxzI5fke2SXwXQWmg
	 A+RbfFitKH4DdHZ1tnSiwHenDvmzwF1toRDzU06NHVHPK4vGiUjBWZqXAstpuNN1MowBa
	 wytEjUQQ2qlc+L1ck+5c+PrUHP2EEMTEFTD85rcNt2rLtbQ3PIh6h1Wdez0TIdmTxdpxk
	 Yriw/7dn24+IjTJKoqAH6ygaidkWv2E9KqvZOSXRWNOjhxzEaDcwp1LZXQfY9mZuWdfvP
	 xNKautKgBLMNdIxxalOgaKL3DfNHvTLYDcqH9TDQylqiBjnigm359qzBpLS04XN75AQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790097754;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=8dZejJVRyqnEq1Vx+BOPr8258gKCiedGT6nS50h41Dw=;
	b=GrvalRrdGkJJU3gs8iDbnHHCPUFzd51RHdjc9Ppc7eBcA03L1bX96uAJ+zYvjFt6lnwd
	 CRNpRVJ+oXjoYBpA9d60tVGIAFHVp34MtwY2v/mDDmjAly2CE7gTRcDRc06f33FIjUfB7
	 bGXQe1HginauyPhmrVB9wk0z/EYMLu2HhUvbqKou6TBJzHDingwN0hsr8dQDsCZXCrTU2
	 5pJqX7BtIlbz0XlcHSbkaaLDNegFxLQDnDY1fNEmMy8GMyHnrbZWxl7ExpL7HVktnje14
	 W80LRCw31eYpvXnuIPadqTJta5aDleRUEIRMQusdcBxytgQ68GR7lMKqmKPu8Yg0AtA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790097754;
	bh=8dZejJVRyqnEq1Vx+BOPr8258gKCiedGT6nS50h41Dw=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=m24YU89pUFUIRT6PnNGGnWdOSlBMwgT+gy3Nbs5PHdpMHGp6q0vimYQ5DORuit99q
	 fxfjXDTTfO/oi5Mv/N7RnaG2n7VTse+TSD4OLoXY0bbZjscw2Dkh3ksj9NXbCLYAnZ
	 /smAYfRXkmRWWiN9adCxdaATqTI9A76jX+2FS4SydTVMb8/T3RgMw8y9QJsLDjTusZ
	 D2ZUuZzedTK3SiEDSZFW4kgk9em6hpWjrkEmjmioSLKdUxmS/51m8HGyUdzr0/wegT
	 T60iWMWGOWriyhK0SUMJ6jIAvvm4e991KVVc6UxGw+2g+eZU6uHUi0HTFSQD9uBTOp
	 j1UZ3wwQaIqoA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 586C680AE8;
	Tue, 22 Sep 2026 17:22:34 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 56607D1
 for <buildroot@buildroot.org>; Tue, 22 Sep 2026 17:22:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1D97E40068
 for <buildroot@buildroot.org>; Tue, 22 Sep 2026 17:22:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id emQYf1BxdGMW for <buildroot@buildroot.org>;
 Tue, 22 Sep 2026 17:22:29 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 9ED7A4004A
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790097749;
 b=PxhStmRHe8MGAuYxzonzQXmLvczWOLYUIAM1C/jOyt1qQKa0K1e3YRvKAhasTSkwMv3h
 VtV9EekpnW/+lapRaZ8Tjnnoxg0PUMn0AuHublp7Lj8rkqfZD/GHAXgJCM385u31ADckP
 nO0tokEo3/6RQFmQjaJder7qmBiAOL9qKfwB3dKW9eMxCiLmLWvZdMVBw3EKYH7EVhJ9U
 vZTmLwbFzogkNI2rrcsuiY93uTgpp4L2g0rAqokmiINNUjsyMl6c8ie4orgY3KLq9UhB1
 uvl/jfSy74d2jxN57bfatFAEV7l29usGT2g0Lwn9Naro1to6GP8K1bfXMASwWI7D7Ew==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790097749;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=zLzu7CUhDHXxiNcp7ou9MZ/S50qGv5OUvd5X2CqIbyE=;
 b=TuMHnwveUPnLI9+YPxl66oCjM0QqMAhjrkDkQjZ2iha0o2khv9zpQTjO7rqvSQa/axBv
 ypxDm48h6F370gewPKSMAIcSw4yv9Bu1dkv0+YcJZzk7yoxM3U3QWdyFooS0ZQYjqu1+z
 Xh0ppXE89gUKLmR0lo7WnNAgglwviaNwm/AWpHqW+5nGyKk0JyOBWccXpli3wS3x2ORpr
 gTX094yVX7GEn0EBGe9Jvwl8l9NJ7MVbLH7efJbEwOYcxqGO8SXJY7MvZTd1O5ERVUzsy
 XfocLpJwZWWiNbHKtMGVGoIRz/3bEQDUnhVEY6yxrj2lvD5Y0q9MEU6pFlA/Y9lp9rQ==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9ED7A4004A
 for <buildroot@buildroot.org>; Tue, 22 Sep 2026 17:22:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 35FBF976B0; Tue, 22 Sep 2026 17:21:20 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 22 Sep 2026 19:08:08 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d8f408b1f16d067d2e676f3db91e7b337aebe160
X-Git-Newrev: 1e62d0b0625e474513fdbd352b164cb177dbb231
X-Patchwork-Hint: ignore
Message-Id: <20260922172120.35FBF976B0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mrouted: bump to version 4.7
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/1e62d0b0625e474513fdbd352b164cb177dbb231
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Multiple changes upstream, for the full list of changes, see the release
notes: https://github.com/troglobit/mrouted/releases/tag/4.7

Package changes:

- Drop local backported patch, merged in 4.7

Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/mrouted/0001-gcc15.patch | 33 ---------------------------------
 package/mrouted/mrouted.hash     |  4 ++--
 package/mrouted/mrouted.mk       |  4 ++--
 3 files changed, 4 insertions(+), 37 deletions(-)

diff --git a/package/mrouted/0001-gcc15.patch b/package/mrouted/0001-gcc15.patch
deleted file mode 100644
index 781f83f5c7..0000000000
--- a/package/mrouted/0001-gcc15.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From cdb388c8dc6e661d2a23f1e9b79102bc68e89af5 Mon Sep 17 00:00:00 2001
-From: Philippe Troin <phil+github-commits@fifi.org>
-Date: Wed, 23 Apr 2025 16:04:20 -0700
-Subject: [PATCH] C23 compatibility.
-
-bool is a keyword in C23.
-
-Upstream: https://github.com/troglobit/mrouted/pull/65
-
-Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
----
- src/kern.c | 6 +++---
- 1 file changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/src/kern.c b/src/kern.c
-index 27f8dd4..04f1c36 100644
---- a/src/kern.c
-+++ b/src/kern.c
-@@ -104,11 +104,11 @@ void k_set_rcvbuf(int bufsize, int minsize)
-  * in the kernel and "panic". The kernel patch for netinet/ip_raw.c
-  * coming with this distribution fixes it.
-  */
--void k_hdr_include(int bool)
-+void k_hdr_include(int flag)
- {
- #ifdef IP_HDRINCL
--    if (setsockopt(igmp_socket, IPPROTO_IP, IP_HDRINCL, &bool, sizeof(bool)) < 0)
--        logit(LOG_ERR, errno, "Failed setting socket IP_HDRINCL %u", bool);
-+    if (setsockopt(igmp_socket, IPPROTO_IP, IP_HDRINCL, &flag, sizeof(flag)) < 0)
-+        logit(LOG_ERR, errno, "Failed setting socket IP_HDRINCL %u", flag);
- #endif
- }
- 
diff --git a/package/mrouted/mrouted.hash b/package/mrouted/mrouted.hash
index aabfd19f33..a38fec413e 100644
--- a/package/mrouted/mrouted.hash
+++ b/package/mrouted/mrouted.hash
@@ -1,5 +1,5 @@
-# From https://github.com/troglobit/mrouted/releases/download/4.6/mrouted-4.6.tar.gz.sha256
-sha256  49443c47b5b28a5ab65d796f3495d72a94c1c95e54333cb11fe04075006b576b  mrouted-4.6.tar.gz
+# Upstream sha256 from GitHub
+sha256  24da2782297dad2727c7b467ce232837f3e71a8a42d15e0bd029495da83abc3e  mrouted-4.7.tar.gz
 
 # Locally calculated
 sha256  834f45ed282fd010f354ecc0a50538af519a1cfcc4d2866de3be06982fa9ed29  LICENSE
diff --git a/package/mrouted/mrouted.mk b/package/mrouted/mrouted.mk
index 077afac2b9..e44a0e46b2 100644
--- a/package/mrouted/mrouted.mk
+++ b/package/mrouted/mrouted.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MROUTED_VERSION = 4.6
+MROUTED_VERSION = 4.7
 MROUTED_SITE = \
 	https://github.com/troglobit/mrouted/releases/download/$(MROUTED_VERSION)
 MROUTED_DEPENDENCIES = host-bison
@@ -13,7 +13,7 @@ MROUTED_LICENSE_FILES = LICENSE
 MROUTED_CPE_ID_VENDOR = troglobit
 
 define MROUTED_INSTALL_INIT_SYSV
-	$(INSTALL) -m 755 -D package/mrouted/S41mrouted \
+	$(INSTALL) -m 0755 -D package/mrouted/S41mrouted \
 		$(TARGET_DIR)/etc/init.d/S41mrouted
 endef
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
