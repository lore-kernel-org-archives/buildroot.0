Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 896ACC32772
	for <buildroot@archiver.kernel.org>; Wed, 17 Aug 2022 19:24:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 14E8C4027F;
	Wed, 17 Aug 2022 19:24:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 14E8C4027F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2shi0aKJ8n2N; Wed, 17 Aug 2022 19:24:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id EF25C4013E;
	Wed, 17 Aug 2022 19:24:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EF25C4013E
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 73DDF1BF47E
 for <buildroot@lists.busybox.net>; Wed, 17 Aug 2022 19:24:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4CC8D60B7D
 for <buildroot@lists.busybox.net>; Wed, 17 Aug 2022 19:24:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4CC8D60B7D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cCOYkdSTycAx for <buildroot@lists.busybox.net>;
 Wed, 17 Aug 2022 19:24:45 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4A3C060BAC
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4A3C060BAC
 for <buildroot@buildroot.org>; Wed, 17 Aug 2022 19:24:45 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:1014:5f7:51e1:dc98])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id E44F52003AE;
 Wed, 17 Aug 2022 21:24:39 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Wed, 17 Aug 2022 21:24:39 +0200
Date: Wed, 17 Aug 2022 21:24:39 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20220817192439.GS2854108@scaer>
References: <20220817061157.4120650-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220817061157.4120650-1-james.hilliard1@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1660764282;
 bh=fQjN7DJ1AcwFueV/9VRbOIs2nok+Bypmz28Te3S7Ddc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=VfQ+Rc068Z+rG98y1e8a9sxleGB5FnrCfB42mvlFBhFR3HCjzXIfjcuUxC7G7Usjq
 AiNEArgJP7LnEiejAtgqlEOOP1OZUPWibiGhjeUewmfZkeJ+ao7RUbXZyBIvEBT2Cp
 V42m6xmesY9iy4j/kfgXvFg/RJ0DNTrNxgy1YAjyUahsEza0dHjF+Ib+7U17QssMOy
 iER2KFEBhrBELhAcOJANXkg7ETozbN4JDI49lDBXw0RWk7vRlsDpl2pyXJbqaj/fNR
 EFd+B9zv0mzzPMeeINOEWvt+UgPVLCwCrfuDy5W3QY6tBtSo8jdALlYEhvkyTqF5dx
 O8QV8ubLx1WFA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=VfQ+Rc06
Subject: Re: [Buildroot] [PATCH v3 1/1] utils/scanpypi: restore modules
 search path in case of error
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

James, All,

On 2022-08-17 00:11 -0600, James Hilliard spake thusly:
> We extend the modules search path to be able to load the package
> metadata. In case that fails, we need to restore it to its previous
> state to avoid leaking the path further.

Thanks for adding those explanations, it makes really more sense to
explain the patch. Given your further feedback on IRC, I've extended
that to explain that the restoration code was already present for the
case verything worked, and was missing only when it failed.

Applied to master, thanks.

Regards,
Yann E. MORIN.

> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
> Changes v2 -> v3:
>   - add more detailed commit log
> ---
>  utils/scanpypi | 34 ++++++++++++++++++----------------
>  1 file changed, 18 insertions(+), 16 deletions(-)
> 
> diff --git a/utils/scanpypi b/utils/scanpypi
> index cc13701c0e..452b4a3fc3 100755
> --- a/utils/scanpypi
> +++ b/utils/scanpypi
> @@ -296,23 +296,25 @@ class BuildrootPackage():
>          current_dir = os.getcwd()
>          os.chdir(self.tmp_extract)
>          sys.path.insert(0, self.tmp_extract)
> -        s_file, s_path, s_desc = imp.find_module('setup', [self.tmp_extract])
> -        imp.load_module('__main__', s_file, s_path, s_desc)
> -        if self.metadata_name in self.setup_args:
> -            pass
> -        elif self.metadata_name.replace('_', '-') in self.setup_args:
> -            self.metadata_name = self.metadata_name.replace('_', '-')
> -        elif self.metadata_name.replace('-', '_') in self.setup_args:
> -            self.metadata_name = self.metadata_name.replace('-', '_')
>          try:
> -            self.setup_metadata = self.setup_args[self.metadata_name]
> -        except KeyError:
> -            # This means setup was not called
> -            print('ERROR: Could not determine package metadata for {pkg}.\n'
> -                  .format(pkg=self.real_name))
> -            raise
> -        os.chdir(current_dir)
> -        sys.path.remove(self.tmp_extract)
> +            s_file, s_path, s_desc = imp.find_module('setup', [self.tmp_extract])
> +            imp.load_module('__main__', s_file, s_path, s_desc)
> +            if self.metadata_name in self.setup_args:
> +                pass
> +            elif self.metadata_name.replace('_', '-') in self.setup_args:
> +                self.metadata_name = self.metadata_name.replace('_', '-')
> +            elif self.metadata_name.replace('-', '_') in self.setup_args:
> +                self.metadata_name = self.metadata_name.replace('-', '_')
> +            try:
> +                self.setup_metadata = self.setup_args[self.metadata_name]
> +            except KeyError:
> +                # This means setup was not called
> +                print('ERROR: Could not determine package metadata for {pkg}.\n'
> +                      .format(pkg=self.real_name))
> +                raise
> +        finally:
> +            os.chdir(current_dir)
> +            sys.path.remove(self.tmp_extract)
>  
>      def get_requirements(self, pkg_folder):
>          """
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
