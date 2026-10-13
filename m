Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43909CC6B03
	for <buildroot@archiver.kernel.org>; Tue, 13 Oct 2026 08:22:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0252F80A47;
	Tue, 13 Oct 2026 08:22:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Uor_UbAs3PhC; Tue, 13 Oct 2026 08:22:39 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org AC154809BE
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791879759;
	b=F3Mfu2ufWMd5/xk7Kkgvzn983JuEFeNugVSKai1zvyYgb6gwyibm/Q+UZB8rp/7t6CeI
	 OmTwJR0C6sax1A/LbnM4wN/iBz3dwH8nagTKB8LXtTYBmE43OQhVK53SBMHCYsqb6PWM7
	 6Qb/aNRTqDvsEZTcxWYNCfTuARtIX8xg8MBHREvqoOPsb0j/v7ni617tWiRTOMkPbP2a6
	 eY1b29UADtCaqJ87YA/Lur4j2axN7wiwdrgO1xFeG03v3e0iWN2GdRBquSNGKU3s1Cm5M
	 ToIuCke1dNAa9BwOO9u2prA5EmR9HCn7ZCYzKB/gO0OX7mZxN0J5BeqnqVgIVtLf7vg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791879759;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=lsAVXsQjpef2OOV7J/iWAMZ0sQhwtiPeB6imV37cvNs=;
	b=JtpZYZtiUsGaWRJVfPiDem/sGn+pYkga45pZz+TanR9EFb6yjFf7rMEgcjq2rc7/9JRa
	 W9fAOQF0R0p1+DY7D0AAs1dseeU6Rxjm31QaAg2ivFiVPImALnDGJSTmXw4dfNqPTYiXi
	 JhrXTROdYPgIBpeoA1dbR2y5qfXXfYvQM7W0a8Q0g0OC2mAflzJU8IWuP28SoO9juZoS5
	 8YiYSJO7a7q6BYi3ostDlw+gtNe+lKYqmgEJUhvkRYNTELEigk8b1ydBb9OLg/QY8aypM
	 1q1K7ny2jeTK7wiaqnEem2HXOlNbV39/4JQu9o6nuXleQ8Gf5GZr0ay/3zKGEqDCWrg==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791879759;
	bh=lsAVXsQjpef2OOV7J/iWAMZ0sQhwtiPeB6imV37cvNs=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=VVqi+UveSbwbZJf2yhZ7nrcoFo+cewFIm/NdA8DcGL7GRIVfCwSULIF2+JtkROeMI
	 K5Mp1LQ2VAY9Rr62r81maolhSRd1H0d5Slr5JjzM91bs640rNPnQ+GcUw7xPLfDkDs
	 DOEu/O34rdB3AoRfgjHNIrY7PaxPvnITELPMfUAf/zVWs82tXXV9c0iK98ATzh3n1K
	 KOONgQRErerLsIODlUHaOgJbQji3xl5CfBlEZge+qPhsrevdzsW104Oqsm18flw0iK
	 84ut6ZSB97SVrUkc0TtOx8SjGIoGRZRhlZtrxYzqkI54krZA6P7a0ex75Z+LE51f3g
	 KazURg1qSUR8g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id AC154809BE;
	Tue, 13 Oct 2026 08:22:39 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 7B3681E9
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 08:22:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2DDFE40068
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 08:22:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fT3eQzrhRbzc for <buildroot@buildroot.org>;
 Tue, 13 Oct 2026 08:22:37 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 5D9114005F
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791879757;
 b=pPvI/3hl6MU03G7YhxWnmgpvgwpty8dnL9+oBvWG3Ssy4fDAvBYHOPEVXRLEpZJwdpiC
 TA1JkDQetjlvQq7T8CGCxf9/wQtQoyiMgrPHPG3Uewb+fPK2v7liU+FDpGr4Oi7auPaaR
 3JHghQqBJJO32tUyIPgEmqGiXkk0XO7pCDQCvLKu75pYK5mybBbYOorJ07AcUSGy2L68C
 qPzl34Rf6uzfJ0Lm7ll6TlSfUN559w/t/Lw2tnJ9bmJyYq87XWm+NoJTRkPFpPx3/tls0
 qFS9cbEAk9ZiTDy15A5CwBvmo6LIsT0bF+MerZKhgz7ABbC5B3UrfNAeevZQcdrygRQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791879757;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=U8/x8OaEnRIykNQtpxbBhay2VqMyeXZQzpDa7StxPkk=;
 b=UFiQT1IQBJ/iiUyM8EAW1ywKbPbKFHIHoz0oEsaDLxEFQnaRLPVt7datbHN3jk/hTPiS
 65LbxrMgsV/FAto+lLZvMYl+VsiJU1VG7gpB5C0l9jm2HE4s3rTK4bsIhPEBwIOTgnCr0
 3/YvCY1vMWoSbThBW9kwM0+WHydqmfC4reV6hS/bOtq8OgWLa233z2D2xF0hMMG+QnEJ5
 T2L2UQJfMHOKsWnkeMXJ5KlqoVyG8lWmV8oa44CKdUXbGL8eaD89YTXqLYNI8Kgju5Hd6
 m+TWdpVwMnI9k6cOAIrPzwZRZv5c8zgvgiUKqd5hhcLNLEVce/Z9/Lo0HwWdA1qLEgg==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=syj4cs7u; 
 arc=none smtp.remote-ip=185.246.84.56
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5D9114005F
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 08:22:36 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 1AE651A11FB;
 Tue, 13 Oct 2026 08:22:35 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id D430860362;
 Tue, 13 Oct 2026 08:22:34 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 2458611D70160; 
 Tue, 13 Oct 2026 10:22:34 +0200 (CEST)
Date: Tue, 13 Oct 2026 10:22:33 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
Message-ID: <as3qIczkHrGEpfMp@windsurf>
References: <20261011130058.3443432-1-bernd@kuhls.net>
 <20261011130058.3443432-26-bernd@kuhls.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261011130058.3443432-26-bernd@kuhls.net>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH v9 25/52] package/xmrig: Add support for
 OpenSSL 4.0.0
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

On Sun, Oct 11, 2026 at 03:00:30PM +0200, Bernd Kuhls wrote:
> +     auto name = X509_get_subject_name(m_x509);
> +-    X509_NAME_add_entry_by_txt(name, "CN", MBSTRING_ASC, reinterpret_cast<const uint8_t *>(commonName), -1, -1, 0);
> ++    X509_NAME_add_entry_by_txt((X509_NAME *) name, "CN", MBSTRING_ASC, reinterpret_cast<const uint8_t *>(commonName), -1, -1, 0);

Just casting things seems suspicious, and indeed the upstream feedback
at https://github.com/xmrig/xmrig/pull/3808 suggests that it's not the
right way to fix this OpenSSL 4.0 compatibility issue.

Could you look into upstream's feedback?

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
