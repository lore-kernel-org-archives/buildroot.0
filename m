Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41258C47074
	for <buildroot@archiver.kernel.org>; Thu,  4 Jan 2024 22:42:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D526261468;
	Thu,  4 Jan 2024 22:42:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D526261468
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id E7XPp8GBn1X0; Thu,  4 Jan 2024 22:42:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 40D436144C;
	Thu,  4 Jan 2024 22:42:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 40D436144C
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D717C1BF3E8
 for <buildroot@lists.busybox.net>; Thu,  4 Jan 2024 22:42:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AFDCE40266
 for <buildroot@lists.busybox.net>; Thu,  4 Jan 2024 22:42:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AFDCE40266
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3lIeT9cCZSbM for <buildroot@lists.busybox.net>;
 Thu,  4 Jan 2024 22:42:53 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B4F15401BE
 for <buildroot@buildroot.org>; Thu,  4 Jan 2024 22:42:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B4F15401BE
Received: by mail.gandi.net (Postfix) with ESMTPSA id EC9E9240004;
 Thu,  4 Jan 2024 22:42:50 +0000 (UTC)
Date: Thu, 4 Jan 2024 23:42:50 +0100
To: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Message-ID: <20240104234250.5d7544ed@windsurf>
In-Reply-To: <DS7PR12MB9041AB129B87AC54AB7CC445A1672@DS7PR12MB9041.namprd12.prod.outlook.com>
References: <20240103102311.4048759-1-abrodkin@synopsys.com>
 <20240104221941.044adcb5@windsurf> <ZZckauC7K7-qR0lP@landeda>
 <20240104223823.1bb97896@windsurf>
 <DS7PR12MB9041AB129B87AC54AB7CC445A1672@DS7PR12MB9041.namprd12.prod.outlook.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1704408171;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+4OdUsSYIMKdjb9nxXnxxLxWI/AtrgTkEri6njwHDN0=;
 b=R7pH2hofLwsPMX7h1vJqPtrBLfzYN6J9FmMqEPq9bGKk7eZharJfeWnIKiUNkaQRBNf+0Y
 CDNFnltx/LwA90opOAESHEFGGJ42dSpMZRuVQ18umpl/aaMHTfhTZrXqFZHxSQ1e/n2Ee2
 0eiqI5fgIGU218ZiD/dMiRW4LxRQqY9wC2ZyMJ7OxjssAO+mpMvKkUTbFo1+HyQo84tB6b
 XyOfCDYcpHj3WgV1mSvUpy0jGojbsO1mV+DtAXfmWTc7Q3nwcy5ygQBC6BSZ3mV2cXVU31
 79NpWNrRzX9Gc1WlOjrPFcj4tEOS58gjEAm2EoObtPcq2DoMJrpIHZrhndyDOg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=R7pH2hof
Subject: Re: [Buildroot] [PATCH] arch: Set max/common-page-size for libgcc &
 libstdc++
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Pavel Kozlov <Pavel.Kozlov@synopsys.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>, Vladimir Isaev <VVIsaev@gmail.com>,
 Alexey Brodkin via buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu, 4 Jan 2024 22:22:45 +0000
Alexey Brodkin <Alexey.Brodkin@synopsys.com> wrote:

> Do you mean something like that in gcc.mk?
> ----------------------->8---------------------  
> GCC_COMMON_TARGET_CFLAGS = $(TARGET_CFLAGS) $(ARCH_TOOLCHAIN_WRAPPER_OPTS)
> GCC_COMMON_TARGET_CXXFLAGS = $(TARGET_CXXFLAGS) $(ARCH_TOOLCHAIN_WRAPPER_OPTS)
> GCC_COMMON_TARGET_LDFLAGS = $(TARGET_LDFLAGS) $(ARCH_TOOLCHAIN_WRAPPER_OPTS)
> ----------------------->8---------------------  

Yes, exactly, and removing:

# Make sure libgcc & libstdc++ always get built with -matomic on ARC700
ifeq ($(GCC_TARGET_CPU):$(BR2_ARC_ATOMIC_EXT),arc700:y)
GCC_COMMON_TARGET_CFLAGS += -matomic
GCC_COMMON_TARGET_CXXFLAGS += -matomic
endif

because this will now be taken care of by $(ARCH_TOOLCHAIN_WRAPPER_OPTS)

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
