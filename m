Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A9C2606A31D
	for <buildroot@archiver.kernel.org>; Thu, 22 Oct 2026 21:24:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=QGd6SBjf
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E95FF60883;
	Thu, 22 Oct 2026 21:24:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YTKMUfnEKplQ; Thu, 22 Oct 2026 21:24:17 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 2B504606C4
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792704257;
	b=RGoJ3QQNjnPDwwNyc1yk67gvYXwGxVmDqF0FBLNm7uMIXxu0gygT9Cxc1E60KSkpjrJa
	 Bwq9tyD1ZRwYBwPbM45qs9L7K68wTdFmNCnjgbjb8wpo3gmQWJQcs7mzsg+1rtMC4sFz+
	 GyaPUvERBijODDEl/gA0soUf/Mk6XCYxAkSSEZ752KixhEEmeQuz0NtWyeH/4Gk/WcVs+
	 Jf1JF6ScRLlb1W19tASyn4v8czcxGUXxR3VliUGnZQJaKnphsodsqtkZady4/lzJ+gqu+
	 W40g2tHMeJi8EXolbYZYlJZy0RxBAE+gec6tVk0TH6qVAOzWJY86568NQElOdeHhDMg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792704257;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=XakV7T/WWMrkxx+WyChu1lionJEgO8hcoX6XrPDNNAY=;
	b=WAfrgVOQlrnXeuxNUQesyZ0dKr/BYmETxo9OtAISRDiaLsXaXf24AVSkGEQ+bK6ZbPfh
	 rLqmYd5oqRwNkUMWuheO9wMOME9WjT0MY4FnZUEX10wCaFXkVTdssE4dn3e/uqpKy1q+v
	 aWKVaglpwgCSF+4avsxy743p+z6kwk38m676a47xfHgP8HKGgS0+uEhugNz4w0F5yWb8W
	 wEQyxznR8hSu5yfK26itmS7ipgIFx5Lbnd6t1GFOEp5SLBMoM/Gx6RRIOS6B2xIwgYOcb
	 tso8o+2+MYFtuGmxED6q0bfXprIBIvM9yV8XfMMOxd9pElKqXE8SMJajyBYL7sKGqJg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792704257;
	bh=XakV7T/WWMrkxx+WyChu1lionJEgO8hcoX6XrPDNNAY=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=QGd6SBjfRuGr0SHkqyHdjN4VJ2X5rEbnscHXvPthp/2Dmv9tUBrj0EU9U5rXgHMBc
	 4BP+LvXwj6n9kiZf/cYc5MvLz07TQwkd2RHpL9uzFG84IVS3rf7R7EoAyUGlIcqPai
	 3xi1bs06QKzvUND9EHUoK+YiQ6kw5AOfRy7ymn5Jochu6HFDT504vHdiKuUp4cg+wA
	 VJui725uTgARArrrTy5xPpBFeGSFceIcTGiDm4ZFjI1CRKcyvwHKHumi/Qdca7HFaR
	 myOqI90DYyMlRIByHHEvAfm9UoJaP+xrvwWz6eGH3+lZFRL+HBNv7wOc3DogUz5Mm5
	 yB9qlX9iWqERA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2B504606C4;
	Thu, 22 Oct 2026 21:24:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 17A23356
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 21:24:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F1A3D4099A
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 21:24:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ov4215Yv7OEH for <buildroot@buildroot.org>;
 Thu, 22 Oct 2026 21:24:15 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org ADF764098D
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792704254;
 b=Ew1Vjw8Cy3Nnn3Uhl5sGxXNIxEMhopF3doVIaqsfP1j38boJyio9bLpRpUihhmncvnli
 s3984CNYVarilMMODUnLeHCOiivCUR98JC5u5DYVa01X08KsLggGIg9ktBY7tLvpa+M37
 HWy8aNBlZjyNUznYuqFFwnAp8efONDav1p6mi9VQSEzgnZZC6qZDYFUCWtLRV+cTuRNOx
 vrdPs/BRO7olUtQuQlLJDUW+PnHyvGJEb+bZD21wBlG0rfpzD9fQaDTDWIgdglgBRBtcP
 53RyZyVFx65OyAZuCY6SjEVq+17SZtrJCWro6wHjH4Z4zaai8xB0AGVlvRxjUDA9V/Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792704254;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=qx1P8RUdJ0wP3qg7M6bz7TZF6iP0PIsk4FYyqcJnPCk=;
 b=i3INk6ucyn9a47JVRmhLj5dOEWs/OKWKq8+B9QNa6VYYqZkXQe8ePxwBhjIZuDnglkb4
 XezQ1AEzmd6CsJVh947aob6rK+zDSllnZ0U+ZrMdfNh3AjV6JtmkppnLJ8hds6Fppgn51
 nrkFvN86XN+Rvy8A3ak2/oFP43O0ElrQl/LyqxaEekdabxFNG4EOrfIRveIVwXrJgjcVF
 /5fdTPJB11/EVRi5v8thaBCTqE3uwvwJrLELinbRM/1Ujkan2719crazvWyyda5bBWjqU
 DHU2SVZVx9XHyk4iGP4lT7XqmUMPj4IDz0tIfNjTqudGNG53Ko9mdSHk5OpUn3U82yw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=C85Wer8i; 
 arc=none smtp.remote-ip=185.246.85.4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp4.osuosl.org (Postfix) with ESMTPS id ADF764098D
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 21:24:14 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 8E64B4E412BD;
 Thu, 22 Oct 2026 21:24:12 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 5C56160763;
 Thu, 22 Oct 2026 21:24:12 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id CE322103281B0; 
 Thu, 22 Oct 2026 23:24:06 +0200 (CEST)
Date: Thu, 22 Oct 2026 23:24:06 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, 
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Thomas Perale <thomas.perale@mind.be>
Message-ID: <atp-8zKdT7tpRL1K@windsurf>
References: <20261022211048.1243312-1-bernd@kuhls.net>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261022211048.1243312-1-bernd@kuhls.net>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 1/1] package/bind: security bump version to
 9.20.30
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
	MAILING_LIST_MULTI,SPF_HELO_PASS autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Oct 22, 2026 at 11:10:48PM +0200, Bernd Kuhls wrote:
> https://ftp.isc.org/isc/bind9/9.20.30/doc/arm/html/notes.html#notes-for-bind-9-20-30
> 
> Fixes CVE-2026-19630, CVE-2026-94300, CVE-2026-96888 & CVE-2026-97313.
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
