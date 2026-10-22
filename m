Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 477F3606A31A
	for <buildroot@archiver.kernel.org>; Thu, 22 Oct 2026 21:21:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=Z5sN3bjA
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1BA5660873;
	Thu, 22 Oct 2026 21:21:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5PDmqKY9nBW6; Thu, 22 Oct 2026 21:21:47 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org E56766080C
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792704107;
	b=WZswc0YOf2Bbz/0ZAAqP5OIBFCtJqnzTouQAN8Dp0ZQajuVNaae/9TyqmvYrqIVhkEKl
	 zgNDSY8gl/JnVzrtkqiIpd9Nh2xYw4Rt09uPEfoo/gcFLll55srJlRtcpMPc1Q2niQlIy
	 WPKZ+5d8iYyE52YDx2dux66zFIMAx9MO5rwWrs7LJR2vJY2mFPTOg/hlY/tncVbUmGKvB
	 R1viF+qhEQ/GJVXC3o9IyLWUrJOElIYvzHSX9UZHWpM+Q7fKWrzFrhNqsZYpCVHCrFTJH
	 8BZ9Wza0AHFfZDOUU972d16IyG281NO7/SGylnRvBLQGa4GrZZJl5XbaCdjAP/0YMKA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792704107;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=mMRh9WFMclhaSfU7vEDmUCpfnWF7x7+wT/A/oupmYq4=;
	b=ND7BCqFUSQI6kOSc8ahnSXgw5Dq5dxjopzQt/MP3qy2NBSFJyr3Az24d9iAltDyU/VwE
	 MfMnpxI+rWkmPrMvQ3dMoBAELIWxKnZL8UsZeT8LRL8bWPV7HYs44Zn/UuJ4da+hq8Smt
	 y0ry+YAUoWmLrSw+m1Nq3fmeLVw0rSHs0cqoSGM0U3/s3VMsRsAphEjbHhbdnK81ZLELB
	 ynVUgQzasfHuEf1Tl6c0xo9QkOJ8fTsTSg3ZLknBxhmFzvF9cD9GBfssXNlCo+51/rnBX
	 2OVPsvMLL3LgzwUO3INk0oiBPixvSW1oxuWeGpXotq6+FI98rrBW1lgKbFVqZx3lcsg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792704107;
	bh=mMRh9WFMclhaSfU7vEDmUCpfnWF7x7+wT/A/oupmYq4=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Z5sN3bjACpnxoq7NkPdvCK1Go1mqSYeDOLslPhMqNjF3hnGlxeF53teA1m7dI8MvO
	 RRwxH2wmDHl3jYH6/o12rxwJGgLVdCP8Q6NNocdl4GUUXumTnwY0JqFnN6qE0EO34m
	 QVBnOdsfVnJATFnv/B1a0nIdnf+zfxvyJaOfCwkwAhBWgftpXxUHE6S73DyCZbng4i
	 T7tMuWECwrfd9zAmX9f9lWlOg3/lm6X+dNbV6j0iPj5dq0dnmr9RmmpuA/o/PbpO83
	 5Hvtjf7YF2re1WdPJfY9PaOHzz6uVbtRq/ip8LhasxHTH79NXsQTPaLlkCbDXmeAax
	 FaK5VKMKwxIhg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E56766080C;
	Thu, 22 Oct 2026 21:21:46 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id A6BD03AF
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 21:21:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A48FB40270
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 21:21:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id U8L9FRn_NVps for <buildroot@buildroot.org>;
 Thu, 22 Oct 2026 21:21:45 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org CAD24401D0
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792704105;
 b=E0TPPIdrOWodt8cRpCWgkonQXVt6v0KPz81t3Q/ETnX5IkbLKXGSRFM3wKNIvuP25XLD
 ZWRRSuChRFZY51Xo9zTeaMr0D+VJx5jDwic0OKS/Dview83QLtsOSQRJqP2JSx7PfiGZK
 3nIApeCcm1itj3GM3kiy5HNP0eyU076Lsoc0TJAeCBJIJF+uMymWkWsvXxETiNaBZ9wmy
 mv3cPc3ntiAuRCp0KnocnHWY56vHEbh8R3eoeaxgLFh1l1AePHw/XhGNCHIJVyr6pGA0+
 M6FHoWH6AxvzjwNngdzreW30FtZEAS3d4zlRVLg9hoBPYJgsCUROB/fWm0Uv7xIAUUg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792704105;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=T1dh4hEUwh0ejXW0nnl1BuF9u0FDROnkVX/crw5N+Oo=;
 b=m2Ixe2UO5bCifUMyeMDuhha66SGQCRqgM6SL9UVn30CFdGLiEseyVtL5DdMkjmh8nGMk
 BmaDgxxxn0KsSAyF2CBKXtNfD/TiExvHgEiGZVjt6KfYh7uJOenRyjU0EgeRs4gQrgkq4
 Pi/22t7+jvdY4ZGgVo5hCOr4h+IOpO8vRieLt9TMzNr/Zr9bbZ51Xj3klaYJlJjbe/yxE
 OxrMwDsXZ8BpqEH5uKfGdXpBHAoThFyVvZ7/aerP73FdUF6Nb/aaA+ss0xzXmk6xn82vM
 QNmAlsICUuU7LHBu3Ir8H/Ddm91m8i6y32jgTKhsPh1WwBMulqHgUgX8gI2/o5ypUQw==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=zrVbbb13; 
 arc=none smtp.remote-ip=185.246.84.56
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CAD24401D0
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 21:21:43 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id DBA0B1A12DD;
 Thu, 22 Oct 2026 21:21:41 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id AA3AE60763;
 Thu, 22 Oct 2026 21:21:41 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 94188103281B0; 
 Thu, 22 Oct 2026 23:21:36 +0200 (CEST)
Date: Thu, 22 Oct 2026 23:21:35 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, James Hilliard <james.hilliard1@gmail.com>
Message-ID: <atp-XFVo3ig6vH3y@windsurf>
References: <20261022205205.3030927-1-bernd@kuhls.net>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261022205205.3030927-1-bernd@kuhls.net>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 1/1] package/python3: security bump version
 to 3.14.9
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

On Thu, Oct 22, 2026 at 10:52:05PM +0200, Bernd Kuhls wrote:
> https://www.python.org/downloads/release/python-3149/
> https://docs.python.org/release/3.14.9/whatsnew/changelog.html
> https://discuss.python.org/t/python-3-15-1-3-14-9-and-3-13-17-are-out/109595
> 
> Fixes CVE 2026-12345.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

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
