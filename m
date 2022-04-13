Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B830DC433EF
	for <buildroot@archiver.kernel.org>; Wed, 13 Apr 2022 10:59:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 034C940345;
	Wed, 13 Apr 2022 10:59:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zFqheA71ziEf; Wed, 13 Apr 2022 10:59:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 942B4402FE;
	Wed, 13 Apr 2022 10:59:01 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6E30A1BF28E
 for <buildroot@lists.busybox.net>; Wed, 13 Apr 2022 10:59:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5BDE58177C
 for <buildroot@lists.busybox.net>; Wed, 13 Apr 2022 10:59:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id omjESOPQnnxN for <buildroot@lists.busybox.net>;
 Wed, 13 Apr 2022 10:58:59 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 06FE881443
 for <buildroot@buildroot.org>; Wed, 13 Apr 2022 10:58:58 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id g20so1880503edw.6
 for <buildroot@buildroot.org>; Wed, 13 Apr 2022 03:58:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:content-language:to:from
 :subject; bh=jkxcRvwKTBz39194vW/9La9NaBxtW8oO7WrjAbglbdU=;
 b=jSSKHDov65W6fHxuA6iV3i4eEV5iA3E+8TZDu2s3MVmGju5iD2ljhovp/xkM0z6RPG
 L0pGoQoE5fqAoFfESSbkb6Ie5BQuPKCA0KQsSOaefXkIF3Z/3UftKYd0XS2iWEAnt8/R
 lyBn06sVjr4y0cf+n2I7ZB6S4crsEJ+Kgm5qmjGlIKCmnBDo/kI1ch3Cm+m8u59ymt65
 wzlAGbcG0C8HZV9wFvV9SY23XyDERNJLmZMMsNLbHmLFg5MVbHHq47diRxVuZZl8NNLl
 uT2GhzjAOsavMmuJk78B8U6lnR0q/k69159sO8jJcM1rJoHX512sb0woEvm29zK6jxZO
 AoAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent
 :content-language:to:from:subject;
 bh=jkxcRvwKTBz39194vW/9La9NaBxtW8oO7WrjAbglbdU=;
 b=uzjCBMZbNEjKGj/+4Kz1GCAk+voMBd6P3H4/wfqh/foFZ4uZfIz4a0WQuQvfC2Arp1
 /xMfe0MSZ8PcxOOP+ezT4VGT9i0b1OlOmFlSqYjp6mtBJDTqe1Zt/tSLyof5cJpdzWLF
 fdNlAcMoyPixhYDYUUHSepXgBRm6kLFb7wpjqgnIdR+nNyd5d/QyDd8KrIbTcA+ttOLp
 5IkxHAuOPY3zPf3bP0GrrybzKyv9IsX9vwOs/g/WqpSuF+1ZFX75jPDXvubVdL98GBm4
 zGRlNKPNIV3U6KjZWlpGe+uDy72URuI+Mji9PtFDPbOMKcF3Ej5j4OLTm5BsNZTM7N8q
 BDXQ==
X-Gm-Message-State: AOAM532DF26VxWZ0qyNMkG9aX/VdoiByzbEAkWyBGlVu7RFu2xfN2gmx
 8aGSpIWyN7MsFdXVsxYILTUrqJzIJ62Tug==
X-Google-Smtp-Source: ABdhPJxJS7rWuiEcEHk+W34y7J/eXUN4HBA+eF7v5XPMU3t7axYfTGBT++oMG0x9O26BO9JOjSnGrQ==
X-Received: by 2002:a05:6402:51cf:b0:419:63e2:2b96 with SMTP id
 r15-20020a05640251cf00b0041963e22b96mr43551939edd.336.1649847537187; 
 Wed, 13 Apr 2022 03:58:57 -0700 (PDT)
Received: from [192.168.178.36] (213-47-128-150.cable.dynamic.surfer.at.
 [213.47.128.150]) by smtp.gmail.com with ESMTPSA id
 o17-20020a056402439100b0041938757232sm1078198edc.17.2022.04.13.03.58.56
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Apr 2022 03:58:56 -0700 (PDT)
Message-ID: <8c0d3886-4d40-bbf5-c8da-dcc6e162ac43@gmail.com>
Date: Wed, 13 Apr 2022 12:58:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To: buildroot@buildroot.org
From: Marko Stanisic <sankerspace@gmail.com>
Subject: [Buildroot] BR2_TARGET_UBOOT_PATCH setting not working
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
Content-Type: multipart/mixed; boundary="===============4019125280034351987=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This is a multi-part message in MIME format.
--===============4019125280034351987==
Content-Type: multipart/alternative;
 boundary="------------6jBdCd5FYdXXYHeNocuXeN0U"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------6jBdCd5FYdXXYHeNocuXeN0U
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


