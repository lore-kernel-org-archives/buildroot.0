Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF928C05027
	for <buildroot@archiver.kernel.org>; Thu,  9 Feb 2023 12:09:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8718A40116;
	Thu,  9 Feb 2023 12:09:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8718A40116
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9ew0Wh4M_wAA; Thu,  9 Feb 2023 12:09:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 50C10404D1;
	Thu,  9 Feb 2023 12:09:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 50C10404D1
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0CF401BF5A9
 for <buildroot@lists.busybox.net>; Thu,  9 Feb 2023 12:09:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E7E8D820AF
 for <buildroot@lists.busybox.net>; Thu,  9 Feb 2023 12:09:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E7E8D820AF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RsWZC5GM9DLn for <buildroot@lists.busybox.net>;
 Thu,  9 Feb 2023 12:09:47 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8F3DC81F7D
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com
 [IPv6:2607:f8b0:4864:20::32c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8F3DC81F7D
 for <buildroot@buildroot.org>; Thu,  9 Feb 2023 12:09:47 +0000 (UTC)
Received: by mail-ot1-x32c.google.com with SMTP id
 e12-20020a0568301e4c00b0068bc93e7e34so466324otj.4
 for <buildroot@buildroot.org>; Thu, 09 Feb 2023 04:09:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=U9OeABYRkFjfchCH4U1ohUoALnHDvUgbqrk3KNBgvW0=;
 b=sF/o1ysOM/dTMlSo48pRLMAlvrT2TvBBXVgfMI6CAqe6zAg2fLMfvsGq0QquFRZwXv
 PtjaM2sonRJ0U1URCFagxGjg91j4RdpOXmPsJsiQ8jaHCx0YFPVMWzmEgFd36EF25Q+3
 Xs1SaeQ1ldt0jB33ndHg6Wwjr5ABvC7SqsGhAkzGYphbgPHTudrIomIAgJF3sLE7mfvY
 9gagtUPuXFQpY6GrLF5aNLPhHtoYTKCcjCWL16yOxAss7o72rdzmiKMVI9oz8Qctdi0P
 buL3Ge6rNtLQAxGlEmIG771694jaIr0D5wZu+HBrmxp0Vy57xWAzBPVa4XuEkM7Td59l
 bqPA==
X-Gm-Message-State: AO0yUKUw8OJmM7n82WCj3b+kYfXuW4xaRJcRTOT6kvTobA6uHpOAqBT8
 oJ42EAlbTCKnATQmv8vTCVKDJXzRI1v7MPdGfE8=
X-Google-Smtp-Source: AK7set+pKaRLPbAVbpe6piLtzjxj85z3idHj29nPQ6WysK7ZDn3ZCP5HJ747LCZXDiIlquQ26jpDqiOjdYgenRDaVyU=
X-Received: by 2002:a9d:4e8c:0:b0:68b:e002:bc65 with SMTP id
 v12-20020a9d4e8c000000b0068be002bc65mr1002156otk.61.1675944586517; Thu, 09
 Feb 2023 04:09:46 -0800 (PST)
MIME-Version: 1.0
References: <CADYjeSsqfaF0P7g_hxQ2EjSh=zDG9=FTnLrbq5g4+22UNJq-xw@mail.gmail.com>
 <CACHw65+r07g=hU4yv1Xhb3TFVmOVkYdSpRy3dZF9y+U44TK=Qw@mail.gmail.com>
 <CADYjeStPWnGcr23XOGnB+61eZ=iZKVj8YkhDKSaw0BUFT7WC-A@mail.gmail.com>
 <36be5bdc-591c-71cb-ea31-9e38ae8d643d@inbox.ru>
 <CADYjeSuvmoMXDGgN9rmv+RecroVxqj1_d9x3G4iakwkvLs+j9Q@mail.gmail.com>
 <22e489f3-cc1d-985d-cca6-18f4f6ddecfa@inbox.ru>
 <CADYjeSuBvHsij7YTnyq5tW9jEv1JtV3u1WyYkX2cbffgkQ6_Kw@mail.gmail.com>
 <a481ffb1-5c10-d913-0f8a-cbb5e11ff631@inbox.ru>
 <CADYjeStesndVUqdWqmPVP5=xfW1PFcwzNk=9o0TUM+tXBez8mA@mail.gmail.com>
 <eeb3b4bc-12fa-eea5-4ec0-89c90ac75394@inbox.ru>
 <CADYjeStwFSJQDFvj2z5bAURD0eTLVgYrpEvdEdYMbbVkJmJupQ@mail.gmail.com>
In-Reply-To: <CADYjeStwFSJQDFvj2z5bAURD0eTLVgYrpEvdEdYMbbVkJmJupQ@mail.gmail.com>
From: Sourabh Hegde <hrsourabh011@gmail.com>
Date: Thu, 9 Feb 2023 13:09:37 +0100
Message-ID: <CADYjeSv1r61gQMoamBq2VUgSYwmyvvZ8BP2NGBZHNzF6vU7phg@mail.gmail.com>
To: Maxim Kochetkov <fido_max@inbox.ru>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=U9OeABYRkFjfchCH4U1ohUoALnHDvUgbqrk3KNBgvW0=;
 b=UMczBN+jQpZB7OdQm0xp2rWuVNFyebKRxCTj0xzMIxLOQlDT7j77QvPJAW5qjE6lm2
 sjo41pJPU9m3IG32wugfwl55E2VnQAh4SnSB0VTeKsipUINN4HTsIfrxcpvCN8zRNSuu
 ZaqWlGsQxArA+PyUJisou2Y4JpCM2gtt4Ca5alUZvDCoD3pr+O6DuLTZJqaOoRNNd01l
 Gt0D55ywJKJFnM603Gi0opmIyfeV0ba4InMSWxSFAFrRTMOIKTJ5pWq1R8lIUxCzUgz8
 2Da77LGSvHEwpmNZwoYoNMZNupr5xRiQbpcdXLQC+JrsE34POiAkCkgXe+rrPdghIrCU
 rZ8w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=UMczBN+j
Subject: Re: [Buildroot] How to install custom sdk in buildroot?
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
Cc: Ramon Crichlow <rcrichlow9000@gmail.com>, buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============6176661164946128676=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6176661164946128676==
Content-Type: multipart/alternative; boundary="000000000000be204805f4434101"

--000000000000be204805f4434101
Content-Type: text/plain; charset="UTF-8"

Hello Maxim,

While doing make with new Buildroot-packages I getting:

[ 51%] Building ASM object
aws-lc/crypto/CMakeFiles/crypto_objects.dir/hrss/asm/poly_rq_mul.S.o
/home/amazone/output/build/python-awscrt-0.16.10/crt/aws-lc/crypto/hrss/asm/poly_rq_mul.S:
Assembler messages:
/home/amazone/output/build/python-awscrt-0.16.10/crt/aws-lc/crypto/hrss/asm/poly_rq_mul.S:304:
Error: unknown pseudo-op: `.att_syntax'
/home/amazone/output/build/python-awscrt-0.16.10/crt/aws-lc/crypto/hrss/asm/poly_rq_mul.S:307:
Error: unknown mnemonic `push' -- `push %rbp'
/home/amazone/output/build/python-awscrt-0.16.10/crt/aws-lc/crypto/hrss/asm/poly_rq_mul.S:309:
Error: bad register expression
/home/amazone/output/build/python-awscrt-0.16.10/crt/aws-lc/crypto/hrss/asm/poly_rq_mul.S:310:
Error: unknown mnemonic `movq' -- `movq %rsp,%rbp'
/home/amazone/output/build/python-awscrt-0.16.10/crt/aws-lc/crypto/hrss/asm/poly_rq_mul.S:311:
Error: bad register expression
/home/amazone/output/build/python-awscrt-0.16.10/crt/aws-lc/crypto/hrss/asm/poly_rq_mul.S:312:
Error: unknown mnemonic `push' -- `push %r12'
/home/amazone/output/build/python-awscrt-0.16.10/crt/aws-lc/crypto/hrss/asm/poly_rq_mul.S:313:
Error: bad register expression
/home/amazone/output/build/python-awscrt-0.16.10/crt/aws-lc/crypto/hrss/asm/poly_rq_mul.S:321:
Error: operand 1 must be an integer register -- `mov %rcx,%r8'
/home/amazone/output/build/python-awscrt-0.16.10/crt/aws-lc/crypto/hrss/asm/poly_rq_mul.S:322:
Error: unknown mnemonic `addq' -- `addq $6144+12288+512+9408+32,%r8'
/home/amazone/output/build/python-awscrt-0.16.10/crt/aws-lc/crypto/hrss/asm/poly_rq_mul.S:323:
Error: operand 1 must be an integer register -- `mov %r8,%rax'
/home/amazone/output/build/python-awscrt-0.16.10/crt/aws-lc/crypto/hrss/asm/poly_rq_mul.S:324:
Error: unknown mnemonic `subq' -- `subq $6144,%r8'
/home/amazone/output/build/python-awscrt-0.16.10/crt/aws-lc/crypto/hrss/asm/poly_rq_mul.S:325:
Error: operand 1 must be an integer register -- `mov %r8,%r11'
/home/amazone/output/build/python-awscrt-0.16.10/crt/aws-lc/crypto/hrss/asm/poly_rq_mul.S:326:
Error: unknown mnemonic `subq' -- `subq $12288,%r8'
/home/amazone/output/build/python-awscrt-0.16.10/crt/aws-lc/crypto/hrss/asm/poly_rq_mul.S:327:
Error: operand 1 must be an integer register -- `mov %r8,%r12'
/home/amazone/output/build/python-awscrt-0.16.10/crt/aws-lc/crypto/hrss/asm/poly_rq_mul.S:328:
Error: unknown mnemonic `subq' -- `subq $512,%r8'
/home/amazone/output/build/python-awscrt-0.16.10/crt/aws-lc/crypto/hrss/asm/poly_rq_mul.S:329:
Error: unknown mnemonic `vmovdqa' -- `vmovdqa const3(%rip),%ymm3'
/home/amazone/output/build/python-awscrt-0.16.10/crt/aws-lc/crypto/hrss/asm/poly_rq_mul.S:330:
Error: unknown mnemonic `vmovdqu' -- `vmovdqu 0(%rsi),%ymm0'
/home/amazone/output/build/python-awscrt-0.16.10/crt/aws-lc/crypto/hrss/asm/poly_rq_mul.S:331:
Error: unknown mnemonic `vmovdqu' -- `vmovdqu 88(%rsi),%ymm1'
.
.
.
Any idea what it is complaining about?

Thanks in advance

On Thu, 9 Feb 2023 at 10:28, Sourabh Hegde <hrsourabh011@gmail.com> wrote:

> Hi Maxim,
>
> I was missing python setuptools on my host. After installing it, I can add
> the package. Also, the added package is available in menuconfig
>
> Thank you for the support!
>
> On Thu, 9 Feb 2023 at 10:10, Maxim Kochetkov <fido_max@inbox.ru> wrote:
>
>>
>>
>> On 09.02.2023 12:03, Sourabh Hegde wrote:
>> > Hello Maxim,
>> >
>> > Update:
>> >
>> > The above issue resolved by itself!
>> >
>> > Now when I do: utils/scanpypi awscrt -o package , it says
>> >
>> > spdx_lookup module is not installed. This can lead to an inaccurate
>> > licence detection. Please install it via
>> > pip install spdx_lookup
>> > buildroot package name for awscrt: python-awscrt
>> > Package: python-awscrt
>> > Fetching package awscrt
>> > ERROR: Could not find package awscrt.
>> > Check syntax inside the python package index:
>> > https://pypi.python.org/pypi/ <https://pypi.python.org/pypi/>
>> >
>> > But the package is available at https://pypi.org/project/awscrt/
>> > <https://pypi.org/project/awscrt/>
>>
>> It works fine for me:
>>
>> buildroot package name for awscrt: python-awscrt
>> Package: python-awscrt
>> Fetching package awscrt
>> Downloading package awscrt from
>>
>> https://files.pythonhosted.org/packages/ae/98/dda092078f2d47bad08e184ab9d364b8f89166497062bc1cf811c0bbbde2/awscrt-0.16.10.tar.gz.
>> ..
>> Checking if package package/python-awscrt already exists...
>> Creating package/python-awscrt/python-awscrt.mk...
>> More than one file found for license: LICENSE, crt/aws-c-common/LICENSE,
>> crt/aws-c-io/LICENSE, crt/aws-lc/LICENSE,
>> crt/aws-lc/third_party/fiat/LICENSE, crt/aws-c-mqtt/LICENSE,
>> crt/aws-checksums/LICENSE, crt/aws-c-s3/LICENSE,
>> crt/aws-c-compression/LICENSE, crt/aws-c-http/LICENSE,
>> crt/aws-c-sdkutils/LICENSE, crt/s2n/LICENSE, crt/aws-c-cal/LICENSE,
>> crt/aws-c-auth/LICENSE, crt/aws-c-event-stream/LICENSE
>> Creating package/python-awscrt/python-awscrt.hash...
>> Creating package/python-awscrt/Config.in...
>> NOTE: Remember to also make an update to the DEVELOPERS file
>>        and include an entry for the pkg in packages/Config.in
>>
>>

--000000000000be204805f4434101
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello Maxim,<div><br></div><div>While doing make with new =
Buildroot-packages I getting:</div><div><br></div><div>[ 51%] Building ASM =
object aws-lc/crypto/CMakeFiles/crypto_objects.dir/hrss/asm/poly_rq_mul.S.o=
<br>/home/amazone/output/build/python-awscrt-0.16.10/crt/aws-lc/crypto/hrss=
/asm/poly_rq_mul.S: Assembler messages:<br>/home/amazone/output/build/pytho=
n-awscrt-0.16.10/crt/aws-lc/crypto/hrss/asm/poly_rq_mul.S:304: Error: unkno=
wn pseudo-op: `.att_syntax&#39;<br>/home/amazone/output/build/python-awscrt=
-0.16.10/crt/aws-lc/crypto/hrss/asm/poly_rq_mul.S:307: Error: unknown mnemo=
nic `push&#39; -- `push %rbp&#39;<br>/home/amazone/output/build/python-awsc=
rt-0.16.10/crt/aws-lc/crypto/hrss/asm/poly_rq_mul.S:309: Error: bad registe=
r expression<br>/home/amazone/output/build/python-awscrt-0.16.10/crt/aws-lc=
/crypto/hrss/asm/poly_rq_mul.S:310: Error: unknown mnemonic `movq&#39; -- `=
movq %rsp,%rbp&#39;<br>/home/amazone/output/build/python-awscrt-0.16.10/crt=
/aws-lc/crypto/hrss/asm/poly_rq_mul.S:311: Error: bad register expression<b=
r>/home/amazone/output/build/python-awscrt-0.16.10/crt/aws-lc/crypto/hrss/a=
sm/poly_rq_mul.S:312: Error: unknown mnemonic `push&#39; -- `push %r12&#39;=
<br>/home/amazone/output/build/python-awscrt-0.16.10/crt/aws-lc/crypto/hrss=
/asm/poly_rq_mul.S:313: Error: bad register expression<br>/home/amazone/out=
put/build/python-awscrt-0.16.10/crt/aws-lc/crypto/hrss/asm/poly_rq_mul.S:32=
1: Error: operand 1 must be an integer register -- `mov %rcx,%r8&#39;<br>/h=
ome/amazone/output/build/python-awscrt-0.16.10/crt/aws-lc/crypto/hrss/asm/p=
oly_rq_mul.S:322: Error: unknown mnemonic `addq&#39; -- `addq $6144+12288+5=
12+9408+32,%r8&#39;<br>/home/amazone/output/build/python-awscrt-0.16.10/crt=
/aws-lc/crypto/hrss/asm/poly_rq_mul.S:323: Error: operand 1 must be an inte=
ger register -- `mov %r8,%rax&#39;<br>/home/amazone/output/build/python-aws=
crt-0.16.10/crt/aws-lc/crypto/hrss/asm/poly_rq_mul.S:324: Error: unknown mn=
emonic `subq&#39; -- `subq $6144,%r8&#39;<br>/home/amazone/output/build/pyt=
hon-awscrt-0.16.10/crt/aws-lc/crypto/hrss/asm/poly_rq_mul.S:325: Error: ope=
rand 1 must be an integer register -- `mov %r8,%r11&#39;<br>/home/amazone/o=
utput/build/python-awscrt-0.16.10/crt/aws-lc/crypto/hrss/asm/poly_rq_mul.S:=
326: Error: unknown mnemonic `subq&#39; -- `subq $12288,%r8&#39;<br>/home/a=
mazone/output/build/python-awscrt-0.16.10/crt/aws-lc/crypto/hrss/asm/poly_r=
q_mul.S:327: Error: operand 1 must be an integer register -- `mov %r8,%r12&=
#39;<br>/home/amazone/output/build/python-awscrt-0.16.10/crt/aws-lc/crypto/=
hrss/asm/poly_rq_mul.S:328: Error: unknown mnemonic `subq&#39; -- `subq $51=
2,%r8&#39;<br>/home/amazone/output/build/python-awscrt-0.16.10/crt/aws-lc/c=
rypto/hrss/asm/poly_rq_mul.S:329: Error: unknown mnemonic `vmovdqa&#39; -- =
`vmovdqa const3(%rip),%ymm3&#39;<br>/home/amazone/output/build/python-awscr=
t-0.16.10/crt/aws-lc/crypto/hrss/asm/poly_rq_mul.S:330: Error: unknown mnem=
onic `vmovdqu&#39; -- `vmovdqu 0(%rsi),%ymm0&#39;<br>/home/amazone/output/b=
uild/python-awscrt-0.16.10/crt/aws-lc/crypto/hrss/asm/poly_rq_mul.S:331: Er=
ror: unknown mnemonic `vmovdqu&#39; -- `vmovdqu 88(%rsi),%ymm1&#39;<br></di=
v><div>.</div><div>.</div><div>.=C2=A0</div><div>Any idea what it is compla=
ining about?</div><div><br></div><div>Thanks in advance</div></div><br><div=
 class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, 9 Feb =
2023 at 10:28, Sourabh Hegde &lt;<a href=3D"mailto:hrsourabh011@gmail.com">=
hrsourabh011@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_q=
uote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,2=
04);padding-left:1ex"><div dir=3D"ltr">Hi Maxim,<div><br></div><div>I was m=
issing python setuptools on my host. After installing it, I can add the pac=
kage. Also, the added package is available in menuconfig</div><div><br></di=
v><div>Thank you for the support!</div></div><br><div class=3D"gmail_quote"=
><div dir=3D"ltr" class=3D"gmail_attr">On Thu, 9 Feb 2023 at 10:10, Maxim K=
ochetkov &lt;<a href=3D"mailto:fido_max@inbox.ru" target=3D"_blank">fido_ma=
x@inbox.ru</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex"><br>
<br>
On 09.02.2023 12:03, Sourabh Hegde wrote:<br>
&gt; Hello Maxim,<br>
&gt; <br>
&gt; Update:<br>
&gt; <br>
&gt; The above issue resolved by itself!<br>
&gt; <br>
&gt; Now when I do:=C2=A0utils/scanpypi awscrt -o package , it says<br>
&gt; <br>
&gt; spdx_lookup module is not installed. This can lead to an inaccurate <b=
r>
&gt; licence detection. Please install it via<br>
&gt; pip install spdx_lookup<br>
&gt; buildroot package name for awscrt: python-awscrt<br>
&gt; Package: python-awscrt<br>
&gt; Fetching package awscrt<br>
&gt; ERROR: Could not find package awscrt.<br>
&gt; Check syntax inside the python package index:<br>
&gt; <a href=3D"https://pypi.python.org/pypi/" rel=3D"noreferrer" target=3D=
"_blank">https://pypi.python.org/pypi/</a> &lt;<a href=3D"https://pypi.pyth=
on.org/pypi/" rel=3D"noreferrer" target=3D"_blank">https://pypi.python.org/=
pypi/</a>&gt;<br>
&gt; <br>
&gt; But the package is available=C2=A0at <a href=3D"https://pypi.org/proje=
ct/awscrt/" rel=3D"noreferrer" target=3D"_blank">https://pypi.org/project/a=
wscrt/</a> <br>
&gt; &lt;<a href=3D"https://pypi.org/project/awscrt/" rel=3D"noreferrer" ta=
rget=3D"_blank">https://pypi.org/project/awscrt/</a>&gt;<br>
<br>
It works fine for me:<br>
<br>
buildroot package name for awscrt: python-awscrt<br>
Package: python-awscrt<br>
Fetching package awscrt<br>
Downloading package awscrt from <br>
<a href=3D"https://files.pythonhosted.org/packages/ae/98/dda092078f2d47bad0=
8e184ab9d364b8f89166497062bc1cf811c0bbbde2/awscrt-0.16.10.tar.gz." rel=3D"n=
oreferrer" target=3D"_blank">https://files.pythonhosted.org/packages/ae/98/=
dda092078f2d47bad08e184ab9d364b8f89166497062bc1cf811c0bbbde2/awscrt-0.16.10=
.tar.gz.</a>..<br>
Checking if package package/python-awscrt already exists...<br>
Creating package/python-awscrt/python-awscrt.mk...<br>
More than one file found for license: LICENSE, crt/aws-c-common/LICENSE, <b=
r>
crt/aws-c-io/LICENSE, crt/aws-lc/LICENSE, <br>
crt/aws-lc/third_party/fiat/LICENSE, crt/aws-c-mqtt/LICENSE, <br>
crt/aws-checksums/LICENSE, crt/aws-c-s3/LICENSE, <br>
crt/aws-c-compression/LICENSE, crt/aws-c-http/LICENSE, <br>
crt/aws-c-sdkutils/LICENSE, crt/s2n/LICENSE, crt/aws-c-cal/LICENSE, <br>
crt/aws-c-auth/LICENSE, crt/aws-c-event-stream/LICENSE<br>
Creating package/python-awscrt/python-awscrt.hash...<br>
Creating package/python-awscrt/Config.in...<br>
NOTE: Remember to also make an update to the DEVELOPERS file<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0and include an entry for the pkg in packages/Con=
fig.in<br>
<br>
</blockquote></div>
</blockquote></div>

--000000000000be204805f4434101--

--===============6176661164946128676==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6176661164946128676==--
