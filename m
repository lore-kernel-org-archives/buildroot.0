Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5079606A319
	for <buildroot@archiver.kernel.org>; Tue, 20 Oct 2026 22:06:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=RbahILbe
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 88BBA6071D;
	Tue, 20 Oct 2026 22:06:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ijacnQbJLFAs; Tue, 20 Oct 2026 22:06:13 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org C033F60712
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792533973;
	b=ICLjo0gPR0RkvxCE5jlr/M9q9Y1aPIdHxEomfHYZ7PkHFr25s/Dd5aOoCDuk7LcD4mzE
	 e5d8QPwgJOVjzlb+jMxJeyeHmw7PZRDTplKYK1aMRz1aw5Ig8QJX96e98gn4mgldSqGbm
	 dnpTHki/LZCzuCNQ+cUmyvRNfhJw4S+UPDeYF0MM57Nl0ld75z/V+lqUFGQZxwG9qibT5
	 HuTxWDgO4ayNejSvm55l/bxNdozrDMGzHKMZWHHcC7g9A/FrSQuZRxHFZCD1UdH1KfGWM
	 fktiALXhUgPcnWj4eUVxMbs/ZpM7/mzaj/kU5xJqwYMgOZQZwVKt2R5mwV5INgdS+Xg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792533973;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=TsLKrGx4VSrFkuosZnEZMvt9OvyIQ4EKYK1qR7PZg4k=;
	b=pLJ7oiCKDGpSP0r38AyGQMN+ysOWFvw52wD/+guTALeBsS1HJ7+wLf96YcvWoqc4ebVN
	 fsGe7t6g8D8ftb1Twm859jfkcDBbTlnRbSyeFBQW7BIX9olIXWUqdLbLdwXCq+6L+FSSl
	 QRPAy6kt5u97/i0koOtHTyjX5F3oUqNr4s/et3kGwhu/uQPCHMDUeAlNitJsAT2xl59yr
	 lRKiZcSZYVP7MMfl1lqqmcnlwrofP243/6QiLtRoIEZE4tzJrddXJaZJ6MoSfeCsCOpwL
	 rncJaVROVRnyqDY3AzDaUETuUo36kwl0ORKYUeURODElquwiPMUVxlW68QkG+7MWSvA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792533973;
	bh=TsLKrGx4VSrFkuosZnEZMvt9OvyIQ4EKYK1qR7PZg4k=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=RbahILbeADvZeXvMm94pxmmq1rbEwCz710KoKaitw76RC1MYGfIbp0JXQWTwkzKzv
	 rA4ERxMkrT8FjuDc8N6D2UajLcmA5NDYGjFU2ZgR1UXYBFQKTkHigMnR9Bj1cViFh5
	 wt/kq020fF7tUgjmy6QtlMZ9g/K1I/H7sy/uC4yeq2uTyTY53icxQvJnASp0la1+rZ
	 s0m3UFmlOhd/S4psW0zrjXVPctpHx/59sxrJlfd5sDWSwhYGeLAsuHbCQpjiBfVEci
	 SDtZhCwpMDtTiYjmO2TMfOEeBa8IevSQF+Zh6SE/B8YZUKUS4JIAMo+Ss4NyhqloGC
	 HR8f2XrDxgGLA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C033F60712;
	Tue, 20 Oct 2026 22:06:13 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id ADD0C1E9
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 22:06:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 90886400FC
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 22:06:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mdA2vygForR0 for <buildroot@buildroot.org>;
 Tue, 20 Oct 2026 22:06:10 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org D42E7400F3
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792533970;
 b=NSLqwVhuYPtGuWj7WKzTPJGNsYJPR7QhBfekEQCs0dpPW5ebF6uXFOr2GShTNS4zjeOH
 AOgSpqGV5k8NfNLd4FHBnRS2y86sAS8VwsZ+ATjUE4+4RPpZ/idhHg+GqYQPe6vIqHlJE
 ZEn/a3geGKup+FALWrzPOTeeSuVgqN5ESTb34lzvcAIE8tA0Gm+publMIbo8E+ly3p0HH
 I+AWA01zPd0t1j1IFqpHNiJCEHdeA5vnrBhh0RoaMHrbUYifIpNzbFz3N01YbEr+sTQMz
 Jsa6JmlogdXMLnHlXc4w1/DvCMTZfQSMXGK9ilJOcEWAQjibT3siHce1ZkO49HPWGIQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792533970;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=ApZeoEFklB/bC4PgEvAgiMDE2f29h9R3lhoToUl6cE0=;
 b=n5V6Wh414RJdSnUZK9ktp2oo90ZZmb7Nv7OzlHKIJECSxBze7ISZdRdA+p1l6FHDZCDs
 /Fk7ROOUUnRMLj+ZFcPL7sxgMPSuQyv8R9lP/Zv5xSOiL6zXzQqJXmq93/p2xfgMZz+XY
 Jg4+ylIj5Z6xHr4jZa14noFnCZVr8UFbvjc0szwrD5FnFIAf6CnYg6t6tJd47uDMzy34L
 oDqpx8k4DoWY4pvMT2qidMzHem16HsFubfKeB1abgAYchGZz5j3v4v/TbxWHf/abnkQ1b
 394NDWwym4+22kyAZvSgUPiFZyyA5o3NAoLKOcj/AZKaYao5Dq14RQ1gdd+y48vYAzw==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=s7jONDWx; 
 arc=none smtp.remote-ip=185.246.85.4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D42E7400F3
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 22:06:08 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id DD8FA4E41290
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 22:06:06 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id A1A9860393;
 Tue, 20 Oct 2026 22:06:06 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id D8D0010328E21; 
 Wed, 21 Oct 2026 00:06:01 +0200 (CEST)
Date: Wed, 21 Oct 2026 00:06:00 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
Message-ID: <atflnDYRbmMr3lGV@windsurf>
References: <20260408085531.1641831-1-bernd@kuhls.net>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260408085531.1641831-1-bernd@kuhls.net>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 1/1] package/libplacebo: bump version to
 7.360.1
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

On Wed, Apr 08, 2026 at 10:55:31AM +0200, Bernd Kuhls wrote:
> https://code.videolan.org/videolan/libplacebo/-/tags/v7.360.1
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

I am not 100% sure it is due to this bump, but there are build
failures of placebo:

  https://autobuild.buildroot.net/?reason=libplacebo%

I'm hitting this build failure in my on-going "all package" build.

Do you have an idea what's going on?

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
