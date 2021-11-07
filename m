Return-Path: <SRS0=xRR2=P2=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6545C433F5
	for <buildroot@archiver.kernel.org>; Sun,  7 Nov 2021 08:31:04 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 655D361101
	for <buildroot@archiver.kernel.org>; Sun,  7 Nov 2021 08:31:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 655D361101
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gadz.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1DCC88193E;
	Sun,  7 Nov 2021 08:31:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DhgDnZ7wE3Pa; Sun,  7 Nov 2021 08:31:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id EA8878196E;
	Sun,  7 Nov 2021 08:31:01 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 76DA71BF3A8
 for <buildroot@lists.busybox.net>; Sun,  7 Nov 2021 08:31:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 63FB1401B0
 for <buildroot@lists.busybox.net>; Sun,  7 Nov 2021 08:31:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cb-8dfm585l5 for <buildroot@lists.busybox.net>;
 Sun,  7 Nov 2021 08:30:58 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com
 [209.85.208.180])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 75904400D2
 for <buildroot@buildroot.org>; Sun,  7 Nov 2021 08:30:58 +0000 (UTC)
Received: by mail-lj1-f180.google.com with SMTP id e9so2709540ljl.5
 for <buildroot@buildroot.org>; Sun, 07 Nov 2021 01:30:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=iKNAMpycl4tr57aTJE0VQ8nVj8dTkyF6ihdKpi7kH0M=;
 b=MUlvCXkiJWait9+f7rNX7cbH7bCNowrcNTa/tW8MT8MkxvTyjIZ5ra03A7uJsfvCE+
 OjEsVDOw3fFTUp0B/jI9x1Z+FiviVqAEi2T556R3LFn+aMusIkcPS1z3k3Mt3bnTL/E8
 wNe08oG08OfmZGhs6G6KYHnoXvg+jF29YjTWth5dZG4NvfqGt6F+gp2tGFXJRqIJ3WGt
 P/CPBBcIV6KFC+hhHdkOuMarJdNj+gEzsEcWh5H1ocJje3PjVU9Y9D6F+tTyVRtnZyRt
 2zgpItreffaIeb1QAIwD5vUwyv67WpkCULMWD7gj+c1sQUiHNOaqPvBsN2r03ZzwwFx8
 kl8Q==
X-Gm-Message-State: AOAM533LUXoWTZxKWT+Xbd2aGb1UUX87EhfUh8rRxauJG6EgZii88xIX
 WsJXQteYUpKlxFRkEuFzGob+qB/K7/UE+cvu1/0AJv20/uUUtA==
X-Google-Smtp-Source: ABdhPJx63lwTO6P33r8PZ3EkTs+IbD/9OheFu4aA/W8QZfK7fz9JAswVU41oVWyjhHO0mBHhT0REbVAyGYfALWQR72k=
X-Received: by 2002:a05:651c:230a:: with SMTP id
 bi10mr30361181ljb.185.1636273856197; 
 Sun, 07 Nov 2021 01:30:56 -0700 (PDT)
MIME-Version: 1.0
References: <20211106190057.2487641-1-romain.naour@gmail.com>
 <CAB0FRsschq6bcfjimC1FCce+TrRx2_sJYBpwP+ZtgJNNWuFbfQ@mail.gmail.com>
 <89f9350d-63a6-4953-a212-3e2f17aa5a5f@gmail.com>
In-Reply-To: <89f9350d-63a6-4953-a212-3e2f17aa5a5f@gmail.com>
From: =?UTF-8?Q?Fran=C3=A7ois_Perrad?= <francois.perrad@gadz.org>
Date: Sun, 7 Nov 2021 09:30:44 +0100
Message-ID: <CAB0FRsuJ-37rquRvLsq+n5sg8gJo0PJU2-aRDqGn-kRkUju=Ug@mail.gmail.com>
To: Romain Naour <romain.naour@gmail.com>
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
Cc: =?UTF-8?B?SsO2cmcgS3JhdXNl?= <joerg.krause@embedded.rocks>,
 buildroot <buildroot@buildroot.org>
