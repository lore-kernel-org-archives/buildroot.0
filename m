Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C606C982C9
	for <buildroot@archiver.kernel.org>; Wed, 16 Sep 2026 18:51:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 059DC605E8;
	Wed, 16 Sep 2026 18:51:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LVMcFlHME8TX; Wed, 16 Sep 2026 18:51:03 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 1DDE760626
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789584663;
	b=JdUL1w1Bc+cniaPlx0yXGQa50RaN/eoWwErXS13ZgZ+uuYjhFt/XDekehbsmQKSZeEL4
	 rxrkq2O/i1OpWd4wfUfQAovnZG9/nhmdQ4dGGU1MWBYS+Kz9BB0DJaAm3d01DgPBMk19F
	 4kft/Juu7ZkZs+uOUnlhSlmRWDAOTogXqrLgf9Hf8mcyNDD/+tlk+kvs7geEK2UcJYHDr
	 xPNILiXUGmEAWcaPVzHCbd51ieHAdQHIG0X2iChq/hNJ2Ff6BBL6j17kbRYvncw4s7wjE
	 6GNFdnTarbuRxkSo92B6OvRvKYo/Nz1Os+GAx58JAL9TMcM/Thqm7Okg7bi4o+VRsSw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789584663;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=9reMcsP87B8A7nK69BVxxxzJG1IO9M7nkjDKLRazzUM=;
	b=gx9vcTW3h07kiAmbapTjl9auJ+VARiad5ZUPhgFJPObeffLd569eSc2l8QaOvcGCJSDR
	 e7e/S8zbGOjV+4hNsNp3mhCr54775unNKyn7xs6sfsy4eposkfxDllA900YsbqbDrymkj
	 cHSZ9dRZS7+ABnLmCYC709TobTq+FMkgUwNXx/Z+ZuML+BkJXXWviIoRW82dJFrrIDOgG
	 XV/oe+W3prMAMp5qdZk63/q8T+E8tqkp/oHYP35oqRhZ0zn+muxwV+Zi5JEbhPCXRUx7U
	 eYYfWgyWOugiWiuKPNQbKbZiakz7PPiF9t2mKtADJDAqT2Hnfe8YDoe02F1XdSSFkOg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789584663;
	bh=9reMcsP87B8A7nK69BVxxxzJG1IO9M7nkjDKLRazzUM=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=ZG/fr8GgTF24VQ5zc8dALoD9IsA7HYxmOacjnzBU4vxYiMZu5XT6dVSBh4l/IgQWA
	 s84pU4ufPJUJVPvVY/0sGRgBl2/EAd2tScstGrSFU3uzFfx3v7056wF1CRLznG6HFx
	 Aw/GnQRMF5eFAc6XtxZ7lV37AUrZhLzrOmbzZ8tekcNPxZoYgN5819TuPO8NsE3gYb
	 peXMy0RudogtNJB1SUV9a4OK4XLS4HDjnCdTJpQH2K8VAmrs5kV4N2bJ22AeL5N2YX
	 I/M8wsg0tADgAqjxWNFqtwUt7KE1P87hvkb8bsNJ0dR9m+4lJH5ERmEDOSTayAjwDB
	 kuIhvg5d3VrtQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1DDE760626;
	Wed, 16 Sep 2026 18:51:03 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 4601E388
 for <buildroot@buildroot.org>; Wed, 16 Sep 2026 18:51:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 43C8D4053F
 for <buildroot@buildroot.org>; Wed, 16 Sep 2026 18:51:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0VzmEO32ddR1 for <buildroot@buildroot.org>;
 Wed, 16 Sep 2026 18:51:00 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org E0049404F8
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789584660;
 b=RxDjCRhHCOTX2/D/idRCBaSzJIWZLBIUQsHLKcqysUPPES+MF0dhn/rdOppHWxaaX4RI
 oHrxjD4o1sYxoyB/LzPg8MMor4BCs99SOurnVETKkbZC5x2poUn1vhPuV52rdwGKyAWEJ
 U9EmRq67MCYR7RfI6wN/WqBLIU5LoUoM+cwPrqcnzLTDyiDZzvYYjbZk8GANbPdbMsuxm
 Dwus+M50R8VpAtyhI7nrRXOYxZ7LksmSP+pcjSTn5hWzYX2etfyHRx2H3j88OU8rJzuA2
 KsuKq6RkyymwJ/Oxomw5a8+4XPwMRP5T7AKnrTsrBvq48cBZvaS9JqvOoVou847NXzA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789584660;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=37Hf81ZGxuGJLu9X22p6G6Knhp9Gla984r7MAYnNVqY=;
 b=mDqDQQiDHmi7M//p82veQKSHBjU/FwtQmCh7qpyrFYw0DClcoLN+49roS3AIy/Dg0E3/
 F+EezWOYJJcl5kB6lFCtELc7heY9At5uhR5BX/LfflG+YQPb9dRFMdGrB1P8Oq9ri7I+5
 2YMIPjWiPEMCAojhjfafu2zvUuPy8895FxPch7SouAO9eAhVcDFYk729KQV7kxkqwJQ0R
 MQOCq3BuQzJQET6xdKE53H/Czd7iI4K9F7Z08WOYOCxKsi3KvpxS61YEUvKMTJAwAdAAk
 Rn2YV9mRGtp5MCehHOHTMz2mrxaDHGMVejJxBc29WFtQd04xPrhF59Mw4wnDP9Y8UDg==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=CxfFpDxj; 
 arc=none smtp.remote-ip=185.171.202.116
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E0049404F8
 for <buildroot@buildroot.org>; Wed, 16 Sep 2026 18:50:58 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 88F24C5CD5B
 for <buildroot@buildroot.org>; Wed, 16 Sep 2026 18:51:40 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 5624360337;
 Wed, 16 Sep 2026 18:50:56 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id A2E1811C7B00D; 
 Wed, 16 Sep 2026 20:50:55 +0200 (CEST)
Date: Wed, 16 Sep 2026 20:50:55 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
Message-ID: <aqrlCJzVrvimpqtu@windsurf>
References: <20260914225157.3786041-1-bernd@kuhls.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260914225157.3786041-1-bernd@kuhls.net>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 1/3] package/intel-gmmlib: bump version to
 22.10.2
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

On Tue, Sep 15, 2026 at 12:51:55AM +0200, Bernd Kuhls wrote:
> https://github.com/intel/gmmlib/releases/tag/intel-gmmlib-22.10.2
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Series applied to master, thanks!

Best regards,

Thomas Petazzoni
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
