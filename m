Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19478CA5FCE
	for <buildroot@archiver.kernel.org>; Sun,  4 Oct 2026 15:55:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DC213809CE;
	Sun,  4 Oct 2026 15:55:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0HQYjHcgF9Am; Sun,  4 Oct 2026 15:55:27 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org A35AE809E7
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791129327;
	b=Tc+87uROpMLg7vWKWBqJPcqqXIarrmofI5woSHGfLvSxOs1/tYJPRRBc4j5byCKbkrZ5
	 HqFCYIQoaiHq9BqMhioztTZ0Rue+vDqvDbbY+maDWpa2X5caM4o1LzFCBJAb7So44fFzU
	 Lpb4WEpQW4vH9x2ktbYkRO0DKYlM5nIlhdbmzZ8zIhF2Y9cxAmUMuPzDMOs0Svqe+A8sc
	 2M7P9pua2heOMivdVz76Qiy2oJQGmHf5XrGxdnKosMJpXlX2GAdqBHw4N/4eJxX1WMfJ5
	 KAVFPBW7ssp4fut5CAVH/caYG/8tuBGtcCx6bA2ResPbyYRuNhaGi6GqKGhtD3I9E4Q==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791129327;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=+e+ro5t7Bc7wMOoMoZGdA0o4NCeXNo9NPs5x6k3cHo8=;
	b=YOOJhnm205ioJW6L+H5BVjH51TMLLV68bJ63Nd8xGc7WAiqafDFe7eqsMPGKSyhSsO6L
	 rwMMVoJTI63zSBJ6ujRKxp1b9CE/Q5P1h4AkX1ucfRrw9rVJqkJy7dBVEBQyHpxM1SaiG
	 ciFSvc3X1BmaCF7xU27/5uNAs3JNG/o2HSZLajcOkt63KtAn7XIM/+loTLigeDJVxpmYb
	 vWHP5zDvRzhqcrGr62AFVHph6IDmV6Misj0j2YdHiW9gbO1N5EOujBtQfsubnL9lZzZOs
	 P3O+8HcHPEAARaNRxAL3B5qfNdRVW7/+asnqOmVp4PpvnJnh7GBnfgxw+LSH8LmbESg==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791129327;
	bh=+e+ro5t7Bc7wMOoMoZGdA0o4NCeXNo9NPs5x6k3cHo8=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=D21ORi9lZwVz6TZVRgGQt4DjWh2rI+i2cWJNfmC8ZrEBUP8TdCAWvaPc6I/3gWqgg
	 OwwUJxf8jAwb+YIKBG3PWzLJ7Kr6PfAL1nCpPO09qnQYs1Eh6cKwMQi2YDvJ30tc9R
	 SQ9RrI2UFUMnCAi0HBKDTfmpKa3P5BvYOIG8gsGvify3h2G0RHmle/QlqluXnXLePd
	 HSgW6Tmq9tU63wzBVf9r735hjhnoW0dgcLuYUjodxrMY1dZpj62lBe44mKmrAbOhGM
	 CkVOwl3kHiewQAhfZLOjUYeq+yAgLlMrIrnHxeoLFj95eFfDan6Uth14QO5GIdF4ol
	 /UEbMxlXvmRNQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A35AE809E7;
	Sun,  4 Oct 2026 15:55:27 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 3E2B12E0
 for <buildroot@buildroot.org>; Sun,  4 Oct 2026 15:55:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 23F4E6060C
 for <buildroot@buildroot.org>; Sun,  4 Oct 2026 15:55:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DizOcAonsSOg for <buildroot@buildroot.org>;
 Sun,  4 Oct 2026 15:55:25 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org B54EF60602
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791129325;
 b=ANuu0czPMbGKGTsAISXJeaCyTMacK1BH4BO0kr29ddab14vLoNanJnHCXko0Dn6F2+QE
 kOVvLwzZrqxS/HCG960UE5Wi159gu3410pvuTSg+0Okl/+UY4pvQQo/cOPMG+K18ObgeW
 WE3X/GDegaxF1Jwk5IT/6S5y7dUFqGEk6eKK+jxWHNU4DCjuP8QEyy+9FjL4g6qPrEEpi
 kCKvFT0EhqiVHWv90MbvYR/T24dt5tls+yy5pz+EWQ2ws5/0JGa4oyh3cHDqxl3EYwec6
 K8dJfqoCKzP/f4RdC7pQl6UNz6kVe9tnZUJwuTw6/BSlK/MHxvbZK7A7SwOsmZH97yw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791129325;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=mFsPUrsPjBXV5ZcLirpHJ51HUHQMes+KHpJp+ZKT+w8=;
 b=ZJcr+P2NrTvDDLDDfyasKrXw5UdVUh2a9EHUWkMCslGRbvM6Nufe3MHxtq/Yc3tLnQ+j
 KxIONB3mRAb1YczroxnCJ+aAHcnq9KQnLtF0AE6jozJ9L3J21VRCfDjm9bsd8rD1klAy1
 43+6GtsxYs8Tj1OHmLhDKWLuVAJDVziSSOa1NyyD9wdDJHipcr7AC8K0T7Nenikw1agKe
 sLjr9fUyvOOMXVhL7w24BbaQA/jlroZMiS3HHCv61qM+hW+IU2QtpMG201SbyiKKH6c32
 3roC5EBo3PHPbymD3UmQPw0BLInALXdAJG/OsC7j606Bq4nMLzHrZicNmfg42I0bLLw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=T4NSBNei; 
 arc=none smtp.remote-ip=185.246.84.56
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B54EF60602
 for <buildroot@buildroot.org>; Sun,  4 Oct 2026 15:55:24 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id AF2821A112F
 for <buildroot@buildroot.org>; Sun,  4 Oct 2026 15:55:21 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 3E4DC604FE;
 Sun,  4 Oct 2026 15:55:21 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 162E210328192; 
 Sun,  4 Oct 2026 17:55:19 +0200 (CEST)
Date: Sun, 4 Oct 2026 17:55:18 +0200
To: Waldemar Brodkorb <wbx@openadk.org>
Cc: buildroot@buildroot.org
Message-ID: <asJ24vxAuv_JAjm7@windsurf>
References: <asJRgy5lq_7AenBu@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <asJRgy5lq_7AenBu@waldemar-brodkorb.de>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH] package/valgrind: bump to 3.27.1
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

On Sun, Oct 04, 2026 at 03:15:47PM +0200, Waldemar Brodkorb wrote:
> See here for a ChangeLog:
> https://valgrind.org/docs/manual/dist.news.html
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>

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
