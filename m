Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B5D4C88E56
	for <buildroot@archiver.kernel.org>; Sat, 12 Sep 2026 21:01:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9C4DD40698;
	Sat, 12 Sep 2026 21:01:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8nXPg0lRDDQR; Sat, 12 Sep 2026 21:01:02 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org E40D6405FB
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789246862;
	b=Q20r41m9lsocfYdmMH7fhS04N11UGcoEAJVjxz4qSwTRxxVqHAyRG9CNGmXbHyBxhLpx
	 mqI8tLjRGC6o9WM6dVVhxNsfWXUP8+pf2Bew6JAhQZzrKFXU66ImWSNhwXixZpBkqc/yM
	 yoNximKe05tL0Ekz/TX8emTDO+J4WhDLXl437sPchQ3o9WtDZ/B99J7jqR+VUiJ9usmMe
	 wnk4gl5HpA9Y93SLzuTo9Lf6FzGpffJ1IDTKk/lGYehI0bTgpZM8dkwhjn9dKus+Mtysw
	 p3jFe/dkAETLT7qa9hJQ+6QoabibyLaGFs2/JfJ10rcbmWcfHVPP2+n2jn3wx9u47yw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789246862;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:To:Cc:Date:Message-ID:X-Mailer:MIME-Version:
	 X-Last-TLS-Session-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Type:Content-Transfer-Encoding:
	 Errors-To:Sender;
	bh=WWLPApwtYvCHFbSW8mFRFEUTF3V9XQf1ktxB6OP8wn4=;
	b=bchwZFj5ocYTKFY02HG9rkzV9Vot+EIAG7b3WjbjL1EHZmzKhpdGRSVN/7C4PFhMsu0t
	 VXOztECfpxSBFgIjIEXokaHaYFZ5VXPTbAyTZhXoycABVNCjXUo3MhfgnudBqUegCXvBM
	 TsGFc22eaS+uLDrdVlMomlXHhyEPvuE/9YBMjhD5I3/2VW2sztFhyh9KaYHqI1smteu3R
	 YQfNwAbwL/vXzX8qpTAOsM3mOTtd1ciGZT6CF/P8/Eiv/KeuYI7C6/PhHpxepmKVCWPTU
	 TynO0LbflQoidRCfk+24BJKdlMO1/u6m05cZ2McPqXEi/ExwWPqCYEiL6Srp6vLgqwA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789246862;
	bh=WWLPApwtYvCHFbSW8mFRFEUTF3V9XQf1ktxB6OP8wn4=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=fe8Yy/LTj+5MGCZTYT50/rlRk1B7VYp93Ys2EQwTd+JWiLkS0BmT5GkZUyXUvN2C6
	 W/UjpvFmR/Co5bGfHeNlv/XAN2RoJVxlLRAy8klR/3sNTXg/re/vy0BQ0dilQEMPjE
	 V/mWauImgDczVhZVvGxI2LE7BXzcQNVG7GVslNOKiQP2YDA/V2NBc2GydXzss2MYBs
	 U9CUPFvbl0mNiB7g9UJsXdVcAbbuLNpCQKz/h301qtbJqpEAzq0ogtuwBWkaG5fVJf
	 jJvYdEcFnsWoXLHcgBJ5isx90s1w4aJ5NXsT5bLgc5PzzIDQcHAorOt45beC4B0YDN
	 TuPOtKgTAki8w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E40D6405FB;
	Sat, 12 Sep 2026 21:01:01 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id A2C3B2D0
 for <buildroot@buildroot.org>; Sat, 12 Sep 2026 21:01:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8BA5F80E4E
 for <buildroot@buildroot.org>; Sat, 12 Sep 2026 21:01:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qw4vO7DHFZRV for <buildroot@buildroot.org>;
 Sat, 12 Sep 2026 21:00:59 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 2A0B180E3F
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789246859;
 b=prvsZ6a36w7qpSNjDaxjGyb29AKK9nu1pFYhRmx/CkK9fUW8Hjmk6NGx+RhROWXqgdEL
 4XYNJXJN3odY3ss6k0q+BpwJ3RIKQ+XHEMNznMLKyId71SJMGYApc1PV4faaPNKHrXIe0
 SPs+ZBUu409BYjJWH5dPMKshsZsoGd5D0IC0HbelkOjegK6/4gqkmJAYcaDPe+WSuCrx1
 ZLlfUawcGDzZj+fs40yTpvmhVpxjmtDv0e95EwuycOQw5xTkQDoABetLDQb8flpmmeUbe
 GUJoV3UbTKgEr6bpSOSZ2D5zxGk1ckD/cSIyVVziFTOfgTBjQmPKfiw1rcdivdON08w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789246859;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:MIME-Version:
 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
 bh=B3zjoLNzaPd6oYtl8hNzq/i+zVfqGM/k86MdQcRbBQM=;
 b=UQ/B/HSh1LJQigPxj23u2SDUZt6BGWuKJmPLGrCT7H6M5ZWUIXH585IJ0IDKoetwEbs0
 s+sbDK4rIwoulGHwBdn5oOZYVd9fJPdL4oZlFPElA8rzXBmD5IAjiKKzDnSio8tBsj7Qt
 FFXa5b7399+ps4sd0yAG18ZNYDGHgiHV668O5yyOMvg8vwm2IG/mv1FVLa29mezIQAWT+
 e2Z3y6aqLmEBX4EOCWtg9UfyE+z6BrgzK6mUr1O2Ie9ArsP8RJJhGg1iYK81gCwHHi8yK
 0gkuB5lOhKwXSqFs8MCXaRcj6FTLQQoAdwnVn+jMNREtCal8v1CXjkx9yesI6M9L/eQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=dE8KlU6U; 
 arc=none smtp.remote-ip=185.171.202.116
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2A0B180E3F
 for <buildroot@buildroot.org>; Sat, 12 Sep 2026 21:00:57 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id D7177C63449
 for <buildroot@buildroot.org>; Sat, 12 Sep 2026 21:01:36 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 790BC60580;
 Sat, 12 Sep 2026 21:00:54 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 5F63511C7AFA9; 
 Sat, 12 Sep 2026 23:00:49 +0200 (CEST)
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Andreas Ziegler <br025@umbiko.net>
Date: Sat, 12 Sep 2026 23:00:46 +0200
Message-ID: <20260912210046.1550198-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
Subject: [Buildroot] [PATCH] package/mpd: enable smb support on uClibc
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

