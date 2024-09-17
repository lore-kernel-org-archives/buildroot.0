Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABC9DCAC5A2
	for <buildroot@archiver.kernel.org>; Tue, 17 Sep 2024 21:17:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7381460618;
	Tue, 17 Sep 2024 21:17:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ehb4P3jKAue9; Tue, 17 Sep 2024 21:17:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8C6AF6064B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8C6AF6064B;
	Tue, 17 Sep 2024 21:17:53 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 69AAD1BF5E6
 for <buildroot@lists.busybox.net>; Tue, 17 Sep 2024 21:17:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 57BE34026F
 for <buildroot@lists.busybox.net>; Tue, 17 Sep 2024 21:17:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Fhn9ebb-R94c for <buildroot@lists.busybox.net>;
 Tue, 17 Sep 2024 21:17:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::534; helo=mail-pg1-x534.google.com;
 envelope-from=daryl.spitzer@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 51A3340118
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 51A3340118
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com
 [IPv6:2607:f8b0:4864:20::534])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 51A3340118
 for <buildroot@buildroot.org>; Tue, 17 Sep 2024 21:17:50 +0000 (UTC)
Received: by mail-pg1-x534.google.com with SMTP id
 41be03b00d2f7-7db4c1a54easo2042428a12.1
 for <buildroot@buildroot.org>; Tue, 17 Sep 2024 14:17:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726607869; x=1727212669;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ep5KfRHedFIDaBUJfQiS1VYp0DBmfRiLp3tp0YUHmVs=;
 b=CgdHNoIvpCB2QO6hJAPoBZ1dAFoPQ+B3XPZ3btOXEsIZ7+EXSNiFBFE/794Ezph/GL
 rxZwuA6zx4oqBeWm7kliT8wX+89xYdglDsuckVB5c7frbrkDrbFYrbBrr0qfPlVZtJNk
 XPF8efNWX4nSGf3UcSaeoSMggjSQ0h//B1ZZ1HEHBcQbVwCcb6aGTovvWmu4C081yW/P
 kHMjLElD9+jm5kzsWGTL+qXMMH8mC1oWO5Xs8UYI7fhNvmf+XorbvjV5vEnM36MTtZqe
 90U0jsn25HsAh4n9KXS/FZeyW5c7033PXWW/z5AKX/waP15Y8+LjDWJ/SS1BZDkdesCE
 x+Fw==
X-Gm-Message-State: AOJu0YwtM/1oMuspHWVk/V6gnKh07xk9IkPzangcUOmf8vYFdLwXiT1v
 EKygpcF7RTUdiBUMEt89K1eKOKa0j00IhV9L5KvRxUNwt4bbJJTM0HikPQmN4G2B31h5DYJsa12
 /ppZ2V6JXKlXx4B8nSV144kbesffo087G
X-Google-Smtp-Source: AGHT+IGbx8r6gSy33Q3DBrx1nUQn+rd55tJ17zdt7MScVlM6abEOUB/g8O2zDQQP+9wKnnOZHP6ShFvpxqX4tI80jL0=
X-Received: by 2002:a05:6a20:c99a:b0:1ce:d1b0:bc65 with SMTP id
 adf61e73a8af0-1cf76243c83mr24911261637.43.1726607869113; Tue, 17 Sep 2024
 14:17:49 -0700 (PDT)
MIME-Version: 1.0
From: Daryl Spitzer <daryl.spitzer@gmail.com>
Date: Tue, 17 Sep 2024 14:17:11 -0700
Message-ID: <CAG94F8ptMs+ywOnb9FugtEQxb_JA5FscQP9d1SbRP+9ULq4Txw@mail.gmail.com>
To: buildroot@buildroot.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726607869; x=1727212669; darn=buildroot.org;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=ep5KfRHedFIDaBUJfQiS1VYp0DBmfRiLp3tp0YUHmVs=;
 b=Uj+8ikDm+dw/MaLwtOP9HAGZWt9BqE30o2Br0ta53i1epJfkJxQhz+WpbmQ2YVyYKB
 3+wSCH/gcA9AmLbi1Lt8d8PDbi6BJklhAa6ScnB1LQ3TCP0ZofrGtrVkDldAAvnEwfMC
 E1G6AQgYGwD4rPZiS9KXV+Da39vC4EfbsVRcInnelB30Nr9kixH63MEFz/pmnT7ksF8x
 PscM/ydtqyLnetxWEHQCq72bia8SWVvuDXGfOnjSmoUVsPKBcq+IsFkgtOSqQxhfUHcX
 8Op1RFzg5efxDEzEyywzvaYrCBmLS0Rinkh6w7x4aSHePNB7/hAaPFLq45EeUpQi9xqs
 lszQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=Uj+8ikDm
Subject: [Buildroot] =?utf-8?q?node_crashes_when_the_madvise_system_call_?=
	=?utf-8?q?returns_=E2=80=9CFunction_not_implemented=E2=80=9D?=
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
Content-Type: multipart/mixed; boundary="===============0498794443182549201=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0498794443182549201==
Content-Type: multipart/alternative; boundary="000000000000b47e7f0622573817"

--000000000000b47e7f0622573817
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I'm building a root filesystem including Node.js using buildroot 2024.02.4,
selecting Linux 4.19.x kernel headers and enabling compatibility shims.
It's mounted on a target running kernel version 4.9.84.

I can run `node --version` on the target successfully, but when I run just
`node` (or with a JavaScript file argument) it crashes with "Check failed:
0 =3D=3D ret.Unhandled prefetch abort: breakpoint debug exception (0x002) a=
t
0x019426bc".

I used GDB to learn that node is crashing because a call to the madvise
system call in the V8 JavaScript engine is returning -1 (indicating an
error) and setting errno to 38, which is =E2=80=9CFunction not implemented=
=E2=80=9D
(ENOSYS).

Could this be because a compatibility shim is returning this on the call to
madvise?

I suspect that I'm trying to run node on too old a kernel. But I welcome
any suggestions.

--
Daryl Spitzer

--000000000000b47e7f0622573817
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I&#39;m building a=C2=A0root filesystem including=C2=A0Nod=
e.js using=C2=A0buildroot=C2=A02024.02.4, selecting=C2=A0Linux 4.19.x kerne=
l headers and enabling=C2=A0compatibility shims. It&#39;s mounted on a targ=
et running kernel version=C2=A04.9.84.<div><br></div><div>I can run `node -=
-version` on the target=C2=A0successfully, but when I run just `node` (or w=
ith a=C2=A0JavaScript file argument) it crashes=C2=A0with &quot;Check faile=
d: 0 =3D=3D ret.Unhandled prefetch abort: breakpoint debug exception (0x002=
) at 0x019426bc&quot;.</div><div><br></div><div>I used GDB to learn that no=
de is crashing because=C2=A0a call to the madvise system call in the V8 Jav=
aScript engine is returning -1 (indicating an error) and setting errno to 3=
8, which is =E2=80=9CFunction not implemented=E2=80=9D (ENOSYS).</div><div>=
<br></div><div>Could this be because a=C2=A0compatibility shim is returning=
 this on the call to madvise?</div><div><br></div><div>I suspect that I&#39=
;m trying to run node on too old a kernel. But I welcome any suggestions.</=
div><div><br></div><div>--<br>Daryl=C2=A0Spitzer<br></div><div><br></div></=
div>

--000000000000b47e7f0622573817--

--===============0498794443182549201==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0498794443182549201==--