Hello,

With buildroot i try to build an uboot which should be patched before, 
Uboot ist build by buildroot, but there is no reaction on following setting

BR2_TARGET_UBOOT_PATCH="$(BR2_EXTERNAL_GINO_PATH)/patches/uboot"

Inside <BR2_EXTERNAL_GINO_PATH>/patches/uboot there is a .patch file 
named according to 
https://buildroot.org/downloads/manual/manual.html#patch-policy with

|<number>-uboot-<description>.patch|

|Patches inside directories can be executed according documentation.
|

|Uboot is used insied a submodul of my repo and buidlroot hass acces to 
it over UBOOT_OVERRIDE_SRCDIR.
|

|
|

|I have no clue why patching is not performed:|

 1. |checked with make -s printvars VARS='BR2_TARGET_UBOOT_PATCH'|
 2. checked make -s printvars VARS='UBOOT_PATCHES' , UBOOT_PATCHES is
    set inside boot.mk
 3. make -s printvars VARS='UBOOT_POST_PATCH_HOOKS'
    UBOOT_POST_PATCH_HOOKS=UBOOT_APPLY_LOCAL_PATCHES
    UBOOT_FIXUP_LIBFDT_INCLUDE
 4. BR2_GLOBAL_PATCH_DIR="$(BR2_EXTERNAL_GINO_PATH)/patches is also set
 5. It seems that everything fine, maybe one thin is not very clear to me

I use *UBOOT_OVERRIDE_SRCDIR*and maybe thats make troubles here? because 
of the comment

|When Buildroot finds that for a given package, an 
+<pkg>_OVERRIDE_SRCDIR+ has been defined, it will no longer attempt to 
download, extract and patch the package. Instead, it will directly use 
the source code available in the specified directory and +make clean+ 
will not touch this directory.|


             5.1 If Point (5) makes the problem how can i solve it to 
apply a proper patch over buildroot, or do i have to put it inside the 
submodul directly and how?

        6. I didn't use the deprecated setting 
BR2_TARGET_UBOOT_CUSTOM_PATCH_DIR

        7. Tried to build uboot package

|make uboot-dirclean make uboot-extract make uboot-patch ## nothing 
worked make uboot-build make uboot-install |

Maybe i forgot something?

thank you

||

--------------6jBdCd5FYdXXYHeNocuXeN0U
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<html>
  <head>

    <meta http-equiv=3D"content-type" content=3D"text/html; charset=3DUTF=
-8">
  </head>
  <body vlink=3D"#551A8B" text=3D"#000000" link=3D"#0B6CDA" bgcolor=3D"#f=
fffff"
    alink=3D"#EE0000">
    <p><br>
    </p>
    <p>Hello,</p>
    <p>With buildroot i try to build an uboot which should be patched
      before, Uboot ist build by buildroot, but there is no reaction on
      following setting<br>
    </p>
    <p>=C2=A0=C2=A0=C2=A0
      BR2_TARGET_UBOOT_PATCH=3D"$(BR2_EXTERNAL_GINO_PATH)/patches/uboot"<=
/p>
    <p>Inside &lt;BR2_EXTERNAL_GINO_PATH&gt;/patches/uboot there is a
      .patch file named according to
      <a class=3D"moz-txt-link-freetext" href=3D"https://buildroot.org/do=
wnloads/manual/manual.html#patch-policy">https://buildroot.org/downloads/=
manual/manual.html#patch-policy</a>=C2=A0
      with</p>
    <p>=C2=A0=C2=A0=C2=A0 <code class=3D"literal" style=3D"font-family: &=
quot;Courier
        New&quot;, Courier, monospace; font-size: medium; font-style:
        normal; font-variant-ligatures: normal; font-variant-caps:
        normal; font-weight: 400; letter-spacing: normal; text-align:
        start; text-indent: 0px; text-transform: none; white-space:
        normal; word-spacing: 0px; -webkit-text-stroke-width: 0px;
        text-decoration-thickness: initial; text-decoration-style:
        initial; text-decoration-color: initial;">&lt;number&gt;-uboot-&l=
