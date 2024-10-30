Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C79A4D74954
	for <buildroot@archiver.kernel.org>; Wed, 30 Oct 2024 02:26:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 53EE560823;
	Wed, 30 Oct 2024 02:26:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LJc08z-olNwb; Wed, 30 Oct 2024 02:26:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 254AF60736
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 254AF60736;
	Wed, 30 Oct 2024 02:26:41 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 578DF4969
 for <buildroot@buildroot.org>; Wed, 30 Oct 2024 02:26:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 37FD660736
 for <buildroot@buildroot.org>; Wed, 30 Oct 2024 02:26:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DHAzfKbeU92e for <buildroot@buildroot.org>;
 Wed, 30 Oct 2024 02:26:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=114.111.35.240;
 helo=cvsmtppost28.nm.naver.com; envelope-from=dungeonlords789@naver.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org DC75360707
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DC75360707
Received: from cvsmtppost28.nm.naver.com (cvsmtppost28.nm.naver.com
 [114.111.35.240])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DC75360707
 for <buildroot@buildroot.org>; Wed, 30 Oct 2024 02:26:37 +0000 (UTC)
X-Originating-IP: 125.132.232.68
Received: from cvsendbo029.nm ([10.112.18.60])
 by cvsmtppost28.nm.naver.com with ESMTP id Ha0Y-9NHS86SJca6-qLx9g
 for <buildroot@buildroot.org>; Wed, 30 Oct 2024 02:26:35 -0000
X-Session-ID: nRtaG+3YTB63PeXLPKZ19g
X-Originating-IP: 125.132.232.68
X-Works-Send-Opt: xeYZjAJYjHmlKxu/FoJYKxgXKBwkx0eFjAu=
X-Works-Smtp-Source: TdnZKogqFqJZ+HmdaxbZ+6E=
Received: from Linux.. ([125.132.232.68])
 by cvnsmtp011.nm.naver.com with ESMTP id nRtaG+3YTB63PeXLPKZ19g
 for <multiple recipients>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 30 Oct 2024 02:26:34 -0000
From: Cherniaev Andrei <dungeonlords789@naver.com>
To: buildroot@buildroot.org
Cc: petr.vorel@gmail.com,
	Cherniaev Andrei <dungeonlords789@naver.com>
Date: Wed, 30 Oct 2024 11:26:29 +0900
Message-ID: <20241030022629.2706384-1-dungeonlords789@naver.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=naver.com; s=s20171208; 
 t=1730255195; bh=w/0txd3rwoE7u09/HAmy9ZQeS13eEd2YrCH39WvHbHM=;
 h=From:To:Subject:Date:Message-ID:From:Subject:Feedback-ID:
 X-Works-Security;
 b=NUQmpX7hsOKBEXj4O/G8vE5/1Zfa6dDfg/guJgLA7qBSwKCbokFyp7e1V87i80lV3
 Vbu0OHanLK83wKYOFvQTi4SrOYtD6OnQ58fdBKTIC2MsYYen9ZCcz6S8QOMPTavD3f
 HwrV/x5JmOjNz+itueLQ0DcwgIbt/jzw2s2zq26xFReBwLFFqBA55cpZrRiq6uyMnI
 HUFU4RMC6SqtIj9YK1BDgIEE8BBc0kvF0nfPA/2FSbL7i8c0yzgF2cTD0xlHIOex83
 WiCeT9nYKn7WoUJ3ZHvXFsA8OUMw3/VNHi7PxjF7OeiF7UV+GgVLjD1W4YYuZEEe8B
 vKmvIf/n/2LiQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=naver.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=naver.com header.i=@naver.com header.a=rsa-sha256
 header.s=s20171208 header.b=NUQmpX7h
Subject: [Buildroot] [PATCH 1/1] support/kconfig: fix linux header path
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

Usually you will never have "/usr/src/linux"...
For example on my Ubuntu 24 I have
"/usr/src/linux-headers-6.8.0-47-generic".
My change makes path universal.

Signed-off-by: Cherniaev Andrei <dungeonlords789@naver.com>
---
 support/kconfig/README.buildroot | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/kconfig/README.buildroot b/support/kconfig/README.buildroot
index 76808f85b4..c08970c87e 100644
--- a/support/kconfig/README.buildroot
+++ b/support/kconfig/README.buildroot
@@ -2,7 +2,7 @@ This is a copy of the kconfig code in the kernel (currently 4.17-rc2) tweaked
 to suit Buildroot.
 
 To update:
-	cp -r /usr/src/linux/scripts/kconfig support/kconfig.new
+	cp -r /usr/src/linux-headers-$(uname -r)/scripts/kconfig support/kconfig.new
 	cd support/kconfig.new
 	# zconf.lex.c and zconf.tab.c needs to be generated by 'make menuconfig'
 	mv zconf.lex.c zconf.lex.c_shipped
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
