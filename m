Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8590AEB64DA
	for <buildroot@archiver.kernel.org>; Sat, 22 Jul 2023 10:28:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 00A3540467;
	Sat, 22 Jul 2023 10:28:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 00A3540467
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2hOVB-lfssLb; Sat, 22 Jul 2023 10:28:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 28432401A4;
	Sat, 22 Jul 2023 10:28:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 28432401A4
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 454041BF5A5
 for <buildroot@lists.busybox.net>; Sat, 22 Jul 2023 10:28:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1B01E60B2A
 for <buildroot@lists.busybox.net>; Sat, 22 Jul 2023 10:28:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1B01E60B2A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fodVa1tjkBUu for <buildroot@lists.busybox.net>;
 Sat, 22 Jul 2023 10:28:53 +0000 (UTC)
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E2B7A60760
 for <buildroot@buildroot.org>; Sat, 22 Jul 2023 10:28:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E2B7A60760
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 8288F5FFAC;
 Sat, 22 Jul 2023 12:28:46 +0200 (CEST)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:48782])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 22 Jul 2023 12:28:46 +0200
MIME-Version: 1.0
Date: Sat, 22 Jul 2023 12:28:46 +0200
From: Julien Olivain <ju.o@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
In-Reply-To: <20230721231207.70275816@windsurf>
References: <1689767858-17206-1-git-send-email-gwenj@trabucayre.com>
 <20230721231207.70275816@windsurf>
User-Agent: Webmail Free/1.6.1
Message-ID: <8f11cf6cadb890b13b9955fc22d37894@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1690021729;
 bh=JahylDtNBm/M+z4XJ1ZJ/y+KF6hBN9eCFWZ/KYCZn5o=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=V/0ozMFnIrQQtsimIAH32gWy1YIR3ab/E7KAUKhdbLkWN+yQNho42Yyc5jYha5rln
 A370jmSjXDPA/vxrsqs1Uk8Befzkag7zX2ByDrhEoYq/trjUffGftziO2Yrmid6z9E
 31IaB7fXNR1LmpeQtqnLbEBHEJ/SM/IozrHlb+pWsdxz8hV2B/rcQ0MzmB6q/ZP97z
 T8ZzYxxy7E0Bje4dTl+G7m30gaPuCrK5F0cMa2jB14jkl4AD2ZTGn5hB/HlZQAKyKs
 Hqug+JGpSIMtNiOrxS+wXLq4jcdHEJP8AanA3iRnSmeG7PYUZ24NEYVvYSi34KcCiv
 Qkce5O10wkLig==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=V/0ozMFn
Subject: Re: [Buildroot] [PATCH v3] package/gnuradio: fix gnuradio python
 libraries for cross-compile
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
Cc: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>,
 buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Thomas, Gwenhael,

On 21/07/2023 23:12, Thomas Petazzoni wrote:
> On Wed, 19 Jul 2023 13:57:38 +0200
> Gwenhael Goavec-Merou <gwenj@trabucayre.com> wrote:
> 
>> From: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
>> 
>> By default, module libraries have a suffix based on cpython version + 
>> host
>> architecture: this is fine for a native compile when these libraries 
>> are used on
>> the same computer (or similar computers). But when target architecture 
>> is not
>> the same python is unable to find libraries due to the wrong suffix 
>> and produces
>> unclear errors messages:
>> 
>> # python3
>> Python 3.11.3 (main, Jun 19 2023, 14:15:44) [GCC 11.4.0] on linux
>> Type "help", "copyright", "credits" or "license" for more information.
>> >>> from gnuradio import blocks
>> Traceback (most recent call last):
>>   File 
>> "/home/xxx/buildroot/output/build/gnuradio-3.10.4.0/gr-blocks/python/blocks/__init__.py", 
>> line 18, in <module>
>> ModuleNotFoundError: No module named 'gnuradio.blocks.blocks_python'
>> 
>> During handling of the above exception, another exception occurred:
>> 
>> Traceback (most recent call last):
>>   File "<stdin>", line 1, in <module>
>>   File 
>> "/home/xxx/buildroot/output/build/gnuradio-3.10.4.0/gr-blocks/python/blocks/__init__.py", 
>> line 22, in <module>
>> ModuleNotFoundError: No module named 'gnuradio.blocks.blocks_python'
>> >>>
>> 
>> By adding 
>> _PYTHON_SYSCONFIGDATA_NAME="$(PKG_PYTHON_SYSCONFIGDATA_NAME)" at 
>> configure time, sysconfig will
>> return correct informations (target architecture) instead of host 
>> architecture.
>> 
>> Signed-off-by: Gwenhael Goavec-Merou 
>> <gwenhael.goavec-merou@trabucayre.com>
>> ---
>> Changes v2 -> v3:
>> - replaces PYTHON_MODULE_EXTENSION by _PYTHON_SYSCONFIGDATA_NAME env 
>> (arnout)
>> Changes v1 -> v2:
>> - replaces patch by PYTHON_MODULE_EXTENSION option (result is the same
>>   but less "noisy")
>> ---
>>  package/gnuradio/gnuradio.mk | 4 ++++
>>  1 file changed, 4 insertions(+)
> 
> Not a show-stopper to merge this patch, but would it be possible to add
> a runtime test-case for gnuradio Python modules in support/testing/ ?
> I'm sure if you provide enough details to Julien Olivain (in cc), he
> will be able to help you add this test.

I'm already comfortable with Gnuradio development, so I'm willing to
write such a test. I'll send a proposal in the coming days...

Thanks for the suggestion!

> 
> Thanks!
> 
> Thomas

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
