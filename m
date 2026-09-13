Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69F7BC88E56
	for <buildroot@archiver.kernel.org>; Sun, 13 Sep 2026 12:16:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D70CA405F4;
	Sun, 13 Sep 2026 12:16:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QQq3x5q7ilmq; Sun, 13 Sep 2026 12:16:39 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 0885F40608
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789301799;
	b=ZUmSxRzmgM6D4i/F71i0ptcItGn7hXq05m0KeFvUzI/USItUJZqlxJ+/K0w8SIRvjBOo
	 15R/mDL5RQr5HLD5vPX5/0uCokvH2p6QpOs/cB/t61wuLZpdeKG8YhVLc+OsnInR6iKd2
	 iomuJEEewrHRrzALgSsQRCX1PzwnRKvN2kEqMAzpGE3UOKoHHXkpXRkpXMNM1qvoQ2QbF
	 CmOxR/5XZCCiMhkEYsM23P0obmKA81sic6ojr2YLsVrZN7UZz0aJtsWcyjyJ/kV1Iax24
	 +B2ZiDzKqynDtuB0fQ5UdskMyLh084kPufKoNN3ly1rDQGWOyqbHYY16XaFrrjZQMCA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789301799;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:To:Cc:Date:Message-ID:X-Mailer:MIME-Version:
	 X-Last-TLS-Session-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Type:Content-Transfer-Encoding:
	 Errors-To:Sender;
	bh=0VtxjwJ/44RoWVlu6AhQgt+uGeRsF8ZICQ0kOZQ9Gbw=;
	b=avQOhalQtP6ldt+L+L6K9wqgg1U1vf8RYPVwCqVpNrjUGkuCBqsBxXk2GhdFCvcFri7W
	 pz3hGdoGt3jAKs5PQI/iM++4xdOWhyOXKQjhghZv725+Q7nGBGf4ubhzE2bJdjvkbq7Ci
	 WynDm0faIQq94uGq+Tlzic23/DCSz9UdncX58tc2wKSTxDOXG6o5jMYwWRzAjMmE9FRYd
	 V4q1mrJ9dRfKiQhDSvcsJ+CRvfOl8r3r9Xhj+EfQxEvBS4Xuqq1dX0sWSeMHXGLV9oTKd
	 s58yd5SmT+fCS4qXjLjidIxO76U04w384w5a5imlSml5ySYIabZ39zffxzi4htdcghQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789301799;
	bh=0VtxjwJ/44RoWVlu6AhQgt+uGeRsF8ZICQ0kOZQ9Gbw=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=FOpFBAvXUt3qgpfHVtN8zOt/BcTf+glCVGJ3octIo3CwuvNIxwkXx85txXNgKj8F3
	 ++FZEurmUUuk8Ub6QdLPvUL0aDi3WN5fIHa3KIcT9A6Nxkff8uhg93HzuGU9fJikFx
	 T+E8TBUqm/4dFHWK0+UcJpel/JvwjOivtjKM6It0w5VBeqrSpFsH3sv3exMf8vtVBA
	 th7cSeazsNSJWgp0TJrLm5KOZbsPU1zy8s3VQbjdufS/ddBwXsgEd9DUT7Pw7ouHPY
	 sDilJxLIuik6efvaiI5YailTD28rzMm8Jm69Qf0jx4twdD+bJUCj40o1E3c3ANZwSD
	 eT8vYeuYdrjrQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0885F40608;
	Sun, 13 Sep 2026 12:16:39 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 653E52D0
 for <buildroot@buildroot.org>; Sun, 13 Sep 2026 12:16:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4B4BB40608
 for <buildroot@buildroot.org>; Sun, 13 Sep 2026 12:16:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dmKxTev9_dgO for <buildroot@buildroot.org>;
 Sun, 13 Sep 2026 12:16:37 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 6AE87405F4
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789301796;
 b=mWiLTvJr6oP5VLdVW76TqVFLNHoZH1mRxqiWSmSG3oXT8a54/7aPpL5wkmA1W3Gel4E3
 JMauXozsfqXIy69If+ESKLjRfvc0QEh7EQzOG/pvm6kx6Lzyh7D5UIZPJl+TP1gcnndAP
 T9y4vrLpQ+zpArghvVZkLHnArWisE5hE3qMD6pJ/wOHkZIr35YuYSEwd+5rHGNTXNs+NV
 5Yh2UevMecXVu738aDSamqH/LnbRDzgUxvognSj+6mueil5PYgA9GDjSVDdNAc7WP6cX+
 2CSAEOd+qv7iigdjHgApXKCBHXxaoigUJ8hPLEPmw0/kmCMFTAz8IizBzrrFqcA+GkQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789301796;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:MIME-Version:
 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
 bh=NVoMQPdjjLxIFC8kZLCxwGcqSmKasdbTt75Dvb2XR7g=;
 b=CRyL9VoQZofPK6IlTSVO+5mTdUXT5ZTeaOtmk4lk8369kYlton0bvJXjwqxm5P3d7ee2
 JZZFK75K0+N7mGuGqLC0LwEtZz6PUyAWYcbm07JIbsKjPJ8E+4bagW/pvypSACkKVKb7l
 BcTnQzYhxi5UrqNA85LMS1ddng/7k9rR9SdS5/4fY8AufEk8CW+69DM9CnHC5RH3uuRIy
 YeWxcFkJFLvb3u2Yhbi8GIN10Wei3XTSpqvVvT2DudlBSgOemuRMefjcGGvll6MMoICe4
 k3mpIIzMXZdwws6RoRcLt1j2lFUjJ40sL4ShI4FKesD2XpCEL5yEKuXIbd5/6kpWlGA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=xH5baH+L; 
 arc=none smtp.remote-ip=185.246.85.4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6AE87405F4
 for <buildroot@buildroot.org>; Sun, 13 Sep 2026 12:16:35 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id F2BA74E404A0
 for <buildroot@buildroot.org>; Sun, 13 Sep 2026 12:16:32 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id A165060435;
 Sun, 13 Sep 2026 12:16:32 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 5E7B011C78D5A; 
 Sun, 13 Sep 2026 14:16:31 +0200 (CEST)
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Bernd Kuhls <bernd@kuhls.net>
Date: Sun, 13 Sep 2026 14:16:28 +0200
Message-ID: <20260913121629.1650246-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
Subject: [Buildroot] [PATCH] package/kodi: fix definition of
 BR2_PACKAGE_KODI_ARCH_SUPPORTS
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

