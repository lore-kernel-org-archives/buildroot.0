Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C389FC001B0
	for <buildroot@archiver.kernel.org>; Sun, 13 Aug 2023 07:34:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5A6F781434;
	Sun, 13 Aug 2023 07:34:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5A6F781434
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ROzZC41D5E6O; Sun, 13 Aug 2023 07:34:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6984D81435;
	Sun, 13 Aug 2023 07:34:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6984D81435
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 64F0B1BF470
 for <buildroot@lists.busybox.net>; Sun, 13 Aug 2023 07:34:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3E58C60EE2
 for <buildroot@lists.busybox.net>; Sun, 13 Aug 2023 07:34:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3E58C60EE2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id anjwhE3P1ljU for <buildroot@lists.busybox.net>;
 Sun, 13 Aug 2023 07:34:10 +0000 (UTC)
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C15CD60E38
 for <buildroot@buildroot.org>; Sun, 13 Aug 2023 07:34:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C15CD60E38
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:13dc:fe9:8e15:e643])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 9175F780377;
 Sun, 13 Aug 2023 09:34:05 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 13 Aug 2023 09:34:05 +0200
Date: Sun, 13 Aug 2023 09:34:05 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Francis Laniel <flaniel@linux.microsoft.com>
Message-ID: <20230813073405.GU421096@scaer>
References: <20230811152710.43564-1-flaniel@linux.microsoft.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230811152710.43564-1-flaniel@linux.microsoft.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1691912047;
 bh=XeMP9SWGbtwM+vfCUxHflP+6egmoL9EumC4cPzyPUR4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=u89YRDdnNhHNQ44b/mQkASsTdCxDi9rzygi8Qk4raUExPa73ZB/cC0WLifRlMBRLb
 4+d0fnLLdZOPXgp8qOqedvI2jpV2s2naCvKK2l4zF1DNeahiy7y7TkLu/zzXvbr9YZ
 m0X9u3xY3p5ujXscYyo83hRuUt8HTtpl9UEdN4vDEZYYCgPwFKFvjbaLEgZknwBHg0
 xDsuoA5DUJrsT7bzobb2vuekPOhIa9yCMGXJwvX0SjEPj36xptBoyGCrPJUuWBF8KZ
 am0TxootbKlPKFa6WxWzXwv4GeDAkpgsbn0P6kjCNSnoZwJJoGQSNkhFxaF1WZrF/h
 msj/rNGdyDYFA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=u89YRDdn
Subject: Re: [Buildroot] [RFC PATCH v2 0/3] Bump sysdig and falco libs
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Francis, All,

On 2023-08-11 17:27 +0200, Francis Laniel spake thusly:
> With this contribution, I bumped sysdig and falcosecurity-libs.
> Sadly, I am not fully satisfied with the result, hence the fact I marked it as
> RFC because I would like to get your feedback to make it better.
> 
> First of all, sysdig builds and runs:
> Welcome to Buildroot
> buildroot login: root
> # sysdig --version
> sysdig version 0.31.4
> # sysdig | head
> scap: loading out-of-tree module taints kernel.
> scap: driver loading, scap
> scap: adding new consumer (____ptrval____)
> scap: initializing ring buffer for CPU 0
> scap: CPU buffer initialized, size=8388608
> 26 15:12:28.226519423 0 sysdig (108) > switch next=0 pgft_maj=10 pgft_min=1348 vm_size=47288 vm_rss=19408 vm_swap=0
> 27 15:12:28.227409149 0 <NA> (0) > switch next=13 pgft_maj=0 pgft_min=0 vm_size=0 vm_rss=0 vm_swap=0
> ...
> 
> Nonetheless, I had to increase the minimal size of the image as libsinsp.a is
> quite big:
> # du -sh /sysdig/libsinsp.a
> 171.4M  /sysdig/libsinsp.a
> I am not forcefully sure where this library is used, I will investigate and
> maybe we can run everything without it.

There is no need to have static libs (.a files) on the target, as static
libs are only used at linking phase, which happens on the build machine.

So, unless sysdig embeds a linker and generates an executalbe from
those, it should be safe to remove.

> Secondly, I had to tweak heavily the libscap CMakeLists.txt to install several
> shared libraries.
> Indeed, the libraries are compiled as static, but the sysdig binary is not
> static, so it needs plenty of shared libraries to be run from the image.
> I am not really sure what is the best solution here (either compiling sysdig as
> static or not), but in any case my patch for CMakeLists.txt is not really clean.

I don't quite understand this part.

If the libraries are present as static libs at build time, then sysdig
would be statically linked to those, even if sysdig is not itself a
statically linked binary.

Indeed, it's possible to have, say;

    ld libfoo.a libbar.so main.o -o myprogram

where myprogram would then be a dynamically linked executable,, which
would have been linked with libfoo.a and dynamically linked with
libbar.so.

So you'll have to expand a bit on that part...

Ah, I think I understand what you are trying to say: falcosecurity-libs
build libscap.a and does not install it, but sysdig needs to link
against it, right?

If so, then it has nothing to do with the fact that sysdig is not
static, but just about the fact that sysdig needs to link with those
libraries.

I'll also further reply to the sysdig bump...

> Finally, I had to modify the magical number in falcosecurity-libs.mk for
> API_VERSION and SCHEMA_VERSION.
> While this is not really a big pain, I am wondering if this is not possible to
> read the corresponding values from the corresponding files (i.e. API_VERSION and
> SCHEMA_VERSION).
> So, for future update we would not need to take care of it ourselves.

That is what I was going to suggest while reviewing patch 1/3. I'll
reply further there.

Regards,
Yann E. MORIN.

> Changes since:
>  v1:
>   * Removed everything regarding VALIJSON in sysdig.mk.
>   * Bumped first falcosecurity-libs to avoid problem when building it.
>   * Added runtime test for sysdig.
> 
> Francis Laniel (3):
>   package/falcosecurity-libs: bump to version 0.10.5
>   package/sysdig: bump to version 0.31.4
>   support/testing/package: add new test for sysdig
> 
>  .../0002-cmake-Install-shared-libraries.patch | 61 +++++++++++++++++++
>  .../falcosecurity-libs.hash                   |  2 +-
>  .../falcosecurity-libs/falcosecurity-libs.mk  | 10 +--
>  package/sysdig/sysdig.hash                    |  2 +-
>  package/sysdig/sysdig.mk                      |  9 ++-
>  .../testing/tests/package/test_sysdig.config  |  1 +
>  support/testing/tests/package/test_sysdig.py  | 46 ++++++++++++++
>  7 files changed, 122 insertions(+), 9 deletions(-)
>  create mode 100644 package/falcosecurity-libs/0002-cmake-Install-shared-libraries.patch
>  create mode 100644 support/testing/tests/package/test_sysdig.config
>  create mode 100644 support/testing/tests/package/test_sysdig.py
> 
> --
> 2.34.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
