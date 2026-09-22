Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81682C982FA
	for <buildroot@archiver.kernel.org>; Tue, 22 Sep 2026 17:26:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3F91260715;
	Tue, 22 Sep 2026 17:26:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yixgI1Mw7DlF; Tue, 22 Sep 2026 17:26:27 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 5E0B260766
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790097987;
	b=Qi87Ug92+T/66cuL6cMXj6IEV1v6Eg2gUTi+Dy2Xqnwx+XfkLTXsKAnK5ehtOGIOsREV
	 3aQR2D3/IRDGocX8z4iOTv1ObiOYSM75mdQAwbrAAm/L8XL8NzO9Pob9E08v6ycUVQvTY
	 gdv0sAsqO2+3DdcoxAZ7356F9JGTteGGv2D6EyDkWEttfjzvtb6ZQci1CZPd/fcVIK/ep
	 A54UbdCHfMNKacEKJk9uTIfA0L5mvwqq5rIB/hl4CE67ObcAencBWDWnxEUQokWMC+xJM
	 3HoOlPgA8D88LGyZBH9KOFdFplnprp3X1LUtIohjPPwYYreub3WeEbcOAxh4O/X5Pog==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790097987;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=F650llCTVfZEjVpCfGNliVUbQf/Vy4zilq7OB+SBEFw=;
	b=gvTpBzAE8gfqKKjRToebZO9tAHv3dxeTUhirfgpyWqI3dHaDo8BbxNr7PiSwQlgSEyd5
	 lnQo6JB5CTws4AfgKyN3bcgaOQADxQJB/2US+/+em3UDCmQNcXVIj3GXEPcEWiA9D0K9S
	 n2sDV02SK0VySgat4v1Tt42GbilCMEA+lUUn3/YPhYjNzUPgcfgcNOktRnVPMdTrmKgGV
	 uihIxGfwWJvvsp7Ha0OR0FR5C+er1aQLXo1jhNmPXr9K13L7kWxHgqjLH9XonYgNWNNS3
	 VmbijosfbJxXaei+Mr2tKLtP/an5iBcinB3UOnnLUl89iUXfSZH1zewK7Cb9qeCFuWg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790097987;
	bh=F650llCTVfZEjVpCfGNliVUbQf/Vy4zilq7OB+SBEFw=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=UI7kUKEfMKcLffCHVICOySX0T2T8ikvlWkyGRp/vz6sE36iuyILehYssDEiQLo9hk
	 z4Z1xyNP3liyzbwhvopN9j+GospN2oUD388eO02sMdhZqw6FqKPuGqbXHtdq1cIceh
	 +m67NeYHD7El906J2BSz5en9NWeM/FQgIhaCkaMKsR+08oLN3OW0azrgguxgD+7HIb
	 eslowAwk4VZm7EwO/HcuVWk5w3Y0MddooA9T+j6vEcH72SdGfz7yei+9h9w9m5cVZv
	 jMMCWE9hYqTRwPJIUQSn3SFbq7J638+sUOxdiXMdw+clpQydYgLbVgm/uzWnVAUrV/
	 xRGU+XbJZreOA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5E0B260766;
	Tue, 22 Sep 2026 17:26:27 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 3B369D1
 for <buildroot@buildroot.org>; Tue, 22 Sep 2026 17:26:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2148B60715
 for <buildroot@buildroot.org>; Tue, 22 Sep 2026 17:26:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jpB7qf1PkVbM for <buildroot@buildroot.org>;
 Tue, 22 Sep 2026 17:26:25 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 6922B60710
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790097985;
 b=XB4gN9UZFYVRIDezQ4liYbZAJsO0bHLd096RxD2ldYrGhe/h+pA+is7btYP3hfhaBAU2
 tx2r7QjC0a4g9nivrQnyO9d1zEkLcseW0Zm/Pv1RplKp1CE6clKIbcdWEFkJ3R7uVtPxv
 Nh9RConIaBnKxZGHkPoGHymNNak7hcEv+b3slD56/0PL03KUMpqVr57Ml+iaKeHF2kImr
 s99GcLxjxCsSQ0hwpEb5W1LnisdNOykHWLWxsAzUoXLFirnWulp9QvCpMGVIS/X8xNtf6
 YiFO0RDb/QFUmBlQ0yBGim0Axj0mYd7TiaAXH0kt6nCL5eV0z9fq5cXRRss8TTw2gmw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790097985;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=FyZPSfKyqVlXa8CzQbzf0K4T5n6T0XZzPmhOM8aNBUk=;
 b=WI2fJoD6DXwkxWM7r092NK4l8kH4FmwAWmYWkr5wtQkKS03a13Sett/xP7bgejDeon8s
 UbuUmBO8iTLsGTbBW73g4UrnMx9qYdTF9rDPowu5HOBBxEY3wEw2qwE/UIHlXyvP6Z0jm
 cjGCoxmmgsdfftlPFdNVt05s+htY+JgMItGN4M/wm2HvaI4lMAtgfy4Bwhp2CPTPw+5q3
 hVfAok8c+2blMsBVxpQgGLY1XlyIrB0vxw/p5dYVnw4bm8N/UElry7gOpnxxFaytoXOdU
 gK3prfPOQ4oxtspAwXDrqW9slqPaoB2ncvByvhrgmsWJzsGcJH/4Ax2nxVKgltNH4RA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=free.fr; 
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=M6RFyYEY; 
 arc=none smtp.remote-ip="2a01:e0c:1:1599::15"
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::15;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6922B60710
 for <buildroot@buildroot.org>; Tue, 22 Sep 2026 17:26:24 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id B4282780506;
 Tue, 22 Sep 2026 19:26:18 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 22 Sep 2026 19:26:18 +0200
MIME-Version: 1.0
Date: Tue, 22 Sep 2026 19:26:18 +0200
To: Joachim Wiberg <troglobit@gmail.com>
Cc: buildroot@buildroot.org, Fiona Klute <fiona.klute@gmx.de>, Thomas
 Petazzoni <thomas.petazzoni@bootlin.com>
In-Reply-To: <20260920200450.15964-2-troglobit@gmail.com>
References: <20260914103020.3485030-1-troglobit@gmail.com>
 <20260920200450.15964-2-troglobit@gmail.com>
User-Agent: Webmail Free/1.6.19
Message-ID: <61194953926101de52dfaf8774095c6b@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH v2 1/2] package/mrouted: fix invalid daemon
 path in S41mrouted
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 20/09/2026 22:04, Joachim Wiberg wrote:
> S41mrouted hard-coded /sbin/mrouted, but mrouted has always installed
> to /usr/sbin/mrouted. This went unnoticed with BR2_ROOTFS_MERGED_USR=y,
> but the daemon fails to start without it.
> 
> Also drop the script's executable bit to match other sysv init
> scripts that do not set it.
> 
> Introduced in c25115daf2b2761a2f0f411790c6d24b460c7999
> (package/mrouted: add sysv init script).
> 
> Signed-off-by: Joachim Wiberg <troglobit@gmail.com>

Series applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
