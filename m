Return-Path: <SRS0=xRR2=P2=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C318C433F5
	for <buildroot@archiver.kernel.org>; Sun,  7 Nov 2021 13:15:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B1A936112D
	for <buildroot@archiver.kernel.org>; Sun,  7 Nov 2021 13:15:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B1A936112D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gadz.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4A90780F0E;
	Sun,  7 Nov 2021 13:15:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id apZlx2ZCfvaV; Sun,  7 Nov 2021 13:15:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 85BD180F10;
	Sun,  7 Nov 2021 13:15:12 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 863BF1BF2CB
 for <buildroot@lists.busybox.net>; Sun,  7 Nov 2021 13:15:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8229C40188
 for <buildroot@lists.busybox.net>; Sun,  7 Nov 2021 13:15:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 53sz6cTR_9ua for <buildroot@lists.busybox.net>;
 Sun,  7 Nov 2021 13:15:08 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com
 [209.85.208.176])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4EF92400C7
 for <buildroot@buildroot.org>; Sun,  7 Nov 2021 13:15:08 +0000 (UTC)
Received: by mail-lj1-f176.google.com with SMTP id v15so16915028ljc.0
 for <buildroot@buildroot.org>; Sun, 07 Nov 2021 05:15:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=voSuHKKeEYF+UeiO5L9SerAjBkVcUTs/mI2TbS8rXoc=;
 b=zU7tX06bOSNfx8dlT6qZW8N5vMcnysgl0XTHJ/6nZOOwUWtp8grSiMrDTybvqiEU+i
 v+UumJ4UlHrn3AGdumL1Xtv9hWv+ikK0h19nYTxKoKPgRcnJYzDAkzZKufmdVQVyeyMd
 3p9nUKS2DciEQAEjCd8LgluxN7zZzvVslbcaQW+myTmlvtDPoMm2xc1AH4IvbqjaPhiy
 r9G/KWh2QmmXnvenACdAU0nud8rlSmG1cM37Qzwo+xJCGT69SLpD2JIoiGrvMl7u4Pu5
 TzKK6tzLU5GVAmwOvRq2ADljhnQWSealEYxqRnjIwFMiLsmdX+L5QTuebHEzuk8jdFQ0
 BScw==
X-Gm-Message-State: AOAM533rMt0bc0UN3LI184uxg/PduetFkYR1AJtzMndCGquo0ssNED0s
 O4jvE55jxESL7GhcogUvNBGbKwQLPhHcUzW1ClG5dIecEAvKpQ==
X-Google-Smtp-Source: ABdhPJwQtF6SJDaH9FMGX1BP16ZqQxekOJhL1OCP/zA5++y0Fq6H2sgD+BKHT/g7t75l0dckZbI5gL0PrGbCD5UqDHM=
X-Received: by 2002:a2e:bc19:: with SMTP id b25mr48946765ljf.434.1636290906250; 
 Sun, 07 Nov 2021 05:15:06 -0800 (PST)
MIME-Version: 1.0
References: <20211106190057.2487641-1-romain.naour@gmail.com>
 <CAB0FRsschq6bcfjimC1FCce+TrRx2_sJYBpwP+ZtgJNNWuFbfQ@mail.gmail.com>
 <89f9350d-63a6-4953-a212-3e2f17aa5a5f@gmail.com>
 <CAB0FRsuJ-37rquRvLsq+n5sg8gJo0PJU2-aRDqGn-kRkUju=Ug@mail.gmail.com>
 <4eb0d55eb4e537aaa4ce604127038b43212d8de2.camel@embedded.rocks>
