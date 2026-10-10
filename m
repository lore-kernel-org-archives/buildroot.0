Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13E54CA6017
	for <buildroot@archiver.kernel.org>; Sat, 10 Oct 2026 20:16:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D7E4D6061D;
	Sat, 10 Oct 2026 20:16:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uKdNrv2k-uKV; Sat, 10 Oct 2026 20:15:59 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org CCF9E60674
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791663354;
	b=Y1SDh4Dzar08fSmS8T6+RkJTCpB35sXTkgp+IyE38lnl24paphC6xrZUpM8vSkoj6jvS
	 y2AF9GwTvLA7T1ouQhE3JL4It5NWfFy+W2IHSYWM8Sh29cmnShXlxdJmM6ovzmm+2WpcM
	 ul2qkkn/jmbyyB13PR8RxLVEsHdmZaev7e/w7BKViD6k+YHiodV0JfS9sIbO+dAQplJyd
	 8tKbVfCdGB+0rsWao402i2TakUFqCzWADzYKyBaApqukCp5rutBRSYm9sKNYJtyqFamaz
	 5f7doOnlDFSjWsqYw+eXw4oLdO0lM9qQrSfGugaQRAmjSSGun8vTO3iS7PA4lIU9TZg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791663354;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Feedback-ID:X-Pm-Original-To:Received:Received:From:To:
	 Cc:In-Reply-To:References:Date:Message-ID:User-Agent:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=j7zntYZ3tx/VYDwopNHsYUMiD3tcWIN9600I3dnPIQk=;
	b=AS4o4kb+m1gJBGWxgJ0lobN6pdVvZkdgts7HGhHzf7pC2a6kq2aeFbu3TWKPZ1QR2/fr
	 T4209mFMmtlEjw4oyyj6H0cYRwsCmevx6l+sPCNPCILMP0tKEp9jzr9jbjIpHqO4YLuPK
	 jdYw2MZkeqplkFqA7Y4zqzLNLZZbTKn6vxF2rlwvDbDq2RdEqaa8REng7NQO28gWIlVBa
	 f9hyLpUfrD9+ONmo94mzBRiW6piAB12HZqmFQPT/zDXRzqJs0X1FWz/cGHoxaCNYOrCpX
	 c+9jFva+thOaYXKS6ymcTnOjyTS+DQG+wOPPL0P9MkWzY+I3Spa0AWhSYsx746bOWlg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791663353;
	bh=j7zntYZ3tx/VYDwopNHsYUMiD3tcWIN9600I3dnPIQk=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=K6Ibq3bQGPdbJs0h/Op3RfgubZ6DhtvIoiyVA9h6WWJvmG8okrZk7e3JzYtm52aKT
	 T+hj2FEvpzGSUc//sq3k67akaBg1xx0nX28hhZPEF3wcLamwNUBmp+l2lD8GlVYafb
	 GXL8nnA4W9kuM5J77978o2XFV7bjWf6lChNjmeRLFQuX/cprchiVSC7BXqTmeO8Dpm
	 VRl5dPTEIQlQT+N/XtBhDuJULcs7A23+yYE0Td5UoDaiqHdhP5ghfdxccwPemzu5qj
	 B7QOu8UfT4nqlpmVG6jL6zv24J6wK2rBXe+HAs6YDSO6LifSv8rkzfhfe9DnVDJ//F
	 PtiCRG/ZF+jYQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id CCF9E60674;
	Sat, 10 Oct 2026 20:15:53 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id C2262105
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 20:15:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BFCF5407D8
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 20:15:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3312g96Ib897 for <buildroot@buildroot.org>;
 Sat, 10 Oct 2026 20:15:50 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 7BAF7407CF
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip=34.202.193.197
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791663348;
 b=svvw4qWMFZd8lwa0pkrrUODvvhx+F6WGi3wyosxPaSumWcPkuk8SVcggk+xJCsaY5xE9
 iXCsL3ksFU+DJ278pIxX7dD7DmvwYJgyAI8o8z1VzN6JwTeQhXYXSUWUlO4y8hTna7ucw
 /7yM5GfsxbmNUH+eIzqjC7S2K99A3P2COsboozZYWoIpYDtPi5Ybnm47J+j7uq31rgqVI
 XfismkiGuk+xveHcSKz13T4B69prY6qPK4Rdn9Waf3L380jm6wb+jnlXRx2u9sMYYysbW
 d7g9+R1kvDRtcpq3TRXu088YSKh7W1COOI//NnJVPV3/t4L9mdKpoxYqg8Zr7HkHKMQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791663348;
 h=Received-SPF:DKIM-Signature:Feedback-ID:X-Pm-Original-To:Received:
 Received:From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
 User-Agent:MIME-Version:Content-Type;
 bh=+7akJVKNbSkk/8vG/8V9GJ1oVxt6J1o+xffrrqU+TZg=;
 b=a5BQtIxQXhpV+6dZ3mEs6wcvxRfemfenQK5ph2/+G2BqstXGMEYzvLXpKzLaar83P0mC
 re7GvQ/6foFt3iEObNEkCDXNR5KlWHYiyDoq977QsfazzYSTTksh1NedwtKVukPdeH3CP
 cgiWZrwhTP7c1ov989JOu5iDAkB9ITCdd4U/8E59lqPT5HkydQnn96n7TeSS9p7Xt4d2k
 sWi2PlRzdMD4IN8CAfxUGKjcyCo8jYIZSYOY5qo2yxYMtUQ3xf/CIOe9IkMtOGU1n2/rG
 L8APXJZiFs3o+5Qi1j5oiMioJpWlV4vhxGzUVT8bkJxvY4PxUQS07qSykXdSGCfO9Gg==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=none header.from=korsgaard.com;
 dkim=pass header.d=purelymail.com header.i=@purelymail.com header.a=rsa-sha256
 header.s=purelymail2 header.b=YpVQXeWU; 
 arc=none smtp.remote-ip=34.202.193.197
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: smtp4.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail2 header.b=YpVQXeWU
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7BAF7407CF
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 20:15:46 +0000 (UTC)
DKIM-Signature: a=rsa-sha256;
 b=YpVQXeWUSQpQePNDmd9CTmvPWsFeJeoAKOG3yeVavnXEYic3KOByyIRwtiwPtvUSzHHwic9VDFpQZGsOuyCLyqASmotkUymasYOJrqFad/4Ukl89netFrD14MbXfIwYWYcOHOxjWOyFEfB/eg9Zm35ao860fm39zJx9rJRonsi9nzM+jxp7hGT4oBZ/14p5Bv237SzsXG+e+keu5eZYLtBF7cj4HigAmxIFoWHoGj4caeRNeoF9UTc1TN3lqiYK6bc9onDCImZrrgD/ZR/mtGrTR8rYOhR9hNTAahB8m613AXYhKuy90UtNJY6u2A5rcZO/PDwjSjpqNIvIOA8enMA==;
 s=purelymail2; d=purelymail.com; v=1;
 bh=UFuGywYocBmZLnxcwaJ0iyWG1l2/TGXV3iB3q/HH/7U=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Authentication-Results: purelymail.com; auth=pass
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 1764597091; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Sat, 10 Oct 2026 20:15:44 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1xFdTq-00000004e50-2Wuu;
 Sat, 10 Oct 2026 22:15:42 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Stefan Ott via buildroot <buildroot@buildroot.org>