The definition of BR2_PACKAGE_KODI_ARCH_SUPPORTS is incorrect, it
goes like this:

 	bool
	default y if BR2_PACKAGE_FFMPEG_ARCH_SUPPORTS
	default y if BR2_PACKAGE_HOST_OPENJDK_BIN_ARCH_SUPPORTS

so it means it would be "y" if either
BR2_PACKAGE_FFMPEG_ARCH_SUPPORTS *OR*
BR2_PACKAGE_HOST_OPENJDK_BIN_ARCH_SUPPORTS is true. While clearly what
we need is for both to be true: ffmpeg should be available for the
target architecture, and openjdk should be available for the host
architecture.

One option was to change to:

 	bool
	default y if BR2_PACKAGE_FFMPEG_ARCH_SUPPORTS && BR2_PACKAGE_HOST_OPENJDK_BIN_ARCH_SUPPORTS

Or:

 	bool
	default y if BR2_PACKAGE_FFMPEG_ARCH_SUPPORTS
	depends on BR2_PACKAGE_HOST_OPENJDK_BIN_ARCH_SUPPORTS

But we preferred:

 	bool
	default y
	depends on BR2_PACKAGE_FFMPEG_ARCH_SUPPORTS
	depends on BR2_PACKAGE_HOST_OPENJDK_BIN_ARCH_SUPPORTS

Fixes: b6a2f494290d85a26798564992ddd1ac46c1a48d ("package/kodi: depend on host-openjdk-bin instead of selecting BR2_NEEDS_HOST_JAVA")
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
Note: I have no strong opinion on the different options to express
this "AND" dependency. So if people don't like the choice I've made in
this commit, I'm happy to change to one of other options proposed in
teh commit log.
---
 package/kodi/Config.in | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index 0b13136d82..d64a6fee7e 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -1,7 +1,8 @@
 config BR2_PACKAGE_KODI_ARCH_SUPPORTS
 	bool
-	default y if BR2_PACKAGE_FFMPEG_ARCH_SUPPORTS
-	default y if BR2_PACKAGE_HOST_OPENJDK_BIN_ARCH_SUPPORTS
+	default y
+	depends on BR2_PACKAGE_FFMPEG_ARCH_SUPPORTS
+	depends on BR2_PACKAGE_HOST_OPENJDK_BIN_ARCH_SUPPORTS
 	# i386: needs sse (see upstream PR 10351)
 	depends on !(BR2_i386 && !BR2_X86_CPU_HAS_SSE)
 	# m68k not supported upstream
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
