Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B92E6C369BD
	for <buildroot@archiver.kernel.org>; Sat, 19 Apr 2025 12:29:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 479EA60667;
	Sat, 19 Apr 2025 12:29:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Bs0GoO6u0YQn; Sat, 19 Apr 2025 12:29:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7B76A6068D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7B76A6068D;
	Sat, 19 Apr 2025 12:29:25 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 1B795230
 for <buildroot@buildroot.org>; Sat, 19 Apr 2025 12:29:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0D099402A7
 for <buildroot@buildroot.org>; Sat, 19 Apr 2025 12:29:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2TNE5YdNc6lq for <buildroot@buildroot.org>;
 Sat, 19 Apr 2025 12:29:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.2;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org E339A40147
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E339A40147
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E339A40147
 for <buildroot@buildroot.org>; Sat, 19 Apr 2025 12:29:22 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 6FB882003E8;
 Sat, 19 Apr 2025 14:29:18 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 19 Apr 2025 14:29:18 +0200
MIME-Version: 1.0
Date: Sat, 19 Apr 2025 14:29:18 +0200
From: Julien Olivain <ju.o@free.fr>
To: Joseph Zikusooka <josephzik@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <CAPWx8vsoJUt8YMJG1aUqFRK1=yizNbgjVjGL1Q1+9ygjJGnZLA@mail.gmail.com>
References: <CAPWx8vsoJUt8YMJG1aUqFRK1=yizNbgjVjGL1Q1+9ygjJGnZLA@mail.gmail.com>
User-Agent: Webmail Free/1.6.10
Message-ID: <dfe20dbb0429ce970599a992005b9ffa@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1745065759;
 bh=WMkRtL+sSZqsw0BdxxS0DuorAAMDr0FWn3VCVMp1QV0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Ol/Q3PS5VQqsGdBHKpGSFlHOgqUIWBdlyCJjW6qeqKhYFV2FFab/9cCrJ1LmLaoYF
 q6z/VOcFijEbTcrrLXOeUN/z3776AGPtk9QZ/GVlslgzQGo4lNVXo9Co3Ji6s1ktRG
 Dn2yO0AAUNKDWTetuUhpTcEE8ZVJqHVBmqpLU6tfE7xIN+ImgBj+Wl1pxY2x40WJM+
 cU64QTr7ueldzeuYlL0LXzjSwBp/ZHJ6IZvej44Xb1kPtYPril/kyOPfMqTqdxVl5r
 XUrGMFdROxBHhDjePmEwhlnXKKKzN7MDc1lzhQ1HAUusopfqqKfbWT78zBb8mzw5Ig
 glFwnRR6+Rh1g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=Ol/Q3PS5
Subject: Re: [Buildroot] host-m4 build on Fedora 42 fails
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Joseph,

Thanks for reporting the issue.

On 18/04/2025 16:14, Joseph Zikusooka wrote:
> Recently upgraded to Fedora 42 and since then I am unable to compile
> buildroot.  Make fails at the host-m4 package.
> I looked up several sources and found this:
> https://lists.gnu.org/archive/html/m4-discuss/2025-02/msg00000.html
> 
> The work around on Fedora 42 was to build m4 with the environment
> flags as follows:
> CFLAGS='-std=gnu17' ./configure && make
> 
> I tried to patch m4.mk as follows, but the build is still failing.  Any 
> ideas?
> 
> --- a/m4.mk     2025-04-18 17:02:01.174923317 +0300
> +++ b/m4.mk     2025-04-18 17:03:29.285694673 +0300
> @@ -10,4 +10,7 @@
>  M4_LICENSE = GPL-3.0+
>  M4_LICENSE_FILES = COPYING
> 
> +M4_CONF_ENV = CFLAGS="-std=gnu17"
> +M4_MAKE_ENV = CFLAGS="-std=gnu17"
> +

To workaround this gcc15 issue with the current m4
version 1.4.19, you should probably pass the CFLAGS as:

HOST_M4_CONF_ENV = CFLAGS="$(HOST_CFLAGS) -std=gnu17"

Also, there is an upcoming m4 release which will fix
this gcc 15 issue. See:
https://git.savannah.gnu.org/cgit/m4.git/commit/?h=branch-1.4&id=a22c9802dd7e724eaefb21dc21d84ac2d3a49c89

More specifically:
"
** Update to comply with newer C standards, and inherit portability
    improvements from gnulib.
"

If this new m4 release is not published in the coming days/weeks
please submit an updated version of this patch to fix this issue.
Please also add a comment that this CFLAGS modification is needed
for m4-1.4.19 and host-gcc15 and should be removed in the next
bump to 1.4.20.

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
