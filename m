Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78464C982D7
	for <buildroot@archiver.kernel.org>; Fri, 18 Sep 2026 21:51:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BAE1460C2C;
	Fri, 18 Sep 2026 21:51:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6HqGaE2VDopG; Fri, 18 Sep 2026 21:51:09 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 6794260BE5
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789768269;
	b=Uod+E7KAVbXJqHeYViHpK6OW/trteQXNLpHClTPBhgslHkkCferdIYC4cnk59FG0bAMp
	 ewvOL/RuHueRRjoV0w1u14K1Q8+XBqAwTT3X31orkZrzC80gXSYkJNvg1Ffgko/BJav/L
	 3S/Msu2Z5PprGrr7kAHHdkhl5MDV+4NcsQ6betIQksohbYRg7zARFkIpBtGC/IpGaIeHp
	 ytz2yENAaTswl0sTRSmsoFsfK8VruUKWQd/7YqMj7lCZCCxhCoEiu1FFdd9T/MHYvgAPn
	 IoD6TSSbICx+v1xLLaqSbXZdoWaXmQWkal5piR79FTin3msomDwXUvLM+7mDfwK/t9Q==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789768269;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=HoWozOY9WfpZDKZuGXvWMmvC/vUJt6aoYV0rf28lHpI=;
	b=OoDtjJM6Oa0H3k9PbzjhQZW1esf5wAA+V5PFZ8z11nqqfL9JMtE8TG68/LTTiP2TWSmC
	 FMbygDqlDPMjG1fxu2KyGwMEQcHgE818lEyfKkfvonNmrO5KOx5So30P5/uYzOQ/9d34E
	 furRFJYEf5uYKdJlDyM3W8b4cg/M/LCHy7HET7nJKN9A+AGQu3HKee70nB2dpFxaKVVmd
	 SgGwD2T7B+EjhVhMgY2ACIldU6gWrVMpodbGsra6yJR+VgAoRiNaYMblFuUsmK3mI3hY+
	 LT5VECbPM8iBK/MOVmB86fBzePqy2iGfOu37tvXA4IaCQPP61nTfsddcP0AZDSf9JMA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789768269;
	bh=HoWozOY9WfpZDKZuGXvWMmvC/vUJt6aoYV0rf28lHpI=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=pJRNGkg354sXwmTRpDrcf0pSdkdtSJi/l3wv9TD0uQYnIz9ReR0JMLiUnFB0tuRru
	 TQaMiZ4ssbfYo+Y2nE5k9aeFJgemIN4juKaSVVeYdEIsnc5Q0RZttEv6Y2Q78pdKPz
	 cxrEFvhiFu8naD+0GaZUXAIrVvXCWokfs0ymRRF9YzYWHHnGEZRb4VG0QOTzRSSlvB
	 J8Ok86sHgx9Zmqjbq64mPStgkgdIOKdgkFy3dzR25MpcCvJQ76igSiJXfc+cMx8OFU
	 iwXz2/VT7X9dviIWTHNlPreeeO/AqCGnPge8exUbe8zeSDXDLK/KDokfz6qILwSB/Z
	 i7i1yVYNREweg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6794260BE5;
	Fri, 18 Sep 2026 21:51:09 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 44CA113D
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 21:51:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2AB66400AB
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 21:51:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hrOimC-PeZAN for <buildroot@buildroot.org>;
 Fri, 18 Sep 2026 21:51:06 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 612AB40022
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789768266;
 b=fUVJ6Cux2SkDG1adSsEh2TPjqe7rCTyl3lbWY9qNB9InEWBtLCHBZMw7RBWFJN8U7XdE
 M68BOSkT6qEk2bUVtyVRpBkzeny7tr6X7gYxuPWvU6NQ3NbIKfY6Qil6YMV0rGwrVMVix
 PDu1UXqOF1FBCMolTMLfFy5CtjvNNkowZ7105uVUe+PF/xsWxGAikevgmqSwuv+Bq1OaW
 b7Xav8iDVaYkYzeXEHVmmLTgRTyV8JymM2dk4v367IklGa2VIno+OgU73570hrdoHEs8p
 NA4KUyI3lKdGSkkJRWwSY0erfGfHvbZOZa0Ad5/Ec4d6imIWnvJalr1zVHo2Q+WfmPQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789768266;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:Content-Transfer-Encoding:In-Reply-To:
 X-Last-TLS-Session-Version;
 bh=dp4rJvJdWOrSsELiwgNqwcDongkzxWDMrXkhjNFvNIo=;
 b=AEbtK3rXY0JGQkDmsD6pxwD5XiXlnFFNIa0HRFn98xdDOfsHxd8Lq09jxIRUtyf6EOhA
 ccQfVQiH3iMzosYrWvVwU/4TDgjCAp403i24b/sTZPz4uTx2nd7ZYF047GlxA9txrQi6g
 95noQymngefSRHBUqjivgettPnhsj6jI68g7tyHD7khkYUVHv5DiCB0z+QFAUZQeHKGsq
 xIn/ZXfgXgiURWkGG6ETCh0Kv0WOqNYLz3f/if+Zgc1Z2KXKOxPBFMSyhW5cpUbuQ9g1Z
 AU9cGKTobZsuhf8ko9OLfuMYTPdq3AIYkz9uJ4qagwHJjLzlOI/WcKucsUsloH9Ct6Q==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=x6R74oqn; 
 arc=none smtp.remote-ip=185.246.84.56
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 612AB40022
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 21:51:05 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 3BCC41A09A1
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 21:51:04 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 10D7A60649
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 21:51:04 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 661AE1032907F; 
 Fri, 18 Sep 2026 23:50:59 +0200 (CEST)
Date: Fri, 18 Sep 2026 23:50:59 +0200
To: Alexis =?utf-8?Q?Lothor=C3=A9?= <alexis.lothore@bootlin.com>
Cc: buildroot@buildroot.org
Message-ID: <aq2yL_rNdxOAv-Ll@windsurf>
References: <20260907-fix_openscap-v2-0-28f8f6ee3248@bootlin.com>
 <20260907-fix_openscap-v2-2-28f8f6ee3248@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260907-fix_openscap-v2-2-28f8f6ee3248@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH v2 2/2] support/testing: add tests for
 openscap
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, Sep 07, 2026 at 03:47:37PM +0200, Alexis Lothor=E9 via buildroot wr=
ote:
> Add basic tests for openscap, ensuring that it builds and runs a minimal
> command with different cryptographic backends:
> - libgcrypt
> - libnss
> - no crypto backend
> =

> Signed-off-by: Alexis Lothor=E9 <alexis.lothore@bootlin.com>

Applied, after adding relevant entries in the DEVELOPERS file.

Thomas
-- =

Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