In-Reply-To: <4eb0d55eb4e537aaa4ce604127038b43212d8de2.camel@embedded.rocks>
From: =?UTF-8?Q?Fran=C3=A7ois_Perrad?= <francois.perrad@gadz.org>
Date: Sun, 7 Nov 2021 14:14:54 +0100
Message-ID: <CAB0FRstT9fZVUESTavowBf10p=0HZoNjgyh3tKxVUbgKwgn=GQ@mail.gmail.com>
To: buildroot <buildroot@buildroot.org>
Subject: Re: [Buildroot] [PATCH] Revert "package/luajit: back to mainline
 and bump to 05f1984e"
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
Cc: Romain Naour <romain.naour@gmail.com>,
 =?UTF-8?B?SsO2cmcgS3JhdXNl?= <joerg.krause@embedded.rocks>
Content-Type: multipart/mixed; boundary="===============1623474675828986316=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1623474675828986316==
Content-Type: multipart/alternative; boundary="000000000000376f0505d032aad9"

--000000000000376f0505d032aad9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le dim. 7 nov. 2021 =C3=A0 12:12, J=C3=B6rg Krause <joerg.krause@embedded.r=
ocks> a
=C3=A9crit :

> Hi Fran=C3=A7ois, Hi Romain,
>
> the issue has nothing to do with static linking (the issue Romain cited
> was raised by in 2015 has been fixed long time ago) nor is it an issue
> about moonjit vs luajit as correctly stated by Fran=C3=A7ois. Also, it is
> not about setting `LUAJIT_ENABLE_LUA52COMPAT`.
>
> After applying the patch [1] from Romain I am building and running luvi
> on my machine successfully:
>
> ```
> LD_LIBRARY_PATH=3D"./output/target/usr/lib/:./output/target/lib"
> ./output/target/usr/bin/luvi
> ./output/target/usr/bin/luvi v2.12.0
> libuv: 1.42.0
> ```
>
> The file `init.lua` is Luajitted into an object file:
> ```
> Building $BR/output/host/share/luajit-2.1.0-beta3/?.lua Luajitted
> $BR/output/build/luvi-2.12.0/src/lua/init.lua:
> $BR/output/build/luvi-2.12.0/jitted_tmp/src/lua/init.lua_luvi_generated.o
> ```
>
> My first guess is, that the byte code generated by luajit is generated
> for a different machine than luvi is actually running on. Is
> `file
> output/build/luvi-2.12.0/jitted_tmp/src/lua/init.lua_luvi_generated.o`
> printing the correct file type information?
>
>
correct, src/init.lua is bytecoded in
jitted_tmp/lua/src/init.lua_luvi_generated.o
by the following command :
LUA_PATH=3D.../host/share/luajit-2.1.0-beta3/?.lua \
luajit -b -a arm .../src/lua/init.lua
.../jitted_tmp/src/lua/init.lua_luvi_generated.o

$ nm .../jitted_tmp/src/lua/init.lua_luvi_generated.o
00000000 R luaJIT_BC_init

$ file .../jitted_tmp/src/lua/init.lua_luvi_generated.o
jitted_tmp/src/lua/init.lua_luvi_generated.o: ELF 32-bit LSB relocatable,
ARM, version 1 (SYSV), not stripped

$ nm .../luvi | grep luaJIT_BC_
000173e3 R luaJIT_BC_init
00018248 R luaJIT_BC_luvibundle
00017d28 R luaJIT_BC_luvipath

$ file .../luvi
luvi: ELF 32-bit LSB pie executable, ARM, EABI5 version 1 (SYSV),
dynamically linked, interpreter /lib/ld-linux-armhf.so.3, for GNU/Linux
3.2.0, with debug_info, not stripped

