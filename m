Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D307606A319
	for <buildroot@archiver.kernel.org>; Thu, 22 Oct 2026 21:18:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=dzp+WSGs
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E005440959;
	Thu, 22 Oct 2026 21:18:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gcE6DsYZkseT; Thu, 22 Oct 2026 21:18:06 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org E8D3940960
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792703886;
	b=YzHkg9OC4Y7ZlI7DnrNlyLVddFKy+h5jAoM6lY6joVAluaL8mTZn2C5L5AIe/9sPd9GP
	 K1FbDMlzGBYnxN+Uz5I1k1U/twumVmGSK8ileuQNbG2WAJxWmiAsdoT70Orula36jQbf3
	 pUQMhUycYihtS/nKQc+7DK4N7TRQ0yASYpEN5zVOcvDlX8UgGSHANYe1JlEglkSySlWNR
	 gVYXXHvhlA8Dwb/AFAcdAINjCwOrlT6sSUyZ+hPknKamq+yrkG1rIVz1UpMrIdo/+ZxfC
	 notyNDnO4gpN6zicOy4z9AuJX4ra0uXQNiTsd5uPnp00oe10OUV+QJbEs3wPJz9TWhQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792703886;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=aXoMHUdzIABAmapgXz2IcCq9Qd2/7n3vDH0kD69qxQM=;
	b=tG4Qhx+0oAvj4RLO/mI7HeXyWMlZPEb8bdVK5qkLpkVPqstD9ld9xebUj6IzP7TnzrFp
	 A6SnkyU2pkoex1bjfxOkwUjqkgExBPdd9MQWZYy/Sxw8t9ZpWJ9RWTZnIMVmQWgZBJXHo
	 9kXQ0+KLSLV4XfmOwfGO8VzuUCZgSSk3cwc57/zdyvtj4p4RIYqEBh4YGW7gDvoRxZYZ2
	 6UQ3kGMKo0ow2wupDLepvnsRg+6RtVF9MKUvHMeAdzmC58uAaGrRqw2G2oHVM2IAogLwe
	 BY/mJtOJDSI9gYDWtI2J7wLLhPH+vllNHjbiuj5Yxbg8H7NSfP6MVT8vU8gusewjUFA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792703886;
	bh=aXoMHUdzIABAmapgXz2IcCq9Qd2/7n3vDH0kD69qxQM=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=dzp+WSGs8bf2s2SPeH7Rie+JPIMuX6izgOVO6LPzT6LlBpl23jmVaiXHfc3Ob9CyV
	 Lz6t+t/MQPW75N5O8xVlSKYX2rrymak35Ruc/6uUgY+NywOhmkTV1YvygxW1+JhMRR
	 R5j2bQq73Q45XjrVCDi4usLfgPYGPjviIqA5fpKI3asK6bmBfkmphUqEMQMvFnBAOr
	 /8p8t/UvetPO65TXQmEvSy1u8H9/M8SB5SdcZyc2Q+bbQsGer01Bu2RyHieD0KQ+z0
	 mXVSmrqJ7Z4UFh8PKdNUJ6oj4MwhikaVpj5rZ5Ncmm9y4pc4PisWXJ3lSHo+UUw0Di
	 ukztZWE8CLN1Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E8D3940960;
	Thu, 22 Oct 2026 21:18:05 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 3492A4BC
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 21:18:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1A7654095B
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 21:18:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jmJExUNtRBPD for <buildroot@buildroot.org>;
 Thu, 22 Oct 2026 21:18:03 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 3925B40959
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792703883;
 b=mf2jGkDtYpvfzF/ryqjpwmcLa/cpADNymOkIQDZeb33JjyRScm6mfVN0KP7oZMPq7sHr
 rWwRWcHtnLXU995mjFHhDK6hHoVO73qkRgcbc8SgFldHjO5s+RTQ25MVVrgTLmI/6FwPC
 WsOI2YJUpzzQCAICCOg7CBMCTdXGSEN2GUOIE2OzgVUD68U5ZBrE4HLLMrfwuN1ZP7fw7
 G2mCcbfGj9DbVOm11vGgSyT717pN+edXSuYbFXlMlxfeJLiGgRrvuxTP3U0795NntUB65
 SOsv1s/htcv9aNZm0gWqyDYyU1317fE/raWqRU7XoKgzjCp3oRVrbDdwPRD7Xwv6tCw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792703883;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=OcL71EK8NpyLoJDBWf0YuCXdloxfS8hTJg95WwKgPs8=;
 b=hguN/x0D153rKSqA+xmYVBshQcH0DctAYgSkC1gMDU/jaQD/5kmYNyJkvrdgHjAjoD/0
 Mkp0Tba1J5Ln5WhQx8swRtx9107dVWNFqwVzVrs7LQDCOYzlnjvFRzmm8yMF5GVMNvHG+
 cMfvgE+Pyb1qfob2PAHB0S5qzij0MPaWeatOw1DQJchGLDAcjNxo5B2UBQT5SyyJh3MXL
 3omnkqiOYM0ZiVMXWl1WGoWWc/r+79cjbcDzMPFlC3Yq4BXPI0ozHgHhhy2r0Vi0m7K1I
 ssOWQ5o5Z+NVSGYu46Ef3zpiHzq9duvD47TnYEHdtFnXWZ/Gy7KeNND0udTNaIoqlDg==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=wBJKMzCd; 
 arc=none smtp.remote-ip=185.246.85.4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3925B40959
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 21:18:00 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 15A3C4E412BD
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 21:17:59 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id D718960763;
 Thu, 22 Oct 2026 21:17:58 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id DD6C9103281B0; 
 Thu, 22 Oct 2026 23:17:53 +0200 (CEST)
Date: Thu, 22 Oct 2026 23:17:53 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
Message-ID: <atp9fu5XAonGWE8W@windsurf>
References: <20261022194932.3750344-1-bernd@kuhls.net>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261022194932.3750344-1-bernd@kuhls.net>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 1/1] package/libunibreak: bump version to 8.0
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
X-Spam-Status: No, score=-16.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Oct 22, 2026 at 09:49:32PM +0200, Bernd Kuhls wrote:
> https://github.com/adah1972/libunibreak/blob/libunibreak_8_0/NEWS
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
