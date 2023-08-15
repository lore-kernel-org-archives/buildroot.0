Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B1E0C04A6A
	for <buildroot@archiver.kernel.org>; Tue, 15 Aug 2023 15:23:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0429B80DCC;
	Tue, 15 Aug 2023 15:23:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0429B80DCC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AtX3FeI5D6V9; Tue, 15 Aug 2023 15:23:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id F0D5180DA6;
	Tue, 15 Aug 2023 15:23:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F0D5180DA6
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8E8661BF475
 for <buildroot@lists.busybox.net>; Tue, 15 Aug 2023 15:23:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 739904039D
 for <buildroot@lists.busybox.net>; Tue, 15 Aug 2023 15:23:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 739904039D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UD1-yfBz87Y4 for <buildroot@lists.busybox.net>;
 Tue, 15 Aug 2023 15:23:41 +0000 (UTC)
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com
 [IPv6:2607:f8b0:4864:20::234])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 81C5840017
 for <buildroot@buildroot.org>; Tue, 15 Aug 2023 15:23:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 81C5840017
Received: by mail-oi1-x234.google.com with SMTP id
 5614622812f47-3a7d4030621so2873315b6e.3
 for <buildroot@buildroot.org>; Tue, 15 Aug 2023 08:23:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692113020; x=1692717820;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=fg6NJ6iE4IQytNWKOdBEGqyiRowYK7SNZqIslBEoNfI=;
 b=c+9qDQwIkBD05oHWB3QYwyreGkMJ0JYRLVorQWXcAnJlX8p+llAPGiuB8cPzJkHy1Y
 bIpyebslbC9wYK3q0qmxfPzo2tPQl9HDiXbP39nb6PfABcyXhmVPTkuyzo7cOX2Mrfok
 nutQhS+WgJwJd8o5gxbUQEwHHrMBjEXmw2uED8p4Xo2PddMGU9pnDa8K0LAtmuJ+SoM+
 TEBRjws6tn685n+htta68aFprChLNNH0q0xY4ByseRFC0Xo/iNi9MnNKN1568U1qdpaO
 qbsm21oPL46IBsKerhJi6I22tfz3IX5k9u2vSJNzqYQCNm8ETgAGK8p4QshtrU0QHf5u
 5eAw==
X-Gm-Message-State: AOJu0Ywe+yWNGfVMrTvHV76cTZyRgbuUYElGEIbGRpr5J0ckfTc9RJ9z
 8qqkuceTVyflxx2BOJdE9hYBSvZu3Vvwu18ZRKJKIuXlMlw=
X-Google-Smtp-Source: AGHT+IFzGQlgKO5zjXNuyrHCyne/lDqlBzPwIxaqlrWrnZp6+MHSyOqqUamHcRVngpsGlSY28aOF6Qyeke3mGOb39JI=
X-Received: by 2002:a05:6808:2a65:b0:39c:93e7:d5b0 with SMTP id
 fu5-20020a0568082a6500b0039c93e7d5b0mr10780067oib.21.1692113019990; Tue, 15
 Aug 2023 08:23:39 -0700 (PDT)
MIME-Version: 1.0
From: Sourabh Hegde <hrsourabh011@gmail.com>
Date: Tue, 15 Aug 2023 17:23:29 +0200
Message-ID: <CADYjeStRcjcU0o3u1y7h5H3p6=of8ZB5+5-zPKdO7r9=Y1bMJA@mail.gmail.com>
To: buildroot@buildroot.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1692113020; x=1692717820;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=fg6NJ6iE4IQytNWKOdBEGqyiRowYK7SNZqIslBEoNfI=;
 b=EdxtvUpBzJR3ba1dX3bUQWtNdruA1HcNze2HVSXsMqSFFpKEOofos0q54m/zE/xc1s
 17XuJ9X29cESDT+xE8CsmeKpsxCueq9X4cdstiPDQtz94DeQuF8as90ZKoQTBcbWeG59
 d0CuDr72oi9TDsBRry5bbgL5gsr24knoS7zraX5HD+pIrm4/gbRNUzLgWlfr4r5PbIsu
 co+1z7x6jUJz9YeIy9PYRWmMTPZzOkyGtefD4lneknoJON4HzdqIKhzfrIcAM/8laVb1
 EEF36yCNMMuYZA2ad5mpV+qGvqfqtLCdJ8CdUC+PLecJDPHTwSGrzK9dNpZpbng8zr9D
 cVLA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=EdxtvUpB
Subject: [Buildroot] Error while generating buildroot package using scanpypi
 tool
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
Content-Type: multipart/mixed; boundary="===============6375340219741561217=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6375340219741561217==
Content-Type: multipart/alternative; boundary="00000000000079f5450602f7c393"

--00000000000079f5450602f7c393
Content-Type: text/plain; charset="UTF-8"

Hello All,

I am trying to generate a Buildroot package for a Python package available
from https://pypi.org/ using utils/scanpypi tool.

utils/scanpypi loguru black -o package/

But this is giving an error:

Traceback (most recent call last):
  File "utils/scanpypi", line 743, in <module>
    main()
  File "utils/scanpypi", line 691, in main
    package.load_setup()
  File "utils/scanpypi", line 299, in load_setup
    s_file, s_path, s_desc = imp.find_module('setup', [self.tmp_extract])
  File "/usr/lib/python3.8/imp.py", line 296, in find_module
    raise ImportError(_ERR_MSG.format(name), name=name)
ImportError: No module named 'setup'

I have installed python3-setuptools and  pip3 install setuptools. Still the
same error.

Can anyone please let me know what is the issue here and how to resolve it?

Thanks in advance.

--00000000000079f5450602f7c393
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello All,<div><br></div><div>I am trying to generate a Bu=
ildroot package for a Python package available from=C2=A0<a href=3D"https:/=
/pypi.org/">https://pypi.org/</a> using utils/scanpypi tool.=C2=A0</div><di=
v><br></div><div>utils/scanpypi loguru black -o package/<br></div><div><br>=
</div><div>But this=C2=A0is giving an error:</div><div><br></div><div>Trace=
back (most recent call last):<br>=C2=A0 File &quot;utils/scanpypi&quot;, li=
ne 743, in &lt;module&gt;<br>=C2=A0 =C2=A0 main()<br>=C2=A0 File &quot;util=
s/scanpypi&quot;, line 691, in main<br>=C2=A0 =C2=A0 package.load_setup()<b=
r>=C2=A0 File &quot;utils/scanpypi&quot;, line 299, in load_setup<br>=C2=A0=
 =C2=A0 s_file, s_path, s_desc =3D imp.find_module(&#39;setup&#39;, [self.t=
mp_extract])<br>=C2=A0 File &quot;/usr/lib/python3.8/imp.py&quot;, line 296=
, in find_module<br>=C2=A0 =C2=A0 raise ImportError(_ERR_MSG.format(name), =
name=3Dname)<br>ImportError: No module named &#39;setup&#39;<br></div><div>=
<br></div><div>I have installed python3-setuptools and=C2=A0=C2=A0pip3 inst=
all setuptools. Still the same error.</div><div><br></div><div>Can anyone p=
lease let me know what is the issue here and how to resolve it?</div><div><=
br></div><div>Thanks in advance.</div><div><br></div></div>

--00000000000079f5450602f7c393--

--===============6375340219741561217==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6375340219741561217==--