The LuaJIT bytecode is platform independent (not the case for PUC Lua).
The bytecode could exported as C array in a .c or .h file :
    const unsigned char luaJIT_BC_init[] =3D {
    ...
when exported as .o or .obj, the option -a allows to set the target
architecture.

Fran=C3=A7ois


> [1]
> http://patchwork.ozlabs.org/project/buildroot/patch/20211031210258.654193=
-1-romain.naour@gmail.com/
>
> Best regards
> J=C3=B6rg Krause
>
>
>

--000000000000376f0505d032aad9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0dim. 7 nov. 2021 =C3=A0=C2=A0=
12:12, J=C3=B6rg Krause &lt;joerg.krause@embedded.rocks&gt; a =C3=A9crit=C2=
=A0:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hi Fran=C3=
=A7ois, Hi Romain,<br>
<br>
the issue has nothing to do with static linking (the issue Romain cited<br>
was raised by in 2015 has been fixed long time ago) nor is it an issue<br>
about moonjit vs luajit as correctly stated by Fran=C3=A7ois. Also, it is<b=
r>
not about setting `LUAJIT_ENABLE_LUA52COMPAT`.<br>
<br>
After applying the patch [1] from Romain I am building and running luvi<br>
on my machine successfully:<br>
<br>
```<br>
LD_LIBRARY_PATH=3D&quot;./output/target/usr/lib/:./output/target/lib&quot; =
./output/target/usr/bin/luvi<br>
./output/target/usr/bin/luvi v2.12.0<br>
libuv: 1.42.0<br>
```<br>
<br>
The file `init.lua` is Luajitted into an object file: <br>
```<br>
Building $BR/output/host/share/luajit-2.1.0-beta3/?.lua Luajitted $BR/outpu=
t/build/luvi-2.12.0/src/lua/init.lua: $BR/output/build/luvi-2.12.0/jitted_t=
mp/src/lua/init.lua_luvi_generated.o<br>
```<br>
<br>
My first guess is, that the byte code generated by luajit is generated<br>
for a different machine than luvi is actually running on. Is<br>
`file output/build/luvi-2.12.0/jitted_tmp/src/lua/init.lua_luvi_generated.o=
`<br>
printing the correct file type information?<br>
<br></blockquote><div><br></div><div>correct, src/init.lua is bytecoded in =
jitted_tmp/lua/src/init.lua_luvi_generated.o<br>by the following command :<=
br>LUA_PATH=3D.../host/share/luajit-2.1.0-beta3/?.lua \<br>luajit -b -a arm=
 .../src/lua/init.lua .../jitted_tmp/src/lua/init.lua_luvi_generated.o<br><=
br>$ nm .../jitted_tmp/src/lua/init.lua_luvi_generated.o <br>00000000 R lua=
JIT_BC_init<br><br>$ file .../jitted_tmp/src/lua/init.lua_luvi_generated.o =
<br>jitted_tmp/src/lua/init.lua_luvi_generated.o: ELF 32-bit LSB relocatabl=
e, ARM, version 1 (SYSV), not stripped<br><br>$ nm .../luvi | grep luaJIT_B=
C_<br>000173e3 R luaJIT_BC_init<br>00018248 R luaJIT_BC_luvibundle<br>00017=
d28 R luaJIT_BC_luvipath<br><br>$ file .../luvi<br>luvi: ELF 32-bit LSB pie=
 executable, ARM, EABI5 version 1 (SYSV), dynamically linked, interpreter /=
lib/ld-linux-armhf.so.3, for GNU/Linux 3.2.0, with debug_info, not stripped=
<br><br>The LuaJIT bytecode is platform independent (not the case for PUC L=
ua).<br>The bytecode could exported as C array in a .c or .h file :<br>=C2=
=A0 =C2=A0 const unsigned char luaJIT_BC_init[] =3D {<br>=C2=A0 =C2=A0 ...<=
br>when exported as .o or .obj, the option -a allows to set the target arch=
itecture.<br><br>Fran=C3=A7ois<br></div><div>=C2=A0</div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">
[1] <a href=3D"http://patchwork.ozlabs.org/project/buildroot/patch/20211031=
210258.654193-1-romain.naour@gmail.com/" rel=3D"noreferrer" target=3D"_blan=
k">http://patchwork.ozlabs.org/project/buildroot/patch/20211031210258.65419=
3-1-romain.naour@gmail.com/</a><br>
<br>
Best regards<br>
J=C3=B6rg Krause<br>
<br><br>
</blockquote></div></div>

--000000000000376f0505d032aad9--

--===============1623474675828986316==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1623474675828986316==--