samba4 is available on !musl, but samba support in mpd is available
only with glibc. Turns out that samba support in mpd builds just fine
with uClibc-ng, and that samba4 no longer needs native RPC support: it
can use libtirpc when needed (it's handled in the samba4 package
itself).

Tested with the following defconfig:

BR2_aarch64=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_UCLIBC_BLEEDING_EDGE=y
BR2_PACKAGE_MPD=y
BR2_PACKAGE_MPD_LIBSMBCLIENT=y

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/mpd/Config.in | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/package/mpd/Config.in b/package/mpd/Config.in
index 1b6815e904..831cbe933d 100644
--- a/package/mpd/Config.in
+++ b/package/mpd/Config.in
@@ -226,16 +226,17 @@ config BR2_PACKAGE_MPD_LIBNFS
 comment "nfs support needs a toolchain w/ threads support"
 	depends on !(BR2_TOOLCHAIN_HAS_THREADS || BR2_TOOLCHAIN_HAS_NATIVE_RPC)
 
-comment "samba support needs a glibc toolchain w/ dynamic library, RPC"
-	depends on !BR2_TOOLCHAIN_USES_GLIBC || BR2_STATIC_LIBS || \
-		!BR2_TOOLCHAIN_HAS_NATIVE_RPC
+comment "samba support needs a glibc or uclibc toolchain w/ dynamic library, NPTL"
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4
+	depends on BR2_TOOLCHAIN_USES_MUSL || BR2_STATIC_LIBS || \
+		!BR2_TOOLCHAIN_HAS_THREADS_NPTL
 
 config BR2_PACKAGE_MPD_LIBSMBCLIENT
 	bool "samba"
-	depends on BR2_TOOLCHAIN_USES_GLIBC
-	depends on !BR2_STATIC_LIBS
-	depends on BR2_TOOLCHAIN_HAS_NATIVE_RPC
-	depends on BR2_TOOLCHAIN_HAS_SYNC_4
+	depends on !BR2_TOOLCHAIN_USES_MUSL # samba4
+	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # samba4
+	depends on !BR2_STATIC_LIBS # samba4
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # samba4
 	select BR2_PACKAGE_SAMBA4
 	help
 	  Enable Samba support.
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
