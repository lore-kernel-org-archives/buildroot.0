Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BFF7C6FD1F
	for <buildroot@archiver.kernel.org>; Sat, 25 Mar 2023 10:56:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B0FCF822FE;
	Sat, 25 Mar 2023 10:56:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B0FCF822FE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gDnnN1XzUqZh; Sat, 25 Mar 2023 10:56:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E7A1E82253;
	Sat, 25 Mar 2023 10:56:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E7A1E82253
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B48351BF29F
 for <buildroot@lists.busybox.net>; Sat, 25 Mar 2023 10:56:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9735682253
 for <buildroot@lists.busybox.net>; Sat, 25 Mar 2023 10:56:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9735682253
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6o9zaTmtjWY2 for <buildroot@lists.busybox.net>;
 Sat, 25 Mar 2023 10:56:48 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E50BD82245
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com
 [IPv6:2607:f8b0:4864:20::432])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E50BD82245
 for <buildroot@buildroot.org>; Sat, 25 Mar 2023 10:56:47 +0000 (UTC)
Received: by mail-pf1-x432.google.com with SMTP id z11so2772172pfh.4
 for <buildroot@buildroot.org>; Sat, 25 Mar 2023 03:56:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679741807;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=7ZN8uYN5E6Y3rHsoV/oFaED3eoJIVK1x9EfnN5A+Cxg=;
 b=v2Oq/KT7rJ8MG487nS6Xz2jWqOAlNzo1z+keTkCiNllTNJYrQ6XfVMepSVRf9TkZOS
 R8ANwE0ptEnLFT+2+h5scQAU3SdDjCSkzGQ8R3SUttyq/K5vDVe5d0XApBsdsm1dAskk
 9REvm15+dq2NvB78YwoJ/r2sFtqcvTrLCbu/5wjwJsiCNunGjJtpWs5ROiOYd+GkE3Iy
 ZSh4lxA+5oyPmpP7uaF9/qo9w8G1TtC0fpBt/QGP89bjp0vwTEK24V1Ul+TeUVh52oBV
 MC7X2KxSghQGnnXueZ7U6EPGOxk09jyr4m7zsxjWZ40F14tOpsS5BA04+w5BSmic4Qyp
 CVRQ==
X-Gm-Message-State: AAQBX9fBsxckEv466uV39jjPw9IgKNZRP+QKWBsftHBgfSC6p90oA1Pw
 slE14mN9EVRVsviFb1FkWQEl5YSsGqHryt1o091nSE+ENVA=
X-Google-Smtp-Source: AKy350ahkmwPCxpAYZ3LS6yRPHS8PBazZHOPnoN7UZUakOlc8rjRTWyyrstif4C8mGvcb/YrJsJ38XelPzYeczD06lM=
X-Received: by 2002:a63:4d52:0:b0:507:68f8:4369 with SMTP id
 n18-20020a634d52000000b0050768f84369mr1457283pgl.12.1679741806832; Sat, 25
 Mar 2023 03:56:46 -0700 (PDT)
MIME-Version: 1.0
From: Charles Lohr <lohr85@gmail.com>
Date: Sat, 25 Mar 2023 06:56:35 -0400
Message-ID: <CAGu26P9Mf9sWE_uxVyqT_-4bJTzz-nYc=hXYaVVDo0ugzg__uw@mail.gmail.com>
To: buildroot <buildroot@buildroot.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1679741807;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=7ZN8uYN5E6Y3rHsoV/oFaED3eoJIVK1x9EfnN5A+Cxg=;
 b=b8q0YRCCCWdya84CxcpyvvFzLz7DlZiktP7h6o3PqtbQxWI/6PizG4jyMjsB+Q7Yne
 SGfNveNDN6mTu+zhXtdN45Mw0vkt9S79lqaakznczvUBQD+1FmjO9tclGo37LfO0yhnm
 iXZ0gXbHPoW97EvN8npMoq69RXEPgf/nT+aOCYojkB7a74AZRmboFIZ6hUzUAa8DmdbR
 UQHDwA52TadpFLvfcfoVm4+cAP1kGMlE8RaLIS5350BA2dxNop6QLrBJRvlAUveLnMuG
 A8HlmmGOj9FUNBe9aO6DAoRQGFeMLHzh7qW8+EwgaKp3OXfiU3QtkKIo71xEn91Urhog
 yYBg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=b8q0YRCC
Subject: [Buildroot] host-gcc-final 12.2.0 with linuxthreads
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
Content-Type: multipart/mixed; boundary="===============8726707461112194323=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8726707461112194323==
Content-Type: multipart/alternative; boundary="000000000000b5f31205f7b75d8f"

--000000000000b5f31205f7b75d8f
Content-Type: text/plain; charset="UTF-8"

I'm trying to re-up the RISC-V 32-bit NOMMU patch.

Is there any way of getting host-gcc-final 12.2.0 to compile without
linuxthreads?

It looks like it's basically required with gcc 12?

