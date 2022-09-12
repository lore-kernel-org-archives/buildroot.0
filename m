Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A504BC6FA82
	for <buildroot@archiver.kernel.org>; Mon, 12 Sep 2022 20:35:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 96C6A410AE;
	Mon, 12 Sep 2022 20:35:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 96C6A410AE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wAzCMb5Z34qA; Mon, 12 Sep 2022 20:34:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6DCCA414C9;
	Mon, 12 Sep 2022 20:34:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6DCCA414C9
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1FB1E1BF3D0
 for <buildroot@lists.busybox.net>; Mon, 12 Sep 2022 20:34:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EF68460B26
 for <buildroot@lists.busybox.net>; Mon, 12 Sep 2022 20:34:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EF68460B26
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fdpdkVhWJFDN for <buildroot@lists.busybox.net>;
 Mon, 12 Sep 2022 20:34:54 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2140860A9D
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2140860A9D
 for <buildroot@buildroot.org>; Mon, 12 Sep 2022 20:34:54 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:55b:6f6c:5fb1:e8dc])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 8B351B0053A;
 Mon, 12 Sep 2022 22:34:46 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 12 Sep 2022 22:34:46 +0200
Date: Mon, 12 Sep 2022 22:34:46 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: erichiggins@gmail.com
Message-ID: <20220912203446.GB1082494@scaer>
References: <CAHfxMJ4cFRmUBteM-tM_gM=5fbdupjJRaahnbc34wifYgSn=gg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAHfxMJ4cFRmUBteM-tM_gM=5fbdupjJRaahnbc34wifYgSn=gg@mail.gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1663014889;
 bh=rL60ZwHnrlOLHqOuy3r4QzM7+q12S71znj97B3RSDnM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=kuyXt/jVe3tX0zh5TBDffprS+VxrE9BmmwsA/F9rJzk2+NAQJTqF9yZuU1mU9rEwg
 EjEb6/A68q//x1IXnAmpbG/CugxFmFnDpjdsFyXMb1NdsqDwxBYBMuevYr2Xok4sHn
 V8UgDY2BIOFD/altpBHFiVf7SQrKI4dC3j4UP5QO+wXuRcQm172v7+PL+tfwl1yRHo
 cwiHG5BqL6I6jp3FLg6JGlJODUSpwYxEPA7PzhUzp8pZrxZrVJQeSGBUaQS6mIZi9n
 nIE0Fduw6gXBg0J8zD1x3CRYY7Weh7rpBTG0+uqPU60iNA6ZsGKWPG/1Kj2jXVyQpp
 i/tMcaQlVggtQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=kuyXt/jV
Subject: Re: [Buildroot] [PATCH 1/1] utils/scanpypi: supply package name to
 setup() when not provided
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
Cc: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Eric, All,

+James for his expertise in that file

On 2022-09-12 09:28 -0700, erichiggins@gmail.com spake thusly:
> Signed-off-by: Eric Higgins <erichiggins@gmail.com>

Thanks for this patch.

However, this will need a bit more explanations in the commit log. Start
by describing the issue, explain why that happens, and how it is fixed.

You can get an idea of how to structure that by looking at existing
commit logs: git log utils/scanpypi

> ---
>  utils/scanpypi | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/utils/scanpypi b/utils/scanpypi
> index 452b4a3fc3..a5522a879e 100755
> --- a/utils/scanpypi
> +++ b/utils/scanpypi
> @@ -58,8 +58,9 @@ def setup_decorator(func, method):
>      def closure(*args, **kwargs):
>          # Any python packages calls its setup function to be installed.
>          # Argument 'name' of this setup function is the package's name

So, this comment states that setup() is called with 'name' argument, but
what your commit title implies is that it is not always true. So, this
comment is now incorrect, and must be amended apropriately.

Could it be that sometimes, 'name' is a keyword argument, and in some
other case, it is just a positional argument?

> -        BuildrootPackage.setup_args[kwargs['name']] = kwargs
> -        BuildrootPackage.setup_args[kwargs['name']]['method'] = method
> +        name = kwargs.get('name', BuildrootPackage.setup_args['name'])
> +        BuildrootPackage.setup_args[name] = kwargs
> +        BuildrootPackage.setup_args[name]['method'] = method
>      return closure
> 
>  # monkey patch
> @@ -147,6 +148,7 @@ class BuildrootPackage():
>          self.url = None
>          self.version = None
>          self.license_files = []
> +        self.setup_args['name'] = self.real_name

Otherwise, I do understand what the code does, and I think this is the
correct solution. James, your opinion?.

Still, what is missing is an explanation on why this change is needed.

Regards,
Yann E. MORIN.

>      def fetch_package_info(self):
>          """
> -- 
> 2.25.1
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
