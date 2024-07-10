Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E8C9C3DA42
	for <buildroot@archiver.kernel.org>; Wed, 10 Jul 2024 22:06:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 206F340402;
	Wed, 10 Jul 2024 22:06:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id U4j00hz8tPHw; Wed, 10 Jul 2024 22:06:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C5B6340C3F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C5B6340C3F;
	Wed, 10 Jul 2024 22:06:56 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 32B601BF593
 for <buildroot@lists.busybox.net>; Wed, 10 Jul 2024 22:06:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1F64240126
 for <buildroot@lists.busybox.net>; Wed, 10 Jul 2024 22:06:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6FtF3UA0X55w for <buildroot@lists.busybox.net>;
 Wed, 10 Jul 2024 22:06:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org A6FCC400FE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A6FCC400FE
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A6FCC400FE
 for <buildroot@buildroot.org>; Wed, 10 Jul 2024 22:06:53 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:8213:2270:4a8d:a1d5])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 4F428B0055A;
 Thu, 11 Jul 2024 00:06:48 +0200 (CEST)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Thu, 11 Jul 2024 00:06:44 +0200
Message-ID: <20240710220644.629642-1-ju.o@free.fr>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1720649209;
 bh=84uo/Q6juzG9niabsgQhew1EbXAXSQfmcj3hCgYUxpU=;
 h=From:To:Cc:Subject:Date:From;
 b=S+8ykqWczrllSmI27ZQHDTdu0LFCyF2aOpeBe9a5Li1suM54/PgeVGkGiRJjOo1N/
 srcwuj9SDnVzxHK1MrAvcbrKLfwzOM1ZM5IX6aeGoxXn5KqYq7bb43JiYy09Xl9pZ7
 YkWQqLWOAnt4NXUPvJadDe75rNAUgMWbexWvokxnfw3TT8Ub2CUOhg5UhHy8/l/B/3
 PRGv4zGxqEKoxLPQXVelrwcrdfORBLRyWnSjpS/fnUp8H9VKA9WBvusL4Qialb+Blv
 moXLjjkSQlpGQ0BW23pb8rJEhhY/AFojLAicPmaVqnz9J/W/R3N8T5NWcR3D5Hub7y
 r8KaykInlu24w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=S+8ykqWc
Subject: [Buildroot] [PATCH 1/1] package/pinentry: bump to version 1.3.1
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
Cc: Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

For change log, see:
https://git.gnupg.org/cgi-bin/gitweb.cgi?p=pinentry.git;a=blob;f=NEWS;h=a07d18953341a4eb65c9873e64c06bc7c642606d

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/pinentry/pinentry.hash | 4 ++--
 package/pinentry/pinentry.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/pinentry/pinentry.hash b/package/pinentry/pinentry.hash
index 9c54520da6..3f02eec737 100644
--- a/package/pinentry/pinentry.hash
+++ b/package/pinentry/pinentry.hash
@@ -1,5 +1,5 @@
 # From https://www.gnupg.org/download/integrity_check.html
-sha1  28effa1722865786cb984f3099a32db40f96ea26  pinentry-1.3.0.tar.bz2
-sha256  9b3cd5226e7597f2fded399a3bc659923351536559e9db0826981bca316494de  pinentry-1.3.0.tar.bz2
+sha1  fb0bbb88211558c8f7e652b4b6a675b1972fba04  pinentry-1.3.1.tar.bz2
+sha256  bc72ee27c7239007ab1896c3c2fae53b076e2c9bd2483dc2769a16902bce8c04  pinentry-1.3.1.tar.bz2
 # Locally computed
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/pinentry/pinentry.mk b/package/pinentry/pinentry.mk
index b49037c91b..7482a93d02 100644
--- a/package/pinentry/pinentry.mk
+++ b/package/pinentry/pinentry.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PINENTRY_VERSION = 1.3.0
+PINENTRY_VERSION = 1.3.1
 PINENTRY_SOURCE = pinentry-$(PINENTRY_VERSION).tar.bz2
 PINENTRY_SITE = https://www.gnupg.org/ftp/gcrypt/pinentry
 PINENTRY_LICENSE = GPL-2.0+
-- 
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