Content-Type: multipart/mixed; boundary="===============5065217720234066551=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============5065217720234066551==
Content-Type: multipart/alternative; boundary="000000000000f448e105d02eb144"

--000000000000f448e105d02eb144
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le sam. 6 nov. 2021 =C3=A0 23:02, Romain Naour <romain.naour@gmail.com> a =
=C3=A9crit :

> Le 06/11/2021 =C3=A0 22:19, Fran=C3=A7ois Perrad a =C3=A9crit :
> >
> >
> > Le sam. 6 nov. 2021 =C3=A0 20:01, Romain Naour <romain.naour@gmail.com
> > <mailto:romain.naour@gmail.com>> a =C3=A9crit :
> >
> >     This reverts commit 9450b53c8e06f1b5a75840b82c0f4663a5d75c45 since =
it
> >     introcude a regretion to luvi package [1].
> >
> >     luvi doesn't work since the luv static linking doesn't seems to
> >     work anymore.
> >     (see
> >
> https://github.com/luvit/luvi/commit/a9dc8dae2eb69d4a754a0cf5c08622d70f6b=
7067
> <
> https://github.com/luvit/luvi/commit/a9dc8dae2eb69d4a754a0cf5c08622d70f6b=
7067
> >)
> >
> >      # luvi -v
> >
> >     [string "return require('init')(...)"]:1: module 'init' not found:
> >
> >             no field package.preload['init']
> >             no file './init.lua'
> >             no file '/usr/share/luajit-2.1.0-beta3/init.lua'
> >             no file '/usr/local/share/lua/5.1/init.lua'
> >             no file '/usr/local/share/lua/5.1/init/init.lua'
> >             no file '/usr/share/lua/5.1/init.lua'
> >             no file '/usr/share/lua/5.1/init/init.lua'
> >             no file './init.so'
> >             no file '/usr/local/lib/lua/5.1/init.so'
> >             no file '/usr/lib/lua/5.1/init.so'
> >             no file '/usr/local/lib/lua/5.1/loadall.so'
> >
> >     stack traceback:
> >             [C]: in function 'require'
> >             [string "return require('init')(...)"]:1: in main chunk
> >
> >     luvi now try to load init.lua script:
> >     https://github.com/luvit/luvi/blob/v2.12.0/src/main.c#L176
> >     <https://github.com/luvit/luvi/blob/v2.12.0/src/main.c#L176>
> >
> >     Luvi seems to rely on some moonjit extentions [2] not available yet
> in
> >     luajit.
> >
> >     [1]
> http://lists.busybox.net/pipermail/buildroot/2021-October/627134.html
> >     <
> http://lists.busybox.net/pipermail/buildroot/2021-October/627134.html>
> >     [2] https://github.com/moonjit/moonjit/blob/master/doc/extensions.m=
d
> >     <https://github.com/moonjit/moonjit/blob/master/doc/extensions.md>
> >
> >
> > the module `init.lua` is supplied by luvi (see
> > https://github.com/luvit/luvi/blob/master/src/lua/init.lua
> > <https://github.com/luvit/luvi/blob/master/src/lua/init.lua>)
> > and installed somewhere or not (I cannot find it).
> >
> > moonjit 2.1.2 try to load a Lua module from these locations :
> >     './init.lua'
> >     '/usr/share/luajit-2.1.2/init.lua' (usually reserved to luajit
> itself)
> >     '/usr/local/share/lua/5.1/init.lua'
> >     '/usr/local/share/lua/5.1/init/init.lua'
> >     '/usr/share/lua/5.1/init.lua'
> >     '/usr/share/lua/5.1/init/init.lua'
> >
> > luajit try to load a Lua module from these locations :
> >     './init.lua'
> >     '/usr/share/luajit-2.1.0-beta3/init.lua' (usually reserved to luaji=
t
> itself)
> >     '/usr/local/share/lua/5.1/init.lua'
> >     '/usr/local/share/lua/5.1/init/init.lua'
> >     '/usr/share/lua/5.1/init.lua'
> >     '/usr/share/lua/5.1/init/init.lua'
> >
> > this issue is not about moonjit vs luajit,
>
> The luajit vs moonjit traces are clearly not the same (using strace)
>
> moonjit doesn't even try to open init.lua (init.lua is not installed in
> target):
>
> open("/usr/bin/luvi", O_RDONLY|O_LARGEFILE|O_CLOEXEC) =3D 13
> statx(13, "", AT_STATX_SYNC_AS_STAT|AT_EMPTY_PATH, STATX_ALL,
> {stx_mask=3DSTATX_BASIC_STATS|STATX_MNT_ID, stx_attributes=3D0,
> stx_mode=3DS_IFREG|0755, stx_size=3D401472, ...}) =3D 0
> pread64(13,
>
> "\213\240\5\0h'\4\0\373\277\5\0X5\4\0\342\305\5\0t-\4\0G\260\5\0\34'\4\0"=
...,
> 4096, 397376) =3D 4096
> pread64(13,
>
> "\0\1\0\0\0\2\0\0\0\3\0\0\0\4\0\0\0\351\232\5\0K\253\5\0\361\232\5\0\367\=
232\5"...,
> 4096, 393283) =3D 4096
> pread64(13,
>
> "\1\0\334N\1\0\334N\1\0\334N\1\0\334N\1\0\334N\1\0\334N\1\0\334N\1\0\334N=
"...,
> 4096, 389190) =3D 4096
> pread64(13, "ed\0lz.inflate.meta\0BEST_SPEED\0BE"..., 4096, 385097) =3D 4=
096
> pread64(13, "Luvi/build/luvi-2.12.0/deps/lua-"..., 4096, 381004) =3D 4096
> pread64(13, "ept fail\0#1 BIO must be memory t"..., 4096, 376911) =3D 409=
6
> pread64(13, "scape_ca_dn_bug\0netscape_challen"..., 4096, 372818) =3D 409=
6
> pread64(13, " to cert\0PKCS12_careate failed,p"..., 4096, 368725) =3D 409=
6
> pread64(13,
> "\200+\10\0\0-\t\0\08\t\7\t9\t\0\t\22\n\0\0B\t\2\3\22\3\n\0\22\10\t"...,
> 4096,
> 364632) =3D 4096
> pread64(13,
> "'\7\2\0\22\10\2\0\22\t\3\0B\5\5\2&\4\5\4L\4\2\0K\0\1\0\6\\\6/"...,
> 4096, 360539) =3D 4096
> pread64(13, "ve is too large\0validation faile"..., 4096, 356446) =3D 409=
6
> pread64(13,
>
> "\21\21\21\21\21\21\21\21\21\21\21\21\21\21\21\21\21\21\21\21\21\21\21\21=
\21\21\21\21\21\21\21\21"...,
> 4096, 352353) =3D 4096
> pread64(13,
>
> "TP\237\345\3p\300\343\200\1\240\341\30`\0\342H\200\237\345\25V\240\341\1=
\220\240\341\0\0\227\345"...,
> 4096, 348260) =3D 4096
> pread64(13,
> "\1#\0\0:\1\0P\341\32\0\0\232\2\0\21\341\33\0\0\n\21?o\341\20/o\341\2
> C"...,
> 4096, 344167) =3D 4096
> pread64(13,
> "\215\342\4\360\235\344\363G-\351\34\221\237\345\0`\240\341\0@
> \240\343\2p\240\341\f\0\220\345\4
> "..., 4096, 340074) =3D 4096
> pread64(13,
>
> "!\315\341\3\0\226\350\276\v\377\353\f\0p\343\0\0P\23\0p\240\341%\0\0\272=
\0\0P\343\0"...,
> 4096, 335981) =3D 4096
> pread64(13, "@\26\377\353\0\0P\343\n\0\0\32\4\0\235\345\326\f\0\353\0
> \240\341\0010\240\341\4\0\240\341"..., 4096, 331888) =3D 4096
> write(1, "luvi v2.12.0\n", 13luvi v2.12.0
>
>
> luajit:
>
> pipe2([6, 7], O_NONBLOCK|O_CLOEXEC)     =3D 0
> eventfd2(0, EFD_CLOEXEC|EFD_NONBLOCK)   =3D 8
> open("./init.lua", O_RDONLY|O_LARGEFILE) =3D -1 ENOENT (No such file or
> directory)
> open("/usr/share/luajit-2.1.0-beta3/init.lua", O_RDONLY|O_LARGEFILE) =3D =
-1
> ENOENT
> (No such file or directory)
> open("/usr/local/share/lua/5.1/init.lua", O_RDONLY|O_LARGEFILE) =3D -1
> ENOENT (No
> such file or directory)
> open("/usr/local/share/lua/5.1/init/init.lua", O_RDONLY|O_LARGEFILE) =3D =
-1
> ENOENT
> (No such file or directory)
> open("/usr/share/lua/5.1/init.lua", O_RDONLY|O_LARGEFILE) =3D -1 ENOENT (=
No
> such
> file or directory)
> open("/usr/share/lua/5.1/init/init.lua", O_RDONLY|O_LARGEFILE) =3D -1 ENO=
ENT
> (No
> such file or directory)
> open("./init.so", O_RDONLY|O_LARGEFILE) =3D -1 ENOENT (No such file or
> directory)
> open("/usr/local/lib/lua/5.1/init.so", O_RDONLY|O_LARGEFILE) =3D -1 ENOEN=
T
> (No
> such file or directory)
> open("/usr/lib/lua/5.1/init.so", O_RDONLY|O_LARGEFILE) =3D -1 ENOENT (No
> such file
> or directory)
> open("/usr/local/lib/lua/5.1/loadall.so", O_RDONLY|O_LARGEFILE) =3D -1
> ENOENT (No
> such file or directory)
> write(2, "[string \"return require('init')("..., 596[string "return
> require('init')(...)"]:1: module 'init' not found:
>
> Something is strange here...
>
> Best regards,
> Romain
>
>
luvi requires a luajit built with the `-DLUAJIT_ENABLE_LUA52COMPAT` flag.
it was the default with moonjit.
the package luvi must :
       select BR2_PACKAGE_LUAJIT_COMPAT52

Fran=C3=A7ois


>
> > it is about `init.lua` is not installed by luvi package.
> >
> > Fran=C3=A7ois
> >
> >
> >     Signed-off-by: Romain Naour <romain.naour@gmail.com
> >     <mailto:romain.naour@gmail.com>>
> >     Cc: Francois Perrad <francois.perrad@gadz.org <mailto:
> francois.perrad@gadz.org>>
> >     Cc: J=C3=B6rg Krause <joerg.krause@embedded.rocks>
> >
>
>

--000000000000f448e105d02eb144
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0sam. 6 nov. 2021 =C3=A0=C2=A0=
23:02, Romain Naour &lt;<a href=3D"mailto:romain.naour@gmail.com">romain.na=
our@gmail.com</a>&gt; a =C3=A9crit=C2=A0:<br></div><blockquote class=3D"gma=
il_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,2=
04,204);padding-left:1ex">Le 06/11/2021 =C3=A0 22:19, Fran=C3=A7ois Perrad =
a =C3=A9crit=C2=A0:<br>
&gt; <br>
&gt; <br>
&gt; Le=C2=A0sam. 6 nov. 2021 =C3=A0=C2=A020:01, Romain Naour &lt;<a href=
=3D"mailto:romain.naour@gmail.com" target=3D"_blank">romain.naour@gmail.com=
</a><br>
&gt; &lt;mailto:<a href=3D"mailto:romain.naour@gmail.com" target=3D"_blank"=
>romain.naour@gmail.com</a>&gt;&gt; a =C3=A9crit=C2=A0:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0This reverts commit 9450b53c8e06f1b5a75840b82c0f466=
3a5d75c45 since it<br>
&gt;=C2=A0 =C2=A0 =C2=A0introcude a regretion to luvi package [1].<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0luvi doesn&#39;t work since the luv static linking =
doesn&#39;t seems to<br>
&gt;=C2=A0 =C2=A0 =C2=A0work anymore.<br>
&gt;=C2=A0 =C2=A0 =C2=A0(see<br>
&gt;=C2=A0 =C2=A0 =C2=A0<a href=3D"https://github.com/luvit/luvi/commit/a9d=
c8dae2eb69d4a754a0cf5c08622d70f6b7067" rel=3D"noreferrer" target=3D"_blank"=
>https://github.com/luvit/luvi/commit/a9dc8dae2eb69d4a754a0cf5c08622d70f6b7=
067</a> &lt;<a href=3D"https://github.com/luvit/luvi/commit/a9dc8dae2eb69d4=
a754a0cf5c08622d70f6b7067" rel=3D"noreferrer" target=3D"_blank">https://git=
hub.com/luvit/luvi/commit/a9dc8dae2eb69d4a754a0cf5c08622d70f6b7067</a>&gt;)=
<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0# luvi -v<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0[string &quot;return require(&#39;init&#39;)(...)&q=
uot;]:1: module &#39;init&#39; not found:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 no field package.preloa=
d[&#39;init&#39;]<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 no file &#39;./init.lua=
&#39;<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 no file &#39;/usr/share=
/luajit-2.1.0-beta3/init.lua&#39;<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 no file &#39;/usr/local=
/share/lua/5.1/init.lua&#39;<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 no file &#39;/usr/local=
/share/lua/5.1/init/init.lua&#39;<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 no file &#39;/usr/share=
/lua/5.1/init.lua&#39;<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 no file &#39;/usr/share=
/lua/5.1/init/init.lua&#39;<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 no file &#39;./init.so&=
#39;<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 no file &#39;/usr/local=
/lib/lua/5.1/init.so&#39;<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 no file &#39;/usr/lib/l=
ua/5.1/init.so&#39;<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 no file &#39;/usr/local=
/lib/lua/5.1/loadall.so&#39;<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0stack traceback:<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 [C]: in function &#39;r=
equire&#39;<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 [string &quot;return re=
quire(&#39;init&#39;)(...)&quot;]:1: in main chunk<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0luvi now try to load init.lua script:<br>
&gt;=C2=A0 =C2=A0 =C2=A0<a href=3D"https://github.com/luvit/luvi/blob/v2.12=
.0/src/main.c#L176" rel=3D"noreferrer" target=3D"_blank">https://github.com=
/luvit/luvi/blob/v2.12.0/src/main.c#L176</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://github.com/luvit/luvi/blob/v=
2.12.0/src/main.c#L176" rel=3D"noreferrer" target=3D"_blank">https://github=
.com/luvit/luvi/blob/v2.12.0/src/main.c#L176</a>&gt;<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Luvi seems to rely on some moonjit extentions [2] n=
ot available yet in<br>
&gt;=C2=A0 =C2=A0 =C2=A0luajit.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0[1] <a href=3D"http://lists.busybox.net/pipermail/b=
uildroot/2021-October/627134.html" rel=3D"noreferrer" target=3D"_blank">htt=
p://lists.busybox.net/pipermail/buildroot/2021-October/627134.html</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://lists.busybox.net/pipermail/b=
uildroot/2021-October/627134.html" rel=3D"noreferrer" target=3D"_blank">htt=
p://lists.busybox.net/pipermail/buildroot/2021-October/627134.html</a>&gt;<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0[2] <a href=3D"https://github.com/moonjit/moonjit/b=
lob/master/doc/extensions.md" rel=3D"noreferrer" target=3D"_blank">https://=
github.com/moonjit/moonjit/blob/master/doc/extensions.md</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://github.com/moonjit/moonjit/b=
lob/master/doc/extensions.md" rel=3D"noreferrer" target=3D"_blank">https://=
github.com/moonjit/moonjit/blob/master/doc/extensions.md</a>&gt;<br>
&gt; <br>
&gt; <br>
&gt; the module `init.lua` is supplied by luvi (see<br>
&gt; <a href=3D"https://github.com/luvit/luvi/blob/master/src/lua/init.lua"=
 rel=3D"noreferrer" target=3D"_blank">https://github.com/luvit/luvi/blob/ma=
ster/src/lua/init.lua</a><br>
&gt; &lt;<a href=3D"https://github.com/luvit/luvi/blob/master/src/lua/init.=
lua" rel=3D"noreferrer" target=3D"_blank">https://github.com/luvit/luvi/blo=
b/master/src/lua/init.lua</a>&gt;)<br>
&gt; and installed somewhere or not (I cannot find it).<br>
&gt; <br>
&gt; moonjit 2.1.2 try to load a Lua module from these locations :<br>
&gt; =C2=A0 =C2=A0 &#39;./init.lua&#39;<br>
&gt; =C2=A0 =C2=A0 &#39;/usr/share/luajit-2.1.2/init.lua&#39; (usually rese=
rved to luajit itself)<br>
&gt; =C2=A0 =C2=A0 &#39;/usr/local/share/lua/5.1/init.lua&#39;<br>
&gt; =C2=A0 =C2=A0 &#39;/usr/local/share/lua/5.1/init/init.lua&#39;<br>
&gt; =C2=A0 =C2=A0 &#39;/usr/share/lua/5.1/init.lua&#39;<br>
&gt; =C2=A0 =C2=A0 &#39;/usr/share/lua/5.1/init/init.lua&#39;<br>
&gt; <br>
&gt; luajit try to load a Lua module from these locations :<br>
&gt; =C2=A0 =C2=A0 &#39;./init.lua&#39;<br>
&gt; =C2=A0 =C2=A0 &#39;/usr/share/luajit-2.1.0-beta3/init.lua&#39; (usuall=
y reserved to luajit itself)<br>
&gt; =C2=A0 =C2=A0 &#39;/usr/local/share/lua/5.1/init.lua&#39;<br>
&gt; =C2=A0 =C2=A0 &#39;/usr/local/share/lua/5.1/init/init.lua&#39;<br>
&gt; =C2=A0 =C2=A0 &#39;/usr/share/lua/5.1/init.lua&#39;<br>
&gt; =C2=A0 =C2=A0 &#39;/usr/share/lua/5.1/init/init.lua&#39;<br>
&gt; <br>
&gt; this issue is not about moonjit vs luajit,<br>
<br>
The luajit vs moonjit traces are clearly not the same (using strace)<br>
<br>
moonjit doesn&#39;t even try to open init.lua (init.lua is not installed in=
 target):<br>
<br>
open(&quot;/usr/bin/luvi&quot;, O_RDONLY|O_LARGEFILE|O_CLOEXEC) =3D 13<br>
statx(13, &quot;&quot;, AT_STATX_SYNC_AS_STAT|AT_EMPTY_PATH, STATX_ALL,<br>
{stx_mask=3DSTATX_BASIC_STATS|STATX_MNT_ID, stx_attributes=3D0,<br>
stx_mode=3DS_IFREG|0755, stx_size=3D401472, ...}) =3D 0<br>
pread64(13,<br>
&quot;\213\240\5\0h&#39;\4\0\373\277\5\0X5\4\0\342\305\5\0t-\4\0G\260\5\0\3=
4&#39;\4\0&quot;...,<br>
4096, 397376) =3D 4096<br>
pread64(13,<br>
&quot;\0\1\0\0\0\2\0\0\0\3\0\0\0\4\0\0\0\351\232\5\0K\253\5\0\361\232\5\0\3=
67\232\5&quot;...,<br>
4096, 393283) =3D 4096<br>
pread64(13,<br>
&quot;\1\0\334N\1\0\334N\1\0\334N\1\0\334N\1\0\334N\1\0\334N\1\0\334N\1\0\3=
34N&quot;...,<br>
4096, 389190) =3D 4096<br>
pread64(13, &quot;ed\0lz.inflate.meta\0BEST_SPEED\0BE&quot;..., 4096, 38509=
7) =3D 4096<br>
pread64(13, &quot;Luvi/build/luvi-2.12.0/deps/lua-&quot;..., 4096, 381004) =
=3D 4096<br>
pread64(13, &quot;ept fail\0#1 BIO must be memory t&quot;..., 4096, 376911)=
 =3D 4096<br>
pread64(13, &quot;scape_ca_dn_bug\0netscape_challen&quot;..., 4096, 372818)=
 =3D 4096<br>
pread64(13, &quot; to cert\0PKCS12_careate failed,p&quot;..., 4096, 368725)=
 =3D 4096<br>
pread64(13,<br>
&quot;\200+\10\0\0-\t\0\08\t\7\t9\t\0\t\22\n\0\0B\t\2\3\22\3\n\0\22\10\t&qu=
ot;..., 4096,<br>
364632) =3D 4096<br>
pread64(13, &quot;&#39;\7\2\0\22\10\2\0\22\t\3\0B\5\5\2&amp;\4\5\4L\4\2\0K\=
0\1\0\6\\\6/&quot;...,<br>
4096, 360539) =3D 4096<br>
pread64(13, &quot;ve is too large\0validation faile&quot;..., 4096, 356446)=
 =3D 4096<br>
pread64(13,<br>
&quot;\21\21\21\21\21\21\21\21\21\21\21\21\21\21\21\21\21\21\21\21\21\21\21=
\21\21\21\21\21\21\21\21\21&quot;...,<br>
4096, 352353) =3D 4096<br>
pread64(13,<br>
&quot;TP\237\345\3p\300\343\200\1\240\341\30`\0\342H\200\237\345\25V\240\34=
1\1\220\240\341\0\0\227\345&quot;...,<br>
4096, 348260) =3D 4096<br>
pread64(13,<br>
&quot;\1#\0\0:\1\0P\341\32\0\0\232\2\0\21\341\33\0\0\n\21?o\341\20/o\341\2 =
C&quot;...,<br>
4096, 344167) =3D 4096<br>
pread64(13,<br>
&quot;\215\342\4\360\235\344\363G-\351\34\221\237\345\0`\240\341\0@\240\343=
\2p\240\341\f\0\220\345\4<br>
&quot;..., 4096, 340074) =3D 4096<br>
pread64(13,<br>
&quot;!\315\341\3\0\226\350\276\v\377\353\f\0p\343\0\0P\23\0p\240\341%\0\0\=
272\0\0P\343\0&quot;...,<br>
4096, 335981) =3D 4096<br>
pread64(13, &quot;@\26\377\353\0\0P\343\n\0\0\32\4\0\235\345\326\f\0\353\0<=
br>
\240\341\0010\240\341\4\0\240\341&quot;..., 4096, 331888) =3D 4096<br>
write(1, &quot;luvi v2.12.0\n&quot;, 13luvi v2.12.0<br>
<br>
<br>
luajit:<br>
<br>
pipe2([6, 7], O_NONBLOCK|O_CLOEXEC)=C2=A0 =C2=A0 =C2=A0=3D 0<br>
eventfd2(0, EFD_CLOEXEC|EFD_NONBLOCK)=C2=A0 =C2=A0=3D 8<br>
open(&quot;./init.lua&quot;, O_RDONLY|O_LARGEFILE) =3D -1 ENOENT (No such f=
ile or directory)<br>
open(&quot;/usr/share/luajit-2.1.0-beta3/init.lua&quot;, O_RDONLY|O_LARGEFI=
LE) =3D -1 ENOENT<br>
(No such file or directory)<br>
open(&quot;/usr/local/share/lua/5.1/init.lua&quot;, O_RDONLY|O_LARGEFILE) =
=3D -1 ENOENT (No<br>
such file or directory)<br>
open(&quot;/usr/local/share/lua/5.1/init/init.lua&quot;, O_RDONLY|O_LARGEFI=
LE) =3D -1 ENOENT<br>
(No such file or directory)<br>
open(&quot;/usr/share/lua/5.1/init.lua&quot;, O_RDONLY|O_LARGEFILE) =3D -1 =
ENOENT (No such<br>
file or directory)<br>
open(&quot;/usr/share/lua/5.1/init/init.lua&quot;, O_RDONLY|O_LARGEFILE) =
=3D -1 ENOENT (No<br>
such file or directory)<br>
open(&quot;./init.so&quot;, O_RDONLY|O_LARGEFILE) =3D -1 ENOENT (No such fi=
le or directory)<br>
open(&quot;/usr/local/lib/lua/5.1/init.so&quot;, O_RDONLY|O_LARGEFILE) =3D =
-1 ENOENT (No<br>
such file or directory)<br>
open(&quot;/usr/lib/lua/5.1/init.so&quot;, O_RDONLY|O_LARGEFILE) =3D -1 ENO=
ENT (No such file<br>
or directory)<br>
open(&quot;/usr/local/lib/lua/5.1/loadall.so&quot;, O_RDONLY|O_LARGEFILE) =
=3D -1 ENOENT (No<br>
such file or directory)<br>
write(2, &quot;[string \&quot;return require(&#39;init&#39;)(&quot;..., 596=
[string &quot;return<br>
require(&#39;init&#39;)(...)&quot;]:1: module &#39;init&#39; not found:<br>
<br>
Something is strange here...<br>
<br>
Best regards,<br>
Romain<br>
<br></blockquote><div><br></div><div>luvi requires a luajit built with the =
`-DLUAJIT_ENABLE_LUA52COMPAT` flag.<br>it was the default with moonjit.<br>=
the package luvi must :<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 select BR2_=
PACKAGE_LUAJIT_COMPAT52<br></div><div><br></div><div>Fran=C3=A7ois<br></div=
><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
&gt; it is about `init.lua` is not installed by luvi package.<br>
&gt; <br>
&gt; Fran=C3=A7ois<br>
&gt; =C2=A0<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Signed-off-by: Romain Naour &lt;<a href=3D"mailto:r=
omain.naour@gmail.com" target=3D"_blank">romain.naour@gmail.com</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:romain.naour@gmail.com=
" target=3D"_blank">romain.naour@gmail.com</a>&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0Cc: Francois Perrad &lt;<a href=3D"mailto:francois.=
perrad@gadz.org" target=3D"_blank">francois.perrad@gadz.org</a> &lt;mailto:=
<a href=3D"mailto:francois.perrad@gadz.org" target=3D"_blank">francois.perr=
ad@gadz.org</a>&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0Cc: J=C3=B6rg Krause &lt;joerg.krause@embedded.rock=
s&gt;<br>
&gt; <br>
<br>
</blockquote></div></div>

--000000000000f448e105d02eb144--

--===============5065217720234066551==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5065217720234066551==--
