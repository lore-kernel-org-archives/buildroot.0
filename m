Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75B09C982D7
	for <buildroot@archiver.kernel.org>; Sat, 19 Sep 2026 16:17:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 38CAC60BC8;
	Sat, 19 Sep 2026 16:17:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PU-e9st0Sm4A; Sat, 19 Sep 2026 16:17:53 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org CE4F6606DC
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789834672;
	b=OplswQMqFn9sGNRUKu0nNS3Nmrg+cn6fajW1RhQe5+6TfGaUr1RQ6QIxDHuCc5wiwOF6
	 sw5Fq/SQAlaC44cMKmj5but0kOp1KgcSa8TjBsGgjeB/0CIGR8zqYlpO62JccPIQdplRS
	 1ALQMM/vpL6lzSZ4E2dalJ18OVB7QIXttK9GMgvrSHHTuewu04NusI9qG9ri3jWJ4tE3L
	 0uCWAng1r6K+471cldIT4GMWzzpMVKfrgjydiZPxwZUdMh8PmOI1Jahl8RK7Dm3G0z6c4
	 bP/tOX8GC116ILCN2zKelpI0N8L5XzJYl2Qw8MHPB1F01L6c+GqeRrgXjqrT1COOWFw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789834672;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=RtgyM2td2bBb1o3bYynSp9S8Z4wmxv08uDrs3fUsHmI=;
	b=pUjN9j8ExvcqFLD951YmUVfX3CmZyzHZm0HCWQKIXW/Io2fEQibMyatebef0GRtSA89k
	 DzFFh9jsZs4z402A5Y0kT/zD+qL2sxV6c2U18xo6kOJ7D+e95pI7+9nQXT1fAKJB40ekk
	 ZSjl2XZGLKG1DrTanryS4oU8TtDW48Qq/gzeAN5cuX6IauklCovsnV3GpuSJGBcjnDLLx
	 E3YAu+58DWQMHVOcCAgFC7ytmIaiYDmUrc8tZgkH3eep2M1YOJ0ka7dScsLWzWdTKEwYH
	 0NBz6ggt9Q2rore76xwjX2mL8rO0tgGnlZCUrO6UBOzcsUjwpxTxu32Tlk/2rTrO/kw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789834672;
	bh=RtgyM2td2bBb1o3bYynSp9S8Z4wmxv08uDrs3fUsHmI=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=fAS1o8jicGBrojcy6/e9qJq2yLa7y2mpK6kzTc2UZZ2P5eKruzv6VOpIrnYmpsAeL
	 w6Z8lhhmrAtUC47ohx9pu4FIfHi9av13quNW6xoabX0F3PJHWFd/sTIbnZNztDmc58
	 ercGvZ2tHv6nh62fAuPsEOYzgreyx5xvbhS3IS75pZM6s6S/gv5XISN+K3wEXr4rKp
	 qP0gvW7pVrH0aIWPBPsKvW2PzLetzzuwFbhe3KH9EFgyGkU15dFmqXjqqNWZWklQ4h
	 6bJFspZwoaNrzbEDKpuQnFdBo5wnTGFdoC2pjab700xRtmfOnkE8J+7K198Iqy7jHp
	 GeFm3yhXiJtSA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id CE4F6606DC;
	Sat, 19 Sep 2026 16:17:52 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id C3DEE333
 for <buildroot@buildroot.org>; Sat, 19 Sep 2026 16:17:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A9EB940085
 for <buildroot@buildroot.org>; Sat, 19 Sep 2026 16:17:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id C4leyOC_SMO8 for <buildroot@buildroot.org>;
 Sat, 19 Sep 2026 16:17:50 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 1C05040026
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789834670;
 b=dzQKuyxqenxeubSAw0rkFHZ18FQH1ZNjHaMUTdR3XkqYBdugw8Y6lLVYVC6zDz8C1JSg
 LGUQLhDLw0jeTMPxDPQ2VZbMU8jtC13advqfPiRlgx80YXq4d2Jv72wpjFqPn/K5DLNKs
 odfcIfpvU5wO+qypouX5lEN9MQMxijwqiza0ONL3xOaZx6Gpl/d8BVYaz3mffQIhaxt6T
 /pnM6VzYxFDjymkO9MTEmHOSYflFrSjiGW0zXc9Q0hWbePxTRgP8OL2q+7aFAow7VClPR
 ln+77dZA3HjSsvuDHuQc+KfLniCNZlwCp9lybLwz5LQGUgH+90PUxqqtk5bVHY7HgHA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789834670;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=eYjdN2vzRniwHFuJ9iEDfVIFb5GVmeZvdeCzngoww7A=;
 b=sg0G4xlh9QmuAN05nRiAXGOIcxfB7PvJ+2KBUdD2WRqKbQ68Gh0qyat+bXyB8hlZR+9s
 CCF2qWawQuZi4y3wSGTGjk3YCHP5aKrvxPmeSLDXCQ9IZt0LbHQTD7zDFbAhgksOjv7A2
 xh9dba9UIXuqJ3NWnGwX02uF1MLlaYY57KBqMcBO2bjKx+5+j7ay+C1d/TjxrSKH4SBV1
 rQKovDP+QkxTsUSBw7yr2xP94GGpJ5cKCbN6PFAN8PONMNMy+Awe1RUGxsRTueCbSKxCt
 3YteDzOmkEkIj9qaVeXoRPVDbNpUKYYlP+geiUc9TDiieDAbz70L3VSOiU/3+OYSWgw==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=fug1oDOh; 
 arc=none smtp.remote-ip=185.246.85.4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1C05040026
 for <buildroot@buildroot.org>; Sat, 19 Sep 2026 16:17:48 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id A167D4E408AC
 for <buildroot@buildroot.org>; Sat, 19 Sep 2026 16:17:46 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 2E358606CA;
 Sat, 19 Sep 2026 16:17:46 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id CDD1310328B89; 
 Sat, 19 Sep 2026 18:17:44 +0200 (CEST)
Date: Sat, 19 Sep 2026 18:17:43 +0200
To: Buildroot List <buildroot@buildroot.org>, 
 Andreas Ziegler <br025@umbiko.net>
Message-ID: <aq61ogpVncz7KJ9r@windsurf>
References: <20260828194058.2405217-1-thomas.petazzoni@bootlin.com>
 <20260828194058.2405217-3-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260828194058.2405217-3-thomas.petazzoni@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH v3 2/2] package/libnfs: bump version to 7.0.1
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

On Fri, Aug 28, 2026 at 09:40:57PM +0200, Thomas Petazzoni via buildroot wrote:
> From: Andreas Ziegler <br025@umbiko.net>
> 
> Change log:
> https://github.com/sahlberg/libnfs/compare/libnfs-6.0.2...libnfs-7.0.1
> 
> All patches are dropped as they are all included in 7.0.1.
> 
> Signed-off-by: Andreas Ziegler <br025@umbiko.net>
> [Thomas: bump to 7.0.1]
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Applied to master, thanks!

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
