Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A588FCD13D2
	for <buildroot@archiver.kernel.org>; Sat, 31 Aug 2024 13:52:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3E19960706;
	Sat, 31 Aug 2024 13:52:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id g3tyAZ15GRXW; Sat, 31 Aug 2024 13:52:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2433F6070E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2433F6070E;
	Sat, 31 Aug 2024 13:52:04 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9E2A81BF2C2
 for <buildroot@lists.busybox.net>; Sat, 31 Aug 2024 13:52:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 88D9C81F23
 for <buildroot@lists.busybox.net>; Sat, 31 Aug 2024 13:52:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qrK7K_W-2nhL for <buildroot@lists.busybox.net>;
 Sat, 31 Aug 2024 13:52:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=117.135.210.4;
 helo=m16.mail.163.com; envelope-from=tianyuanhao3@163.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org C627981EB1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C627981EB1
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.4])
 by smtp1.osuosl.org (Postfix) with ESMTP id C627981EB1
 for <buildroot@buildroot.org>; Sat, 31 Aug 2024 13:52:00 +0000 (UTC)
Received: from tianyuanhao3$163.com ( [223.102.86.110] ) by
 ajax-webmail-wmsvr-40-119 (Coremail) ; Sat, 31 Aug 2024 21:51:49 +0800
 (CST)
X-Originating-IP: [223.102.86.110]
Date: Sat, 31 Aug 2024 21:51:49 +0800 (CST)
From: "TIAN Yuanhao" <tianyuanhao3@163.com>
To: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.14 build 20240801(9da12a7b)
 Copyright (c) 2002-2024 www.mailtech.cn 163com
In-Reply-To: <20240830191133.61f32008@windsurf>
References: <20240830114319.4353-1-tianyuanhao3@163.com>
 <20240830191133.61f32008@windsurf>
X-NTES-SC: AL_Qu2ZB/2avUsr7yiYbekZkkYXhuY6XcOwvf4l1YJTOJs0piTU6z0penlCJkbL78ujADmWth6xXCRlyvp0YZB1XIWzn3A86i6NlvAbtaPyD7vm
MIME-Version: 1.0
Message-ID: <70157807.3812.191a8b4d835.Coremail.tianyuanhao3@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: _____wD3_z71H9Nm0GlWAA--.62358W
X-CM-SenderInfo: xwld05xxdqxtjrt6il2tof0z/xtbBhAZMjWV4IKIfWAAFse
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=163.com; 
 s=s110527; h=Date:From:Subject:Content-Type:MIME-Version:
 Message-ID; bh=ZZBUU+DmKJEOzv/QWj65Y4vnh9S5LLU1vxuP0g8B+Zo=; b=K
 9OGJSwoOqOwYA9qslW3che4397wyQeSvN93vhZirjGRMQLL86/3LFXVqh08o6tD9
 XUYTgoDSLe+zJr5jxDPUHb1zV/X1YWKIGEL8yvcsS5cESEqHcoDcchwzGI00Nb7h
 5UZoWbsbkGcV6nWnRGgQnw2dKNqe6ssOKnb45NPIWA=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=163.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=fail reason="signature verification failed" (1024-bit key,
 unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256
 header.s=s110527 header.b=K9OGJSwo
Subject: Re: [Buildroot] [PATCH 1/1] package/chrony: install default config
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

At 2024-08-31 01:11:33, "Thomas Petazzoni via buildroot" <buildroot@buildroot.org> wrote:
>Hello,
>
>On Fri, 30 Aug 2024 04:43:19 -0700
>TIAN Yuanhao <tianyuanhao3@163.com> wrote:
>
>> chrony needs a config file to work:
>>   Could not open /etc/chrony.conf : No such file or directory
>> 
>> Signed-off-by: TIAN Yuanhao <tianyuanhao3@163.com>
>> Cc: Peter Korsgaard <peter@korsgaard.com>
>
>Thanks for this contribution. Question below.
>
>>  define CHRONY_INSTALL_TARGET_CMDS
>>  	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR="$(TARGET_DIR)" install
>> +	$(INSTALL) -D -m 644 $(@D)/examples/chrony.conf.example2 $(TARGET_DIR)/etc/chrony.conf
>>  endef
>
>I'm not super familiar with chrony, but the question is: is there a
>sensible "default configuration file" that makes sense for people as a
>starting point?
>
>For example, chrony ships with 3 example configuration files, and
>you've decided to install example2. Why not example1 or example3?
>

chrony is mainly used to replace ntp in Linux distros of the RHEL family.

Many distros [1][2] use example 2 as the default config, and few distros (such as freeBSD [3]) use example 3.

Example 1 [4] is very brief. Example 2 [5] fully includes example 1 and sets the log directory. Example 3 [6] is almost entirely comments intended to serve as documentation.

[1]: https://github.com/microsoft/azurelinux/blob/3.0-stable/SPECS/chrony/chrony.spec#L72
[2]: https://github.com/vmware/photon/blob/5.0-Beta/SPECS/chrony/chrony.spec#L33
[3]: https://github.com/FreeBSDDesktop/freebsd-ports/blob/master/net/chrony/Makefile#L93-L94
[4]: https://gitlab.com/chrony/chrony/-/blob/3.5-stable/examples/chrony.conf.example1
[5]: https://gitlab.com/chrony/chrony/-/blob/3.5-stable/examples/chrony.conf.example2#L35
[6]: https://gitlab.com/chrony/chrony/-/blob/3.5-stable/examples/chrony.conf.example3#L30-34

>Thomas
>-- 
>Thomas Petazzoni, co-owner and CEO, Bootlin
>Embedded Linux and Kernel engineering and training
>https://bootlin.com

--
Regards,
TIAN Yuanhao
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