/home/cnlohr/git/mini-rv32ima/buildroot/output/build/host-gcc-final-12.2.0/build/./gcc/xgcc
-B/home/cnlohr/git/mini-rv32ima/buildroot/output/build/host-gcc-final-12.2.0/build/./gcc/
-B/home/cnlohr/git/mini-rv32ima/buildroot/output/host/riscv32-buildroot-linux-uclibc/bin/
-B/home/cnlohr/git/mini-rv32ima/buildroot/output/host/riscv32-buildroot-linux-uclibc/lib/
-isystem
/home/cnlohr/git/mini-rv32ima/buildroot/output/host/riscv32-buildroot-linux-uclibc/include
-isystem
/home/cnlohr/git/mini-rv32ima/buildroot/output/host/riscv32-buildroot-linux-uclibc/sys-include
   -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -Os -g0
-fPIC -Wl,-elf2flt=-r -static -O2 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64  -Os -g0  -fPIC  -Wl,-elf2flt=-r -static -DIN_GCC
 -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrowing -Wwrite-strings
-Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition
 -isystem ./include  -I. -I. -I../.././gcc -I../../../libgcc
-I../../../libgcc/. -I../../../libgcc/../gcc -I../../../libgcc/../include
-g0  -finhibit-size-directive -fno-inline -fno-exceptions
-fno-zero-initialized-in-bss -fno-toplevel-reorder -fno-tree-vectorize
-fbuilding-libgcc -fno-stack-protector    -I. -I. -I../.././gcc
-I../../../libgcc -I../../../libgcc/. -I../../../libgcc/../gcc
-I../../../libgcc/../include  -o crtendS.o -MT crtendS.o -MD -MP -MF
crtendS.dep  -fPIC -c ../../../libgcc/crtstuff.c -DCRT_END -DCRTSTUFFS_O
In file included from ../../../libgcc/gthr.h:148,
                 from ../../../libgcc/emutls.c:31:
./gthr-default.h:35:10: fatal error: pthread.h: No such file or directory
   35 | #include <pthread.h>
      |          ^~~~~~~~~~~
compilation terminated.

Any ideas?

--000000000000b5f31205f7b75d8f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>I&#39;m trying to re-up the RISC-V 32-bit NOMMU patch=
.</div><div><br></div><div>Is there any way of getting host-gcc-final 12.2.=
0 to compile without linuxthreads?=C2=A0 <br></div><div><br></div><div>It l=
ooks like it&#39;s basically required with gcc 12?</div><div><br></div><div=
>/home/cnlohr/git/mini-rv32ima/buildroot/output/build/host-gcc-final-12.2.0=
/build/./gcc/xgcc -B/home/cnlohr/git/mini-rv32ima/buildroot/output/build/ho=
st-gcc-final-12.2.0/build/./gcc/ -B/home/cnlohr/git/mini-rv32ima/buildroot/=
output/host/riscv32-buildroot-linux-uclibc/bin/ -B/home/cnlohr/git/mini-rv3=
2ima/buildroot/output/host/riscv32-buildroot-linux-uclibc/lib/ -isystem /ho=
me/cnlohr/git/mini-rv32ima/buildroot/output/host/riscv32-buildroot-linux-uc=
libc/include -isystem /home/cnlohr/git/mini-rv32ima/buildroot/output/host/r=
iscv32-buildroot-linux-uclibc/sys-include =C2=A0 =C2=A0-D_LARGEFILE_SOURCE =
-D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=3D64 -Os -g0 -fPIC -Wl,-elf2flt=
=3D-r -static -O2 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_=
BITS=3D64 =C2=A0-Os -g0 =C2=A0-fPIC =C2=A0-Wl,-elf2flt=3D-r -static -DIN_GC=
C =C2=A0-DCROSS_DIRECTORY_STRUCTURE =C2=A0-W -Wall -Wno-narrowing -Wwrite-s=
trings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -Wold-style-def=
inition =C2=A0-isystem ./include =C2=A0-I. -I. -I../.././gcc -I../../../lib=
gcc -I../../../libgcc/. -I../../../libgcc/../gcc -I../../../libgcc/../inclu=
de =C2=A0 -g0 =C2=A0-finhibit-size-directive -fno-inline -fno-exceptions -f=
no-zero-initialized-in-bss -fno-toplevel-reorder -fno-tree-vectorize -fbuil=
ding-libgcc -fno-stack-protector =C2=A0 =C2=A0-I. -I. -I../.././gcc -I../..=
/../libgcc -I../../../libgcc/. -I../../../libgcc/../gcc -I../../../libgcc/.=
./include =C2=A0-o crtendS.o -MT crtendS.o -MD -MP -MF crtendS.dep =C2=A0-f=
PIC -c ../../../libgcc/crtstuff.c -DCRT_END -DCRTSTUFFS_O<br>In file includ=
ed from ../../../libgcc/gthr.h:148,<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0from ../../../libgcc/emutls.c:31:<br>./gthr-defa=
ult.h:35:10: fatal error: pthread.h: No such file or directory<br>=C2=A0 =
=C2=A035 | #include &lt;pthread.h&gt;<br>=C2=A0 =C2=A0 =C2=A0 | =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0^~~~~~~~~~~<br>compilation terminated.</div><div><b=
r></div><div>Any ideas?<br></div></div>

--000000000000b5f31205f7b75d8f--

--===============8726707461112194323==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8726707461112194323==--
