Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4CCFEE49A0
	for <buildroot@archiver.kernel.org>; Mon, 21 Aug 2023 20:23:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9EF4B41525;
	Mon, 21 Aug 2023 20:23:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9EF4B41525
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nIbzzLW93EQ3; Mon, 21 Aug 2023 20:23:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id EF1064154F;
	Mon, 21 Aug 2023 20:23:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EF1064154F
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 659931BF279
 for <buildroot@lists.busybox.net>; Mon, 21 Aug 2023 20:22:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3F41740CA8
 for <buildroot@lists.busybox.net>; Mon, 21 Aug 2023 20:22:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3F41740CA8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jwaxKEmGgbix for <buildroot@lists.busybox.net>;
 Mon, 21 Aug 2023 20:22:31 +0000 (UTC)
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4006140CA1
 for <buildroot@buildroot.org>; Mon, 21 Aug 2023 20:22:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4006140CA1
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:64fe:9015:874f:9d44])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 0300613F88A;
 Mon, 21 Aug 2023 22:22:26 +0200 (CEST)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Mon, 21 Aug 2023 22:22:15 +0200
Message-ID: <20230821202217.474022-1-ju.o@free.fr>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1692649348;
 bh=4GVhduYDeIkXbl4HGHaTtYObLA8c8Qn6fkUWcd8tzcQ=;
 h=From:To:Cc:Subject:Date:From;
 b=US4tHtLQZ4P+a1BqVJ/R4L/UzugC5ZtiyIq2jGI7j/Ghi01G/VhtZcY9kpaFUTKrw
 KrUGp2MPe9Jzl8I1nUm6mIUl7qfV7JFQluDHqCugBMU7UrvK8TcSVkVkrLfnQM3Zdj
 icJUY0YoqJFJJUX+XXtt8hT7KOFTL5j+BasrDj4XMt5PlxV2S3nsg3zAordG0RbSvC
 Ghr8hJJ+U6ioI/azektv/6SMKrEho4dgsZeqp/VSGeYg0Q71veMpz15lFQabVP5QHJ
 95BInxiSprc899tBwak8q6yWHH6ykZwkBw9BUEjD919jFccrqL3bt1WYcGujDqu5GL
 LQzV9/NKzpgXA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=US4tHtLQ
Subject: [Buildroot] [PATCH next 1/2] package/libassuan: update _SITE url to
 use https
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

This new _SITE url matches the one published upstream at:
https://gnupg.org/download/

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/libassuan/libassuan.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libassuan/libassuan.mk b/package/libassuan/libassuan.mk
index f98c13b59f..0f69d1ba6b 100644
--- a/package/libassuan/libassuan.mk
+++ b/package/libassuan/libassuan.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBASSUAN_VERSION = 2.5.5
-LIBASSUAN_SITE = ftp://ftp.gnupg.org/gcrypt/libassuan
+LIBASSUAN_SITE = https://gnupg.org/ftp/gcrypt/libassuan
 LIBASSUAN_SOURCE = libassuan-$(LIBASSUAN_VERSION).tar.bz2
 LIBASSUAN_LICENSE = LGPL-2.1+ (library), GPL-3.0 (tests, doc)
 LIBASSUAN_LICENSE_FILES = COPYING.LIB COPYING
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
