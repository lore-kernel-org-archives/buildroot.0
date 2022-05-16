Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B41D4C433EF
	for <buildroot@archiver.kernel.org>; Mon, 16 May 2022 21:32:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6393B4173A;
	Mon, 16 May 2022 21:32:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id e5iJoaNPV20J; Mon, 16 May 2022 21:32:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0C16A41721;
	Mon, 16 May 2022 21:32:10 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5E0D71BF35A
 for <buildroot@lists.busybox.net>; Mon, 16 May 2022 21:32:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 59FAF4010C
 for <buildroot@lists.busybox.net>; Mon, 16 May 2022 21:32:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YcRIR1WU1lJV for <buildroot@lists.busybox.net>;
 Mon, 16 May 2022 21:32:08 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1400E4034B
 for <buildroot@buildroot.org>; Mon, 16 May 2022 21:32:07 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:5536:e9db:e000:2fa9])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 9B5CBB004EE;
 Mon, 16 May 2022 23:32:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1652736725;
 bh=V+ippJyor+w1TSkugqeYPogrncXrC1/5cK0LsOcgcHM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=hWHC0lTuYPEJmQFdmmqRi62INtEz85S6cnT50UUKcIOBzNBGOepXa9dOoQ+dvDCzh
 H6VBLcUk+SozwxPN+c4CAfVQNjmBgYhp/URtiLski4M5worTSErKgjYWt9zbRibrJx
 l+VLbrJ2wD8WwEO1SzMq4qc7lPw1tw3Mg1YpzKm8XYUPPeAnSx07NMbs3w24ih2VQ7
 DetBl85BsMuxErfyoY5sr1g+hykA6lgTEuwjiihMXm1Ce/dEKcMw/Z9+/0SKItj66G
 KqVRzNA5/H4Emioka5GpUK+YCj18Bt5nr330wN93A8Wprx6qL9FmHXQy63tBVC6IKk
 yxgOzzQBItMMw==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 16 May 2022 23:32:02 +0200
Date: Mon, 16 May 2022 23:32:02 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Johan Oudinet <johan.oudinet@gmail.com>
Message-ID: <20220516213202.GJ1597494@scaer>
References: <20220516131334.1910858-1-johan.oudinet@gmail.com>
 <20220516131334.1910858-2-johan.oudinet@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220516131334.1910858-2-johan.oudinet@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 01/20] package/erlang-idna: remove
 unicode_util_compat library
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

Johan, All,

On 2022-05-16 15:13 +0200, Johan Oudinet spake thusly:
> This library is not needed for the erlang version packaged in
> Buildroot. Since it has been recently removed from erlang-idna
> upstream repository but not included in any release yet, backport this
> commit as a patch to this version.

We're still on elran-idna 6.0.0.

But as there's been no new release sine 2020-12-05, and no new commit
since about the same day, and since the patch you are adding is the only
commit since 6.1.1., maybe we should just bump to the latest commit in
the repository?

Regards,
Yann E. MORIN.

> Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
> ---
>  ...1-remove-unicode_util_compat_library.patch | 92 +++++++++++++++++++
>  1 file changed, 92 insertions(+)
>  create mode 100644 package/erlang-idna/0001-remove-unicode_util_compat_library.patch
> 
> diff --git a/package/erlang-idna/0001-remove-unicode_util_compat_library.patch b/package/erlang-idna/0001-remove-unicode_util_compat_library.patch
> new file mode 100644
> index 0000000000..788e633879
> --- /dev/null
> +++ b/package/erlang-idna/0001-remove-unicode_util_compat_library.patch
> @@ -0,0 +1,92 @@
> +From 230a9175a5edb1b1a47fb09af2f4341eab93b1b0 Mon Sep 17 00:00:00 2001
> +From: Benoit Chesneau <bchesneau@gmail.com>
> +Date: Sat, 5 Dec 2020 11:31:24 +0100
> +Subject: [PATCH] remove unicode_util_compat library
> +
> +remove unicode_util_compat library and support only Erlang >= 20. This
> +change simplify the stack and prepare future change to support specific
> +features of Erlang 23 and sup.
> +---
> + src/idna.app.src     |  2 +-
> + src/idna.erl         | 10 +++++-----
> + src/idna_context.erl |  4 ++--
> + 3 files changed, 8 insertions(+), 8 deletions(-)
> +
> +diff --git a/src/idna.app.src b/src/idna.app.src
> +index a6a7537..d647506 100644
> +--- a/src/idna.app.src
> ++++ b/src/idna.app.src
> +@@ -3,7 +3,7 @@
> +   {vsn, "6.0.0"},
> +   {modules, []},
> +   {registered, []},
> +-  {applications, [kernel, stdlib, unicode_util_compat]},
> ++  {applications, [kernel, stdlib]},
> + 
> +   {maintainers, ["Benoit Chesneau"]},
> +   {licenses, ["BSD"]},
> +diff --git a/src/idna.erl b/src/idna.erl
> +index 3436dd9..24d96b8 100644
> +--- a/src/idna.erl
> ++++ b/src/idna.erl
> +@@ -333,7 +333,7 @@ lowercase_list([], true) ->
> + lowercase_list([], false) ->
> +   throw(unchanged);
> + lowercase_list(CPs0, Changed) ->
> +-  case unicode_util_compat:lowercase(CPs0) of
> ++  case unicode_util:lowercase(CPs0) of
> +     [Char|CPs] when Char =:= hd(CPs0) -> [Char|lowercase_list(CPs, Changed)];
> +     [Char|CPs] -> append(Char,lowercase_list(CPs, true));
> +     [] -> lowercase_list([], Changed)
> +@@ -346,9 +346,9 @@ lowercase_bin(CP1, <<CP2/utf8, Bin/binary>>, Changed)
> +   when CP1 < 128, CP2 < 256 ->
> +   [CP1|lowercase_bin(CP2, Bin, Changed)];
> + lowercase_bin(CP1, Bin, Changed) ->
> +-  case unicode_util_compat:lowercase([CP1|Bin]) of
> ++  case unicode_util:lowercase([CP1|Bin]) of
> +     [CP1|CPs] ->
> +-      case unicode_util_compat:cp(CPs) of
> ++      case unicode_util:cp(CPs) of
> +         [Next|Rest] ->
> +           [CP1|lowercase_bin(Next, Rest, Changed)];
> +         [] when Changed ->
> +@@ -357,7 +357,7 @@ lowercase_bin(CP1, Bin, Changed) ->
> +           throw(unchanged)
> +       end;
> +     [Char|CPs] ->
> +-      case unicode_util_compat:cp(CPs) of
> ++      case unicode_util:cp(CPs) of
> +         [Next|Rest] ->
> +           [Char|lowercase_bin(Next, Rest, true)];
> +         [] ->
> +@@ -374,7 +374,7 @@ append(GC, Str) when is_list(GC) -> GC ++ Str.
> + 
> + 
> + characters_to_nfc_list(CD) ->
> +-  case unicode_util_compat:nfc(CD) of
> ++  case unicode_util:nfc(CD) of
> +     [CPs|Str] when is_list(CPs) -> CPs ++ characters_to_nfc_list(Str);
> +     [CP|Str] -> [CP|characters_to_nfc_list(Str)];
> +     [] -> []
> +diff --git a/src/idna_context.erl b/src/idna_context.erl
> +index afcb814..a09ff1f 100644
> +--- a/src/idna_context.erl
> ++++ b/src/idna_context.erl
> +@@ -28,7 +28,7 @@ valid_contextj(Label, Pos) ->
> + valid_contextj(16#200c, Label, Pos) ->
> +   if
> +      Pos > 0 ->
> +-       case unicode_util_compat:lookup(lists:nth(Pos, Label)) of
> ++       case unicode_util:lookup(lists:nth(Pos, Label)) of
> +          #{ ccc := ?virama_combining_class } -> true;
> +          _ ->
> +            valid_contextj_1(Label, Pos)
> +@@ -38,7 +38,7 @@ valid_contextj(16#200c, Label, Pos) ->
> +   end;
> + 
> + valid_contextj(16#200d, Label, Pos) when Pos > 0 ->
> +-  case unicode_util_compat:lookup(lists:nth(Pos, Label)) of
> ++  case unicode_util:lookup(lists:nth(Pos, Label)) of
> +     #{ ccc := ?virama_combining_class } -> true;
> +     _ -> false
> +   end;
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
