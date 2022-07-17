Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F806C43334
	for <buildroot@archiver.kernel.org>; Sun, 17 Jul 2022 09:15:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2670740A38;
	Sun, 17 Jul 2022 09:15:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2670740A38
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id R-McMSToozy2; Sun, 17 Jul 2022 09:15:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1BCC5401A0;
	Sun, 17 Jul 2022 09:15:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1BCC5401A0
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 400501BF5AD
 for <buildroot@lists.busybox.net>; Sun, 17 Jul 2022 09:15:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1AA0E83EAA
 for <buildroot@lists.busybox.net>; Sun, 17 Jul 2022 09:15:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1AA0E83EAA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gGN_AJ9RWZ6O for <buildroot@lists.busybox.net>;
 Sun, 17 Jul 2022 09:15:44 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4D21483EA5
Received: from mail.tkos.co.il (guitar.tkos.co.il [84.110.109.230])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4D21483EA5
 for <buildroot@busybox.net>; Sun, 17 Jul 2022 09:15:43 +0000 (UTC)
Received: from tarshish (unknown [10.0.8.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.tkos.co.il (Postfix) with ESMTPS id 6CCA7440C81;
 Sun, 17 Jul 2022 12:15:16 +0300 (IDT)
References: <55f81de26c9b74283245f427bc7dd7ff4db09c06.1657777745.git.baruch@tkos.co.il>
 <20220717090719.GE2543@scaer>
User-agent: mu4e 1.8.5; emacs 27.1
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Date: Sun, 17 Jul 2022 12:09:15 +0300
In-reply-to: <20220717090719.GE2543@scaer>
Message-ID: <87pmi4xfph.fsf@tarshish>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=tkos.co.il; s=default; t=1658049316;
 bh=l4faoNx602yQApGNJBA686QLZQ4xte05Gm94BdaOh1k=;
 h=References:From:To:Cc:Subject:Date:In-reply-to:From;
 b=ZxHDd+cBn8WlvOeiRuEdslRFNoGu/Uf2d3BgrJpur86Pv7fJWbVxNwEjBlS9l+rxi
 DYmSAE7F7M2apnKHT533zGxVk0A1tmnvZRzRBWfjs7UeNW692mS0yL8ppyPZfHwCit
 udA9jwRb9+u1UWdIx5SqkdMm0nBHKxuAJn2Q7VWT1EZYlFn9JZi9zE8zDSa7WPgqhC
 /ncUfp6NEcqB6VJZ8+cFYtTQf6gwXvujq9K5i90ieIKvQXe9i1C4ZOg+YnH/sPgeEO
 ejn364u9gkOkK0guCaqXBxy0ZhftlJitB1rzr8cg5ZNKcVyjPHvE4Y/z2h+AXV+oYW
 Xq10KTIsAPq5g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=tkos.co.il header.i=@tkos.co.il
 header.a=rsa-sha256 header.s=default header.b=ZxHDd+cB
Subject: Re: [Buildroot] [RFC PATCH v2] package/uacme: requires TLS support
 in libcurl
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
From: Baruch Siach via buildroot <buildroot@buildroot.org>
Reply-To: Baruch Siach <baruch@tkos.co.il>
Cc: buildroot@busybox.net, Nicola Di Lieto <nicola.dilieto@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Yann,

On Sun, Jul 17 2022, Yann E. MORIN wrote:
> On 2022-07-14 08:49 +0300, Baruch Siach via buildroot spake thusly:
>> uacme configure script fails when libcurl does not support TLS. This
>> means that BR2_PACKAGE_LIBCURL_TLS_NONE is incompatible with uacme. But
>> there is no way to change the choice to something other than
>> BR2_PACKAGE_LIBCURL_TLS_NONE. So instead make uacme depend on libcurl
>> and !BR2_PACKAGE_LIBCURL_TLS_NONE.
>> 
>> As a result we can no longer select BR2_PACKAGE_OPENSSL since it causes
>> recursive dependency. Use 'depend on' instead, and add a comment to
>> explain this uncommon choice.
>> 
>> Fixes:
>> http://autobuild.buildroot.net/results/4e16f1d958ac3d30e26e7f17bdffc47834b0e2bd/
>> http://autobuild.buildroot.net/results/4e16f1d958ac3d30e26e7f17bdffc47834b0e2bd/
>> http://autobuild.buildroot.net/results/25280409b32282b4dd40b1e88127051439380f3d/
>> 
>> Cc: Nicola Di Lieto <nicola.dilieto@gmail.com>
>> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
>> ---
>> v2:
>>   Add dependency on crypto back end for uacme itself (Nicola Di Lieto)
>> ---
>>  package/uacme/Config.in | 12 ++++++++++--
>>  1 file changed, 10 insertions(+), 2 deletions(-)
>> 
>> diff --git a/package/uacme/Config.in b/package/uacme/Config.in
>> index 58b7c534e73d..815ab5da7d61 100644
>> --- a/package/uacme/Config.in
>> +++ b/package/uacme/Config.in
>> @@ -1,8 +1,9 @@
>>  config BR2_PACKAGE_UACME
>>  	bool "uacme"
>>  	depends on BR2_USE_MMU # fork()
>> -	select BR2_PACKAGE_OPENSSL if !(BR2_PACKAGE_GNUTLS || BR2_PACKAGE_MBEDTLS)
>> -	select BR2_PACKAGE_LIBCURL
>> +	# We can not use select here as it causes recursive dependency
>> +	depends on BR2_PACKAGE_OPENSSL || BR2_PACKAGE_GNUTLS || BR2_PACKAGE_MBEDTLS
>> +	depends on BR2_PACKAGE_LIBCURL && !BR2_PACKAGE_LIBCURL_TLS_NONE
>
> I don't think this is correct. Indeed, even with one of those packages
> enabled, there is nothing that prevents libcurl to be linked with
> another TLS provider, as that is decided with the choice entries, not
> with the packages being enabled.
>
> Instead, what about:
>
>     depends on BR2_PACKAGE_LIBCURL_OPENSSL \
>             || BR2_PACKAGE_LIBCURL_GNUTLS \
>             || BR2_PACKAGE_LIBCURL_MBEDTLS
>
> That way, it encodes both the fact that libcurl is enabled, *and* that
> is has the proper TLS support enabled.

As Nicola explained on v1, uacme does not care which crypto back end
libcurl uses, as long as there is one.

  https://lore.kernel.org/all/Ys5vPCrxDXWvj+ok@einstein.dilieto.eu/

Regardless of that, uacme requires one of these crypt back ends for its
own use. So I think these dependencies are correct.

>>  	help
>>  	  uacme is a client for the ACMEv2 protocol described in
>>  	  RFC8555, written in plain C with minimal dependencies
>> @@ -14,6 +15,13 @@ config BR2_PACKAGE_UACME
>>  
>>  	  https://github.com/ndilieto/uacme
>>  
>> +comment "uacme needs one of openssl, gnutls or mbedtls"
>> +	depends on !BR2_PACKAGE_OPENSSL && !BR2_PACKAGE_GNUTLS && !BR2_PACKAGE_MBEDTLS
>
> That's not correct. It would be better to phrase it, as Nicola suggested
> in their review of v1:
>
>     comment "uacme needs libcurl with openssl, gnutls or mbedtls"
>             depends on BR2_USE_MMU
>             depends on !BR2_PACKAGE_LIBCURL_OPENSSL \
>                     && !BR2_PACKAGE_LIBCURL_GNUTLS \
>                     && !BR2_PACKAGE_LIBCURL_MBEDTLS

This is overly restrictive. See above.

>> +comment "uacme needs libcurl with TLS support"
>> +	depends on BR2_USE_MMU
>> +	depends on !BR2_PACKAGE_LIBCURL || BR2_PACKAGE_LIBCURL_TLS_NONE
>
> ... then this comment is no longer needed.
>
> Also, comments about packages being not available should go either
> before the main symbol, or after the conditional options. Otherwise, the
> sub-options are not indented below the main symbol. With your code:
>
>     [*] uacme
>     [ ] enable ualpn
>
> while we want:
>
>     [*] uacme
>     [ ]   enable ualpn
>
> I'd have fixed that when applying, but I prefer to get some feedback
> about my proposal on the dependendcy condition.

I'll fix that if I send another iteration.

baruch

-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch@tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
