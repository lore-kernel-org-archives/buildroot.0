Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF6F6C46467
	for <buildroot@archiver.kernel.org>; Sat, 14 Jan 2023 06:31:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2E92982237;
	Sat, 14 Jan 2023 06:31:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2E92982237
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jWpMZt36yb5s; Sat, 14 Jan 2023 06:31:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5F04B821AB;
	Sat, 14 Jan 2023 06:31:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5F04B821AB
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 62E5D1BF4E6
 for <buildroot@lists.busybox.net>; Sat, 14 Jan 2023 06:31:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 36D0F416FD
 for <buildroot@lists.busybox.net>; Sat, 14 Jan 2023 06:31:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 36D0F416FD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CK832Q9isqtB for <buildroot@lists.busybox.net>;
 Sat, 14 Jan 2023 06:31:50 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 19AE9416FC
Received: from mail-yw1-x112e.google.com (mail-yw1-x112e.google.com
 [IPv6:2607:f8b0:4864:20::112e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 19AE9416FC
 for <buildroot@buildroot.org>; Sat, 14 Jan 2023 06:31:49 +0000 (UTC)
Received: by mail-yw1-x112e.google.com with SMTP id
 00721157ae682-4d59d518505so144317907b3.1
 for <buildroot@buildroot.org>; Fri, 13 Jan 2023 22:31:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=D7zIReTMLajFoQWiFrE35BdVNZza0N6yi/szabK4puw=;
 b=M55awah+aQZ+QSH4AvRdMTs6F5NR5VvTuB86/xUmxXEFwMQyluWOrIFevj2dvlCCtV
 Hw/n2LMMTOmXVeyIINBhpSBsFNupJbZI0E7AcFNHo1MH4ba4tqCBE4Q2PVFaNjHbOMLX
 Pes0+j5g8GiTL/jljt1wH9ChcxAdusP5pvwqZ1ckbd0bgoBFTCuD7Sn52ZsGeva1h8p0
 fo/j6BhveqMUuM8LVMHlS6KTL2PfDmmqs1qPUGfP0ZQIHbAdo6Uwr5sCWsU1ZZqk+jNR
 /1Jc9Cl2w+E7hCXYikaqtZll9UPUR4ZbFa8kIS0/P0DyFfbdCrSuOqWi5kXjIYJRx6wW
 1BOQ==
X-Gm-Message-State: AFqh2koDKFEJXqV844/uJIweZyyZEUu10weyPUw0pgm/4QCZI0o1BTKu
 uT8xNxCrP9jYahEesxJGRG3hFKfHnA1REVc2TRFx4hfig90=
X-Google-Smtp-Source: AMrXdXuuThY5esEKiHGKI6UjZm7ZLRK2dMj5N5pNPFbuLfyRk8YO3faM7XQ1EirVyro7MIRYUCjLDXFqOq0AKGNeUIo=
X-Received: by 2002:a05:690c:b05:b0:467:2f6:4de5 with SMTP id
 cj5-20020a05690c0b0500b0046702f64de5mr4222557ywb.278.1673677908454; Fri, 13
 Jan 2023 22:31:48 -0800 (PST)
MIME-Version: 1.0
From: Ernie Carp <erniecarp2018@gmail.com>
Date: Fri, 13 Jan 2023 22:31:37 -0800
Message-ID: <CAHdaamN7mawJYf6LAVJXTtptm08u79TucxEbbSoMYHduhUdL3A@mail.gmail.com>
To: buildroot@buildroot.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=D7zIReTMLajFoQWiFrE35BdVNZza0N6yi/szabK4puw=;
 b=iNyeAW8DD6Rx1vQYh8v93f/EpVtMsFZqcFJWez4891M3n3kwFlE0qqYtLJeMlNPiRK
 TliWoJL9g+VgQ5YXGwIFLT0Qq4C92FsHhnYVbfM+GV7GhdmygTDP3SM69qZhNevgQk8p
 o13H8OodmC4P6PThceTu0xa9DergHz7Ffp3+gkls+LKXPLYROwBDRiL++R8N1aA+9x0l
 ebqo1wfjZ9gh/eoPQ9CQtSyjvX7ZrSxs3Uq12POev2iu/+Z0Qyt1Q7ox3rbuQBincwLS
 3GTvHdrGYMtu18vzV/rpb5ksUlmvqITAyZiU6iBBK5UWmRgY3DRUC9Sx0Q7O0PVkl41B
 eE+w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=iNyeAW8D
Subject: [Buildroot] Python 3 bcrypt error
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
Content-Type: multipart/mixed; boundary="===============5105089486093210348=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============5105089486093210348==
Content-Type: multipart/alternative; boundary="00000000000033b1d805f2338190"

--00000000000033b1d805f2338190
Content-Type: text/plain; charset="UTF-8"

Hello,

When compiling python3 on buildroot version 2022-11 I get an error message
about bcrypt.
The PyPi.org lists the sha256 hash as
27d375903ac8261cfe4047f6709d16f7d18d39b1ec92aaf72af989552a650ebd

Need a little help to fix it.

[source.vendored-sources]
directory = "VENDOR"
ERROR: bcrypt-4.0.1.tar.gz has wrong sha256 hash:
ERROR: expected:
d64daee0af1afe137718674e67a49b8bb791842aab265b588a6d68d44a449c70
ERROR: got     :
108aaa38326360d716f4a6e2e98bfe84969542e559bd8bfe3b09ccc93e6c2944
ERROR: Incomplete download, or man-in-the-middle (MITM) attack
wget --passive-ftp -nd -t 3 -O
'/home/ethertek/rms200v2/buildroot/output/build/.bcrypt-4.0.1.tar.gz.CquFUP/output'
'http://sources.buildroot.net/bcrypt-4.0.1.tar.gz'
--2023-01-14 06:19:19--  http://sources.buildroot.net/bcrypt-4.0.1.tar.gz
Resolving sources.buildroot.net (sources.buildroot.net)... 104.26.0.37,
172.67.72.56, 104.26.1.37, ...
Connecting to sources.buildroot.net (sources.buildroot.net)|104.26.0.37|:80...
connected.
HTTP request sent, awaiting response... 404 Not Found
2023-01-14 06:19:19 ERROR 404: Not Found.

make[1]: *** [package/pkg-generic.mk:189:
/home/ethertek/rms200v2/buildroot/output/build/python-bcrypt-4.0.1/.stamp_downloaded]
Error 1
make: *** [Makefile:84: _all] Error 2

Thank you,
Ernie.

--00000000000033b1d805f2338190
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr">Hello,<div><br></div><di=
v>When compiling python3 on buildroot version 2022-11 I get an error messag=
e about bcrypt.</div><div>The PyPi.org lists the sha256 hash as 27d375903ac=
8261cfe4047f6709d16f7d18d39b1ec92aaf72af989552a650ebd</div><div><br></div><=
div>Need a little help to fix it.</div><div><br></div><div><div>[source.ven=
dored-sources]</div><div>directory =3D &quot;VENDOR&quot;</div><div>ERROR: =
bcrypt-4.0.1.tar.gz has wrong sha256 hash:</div><div>ERROR: expected: d64da=
ee0af1afe137718674e67a49b8bb791842aab265b588a6d68d44a449c70</div><div>ERROR=
: got=C2=A0 =C2=A0 =C2=A0: 108aaa38326360d716f4a6e2e98bfe84969542e559bd8bfe=
3b09ccc93e6c2944</div><div>ERROR: Incomplete download, or man-in-the-middle=
 (MITM) attack</div><div>wget --passive-ftp -nd -t 3 -O &#39;/home/ethertek=
/rms200v2/buildroot/output/build/.bcrypt-4.0.1.tar.gz.CquFUP/output&#39; &#=
39;<a href=3D"http://sources.buildroot.net/bcrypt-4.0.1.tar.gz">http://sour=
ces.buildroot.net/bcrypt-4.0.1.tar.gz</a>&#39;=C2=A0</div><div>--2023-01-14=
 06:19:19--=C2=A0 <a href=3D"http://sources.buildroot.net/bcrypt-4.0.1.tar.=
gz">http://sources.buildroot.net/bcrypt-4.0.1.tar.gz</a></div><div>Resolvin=
g <a href=3D"http://sources.buildroot.net">sources.buildroot.net</a> (<a hr=
ef=3D"http://sources.buildroot.net">sources.buildroot.net</a>)... 104.26.0.=
37, 172.67.72.56, 104.26.1.37, ...</div><div>Connecting to <a href=3D"http:=
//sources.buildroot.net">sources.buildroot.net</a> (<a href=3D"http://sourc=
es.buildroot.net">sources.buildroot.net</a>)|104.26.0.37|:80... connected.<=
/div><div>HTTP request sent, awaiting response... 404 Not Found</div><div>2=
023-01-14 06:19:19 ERROR 404: Not Found.</div><div><br></div><div>make[1]: =
*** [package/<a href=3D"http://pkg-generic.mk:189">pkg-generic.mk:189</a>: =
/home/ethertek/rms200v2/buildroot/output/build/python-bcrypt-4.0.1/.stamp_d=
ownloaded] Error 1</div><div>make: *** [Makefile:84: _all] Error 2</div></d=
iv><div><br></div><div>Thank you,</div><div>Ernie.</div></div></div></div>

--00000000000033b1d805f2338190--

--===============5105089486093210348==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5105089486093210348==--