t;description&gt;.patch</code></p>
    <p><code class=3D"literal" style=3D"font-family: &quot;Courier
        New&quot;, Courier, monospace; font-size: medium; font-style:
        normal; font-variant-ligatures: normal; font-variant-caps:
        normal; font-weight: 400; letter-spacing: normal; text-align:
        start; text-indent: 0px; text-transform: none; white-space:
        normal; word-spacing: 0px; -webkit-text-stroke-width: 0px;
        text-decoration-thickness: initial; text-decoration-style:
        initial; text-decoration-color: initial;">Patches inside
        directories can be executed according documentation.<br>
      </code></p>
    <p><code class=3D"literal" style=3D"font-family: &quot;Courier
        New&quot;, Courier, monospace; font-size: medium; font-style:
        normal; font-variant-ligatures: normal; font-variant-caps:
        normal; font-weight: 400; letter-spacing: normal; text-align:
        start; text-indent: 0px; text-transform: none; white-space:
        normal; word-spacing: 0px; -webkit-text-stroke-width: 0px;
        text-decoration-thickness: initial; text-decoration-style:
        initial; text-decoration-color: initial;">Uboot is used insied a
        submodul of my repo and buidlroot hass acces to it over
        UBOOT_OVERRIDE_SRCDIR.<br>
      </code></p>
    <p><code class=3D"literal" style=3D"font-family: &quot;Courier
        New&quot;, Courier, monospace; font-size: medium; font-style:
        normal; font-variant-ligatures: normal; font-variant-caps:
        normal; font-weight: 400; letter-spacing: normal; text-align:
        start; text-indent: 0px; text-transform: none; white-space:
        normal; word-spacing: 0px; -webkit-text-stroke-width: 0px;
        text-decoration-thickness: initial; text-decoration-style:
        initial; text-decoration-color: initial;"><br>
      </code></p>
    <p><code class=3D"literal" style=3D"font-family: &quot;Courier
        New&quot;, Courier, monospace; font-size: medium; font-style:
        normal; font-variant-ligatures: normal; font-variant-caps:
        normal; font-weight: 400; letter-spacing: normal; text-align:
        start; text-indent: 0px; text-transform: none; white-space:
        normal; word-spacing: 0px; -webkit-text-stroke-width: 0px;
        text-decoration-thickness: initial; text-decoration-style:
        initial; text-decoration-color: initial;">I have no clue why
        patching is not performed:</code></p>
    <ol>
      <li><code class=3D"literal" style=3D"font-family: &quot;Courier
          New&quot;, Courier, monospace; font-size: medium; font-style:
          normal; font-variant-ligatures: normal; font-variant-caps:
          normal; font-weight: 400; letter-spacing: normal; text-align:
          start; text-indent: 0px; text-transform: none; white-space:
          normal; word-spacing: 0px; -webkit-text-stroke-width: 0px;
          text-decoration-thickness: initial; text-decoration-style:
          initial; text-decoration-color: initial;">checked with make -s
          printvars VARS=3D'BR2_TARGET_UBOOT_PATCH'</code></li>
      <li><font face=3D"Courier New, Courier, monospace">checked make -s
          printvars VARS=3D'UBOOT_PATCHES' , </font><font face=3D"Courier=

          New, Courier, monospace"><font face=3D"Courier New, Courier,
            monospace">UBOOT_PATCHES</font> is set inside boot.mk</font><=
/li>
      <li><font face=3D"Courier New, Courier, monospace">make -s printvar=
s
          VARS=3D'UBOOT_POST_PATCH_HOOKS'<br>
          UBOOT_POST_PATCH_HOOKS=3DUBOOT_APPLY_LOCAL_PATCHES
          UBOOT_FIXUP_LIBFDT_INCLUDE</font></li>
      <li><font face=3D"Courier New, Courier, monospace">BR2_GLOBAL_PATCH=
_DIR=3D"$(BR2_EXTERNAL_GINO_PATH)/patches
          is also set</font></li>
      <li><font face=3D"Courier New, Courier, monospace"><font
            face=3D"Courier New, Courier, monospace">It seems that
            everything fine, maybe one thin is not very clear to me</font=
></font></li>
    </ol>
    <p><font face=3D"Courier New, Courier, monospace">I use <b><span styl=
e=3D"color: rgb(51, 51, 51); font-size: 13px; font-style: normal; font-va=
riant-ligatures: normal; font-variant-caps: normal; letter-spacing: norma=
l; text-align: left; text-indent: 0px; text-transform: none; white-space:=
 pre-wrap; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-=
