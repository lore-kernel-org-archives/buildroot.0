Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10FEBC433F5
	for <buildroot@archiver.kernel.org>; Wed,  5 Jan 2022 12:02:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9F87B80BE5;
	Wed,  5 Jan 2022 12:02:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GC5ZVn55yGPI; Wed,  5 Jan 2022 12:02:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E551E80BDA;
	Wed,  5 Jan 2022 12:02:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3011A1BF575
 for <buildroot@lists.busybox.net>; Wed,  5 Jan 2022 12:02:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1D4FB40502
 for <buildroot@lists.busybox.net>; Wed,  5 Jan 2022 12:02:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9CR4uAG-Il21 for <buildroot@lists.busybox.net>;
 Wed,  5 Jan 2022 12:02:11 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from eu-smtp-delivery-151.mimecast.com
 (eu-smtp-delivery-151.mimecast.com [185.58.85.151])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 825C4400E6
 for <buildroot@buildroot.org>; Wed,  5 Jan 2022 12:02:11 +0000 (UTC)
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 uk-mta-4-yqcrxHR8O2mq5WpD-xZjIw-1; Wed, 05 Jan 2022 12:01:42 +0000
X-MC-Unique: yqcrxHR8O2mq5WpD-xZjIw-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) with Microsoft SMTP
 Server (TLS) id 15.0.1497.26; Wed, 5 Jan 2022 12:01:42 +0000
Received: from AcuMS.Aculab.com ([fe80::994c:f5c2:35d6:9b65]) by
 AcuMS.aculab.com ([fe80::994c:f5c2:35d6:9b65%12]) with mapi id
 15.00.1497.026; Wed, 5 Jan 2022 12:01:42 +0000
From: David Laight <David.Laight@ACULAB.COM>
To: 'Arnout Vandecappelle' <arnout@mind.be>, "buildroot@buildroot.org"
 <buildroot@buildroot.org>
Thread-Topic: [Buildroot] [git commit] package/dnsmasq: fix build with gcc 4.8
Thread-Index: AQHYAZaQZzYHzKe/Tk2PWHN3/Q5x1KxUVHvg
Date: Wed, 5 Jan 2022 12:01:42 +0000
Message-ID: <516a76d402014d0fb3d8e1b0cb8ef462@AcuMS.aculab.com>
References: <20220104180257.67D5282BA6@busybox.osuosl.org>
In-Reply-To: <20220104180257.67D5282BA6@busybox.osuosl.org>
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
Subject: Re: [Buildroot] [git commit] package/dnsmasq: fix build with gcc 4.8
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

From: Arnout Vandecappelle
> Sent: 04 January 2022 17:49
> 
> commit: https://git.buildroot.net/buildroot/commit/?id=17aa836bd7a2c90da053398ce024b4113cf8b53c
> branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master
> 
> Fix the following build failure with gcc 4.8 raised since bump to
> version 2.86 in commit 5b29096f8fcb0acd8890073a56ba9d620b1f911c:
> 
> option.c: In function 'one_opt':
> option.c:2445:11: error: 'for' loop initial declarations are only allowed in C99 mode
>            for (char *p = arg; *p; p++) {
>            ^
> option.c:2445:11: note: use option -std=c99 or -std=gnu99 to compile your code
> option.c:2453:11: error: 'for' loop initial declarations are only allowed in C99 mode
>            for (u8 i = 0; i < sizeof(daemon->umbrella_device); i++, arg+=2) {
>            ^
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/39b34a4e69fc10f4bd9d4ddb0ed8c0aae5741c84
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> ---
>  .../0001-src-option.c-fix-build-with-gcc-4.8.patch | 52 ++++++++++++++++++++++
>  ...2909d9080ff8743133fbd52427b4b2213171-typo.patch | 36 +++++++++++++++
>  2 files changed, 88 insertions(+)
> 
> diff --git a/package/dnsmasq/0001-src-option.c-fix-build-with-gcc-4.8.patch b/package/dnsmasq/0001-
> src-option.c-fix-build-with-gcc-4.8.patch
> new file mode 100644
> index 0000000000..50ecf2f18a
> --- /dev/null
> +++ b/package/dnsmasq/0001-src-option.c-fix-build-with-gcc-4.8.patch
> @@ -0,0 +1,52 @@
> +From 46312909d9080ff8743133fbd52427b4b2213171 Mon Sep 17 00:00:00 2001
> +From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +Date: Fri, 31 Dec 2021 17:29:44 +0100
> +Subject: [PATCH] src/option.c: fix build with gcc 4.8
> +
> +Fix the following build failure with gcc 4.8 raised since version 2.86:
> +
> +option.c: In function 'one_opt':
> +option.c:2445:11: error: 'for' loop initial declarations are only allowed in C99 mode
> +           for (char *p = arg; *p; p++) {
> +           ^
> +option.c:2445:11: note: use option -std=c99 or -std=gnu99 to compile your code
> +option.c:2453:11: error: 'for' loop initial declarations are only allowed in C99 mode
> +           for (u8 i = 0; i < sizeof(daemon->umbrella_device); i++, arg+=2) {
> +           ^
> +
> +Fixes:
> + - http://autobuild.buildroot.org/results/39b34a4e69fc10f4bd9d4ddb0ed8c0aae5741c84
> +
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +[Upstream commit 46312909d9080ff8743133fbd52427b4b2213171]
> +---
> + src/option.c | 6 ++++--
> + 1 file changed, 4 insertions(+), 2 deletions(-)
> +
> +diff --git a/src/option.c b/src/option.c
> +index ff54def..c57f6d8 100644
> +--- a/src/option.c
> ++++ b/src/option.c
> +@@ -2525,7 +2525,8 @@ static int one_opt(int option, char *arg, char *errstr, char *gen_err, int
> comma
> +           arg += 9;
> +           if (strlen(arg) != 16)
> +               ret_err(gen_err);
> +-          for (char *p = arg; *p; p++) {
> ++          char *p;
> ++          for (*p = arg; *p; p++) {

Isn't that going to get an error for mixing code and declarations?

	David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
Registration No: 1397386 (Wales)

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
