Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4F84C624DB
	for <buildroot@archiver.kernel.org>; Sat,  5 Sep 2026 12:09:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A98A24080B;
	Sat,  5 Sep 2026 12:09:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ipNgCK6jUDtE; Sat,  5 Sep 2026 12:09:32 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 1E0BB40BF0
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788610172;
	b=q+6VZDoj/+zK82vEHPH1IcGD8bNHmhKDXIqhS9N9HemsQOJd6BDkZU2MMOH2+V6iKvJC
	 EeOof+Gqi50XOlYKfQjRQ37HvjHviYMne6Ca7/8tAPx7L7n/6JpAC6PYCTwfOtrf5/SSO
	 0enRy/S+eOVb1sPgpU8pl7j8yiRcxdSok95Se94K+il33/m1Jnk6dRUUsAu8UL6IaEV50
	 hubV29hdmMprnSP2UGsIARKgXhqpR3UGekwQIn+R3eSnpIEWD0I/4KZ3rUKX/0Amkbi+P
	 3YlOIwPErtOptgugE++P5WnXTFlA0Bs7QEPao7jyk2tYR/gJzTLnEQ/z2CfP//oqdBQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788610172;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:
	 MIME-Version:X-Spamd-Bar:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=4RWbhkJaOlsiSImUSeap5WliGkKA1PjB0swq3oOrmtU=;
	b=jKE4Mn2jY2ixWw9VmLUwDFfcfq7jNw6DadkrRYWzc9S7DuMqDvTNO3dHa0t3IvYRLWst
	 vMhVYj6lXeOxwzeEizWuBYW5BT8AVhLYdJnTMuXtg+NLWz99UBFLjdKqiK8V5vt12BJOI
	 K1a3IDnSgoaal/tPiMqS45pUkqd3VEWWARtsXqKIsUsQQlq9G/+D0F6RPugKjahaxHjs7
	 q7ZThEZmZ2NLTC5QiJG0bwG7lxlzUK1h+8K5CA2fUCRBnxA2KHjd4K3gqZItN//WaWHvC
	 eoxM7x6XHEmLWOplg05F3/RBBP0eX0dxEx+YHbrmrg9EVKZultl5ZowpAmYuPUxlzkw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788610172;
	bh=4RWbhkJaOlsiSImUSeap5WliGkKA1PjB0swq3oOrmtU=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=NPjB4+oWNyH1wUPkKbPObqFAI/pouiDGlciDwxtW/eAGpbCciBGiB+ZLunCgPnwMJ
	 FcxuDOa1mnVPlLoVq6bAbCwOA2auyrrCwXMqn1shKbc7yONJ+XR/qeIRahEmreFUzF
	 XWydSmxej+aQPNRXcClxZuzsdS7fyVOBpJQXRq8Ll6QBvsDYISuEiNTUUXuFBsEpzJ
	 1ZE5lRALeH/2M98K4gfTzaQqxgd3vo/n5ZfHSr72iAX2KN5g3UzaXMpsNrzO7NwdQc
	 wFi5RleKnbM7kJh5lJRmtrDr46Mv8+0B5OgXChxeCb6lymRDoKytqSeNrMm+Yw5wpy
	 Ps8POgUrsKeWg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1E0BB40BF0;
	Sat,  5 Sep 2026 12:09:32 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 193C6105
 for <buildroot@buildroot.org>; Sat,  5 Sep 2026 12:09:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F289E60613
 for <buildroot@buildroot.org>; Sat,  5 Sep 2026 12:09:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QkiEd3G4TUko for <buildroot@buildroot.org>;
 Sat,  5 Sep 2026 12:09:29 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 365476060B
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788610169;
 b=IrpG5h5wKi1Kd+OSxBcRK0GiI65mlC/MJWMn27YSxawA1DVKjeCf80RwlWpP/x2pzzRy
 RYGVzGl7b3d2xGYh76kYctouwDEekuUD4wIx9aBIF+za3h9SJLI21HzLQXoZgNIiXEXe7
 jpu3Hqj5uuirtpKQUFP5+dZdlfGZ2s+PrRtTOSW+clf9QAV6Q4zDKe1riB9hh5xA0WUvq
 N8GcC2dpUbHj+puX02KNGOd+YvjYfAMOglsx5PaOO+NqoDWh8IPzvjq0xmDBaMds2nGFy
 U0y+jtV0KEekY4EdijMqNAzqjQugJEhzNmuPBgyS/r6OlJDsD0ydnzLg4fWbmKgfT+Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788610169;
 h=Received-SPF:DKIM-Signature:Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
 X-Spam-Score:X-Spamd-Bar;
 bh=7R7bim0+0gnruwK5HRyqG+rVRBZEAXxDRzA7zNbmGtY=;
 b=RmQMKnVNXyE8qRfqBKxOEcjjKOhonjot/RnUiUKxk6WxU+tjhWc3qPe4v3Vii9TqwSO6
 Cah6bSDKx5Xo6+tOwXl+Nz4EDXoAXLkqR8dKirUXs01i0haaLe6QxYgUzWg+8q8IXQJTn
 VO3RCTFYLCV1G0ssGAuJPyemQYxbKxm64A4aJFk3i0lE7DF1XamZbRhLcfjkz8JIGKr3s
 LVKSUArNXO+tgP9Yp0q7VooH+jhjMWT52CD8tN3D/so7eBUhFLEFMMCi2zyrWkG10jHCG
 p5iOhZXD6EWKH3oqHICKnApDN/7hbVxgTpae0cr1VHntExXjy5t5GaP6+ioR1rXKvbA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=jpgwHHbt; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp3.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=jpgwHHbt
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 365476060B
 for <buildroot@buildroot.org>; Sat,  5 Sep 2026 12:09:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1788610163;
 bh=7R7bim0+0gnruwK5HRyqG+rVRBZEAXxDRzA7zNbmGtY=;
 h=From:To:Cc:Subject:Date:From;
 b=jpgwHHbtofhlx2gIQQM8nM17ZXAlVQWuC7qXkE5Xh6tFqsu3KuzPdyZ3Le4oQbL00
 s5m3Kte83ypsPEtQOEzRFfd5VEVRxJxFlLPRSv5F9v9dqSx7m9Y/f13EH4/72Dih3B
 aoJLE8Iyvgg2ZjaQRoxGZASsOxwzG602AFgTJY1nAm8sI2A9f6nQDNxjcnVjROstoV
 8iKsluD5uRakSYri2E1FuFsf0qACsGZOo0ul+tVMtSU1sxgyCV5AybvaB8h7gFLPDQ
 +kEAEklrt/vYjELVyA469oS4YYHkSPDP1oZawaWScy5//1BCHFwwhPRlyHkgjGCbyL
 uYb4t5Dds7c4Q==
