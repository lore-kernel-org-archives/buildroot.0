Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFF8EC19F2B
	for <buildroot@archiver.kernel.org>; Thu,  4 Aug 2022 08:00:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 47345408F8;
	Thu,  4 Aug 2022 08:00:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 47345408F8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mSXmqU6P2JOh; Thu,  4 Aug 2022 08:00:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 050CC408E9;
	Thu,  4 Aug 2022 08:00:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 050CC408E9
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E935D1BF2C1
 for <buildroot@lists.busybox.net>; Thu,  4 Aug 2022 08:00:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C07CC408E8
 for <buildroot@lists.busybox.net>; Thu,  4 Aug 2022 08:00:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C07CC408E8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Au4RSkAFAWlY for <buildroot@lists.busybox.net>;
 Thu,  4 Aug 2022 08:00:30 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 65C9A40A0E
Received: from eu-smtp-delivery-151.mimecast.com
 (eu-smtp-delivery-151.mimecast.com [185.58.86.151])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 65C9A40A0E
 for <buildroot@buildroot.org>; Thu,  4 Aug 2022 08:00:30 +0000 (UTC)
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 uk-mta-323-GMgf1YKDOtqQQgtnyaNaag-1; Thu, 04 Aug 2022 09:00:27 +0100
X-MC-Unique: GMgf1YKDOtqQQgtnyaNaag-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) with Microsoft SMTP
 Server (TLS) id 15.0.1497.36; Thu, 4 Aug 2022 09:00:26 +0100
Received: from AcuMS.Aculab.com ([fe80::994c:f5c2:35d6:9b65]) by
 AcuMS.aculab.com ([fe80::994c:f5c2:35d6:9b65%12]) with mapi id
 15.00.1497.036; Thu, 4 Aug 2022 09:00:26 +0100
From: David Laight <David.Laight@ACULAB.COM>
To: 'Yann E.MORIN' <yann.morin.1998@free.fr>, "buildroot@buildroot.org"
 <buildroot@buildroot.org>
Thread-Topic: [Buildroot] [git commit] Makefile: error out printvars target
 when VARS is empty or unset
Thread-Index: AQHYp1txIfI6aiZ/TkCXXQTBYm2lP62eYXFQ
Date: Thu, 4 Aug 2022 08:00:26 +0000
Message-ID: <ffe375e2a41b4e069ce2632c28cea51d@AcuMS.aculab.com>
References: <20220803165240.BEDEB86D85@busybox.osuosl.org>
In-Reply-To: <20220803165240.BEDEB86D85@busybox.osuosl.org>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.202.205.107]
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: aculab.com
Content-Language: en-US
Subject: Re: [Buildroot] [git commit] Makefile: error out printvars target
 when VARS is empty or unset
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

From: Yann E.MORIN
> Sent: 03 August 2022 18:05
> 
> printvars returns nothing when VARS is not passed or empty. This is done
> on purpose, see commit fd5bd12379dc ("Makefile: printvars: don't print
> anything when VARS is not set").
> 
> An error message making explicit what is required from the user in order
> to use printvars is however better than silently doing nothing.
> 
> This adds a check for a non-empty VARS variable.
> 
> Cc: Quentin Schulz <foss+buildroot@0leil.net>
> Signed-off-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> ---
>  Makefile | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/Makefile b/Makefile
> index 07b594ea8a..5f266e36b2 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -1058,6 +1058,10 @@ endif
>  # to workaround a bug in make 4.3; see https://savannah.gnu.org/bugs/?59093
>  .PHONY: printvars
>  printvars:
> +ifndef VARS
> +	@echo "Please pass a non-empty VARS to 'make printvars'"

Shouldn't that have a >&2 ??

	David

	
> +	@exit 1
> +endif
>  	@:
>  	$(foreach V, \
>  		$(sort $(foreach X, $(.VARIABLES), $(filter $(VARS),$(X)))), \
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
Registration No: 1397386 (Wales)

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