Cc: Stefan Ott <stefan@ott.net>,  Bernd Kuhls <bernd@kuhls.net>
In-Reply-To: <20260629020636.4066911-1-stefan@ott.net> (Stefan Ott via
 buildroot's message of "Mon, 29 Jun 2026 04:06:36 +0200")
References: <20260629020636.4066911-1-stefan@ott.net>
Date: Sat, 10 Oct 2026 22:15:42 +0200
Message-ID: <87se2d9us1.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/libcec: Add option to use
 kernel framework
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

>>>>> "Stefan" == Stefan Ott via buildroot <buildroot@buildroot.org> writes:

Hi,

 > As explained in libcec's README.raspberrypi.md:
 >   On a recent Raspberry Pi that's using the vc4_kms_3d dtoverlay,
 >   you have to use the Linux Kernel driver and disable the Raspberry Pi
 >   driver with -DHAVE_RPI_API=0 to use CEC.

 > This patch adds an option to do just that to the libcec package.

..

 > +ifeq ($(BR2_PACKAGE_LIBCEC_LINUX_API),y)
 > +LIBCEC_CONF_OPTS += \
 > +	-DHAVE_RPI_API=0 \
 > +	-DHAVE_LINUX_API=1

HAVE_RPI_API defaults to off, so no need to explicitly set it 0. The
Linux API needs the linux/cec.h header which was added in 4.10, so we
need a dependency on >= 4.10 headers.

The Linux API support only adds around ~3% to the build size, so I
think it makes most sense to automatically enable it if the kernel
headers are new enough rather than an option:

-rwxr-xr-x 1 peko peko 594K Oct 10 18:53 target/usr/lib/libcec.so.8.1.7.without
-rwxr-xr-x 1 peko peko 614K Oct 10 18:53 target/usr/lib/libcec.so.8.1.7.with

Committed with that changed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