Received: from fli4l.lan.fli4l (p5b3a03a0.dip0.t-ipconnect.de [91.58.3.160])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id A45EEA4C2EDD;
 Sat,  5 Sep 2026 14:09:23 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:39752)
 by fli4l.lan.fli4l with esmtp (Exim 4.100)
 (envelope-from <bernd@kuhls.net>) id 1x2pD1-000000004SI-0AOr;
 Sat, 05 Sep 2026 12:09:23 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Romain Naour <romain.naour@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat,  5 Sep 2026 14:09:22 +0200
Message-ID: <20260905120923.1531021-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: -
Subject: [Buildroot] [PATCH 1/1] package/{glibc,
 localedef}: security bump version to 2.44-40-g30950ce64
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

Fixes CVE-2026-18374:
https://gitlab.com/gnutools/glibc/-/commit/0b4e41fc51e6aba6216a908961b49b0622b47fa0

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/glibc/glibc.hash       | 2 +-
 package/glibc/glibc.mk         | 5 ++++-
 package/localedef/localedef.mk | 2 +-
 3 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/package/glibc/glibc.hash b/package/glibc/glibc.hash
index 8d69de7b2a..f541a8d8f8 100644
--- a/package/glibc/glibc.hash
+++ b/package/glibc/glibc.hash
@@ -1,5 +1,5 @@
 # Locally calculated (fetched from git)
-sha256  39f6808e31a02da42f774912c6754ea22d5f076c4e935b1e233f3602d4d772c0  glibc-2.44-36-g2d5421ffca8893534d5e02ad38c28acd8e778fa3-git4.tar.gz
+sha256  440f4e6d5b787369c1af241de7ca0692731fff3a0c3d279a98e8827a6ccba5d1  glibc-2.44-40-g30950ce64dbc29db0aedf1d46b6b8eb70b360f0c-git4.tar.gz
 
 # Hashes for license files
 sha256  edaef632cbb643e4e7a221717a6c441a4c1a7c918e6e4d56debc3d8739b233f6  COPYINGv2
diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
index f39e959c29..3cddf7c1e3 100644
--- a/package/glibc/glibc.mk
+++ b/package/glibc/glibc.mk
@@ -7,7 +7,7 @@
 # Generate version string using:
 #   git describe --match 'glibc-*' --abbrev=40 origin/release/MAJOR.MINOR/master | cut -d '-' -f 2-
 # When updating the version, please also update localedef
-GLIBC_VERSION = 2.44-36-g2d5421ffca8893534d5e02ad38c28acd8e778fa3
+GLIBC_VERSION = 2.44-40-g30950ce64dbc29db0aedf1d46b6b8eb70b360f0c
 GLIBC_SITE = https://gitlab.com/gnutools/glibc.git
 GLIBC_SITE_METHOD = git
 
@@ -37,6 +37,9 @@ GLIBC_IGNORE_CVES += CVE-2026-77117
 # Fixed by 2.44-31-gcb61572ea3f773e1e1978f6c412cc36a30acdb0c
 GLIBC_IGNORE_CVES += CVE-2026-80489
 
+# Fixed by 2.44-39-g0b4e41fc51e6aba6216a908961b49b0622b47fa0
+GLIBC_IGNORE_CVES += CVE-2026-18374
+
 # This CVE is considered as not being security issues by
 # upstream glibc:
 #  https://security-tracker.debian.org/tracker/CVE-2010-4756
diff --git a/package/localedef/localedef.mk b/package/localedef/localedef.mk
index 048891724d..6904e147d9 100644
--- a/package/localedef/localedef.mk
+++ b/package/localedef/localedef.mk
@@ -7,7 +7,7 @@
 # Use the same VERSION, SITE, and LICENSE as target glibc
 # As in glibc.mk, generate version string using:
 #   git describe --match 'glibc-*' --abbrev=40 origin/release/MAJOR.MINOR/master | cut -d '-' -f 2-
-LOCALEDEF_VERSION = 2.44-36-g2d5421ffca8893534d5e02ad38c28acd8e778fa3
+LOCALEDEF_VERSION = 2.44-40-g30950ce64dbc29db0aedf1d46b6b8eb70b360f0c
 LOCALEDEF_SOURCE = glibc-$(LOCALEDEF_VERSION)$(BR_FMT_VERSION_git).tar.gz
 LOCALEDEF_SITE = https://gitlab.com/gnutools/glibc.git
 LOCALEDEF_SITE_METHOD = git
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
