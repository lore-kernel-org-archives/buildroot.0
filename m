Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0635CA0EE8
	for <buildroot@archiver.kernel.org>; Fri, 15 Aug 2025 10:18:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 69ADC8151E;
	Fri, 15 Aug 2025 10:18:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zzf45I3Ymgmc; Fri, 15 Aug 2025 10:18:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8B01D81544
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8B01D81544;
	Fri, 15 Aug 2025 10:18:24 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id F24C6196
 for <buildroot@buildroot.org>; Fri, 15 Aug 2025 10:18:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EF92460D6B
 for <buildroot@buildroot.org>; Fri, 15 Aug 2025 10:18:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id a89hwzjueroK for <buildroot@buildroot.org>;
 Fri, 15 Aug 2025 10:18:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::225;
 helo=relay5-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org C17CD60E06
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C17CD60E06
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C17CD60E06
 for <buildroot@buildroot.org>; Fri, 15 Aug 2025 10:18:21 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id B509043274;
 Fri, 15 Aug 2025 10:18:17 +0000 (UTC)
Date: Fri, 15 Aug 2025 12:18:15 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Julien Olivain <ju.o@free.fr>
Message-ID: <20250815121815.436050ec@windsurf>
In-Reply-To: <20250730190118.448997-1-bernd@kuhls.net>
References: <20250730190118.448997-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddugeefjedtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtjeertdertddvnecuhfhrohhmpefvhhhomhgrshcurfgvthgriiiiohhnihcuoehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepvefgudefhffghffhheekudejgfegkeegkeevkeekueelkeeivdffkefhkeetgfeknecuffhomhgrihhnpehsuhhsvgdrtghomhdpghhithhlrggsrdgtohhmpdgsuhhilhgurhhoohhtrdhorhhgpdgsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemtggsudekmeekieegugemvddutddtmegrtddtfhemheelsgefmeegfhdvmeeifegusgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudekmeekieegugemvddutddtmegrtddtfhemheelsgefmeegfhdvmeeifegusgdphhgvlhhopeifihhnughsuhhrfhdpmhgrihhlfhhrohhmpehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepfedprhgtphhtthhopegsvghrnhgusehkuhhhlhhsrdhnvghtpdhrtghpthhtohepsghuihhlughro
 hhothessghuihhlughrohhothdrohhrghdprhgtphhtthhopehjuhdrohesfhhrvggvrdhfrh
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1755253098;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sV+h4aBSxpmQDZDzKzyUyW4WtvpPmCg8yoQR5WqnXbA=;
 b=LVnFt15yu/4mxIGzIDTfNxf2gsI3QfXXB4v1xKMICfRwgHCN+jAGZA6oVdmDGtb2XqtlMI
 BC6Jbw/FPrIkIjrquIZSJWJr3bnyxnhcpuhxKlP1XvCyjRJrmjPOj/6zBKQeJ0izj1s5Xb
 MpbsN6TOEZYKQQpEkXgFEx286FeSHXB96FEl48I3RcIdGqKLrYgGpuAwYogJ39yXY8mj/L
 KIwGvpjD5Q08IzqAqL3UDwOZgZ1Chp8QDdiYoS9p+274HkW30GysSwvAhCPgiqe8DQ39Zl
 lchi9AxpjxSMGJHBBDH9WwcXZApAGaO5WpCkjEgZS81PrlEvXybyGGd9NKcraw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=LVnFt15y
Subject: Re: [Buildroot] [PATCH 1/1] boot/syslinux: fix build with gcc-15.x
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

Hello,

On Wed, 30 Jul 2025 21:01:18 +0200
Bernd Kuhls <bernd@kuhls.net> wrote:

> Fixes build error with gcc-15.x:
> 
> drivers/net/3c509-eisa.c:39:26: error:  initialization of 'void (*)(void)'
>  from incompatible pointer type 'void (*)(struct nic *, struct eisa_device *)'
>  [-Wincompatible-pointer-types]
> 
> For a similar fix see https://bugzilla.suse.com/show_bug.cgi?id=1243225
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

This change breaks the build with older compilers:

  https://gitlab.com/buildroot.org/buildroot/-/jobs/10975828975

I'm about to send a patch that will update the toolchain used in those
tests, papering over this issue, but I believe it is not normal to
break the build of syslinux with older compilers, such as:

    BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
    BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
    BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-i386-pentium4-full-2017.05-1078-g95b1dae.tar.bz2"
    BR2_TOOLCHAIN_EXTERNAL_GCC_6=y
    BR2_TOOLCHAIN_EXTERNAL_HEADERS_3_2=y
    BR2_TOOLCHAIN_EXTERNAL_LOCALE=y
    # BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_DEBUG is not set
    BR2_TOOLCHAIN_EXTERNAL_CXX=y

Best regards,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