color: rgb(248, 248, 248); text-decoration-thickness: initial; text-decor=
ation-style: initial; text-decoration-color: initial; display: inline !im=
portant; float: none;">UBOOT_OVERRIDE_SRCDIR</span></b><span style=3D"col=
or: rgb(51, 51, 51); font-size: 13px; font-style: normal; font-variant-li=
gatures: normal; font-variant-caps: normal; font-weight: 600; letter-spac=
ing: normal; text-align: left; text-indent: 0px; text-transform: none; wh=
ite-space: pre-wrap; word-spacing: 0px; -webkit-text-stroke-width: 0px; b=
ackground-color: rgb(248, 248, 248); text-decoration-thickness: initial; =
text-decoration-style: initial; text-decoration-color: initial; display: =
inline !important; float: none;"> </span><span style=3D"color: rgb(51, 51=
, 51); font-size: 13px; font-style: normal; font-variant-ligatures: norma=
l; font-variant-caps: normal; letter-spacing: normal; text-align: left; t=
ext-indent: 0px; text-transform: none; white-space: pre-wrap; word-spacin=
g: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(248, 248, 2=
48); text-decoration-thickness: initial; text-decoration-style: initial; =
text-decoration-color: initial; display: inline !important; float: none;"=
></span>and
        maybe thats make troubles here? because of the comment</font></p>=

    <pre style=3D"box-sizing: border-box; margin: 0px; padding: 0px; vert=
ical-align: baseline; border: 0px solid; font-size: 14px; display: inline=
-block; width: 2329.6px;"><code class=3D"code-colors hljs" style=3D"box-s=
izing: border-box; margin: 5px 0px; padding: 0.5em; vertical-align: middl=
e; border: 1px solid rgb(204, 204, 204); font-size: 13px; display: block;=
 overflow: auto hidden; color: rgb(51, 51, 51); background: rgb(248, 248,=
 248); text-align: left; white-space: pre-wrap; overflow-wrap: break-word=
; border-radius: var(--border-radius); font-family: Menlo, Monaco, Consol=
as, &quot;Liberation Mono&quot;, &quot;Courier New&quot;, monospace; font=
-weight: 600; direction: ltr; unicode-bidi: embed;">When Buildroot finds =
that for a given package, an
+&lt;pkg&gt;_OVERRIDE_SRCDIR+ has been defined, it will no longer attempt=
 to
download, extract and patch the package. Instead, it will directly use
the source code available in the specified directory and +make clean+
will not touch this directory.</code></pre>
    <p>=C2=A0=C2=A0=C2=A0 <br>
    </p>
    <p>=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 5.1 If Po=
int (5) makes the problem how can i solve it
      to apply a proper patch over buildroot, or do i have to put it
      inside the submodul directly and how?</p>
    <p>=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 6. I didn't use the deprecated set=
ting
      BR2_TARGET_UBOOT_CUSTOM_PATCH_DIR</p>
    <p>=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0 7. Tried to build uboot package <b=
r>
    </p>
    <pre style=3D"box-sizing: border-box; margin: 0px; padding: 0px; vert=
ical-align: baseline; border: 0px solid; font-size: 14px; display: inline=
-block; width: 2329.6px;"><code class=3D"code-colors hljs" style=3D"box-s=
izing: border-box; margin: 5px 0px; padding: 0.5em; vertical-align: middl=
e; border: 1px solid rgb(204, 204, 204); font-size: 13px; display: block;=
 overflow: auto hidden; color: rgb(51, 51, 51); background: rgb(248, 248,=
 248); text-align: left; white-space: pre-wrap; overflow-wrap: break-word=
; border-radius: var(--border-radius); font-family: Menlo, Monaco, Consol=
as, &quot;Liberation Mono&quot;, &quot;Courier New&quot;, monospace; font=
-weight: 600; direction: ltr; unicode-bidi: embed;">make uboot-dirclean
make uboot-extract
make uboot-patch   ## nothing worked
make uboot-build
make uboot-install
</code></pre>
    <p>=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 </p>
    <p>Maybe i forgot something?<br>
    </p>
    <p>thank you<br>
    </p>
    <p><code class=3D"literal" style=3D"font-family: &quot;Courier
        New&quot;, Courier, monospace; font-size: medium; font-style:
        normal; font-variant-ligatures: normal; font-variant-caps:
        normal; font-weight: 400; letter-spacing: normal; text-align:
        start; text-indent: 0px; text-transform: none; white-space:
        normal; word-spacing: 0px; -webkit-text-stroke-width: 0px;
        text-decoration-thickness: initial; text-decoration-style:
        initial; text-decoration-color: initial;"></code><span
        style=3D"font-family: Georgia, serif; font-size: medium;
        font-style: normal; font-variant-ligatures: normal;
        font-variant-caps: normal; font-weight: 400; letter-spacing:
        normal; text-align: start; text-indent: 0px; text-transform:
        none; white-space: normal; word-spacing: 0px;
        -webkit-text-stroke-width: 0px; text-decoration-thickness:
        initial; text-decoration-style: initial; text-decoration-color:
        initial; display: inline !important; float: none;"></span></p>
  </body>
</html>

--------------6jBdCd5FYdXXYHeNocuXeN0U--

--===============4019125280034351987==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4019125280034351987==--
