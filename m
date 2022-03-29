Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E13E6C433EF
	for <buildroot@archiver.kernel.org>; Tue, 29 Mar 2022 06:12:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 88D5D8417A;
	Tue, 29 Mar 2022 06:12:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iVqO7TwqRD8o; Tue, 29 Mar 2022 06:12:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A703184152;
	Tue, 29 Mar 2022 06:12:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id ACD811BF32C
 for <buildroot@lists.busybox.net>; Tue, 29 Mar 2022 06:12:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9D78484152
 for <buildroot@lists.busybox.net>; Tue, 29 Mar 2022 06:12:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ylpje3C8XMee for <buildroot@lists.busybox.net>;
 Tue, 29 Mar 2022 06:12:47 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from eu-smtp-delivery-151.mimecast.com
 (eu-smtp-delivery-151.mimecast.com [185.58.85.151])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 173EF8413A
 for <buildroot@buildroot.org>; Tue, 29 Mar 2022 06:12:46 +0000 (UTC)
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 uk-mta-254-XFVFgPYjPk-VofDV1OqkVQ-1; Tue, 29 Mar 2022 07:12:42 +0100
X-MC-Unique: XFVFgPYjPk-VofDV1OqkVQ-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) with Microsoft SMTP
 Server (TLS) id 15.0.1497.32; Tue, 29 Mar 2022 07:12:42 +0100
Received: from AcuMS.Aculab.com ([fe80::994c:f5c2:35d6:9b65]) by
 AcuMS.aculab.com ([fe80::994c:f5c2:35d6:9b65%12]) with mapi id
 15.00.1497.033; Tue, 29 Mar 2022 07:12:42 +0100
From: David Laight <David.Laight@ACULAB.COM>
To: "'Jason A. Donenfeld'" <Jason@zx2c4.com>, James Hilliard
 <james.hilliard1@gmail.com>, Arnout Vandecappelle <arnout@mind.be>, "Yann E.
 MORIN" <yann.morin.1998@free.fr>, buildroot <buildroot@buildroot.org>
Thread-Topic: [Buildroot] [PATCH v3] package/urandom-scripts: actually credit
 seed files via seedrng
Thread-Index: AQHYQyqCzS72cv7q9kGHCbtoXkDsoazV3/RQ
Date: Tue, 29 Mar 2022 06:12:41 +0000
Message-ID: <cc188e7013f94bb5a39f87e78c2e697b@AcuMS.aculab.com>
References: <20220327202415.1248312-1-Jason@zx2c4.com>
 <20220329050401.110856-1-Jason@zx2c4.com>
In-Reply-To: <20220329050401.110856-1-Jason@zx2c4.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.202.205.107]
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=C51A453 smtp.mailfrom=david.laight@aculab.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: aculab.com
Content-Language: en-US
Subject: Re: [Buildroot] [PATCH v3] package/urandom-scripts: actually credit
 seed files via seedrng
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Jason A. Donenfeld
> Sent: 29 March 2022 06:04
> 
> The RNG can't actually be seeded from a shell script, due to the
> reliance on ioctls. For this reason, the seedrng project provides a
> basic script meant to be copy and pasted into projects like buildroot
> and tweaked as needed: <https://git.zx2c4.com/seedrng/about/>.
> 
> This commit imports it into buildroot and wires up the init scripts to
> call it. This also is a significant improvement over the current init
> script, which doesn't credit entropy and whose hashing in shell scripts
> is sort of fragile.
> 
> As seedrng.c is a short tiny C program, we include this here in the
> package, like a few other packages do. Later we'll investigate adding
> this to busybox, but for now, this is a good start and a positive step
> in the right direction.

It isn't that tiny, this bloats out to quite a lot of code.

> +#define G(r, i, a, b, c, d) do { \
> +	a += b + m[blake2s_sigma[r][2 * i + 0]]; \
> +	d = ror32(d ^ a, 16); \
> +	c += d; \
> +	b = ror32(b ^ c, 12); \
> +	a += b + m[blake2s_sigma[r][2 * i + 1]]; \
> +	d = ror32(d ^ a, 8); \
> +	c += d; \
> +	b = ror32(b ^ c, 7); \
> +} while (0)
> +
> +#define ROUND(r) do { \
> +	G(r, 0, v[0], v[ 4], v[ 8], v[12]); \
> +	G(r, 1, v[1], v[ 5], v[ 9], v[13]); \
> +	G(r, 2, v[2], v[ 6], v[10], v[14]); \
> +	G(r, 3, v[3], v[ 7], v[11], v[15]); \
> +	G(r, 4, v[0], v[ 5], v[10], v[15]); \
> +	G(r, 5, v[1], v[ 6], v[11], v[12]); \
> +	G(r, 6, v[2], v[ 7], v[ 8], v[13]); \
> +	G(r, 7, v[3], v[ 4], v[ 9], v[14]); \
> +} while (0)
> +		ROUND(0);
> +		ROUND(1);
> +		ROUND(2);
> +		ROUND(3);
> +		ROUND(4);
> +		ROUND(5);
> +		ROUND(6);
> +		ROUND(7);
> +		ROUND(8);
> +		ROUND(9);

I've not looked at why the code is doing this.
If you are feeding data that has come from the RNG back in
as state/entropy why does it contain a copy of blake2?

I was expecting to see a program that copied stdin to /dev/urandom
in a manner that actually credited entropy.
About 10 lines of code.

	David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
Registration No: 1397386 (Wales)

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
