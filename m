Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4469A606A31D
	for <buildroot@archiver.kernel.org>; Tue, 27 Oct 2026 20:00:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=SmhF28fm
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 17375605F7;
	Tue, 27 Oct 2026 20:00:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BNecup0D-Wdc; Tue, 27 Oct 2026 20:00:27 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 4AF96606A8
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793131227;
	b=nD/RdykJcu3Jdod97VFYU+KGd7UDa1kIIaArKyHXQhEHAbagif5BnxVTV3lNNUnBrsT7
	 4zgylffLwxCtMOD7Cz49ceuq0PDY+Mqk5HVd4iWSx1TtK3q3YOUnE6rJkEF7yBoLezUkb
	 eqkICmNDN7Cr97dtyudivxrh935FNKWy6YXxWWlL1bzIn8wZSx01gX/HxXln5qMqnsxTE
	 aSkkejZVVRNmqaHlLdKKhsuXqeKK7CiqBnG0p+1Aeu58CFD7axWm21Xaxmw5G9RkJlBB/
	 rwofc7TbgYVQZGnOmx7XYWDnGzNWsCddY21E4lhWa7FEUbiTLbqxCAnE0MJeCALj7Gg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793131227;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=CN8GjbEKL4Za52sq4eyUGk63IdprS5er8sR8laz+V6A=;
	b=L+9fe1pLOeHkkMZFXnFS0LWVCcB7Km8j5GNsDS3uZWhzZkqQDDerxmCAaommHNPFNyzC
	 aGUbESJ4+gSIE8UOcJuHic2tXrYoNp01twtRB/Ib56zzeni+ezEYmKMBOKKl/qWh+ZsPf
	 pOx7fsXZL4xuFZD/rNTK1NC+9wYuvm87prDoMmzBk8qp8vDspNBHQWWoAZODnqMxV9cgy
	 ajl9WLg/sYvE9Wia55zCAK6YoDejq2gb2gokNI53xbBJ0G7REp/suTkQJYbA4Erf2eRnK
	 RHHmnfcCUbbZIrUIiP/LoLUEhzgGywNVwlcyLO2fgw4jSfYHKDIEn42eXkAHWDxHo+Q==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793131227;
	bh=CN8GjbEKL4Za52sq4eyUGk63IdprS5er8sR8laz+V6A=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=SmhF28fmpB9ZpPuiu+PJ/S8aSv2zMhFjLa4SsbE3Re7dLF5hQmTeS0XG5VZCGYASK
	 /Le/nWvUInMKzQFrFz1Jtk+7F08VRgmxICuSEMmJFkagVWSWQ6f4RKjTHvhiKrAFPL
	 0kKl2w2E5IKP/wzTFEGNgsKKaJNfNxsnC+XYMrMZ+nIzcUbeTYv7TLK5MkIo4huUME
	 VOPfW6OPZLKI9TFQbsGDiLYFPTlG35meQxi8ftQRV0rmGkagER6rL9sssWZTFGijVI
	 jtw5M4OKR5L7WkjeVKOjZ+jKOtW+LbmFTPnFIL3j91zuP5N5IzTtwg8ArB1nXXuccV
	 7GHmUvaIr2f7g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4AF96606A8;
	Tue, 27 Oct 2026 20:00:27 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 4473F529
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 20:00:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 34B77606A8
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 20:00:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id N2KITKzgcRSi for <buildroot@buildroot.org>;
 Tue, 27 Oct 2026 20:00:24 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org D2A8B605F7
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793131224;
 b=cbuYOYN6Z9YBuPWoxqcLVPm+JSBlHl2k+ywFF95dEa0BA+HNwsHYP6Zsa/80ZG6ucfRh
 bFK9ISCBcqCo/JfeT5yHujUHR3/RE1Hf/TXE6nN6r3Z2GfzWvegXEE8N+aWTM0XhGW+Yj
 sED9tu2R88l7RU505Glmbnqh6qwOXFH4GNepbEjekoxd2yNFG2Uxtj8hAYhRp0Wh9e4e+
 nBnwnl753G19nMI+TheDTx4247LKNRFKVkdTY4et0CV9QTwUp//6fjsXBeU1O1QYyEACv
 SiSUdkUA93yloYGeVz+4kRwvTQGsnAF1i8d2OGDiu1MW19vbEiUqeHfzt2WIu6T/T5A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793131224;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=hNvf7X949+oLx8fs395wwG4huzY9lWIhzWFBSnuywUk=;
 b=EUZV9oeKyeJERYpxg8qFEdS2fzrKxNbWKe7amQ7VCaHTKhE/K0HXLps18P3p5NqDNtlr
 tVFrZVF617+tJmATOShZMFp96c+UaxhI9nasS64I+1KN4Tfb53f0oJEF8G69t6axh5hyY
 LRtMYQySx3iul5ma+IcwhPBaCEeJIequQvxlwgm+vsZFAmWr5OdL2oONXEgfGU/7wDfA5
 eU0wigHSUwE/aFuCLPk59ERNcJ9FUcZL5qzAuH5unmS1kEBXd19ZE3nR4DM4300ZPcO9t
 b1Ur/znthgqjjcdkQSITT8eDpz1TvYLWAAhTnjSxNm1/LIuw8p2jo5gz0/cohEq0BwA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b="u//nLQns"; 
 arc=none smtp.remote-ip=185.246.85.4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D2A8B605F7
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 20:00:21 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 5E6CA4E41336;
 Tue, 27 Oct 2026 20:00:19 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 2556D603BD;
 Tue, 27 Oct 2026 20:00:19 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 4E70610329093; Tue, 27 Oct 2026 21:00:13 +0100 (CET)
Date: Tue, 27 Oct 2026 21:00:13 +0100
To: Adam Duskett <adam.duskett@amarulasolutions.com>
Cc: buildroot@buildroot.org, Angelo Compagnucci <angelo.compagnucci@gmail.com>
Message-ID: <auECyfjLE9iJjcfV@windsurf>
References: <20261027164013.1602502-1-adam.duskett@amarulasolutions.com>
 <20261027164013.1602502-7-adam.duskett@amarulasolutions.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261027164013.1602502-7-adam.duskett@amarulasolutions.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH v2 07/14] package/mender-update-modules: add
 persistent-app module
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-11.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Oct 27, 2026 at 05:40:04PM +0100, Adam Duskett wrote:
> Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>

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
