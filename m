Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFC52CD6E49
	for <buildroot@archiver.kernel.org>; Sat, 30 May 2026 20:31:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B90DC6F5DB;
	Sat, 30 May 2026 20:31:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MLqI1QJBvUNc; Sat, 30 May 2026 20:31:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F0D756F5D7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780173109;
	bh=uWm4bkps77r7sHI9ZYsUmD9joa3nC8iVSG8dTAH8vWg=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=FGTT/OPGK8cAAeO8DXWwiAlGzFh4ltHgwbfn/SP4eN6gxalKD/kkjg5ZttShFXx9x
	 Izxw/HQ5cM5gXf1GdUTaUJcYqscE0+B1WyvQ2Lxku2wM2iocIslLLBz5JNp08n+Vzk
	 UaWHSJrV0Y/nadkUmMclvTzO3AvJVWD9IyG0YNrNTgpZlLetxz8uBgZE9tto7raAue
	 p5/5EBORRBqqKci8038tJRAsqQNWNM0p+nggcb8QVYNuLDIRf252DvNe6HYFtAqoNT
	 3moTJnMqjr89LO6gQhGw++WiQvf/Q7kSrkk9ZB1bszAo9BWgY/5jPAsyyZbOU33OER
	 3ZBn/uyCbiSng==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id F0D756F5D7;
	Sat, 30 May 2026 20:31:48 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id A2B39F4
 for <buildroot@buildroot.org>; Sat, 30 May 2026 20:31:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 947A56F5D8
 for <buildroot@buildroot.org>; Sat, 30 May 2026 20:31:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pdBB1lCBGYck for <buildroot@buildroot.org>;
 Sat, 30 May 2026 20:31:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DBBF76F5D7
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id DBBF76F5D7
 for <buildroot@buildroot.org>; Sat, 30 May 2026 20:31:46 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9C6078758D; Sat, 30 May 2026 20:31:33 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 30 May 2026 22:31:26 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e139c3692580e40aff8e54672bc585ed2b79a67e
X-Git-Newrev: 8e2238ccce83623c575446f11a84cc2712cdd225
X-Patchwork-Hint: ignore
Message-Id: <20260530203133.9C6078758D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/stellarium: fix qt5serialport
 dependency
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/8e2238ccce83623c575446f11a84cc2712cdd225
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

qt5serialport is only needed when GPS support is enabled:
https://github.com/Stellarium/stellarium/blob/v25.4/CMakeLists.txt#L623,
so having qt5serialport without gpsd doesn't bring anything.

Please note that we disable telescope support by default so only gpsd
enables the usage of qt5serialport.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/stellarium/stellarium.mk | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/package/stellarium/stellarium.mk b/package/stellarium/stellarium.mk
index 660d518860..48dadfec61 100644
--- a/package/stellarium/stellarium.mk
+++ b/package/stellarium/stellarium.mk
@@ -32,11 +32,8 @@ else
 STELLARIUM_CONF_OPTS += -DENABLE_SCRIPTING=OFF
 endif
 
-ifeq ($(BR2_PACKAGE_QT5SERIALPORT),y)
-STELLARIUM_DEPENDENCIES += qt5serialport
-ifeq ($(BR2_PACKAGE_GPSD),y)
-STELLARIUM_DEPENDENCIES += gpsd
-endif
+ifeq ($(BR2_PACKAGE_GPSD)$(BR2_PACKAGE_QT5SERIALPORT),yy)
+STELLARIUM_DEPENDENCIES += gpsd qt5serialport
 STELLARIUM_CONF_OPTS += -DENABLE_GPS=ON
 else
 STELLARIUM_CONF_OPTS += -DENABLE_GPS=OFF
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
