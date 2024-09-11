Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A60DBEDE997
	for <buildroot@archiver.kernel.org>; Wed, 11 Sep 2024 04:34:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 60D264050D;
	Wed, 11 Sep 2024 04:34:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HA0gOHX4bapQ; Wed, 11 Sep 2024 04:34:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3177240538
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3177240538;
	Wed, 11 Sep 2024 04:34:07 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 774C71BF339
 for <buildroot@lists.busybox.net>; Wed, 11 Sep 2024 04:34:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 723D440538
 for <buildroot@lists.busybox.net>; Wed, 11 Sep 2024 04:34:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CplxSS8XhXXO for <buildroot@lists.busybox.net>;
 Wed, 11 Sep 2024 04:34:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1828:2000:679::23; helo=helium.openadk.org;
 envelope-from=wbx@openadk.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 4381B4050D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4381B4050D
Received: from helium.openadk.org (helium.openadk.org
 [IPv6:2a00:1828:2000:679::23])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4381B4050D
 for <buildroot@buildroot.org>; Wed, 11 Sep 2024 04:34:04 +0000 (UTC)
Received: by helium.openadk.org (Postfix, from userid 1000)
 id A73B535373F6; Wed, 11 Sep 2024 06:34:02 +0200 (CEST)
Date: Wed, 11 Sep 2024 06:34:02 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: buildroot@buildroot.org
Message-ID: <ZuEduoEnuPo43RqP@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
X-Operating-System: Linux 5.10.0-32-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1726029242; bh=X5cLCyBRc1gVVTAII+nAc440jfzfczAZBiDx5lcQV24=;
 h=Date:From:To:Subject:From;
 b=eYCVcZtpIOY3NtI8VxjdT9mAfnZuFwMKeCNeb7pM+jyTgSRUmXQrrJR5VVeJZALQc
 8/qILveGvdSOFdfdy5bV8IZTZ7+eoFnQ32GZLisnmEeQfSSh2ip3oG7ltyaVY+bDer
 ubveFXivC8mFg3G02Cv4Mk9I5FuMZsvhuHtHaHkLuP/2zpekVWCQLIqLk8k3Io5FYc
 Qpet99Xd7N33I5f4Yrw+z3YDfQCifrWKsBppJlCf07h/+8a1RfxGjGHlprTcnR/fsX
 Yem6hjTo+w02OiQkZvFSOjZIbYdAtY3WxEMvX0qNUnJvST3bYKeyZN27aAykrBaTMz
 Ydy0C1tBLmtsA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=openadk.org
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=openadk.org header.i=@openadk.org header.a=rsa-sha256
 header.s=2022 header.b=eYCVcZtp
Subject: [Buildroot] [PATCH] package/libssh: update to 0.11.1
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

For a changelog see the main page here:
https://www.libssh.org/

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 package/libssh/libssh.hash | 4 ++--
 package/libssh/libssh.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libssh/libssh.hash b/package/libssh/libssh.hash
index 2931c8357d..b131557ee8 100644
--- a/package/libssh/libssh.hash
+++ b/package/libssh/libssh.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-# https://www.libssh.org/files/0.11/libssh-0.11.0.tar.xz.asc
+# https://www.libssh.org/files/0.11/libssh-0.11.1.tar.xz.asc
 # with key 88A228D89B07C2C77D0C780903D5DF8CFDD3E8E7
-sha256  860e814579e7606f3fc3db98c5807bef2ab60f793ec871d81bcd23acdcdd3e91  libssh-0.11.0.tar.xz
+sha256  14b7dcc72e91e08151c58b981a7b570ab2663f630e7d2837645d5a9c612c1b79  libssh-0.11.1.tar.xz
 sha256  1656186e951db1c010a8485481fa94587f7e53a26d24976bef97945ad0c4df5a  COPYING
diff --git a/package/libssh/libssh.mk b/package/libssh/libssh.mk
index 932ab2de83..6f8a1ac389 100644
--- a/package/libssh/libssh.mk
+++ b/package/libssh/libssh.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBSSH_VERSION_MAJOR = 0.11
-LIBSSH_VERSION = $(LIBSSH_VERSION_MAJOR).0
+LIBSSH_VERSION = $(LIBSSH_VERSION_MAJOR).1
 LIBSSH_SOURCE = libssh-$(LIBSSH_VERSION).tar.xz
 LIBSSH_SITE = https://www.libssh.org/files/$(LIBSSH_VERSION_MAJOR)
 LIBSSH_LICENSE = LGPL-2.1
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
