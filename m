Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BADDC433F5
	for <buildroot@archiver.kernel.org>; Fri, 10 Dec 2021 19:09:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 48DCD423C3;
	Fri, 10 Dec 2021 19:09:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KgTsmzBOkIHa; Fri, 10 Dec 2021 19:09:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7C5AB423A5;
	Fri, 10 Dec 2021 19:09:46 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 53D351BF3D4
 for <buildroot@lists.busybox.net>; Fri, 10 Dec 2021 19:09:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 436A883F0E
 for <buildroot@lists.busybox.net>; Fri, 10 Dec 2021 19:09:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NXpTq_uV44in for <buildroot@lists.busybox.net>;
 Fri, 10 Dec 2021 19:09:44 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 24AB683F0B
 for <buildroot@buildroot.org>; Fri, 10 Dec 2021 19:09:43 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id t5so32581042edd.0
 for <buildroot@buildroot.org>; Fri, 10 Dec 2021 11:09:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=6ZMVOFtBKSGwb5g5lZNHpfp7B8fBgOkBcwhAJ2En0hM=;
 b=UqfWufrCiLqFYUF7qlDAqznWskXYbFbCglM4OGyYNoLgDpUPGF//6ByFcCBo4je2ce
 7taIIG3gjb1STdjUE4OJQWBlvd2ecdsRrWVxOrxvPnrnpWTtGxIseAIydJSQFxnAk16J
 uLewQUl1Q1sw006Vgvdm/3633iQVJR1emuhvH4cXPCA5G2LtGIukUT3fsiM7z8216kLN
 JhTgbwZlSPn2JXLkiBhsDOxlO7YilRnvEehX2XB5HpVLt0nYhA4J68larmpUdr9vXt9k
 SLvo9TY86OeiVaBCt+ug4o/4WYvzb+LoGOQhu2Z8xAEZeTIsEZ+v72ifp9TnP8kXqUKu
 83Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=6ZMVOFtBKSGwb5g5lZNHpfp7B8fBgOkBcwhAJ2En0hM=;
 b=t/2tzmWq8QGEvVMO7dyIaS4wzZYST8p8/b1IBgWx6uDICIk7Yn96BlXWO8UqQEirun
 YEgOIsMrAhsc4Op7TFILl+tI3che/gsMU92zjivprLqqdJQWjgzRyeZWvwgQH5YhoRVj
 VDFEICnMbrE7o9/PJq7KTH8E+AoQlBbZaO5KT8OHIFSvpHG2hD4kgKNsYhP+/ey/Qmd2
 jqKIt0zxf4islCZwconHxwh4t7KxdU0RCYQfBE0iZJS1GLPJqSIGmOB0KzR+XfzLmD/4
 Nvt5SYPTCsWfaVe7gk+tnJLT2SMXdO3n/C+uHnj2wRCMOJr97DcqhKTmg6Wkj746o7Lt
 ZFyw==
X-Gm-Message-State: AOAM530LvIPyXl5YZa9cYW2N6vv+i8fv44LZ02b+y0CFJ92OKrTpYwzW
 7iltI8ghBcrhasJlszrTI9Ci6wE8TTxI6w==
X-Google-Smtp-Source: ABdhPJyX2AeaGJcpTUI8urP2yy6s9iGJQHfj7ncSdr1AQ1sRKjVLQ/G2kbqJ+VrN7xCox+Esq1D9Pw==
X-Received: by 2002:a05:6402:2744:: with SMTP id
 z4mr41835021edd.310.1639163382291; 
 Fri, 10 Dec 2021 11:09:42 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id l16sm1540400edb.59.2021.12.10.11.09.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Dec 2021 11:09:41 -0800 (PST)
Message-ID: <7713c9af-349d-3da4-b1a6-314303fd3555@mind.be>
Date: Fri, 10 Dec 2021 20:09:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Content-Language: en-GB
To: Ricardo Martincoski <ricardo.martincoski@gmail.com>,
 buildroot@buildroot.org
References: <20211115235336.3814968-1-ricardo.martincoski@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211115235336.3814968-1-ricardo.martincoski@gmail.com>
Subject: Re: [Buildroot] [PATCH] utils/checkpackagelib/lib_mk.py: fix check
 for overridden variable
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Titouan Christophe <titouan.christophe@railnova.eu>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 16/11/2021 00:53, Ricardo Martincoski wrote:
> Currently this .mk snippet results in unexpected behavior from
> check-package:
> |VAR_1 = VALUE1
> |ifeq (condition)
> |VAR_1 := $(VAR_1), VALUE2
> |endif
> 
> Fix commit "163f160a8e utils/{check-package, checkpackagelib}:
> consistently use raw strings for re.compile" that ended up doing this:
> -    CONCATENATING = re.compile("^([A-Z0-9_]+)\s*(\+|:|)=\s*\$\(\\1\)")
> +    CONCATENATING = re.compile(r"^([A-Z0-9_]+)\s*(\+|:|)=\s*\$\(\\1\)")
> 
> But raw strings do not expect escaping when referencing \1 and the
> pattern ends up searching for a raw '\\1' instead of an occurrence of
> the first pattern inside parenthesis.
> 
> |$ python3
> |Python 3.8.10 (default, Sep 28 2021, 16:10:42)
> |[GCC 9.3.0] on linux
> |Type "help", "copyright", "credits" or "license" for more information.
> |>>> import re
> |>>> p1 = re.compile('(foo)bar\\1')
> |>>> p2 = re.compile(r'(foo)bar\\1')
> |>>> p3 = re.compile(r'(foo)bar\1')
> |>>> s1 = 'foobarfoo'
> |>>> s2 = 'foobar\\1'
> |>>> print(p1.search(s1))
> |<re.Match object; span=(0, 9), match='foobarfoo'>
> |>>> print(p2.search(s1))
> |None
> |>>> print(p3.search(s1))
> |<re.Match object; span=(0, 9), match='foobarfoo'>
> |>>> print(p1.search(s2))
> |None
> |>>> print(p2.search(s2))
> |<re.Match object; span=(0, 8), match='foobar\\1'>
> |>>> print(p3.search(s2))
> |None
> |>>>
> 
> So use '\1' instead of '\\1' in the raw string.
> 
> Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Cc: Titouan Christophe <titouan.christophe@railnova.eu>

  Wow, great explanation!

  Applied to master, thanks.

  Regards,
  Arnout


> ---
> Caught this regression using unit tests.
> Before:
> https://gitlab.com/RicardoMartincoski/check-package/-/jobs/1785343039
> After:
> https://gitlab.com/RicardoMartincoski/check-package/-/jobs/1785364353
> ---
>   utils/checkpackagelib/lib_mk.py | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/utils/checkpackagelib/lib_mk.py b/utils/checkpackagelib/lib_mk.py
> index 0278354434..572fe75990 100644
> --- a/utils/checkpackagelib/lib_mk.py
> +++ b/utils/checkpackagelib/lib_mk.py
> @@ -77,7 +77,7 @@ class Indent(_CheckFunction):
>   
>   
>   class OverriddenVariable(_CheckFunction):
> -    CONCATENATING = re.compile(r"^([A-Z0-9_]+)\s*(\+|:|)=\s*\$\(\\1\)")
> +    CONCATENATING = re.compile(r"^([A-Z0-9_]+)\s*(\+|:|)=\s*\$\(\1\)")
>       END_CONDITIONAL = re.compile(r"^\s*({})".format("|".join(end_conditional)))
>       OVERRIDING_ASSIGNMENTS = [':=', "="]
>       START_CONDITIONAL = re.compile(r"^\s*({})".format("|".join(start_conditional)))
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
