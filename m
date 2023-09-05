Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1AF3CA1009
	for <buildroot@archiver.kernel.org>; Tue,  5 Sep 2023 20:02:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 103F941781;
	Tue,  5 Sep 2023 20:02:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 103F941781
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qQsbPQjXWF3U; Tue,  5 Sep 2023 20:02:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CF88C41798;
	Tue,  5 Sep 2023 20:02:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CF88C41798
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id CD3601BF306
 for <buildroot@lists.busybox.net>; Tue,  5 Sep 2023 20:02:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A427F41779
 for <buildroot@lists.busybox.net>; Tue,  5 Sep 2023 20:02:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A427F41779
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MKKPnUXED8Jn for <buildroot@lists.busybox.net>;
 Tue,  5 Sep 2023 20:02:16 +0000 (UTC)
Received: from mail-oo1-xc2c.google.com (mail-oo1-xc2c.google.com
 [IPv6:2607:f8b0:4864:20::c2c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 82C8D4174C
 for <buildroot@buildroot.org>; Tue,  5 Sep 2023 20:02:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 82C8D4174C
Received: by mail-oo1-xc2c.google.com with SMTP id
 006d021491bc7-57129417cecso121657eaf.1
 for <buildroot@buildroot.org>; Tue, 05 Sep 2023 13:02:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693944135; x=1694548935;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=sF5rHHbIQ2CYdLps3zrjWfJrzH2Q9R83ycSy7yUwsUU=;
 b=mCexsOs4CHlG73qyBbOj4bfamWMqpMy1DQKenhKuw03C8LC45IZmlmoGNRL1okhwM6
 Gj2sXHoWPzZ/A+nVR1qQk+Mb6Enb1vJtDMUbDBINBOUdIe9J+QRmPJ0kBguaHk06nFsS
 BYpxj7Eoz/mLcjMwnpqyN9a2asVieYK6qWMV7XBpx79oCelwp2LsUyyYcDPbDyznJQXt
 WTdibv8SAkuWvx6r4qMzfcPT3QkSzqB1RdqclVNKX+8wIjlprKAww36iGIQyYqsvP8bp
 rgetkDj+RxpCss3E4tWGyyJS2nL9M9WzZac69vcOuyRy051Vw1K2rE87oOWKfcxefWk5
 YN/w==
X-Gm-Message-State: AOJu0YyDCMUhYKaStQnGAHL9iNG3DRGRkfDCEudNiq+ZGNk8EE8N03RR
 aWV8YGrodc/ndo/yKEdhmFjBj1EphL06RK6iV6/inl9HPqs=
X-Google-Smtp-Source: AGHT+IH9ou3mCr5+4Ukds/+9FGIkqMe3lhTpprXLD63QmXoJ7gP1zJobmQINqlsl1G4jrHL5E1HnNjD6H+aLMp+8lbY=
X-Received: by 2002:a4a:2746:0:b0:571:1c44:c9c0 with SMTP id
 w6-20020a4a2746000000b005711c44c9c0mr8704921oow.1.1693944135312; Tue, 05 Sep
 2023 13:02:15 -0700 (PDT)
MIME-Version: 1.0
From: Robert D Kocisko <rkocisko@gmail.com>
Date: Tue, 5 Sep 2023 16:02:04 -0400
Message-ID: <CAGF=AeQr3N0UkB9sXqg42D6nUhC3+w3Gw3fHOJPjg-J0f+Lbbg@mail.gmail.com>
To: buildroot@buildroot.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1693944135; x=1694548935; darn=buildroot.org;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=sF5rHHbIQ2CYdLps3zrjWfJrzH2Q9R83ycSy7yUwsUU=;
 b=Yu+dCmP1agWlfzZyZuNYKz+XZHeWzMDWY55RzO0exEdE4jivyQbRN+oC7BunNc2LxL
 +FveSpNHR390jJI/YABwmnxrWJJAPETeYIUW3IOL4nw61eaNK+F909UjwOGVS/NYcJnU
 TaWZNo8s5/cKq6mGTMvjlaKSi1sWzKUzW+FHusXNYvwEIe9zzfk2BAomv91QbvNPzuFG
 8+XVL4jPM+gSSkAItalcbIG4jOfa5vIEANActP9LXm2WcFKskKEo4hLn6LEe1Z/bJG5C
 5La0bg0Kqe2rQvBHYPLoN1wQmdQfyt0XJrimhFRBVxdlOxgjDRqRynEfsLiYq07oc7B1
 aHCA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=Yu+dCmP1
Subject: [Buildroot] Erlang JIT build issues for aarch64
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
Content-Type: multipart/mixed; boundary="===============4389574743552654144=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4389574743552654144==
Content-Type: multipart/alternative; boundary="00000000000074686c0604a21ad0"

--00000000000074686c0604a21ad0
Content-Type: text/plain; charset="UTF-8"

Hello!  I'm fairly new to Buildroot and am attempting to build Erlang for
an aarch64 system.

All was well until I noticed that Erlang said the JIT would be disabled
since I didn't have c++ support.  To fix that, I enabled c++ support, and
now I'm getting the following errors.  Am I doing something wrong or is
this a bug?

asmjit/core/cpuinfo.cpp: In function 'void
asmjit::_abi_1_10::detectHWCaps(CpuInfo&, long unsigned int, const
LinuxHWCapMapping*, size_t)':
asmjit/core/cpuinfo.cpp:840:24: error: 'getauxval' was not declared in this
scope
840 | unsigned long mask = getauxval(type);
| ^~~~~~~~~
In file included from ../include/internal/gcc/ethread.h:347,
from ../include/internal/ethread.h:389,
from beam/erl_threads.h:252,
from beam/sys.h:539,
from beam/dist.c:37:
In function 'ethr_native_atomic64_set_relb',
inlined from 'ethr_atomic_set_mb' at
../include/internal/ethr_atomics.h:4019:5,
inlined from 'erts_dist_command' at beam/dist.c:3866:5:
../include/internal/gcc/ethr_atomic.h:144:5: warning: '__atomic_store_8'
writing 8 bytes into a region of size 0 overflows the destination
[-Wstringop-overflow=]
144 | __atomic_store_n(&var->value, value, __ATOMIC_RELEASE);
| ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
In function 'erts_dist_command':
cc1: note: destination object is likely at address zero
asmjit/core/cpuinfo.cpp: In function 'void
asmjit::_abi_1_10::detectARMCpu(CpuInfo&)':
asmjit/core/cpuinfo.cpp:972:21: error: 'AT_HWCAP' was not declared in this
scope
972 | detectHWCaps(cpu, AT_HWCAP, hwCapMapping,
ASMJIT_ARRAY_SIZE(hwCapMapping));
| ^~~~~~~~
CXX obj/aarch64-buildroot-linux-gnu/opt/jit/asmjit/core/emitterutils.o
CXX obj/aarch64-buildroot-linux-gnu/opt/jit/asmjit/core/environment.o
asmjit/core/cpuinfo.cpp:973:21: error: 'AT_HWCAP2' was not declared in this
scope
973 | detectHWCaps(cpu, AT_HWCAP2, hwCapMapping2,
ASMJIT_ARRAY_SIZE(hwCapMapping2));
|


Buildroot version: buildroot-2023.08-rc1
gcc version: gcc 13.x
binutils version: 2.41
enable c++ support: yes

Thanks!
Bob Kocisko

--00000000000074686c0604a21ad0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><font face=3D"monospace">Hello!=C2=A0 I&#=
39;m fairly new to Buildroot and am attempting to build Erlang for an aarch=
64 system. =C2=A0</font><div><font face=3D"monospace"><br></font></div><div=
><font face=3D"monospace">All was well until I noticed that Erlang said the=
 JIT would be disabled since I didn&#39;t have c++ support.=C2=A0=C2=A0</fo=
nt><span style=3D"font-family:monospace">To fix that, I enabled c++ support=
, and now I&#39;m getting the following errors.=C2=A0 Am I doing something =
wrong or is this a bug?</span><div><font face=3D"monospace"><br>asmjit/core=
/cpuinfo.cpp: In function &#39;void asmjit::_abi_1_10::detectHWCaps(CpuInfo=
&amp;, long unsigned int, const LinuxHWCapMapping*, size_t)&#39;:<br>asmjit=
/core/cpuinfo.cpp:840:24: error: &#39;getauxval&#39; was not declared in th=
is scope<br>840 | unsigned long mask =3D getauxval(type);<br>| ^~~~~~~~~<br=
>In file included from ../include/internal/gcc/ethread.h:347,<br>from ../in=
clude/internal/ethread.h:389,<br>from beam/erl_threads.h:252,<br>from beam/=
sys.h:539,<br>from beam/dist.c:37:<br>In function &#39;ethr_native_atomic64=
_set_relb&#39;,<br>inlined from &#39;ethr_atomic_set_mb&#39; at ../include/=
internal/ethr_atomics.h:4019:5,<br>inlined from &#39;erts_dist_command&#39;=
 at beam/dist.c:3866:5:<br>../include/internal/gcc/ethr_atomic.h:144:5: war=
ning: &#39;__atomic_store_8&#39; writing 8 bytes into a region of size 0 ov=
erflows the destination [-Wstringop-overflow=3D]<br>144 | __atomic_store_n(=
&amp;var-&gt;value, value, __ATOMIC_RELEASE);<br>| ^~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~<br>In function &#39;erts_dist_command&#39;:<=
br>cc1: note: destination object is likely at address zero<br>asmjit/core/c=
puinfo.cpp: In function &#39;void asmjit::_abi_1_10::detectARMCpu(CpuInfo&a=
mp;)&#39;:<br>asmjit/core/cpuinfo.cpp:972:21: error: &#39;AT_HWCAP&#39; was=
 not declared in this scope<br>972 | detectHWCaps(cpu, AT_HWCAP, hwCapMappi=
ng, ASMJIT_ARRAY_SIZE(hwCapMapping));<br>| ^~~~~~~~<br>CXX obj/aarch64-buil=
droot-linux-gnu/opt/jit/asmjit/core/emitterutils.o<br>CXX obj/aarch64-build=
root-linux-gnu/opt/jit/asmjit/core/environment.o<br>asmjit/core/cpuinfo.cpp=
:973:21: error: &#39;AT_HWCAP2&#39; was not declared in this scope<br>973 |=
 detectHWCaps(cpu, AT_HWCAP2, hwCapMapping2, ASMJIT_ARRAY_SIZE(hwCapMapping=
2));<br>|</font></div></div><div><font face=3D"monospace"><br></font></div>=
<div><font face=3D"monospace"><br></font></div><font face=3D"monospace">Bui=
ldroot version: buildroot-2023.08-rc1<br>gcc version: gcc 13.x</font></div>=
<div><font face=3D"monospace">binutils version: 2.41</font></div><div><font=
 face=3D"monospace">enable c++ support: yes</font></div><div dir=3D"ltr"><f=
ont face=3D"monospace"><br></font></div><div>Thanks!</div><div>Bob Kocisko<=
/div></div>

--00000000000074686c0604a21ad0--

--===============4389574743552654144==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4389574743552654144==--
