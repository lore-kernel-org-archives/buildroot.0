Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD8CFC5AD4C
	for <buildroot@archiver.kernel.org>; Thu, 23 Nov 2023 19:15:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8E5EA82009;
	Thu, 23 Nov 2023 19:15:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8E5EA82009
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YrgJOGT-fD62; Thu, 23 Nov 2023 19:15:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id AB8AD82123;
	Thu, 23 Nov 2023 19:15:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AB8AD82123
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id EAC971BF28B
 for <buildroot@lists.busybox.net>; Thu, 23 Nov 2023 19:15:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C2AF440590
 for <buildroot@lists.busybox.net>; Thu, 23 Nov 2023 19:15:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C2AF440590
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 27WuikD8_PZd for <buildroot@lists.busybox.net>;
 Thu, 23 Nov 2023 19:15:11 +0000 (UTC)
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3A0DA40297
 for <buildroot@buildroot.org>; Thu, 23 Nov 2023 19:15:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3A0DA40297
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-548ce39b101so1631277a12.2
 for <buildroot@buildroot.org>; Thu, 23 Nov 2023 11:15:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700766909; x=1701371709;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=tDPfjbSP9xDyY5KhNVE8/VcY5XA32/RZ+NqZnQ4zNjM=;
 b=KZJXDkOs8vUt4h7rvfwguWO/ZvAv4SPMRm5Og5KbReWjmVFwzAp9PSQ6cbI/3IkTal
 sqdG84xhBOzqFd+PcpfS/NiGouIdWTFT4ypn9MvSA+i7ZN59m8RpvwnGZgfGIefkCbru
 AZxk+75qDNSavOONKW7E6Ga7/G+S1co1QtKG6Sin8ffmdvhG+Bnqd4pbl49fZLqHXD1i
 Q5IYoiY+bdyTxe/80mkUdxP5YmdrGjk/DXpWeVmfp7wQL7e6gP4PyzIHEnjsCS256d2n
 HWelVMVzODN+rsNJ54lgVws29t05hWNy3mKrEpsPP1KPJFdI9qxhKzOQsjP7ysPutyr4
 JMFQ==
X-Gm-Message-State: AOJu0YzJhSjgMNr8U6LCJnhDJr1hc2t/1qUeu3O9mDT+JcSQeYkHx8ru
 aSToRAiwa5UD775Xb+unk40p88X3EfPqdYsUJjvhojopUV3vzw==
X-Google-Smtp-Source: AGHT+IHB4jvJ0xDS4h17hK0IGT17xJtVTy8hANI6NcQTaf4tQQfa8ixW5gi8K3zcjeBsqBVs0AtwI/3nrQzcSwzDI8Y=
X-Received: by 2002:a17:906:fd46:b0:9ff:ca67:789d with SMTP id
 wi6-20020a170906fd4600b009ffca67789dmr168650ejb.31.1700766908677; Thu, 23 Nov
 2023 11:15:08 -0800 (PST)
MIME-Version: 1.0
From: Dave Rathnow <drathnow@gmail.com>
Date: Thu, 23 Nov 2023 12:14:57 -0700
Message-ID: <CAPH1yshB_JnFEZQNTTmA5hbYOiX0YfsDvnUbdmy7H6TbT_T3Ag@mail.gmail.com>
To: buildroot@buildroot.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1700766909; x=1701371709; darn=buildroot.org;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=tDPfjbSP9xDyY5KhNVE8/VcY5XA32/RZ+NqZnQ4zNjM=;
 b=HZvizdAlHrmQmzl5e/KFq73CDzbK16drzJgzRiwA8YQEm/O+mSnoRX2ZtWTmS61HCD
 6n67QoGLgM7747DEWt8u4/vur7XIxZreidZ/L7RlK0xSHnaIj7ftIkL9WKq3P6gQ8495
 mtz/RIvGyk8QmrXfHqPa60YdhrCEkGNlp2rRVtpCaT0KSWEigS3/e9n3Xxj72mmJwJU5
 Rj41ka1wOl8Z36A0XQWjyHfDz+SND3BERRNpWTp6r5Uunc06PwLsjB31lGdW1E2VKxuA
 Bky9xdScOoJaBBba0GYX3ADaXfeXoA6xWEQ1uoNHupSoW49rV6aLIwIWjVlGAhjKar1d
 k1zQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=HZvizdAl
Subject: [Buildroot] Broken build
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
Content-Type: multipart/mixed; boundary="===============7965908618948104423=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============7965908618948104423==
Content-Type: multipart/alternative; boundary="0000000000007002b0060ad6a7f9"

--0000000000007002b0060ad6a7f9
Content-Type: text/plain; charset="UTF-8"

Hello,

A couple of years ago, Bootln built us a kernel using Buildroot.  I took
all the build scripts and source code required to build that kernel and
moved them to our own local git repository.  At the time everything
built fine, and the last time I tried--about a year ago--it was working but
I recently tried to build it and I'm getting the error below.  I don't have
the deep knowledge of Buildroot and how it obtains all its sources
and packages but I thought I had moved everything we needed to our local
repository.  Can anyone tell me if I've missed something?

Thanks,
Dave.

arget/etc/lighttpd/conf.d/mime.conf
>>> linux-tools  Extracting
>>> linux f593d9e1e347488358872bc8618180db7aca685c Downloading
Initialized empty Git repository in
/home/fgdev/projects/buildroot/dl/linux/git/.git/
Fetching all references
remote: TF401019: The Git repository with name or identifier linux does not
exist or you do not have permissions for the operation you are attempting.
fatal: Could not read from remote repository.

Please make sure you have the correct access rights
and the repository exists.
Detected a corrupted git cache.
Removing it and starting afresh.
Initialized empty Git repository in
/home/fgdev/projects/buildroot/dl/linux/git/.git/
Fetching all references
remote: TF401019: The Git repository with name or identifier linux does not
exist or you do not have permissions for the operation you are attempting.
fatal: Could not read from remote repository.

Please make sure you have the correct access rights
and the repository exists.
Detected a corrupted git cache.
This is the second time in a row; bailing out
--2023-11-23 11:49:35--
http://sources.buildroot.net/linux/linux-f593d9e1e347488358872bc8618180db7aca685c.tar.gz
Resolving sources.buildroot.net (sources.buildroot.net)...
2606:4700:20::ac43:4838, 2606:4700:20::681a:125, 2606:4700:20::681a:25, ...
Connecting to sources.buildroot.net
(sources.buildroot.net)|2606:4700:20::ac43:4838|:80...
connected.
HTTP request sent, awaiting response... 404 Not Found
2023-11-23 11:49:35 ERROR 404: Not Found.

--2023-11-23 11:49:35--
http://sources.buildroot.net/linux-f593d9e1e347488358872bc8618180db7aca685c.tar.gz
Resolving sources.buildroot.net (sources.buildroot.net)...
2606:4700:20::ac43:4838, 2606:4700:20::681a:125, 2606:4700:20::681a:25, ...
Connecting to sources.buildroot.net
(sources.buildroot.net)|2606:4700:20::ac43:4838|:80...
connected.
HTTP request sent, awaiting response... 404 Not Found
2023-11-23 11:49:35 ERROR 404: Not Found.

make[1]: *** [package/pkg-generic.mk:146:
/home/fgdev/projects/buildroot/output/build/linux-f593d9e1e347488358872bc8618180db7aca685c/.stamp_downloaded]
Error 1
make: *** [Makefile:84: _all] Error 2

--0000000000007002b0060ad6a7f9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello,<div><br></div><div>A couple of years ago, Bootln bu=
ilt us a kernel using Buildroot.=C2=A0 I took all the build scripts and sou=
rce code required to build that kernel and moved them to our own local git =
repository.=C2=A0 At the time everything built=C2=A0fine, and the last time=
 I tried--about a year ago--it was working but I recently tried to build it=
 and I&#39;m getting the error below.=C2=A0 I don&#39;t have the deep knowl=
edge of Buildroot and how it obtains all its sources and=C2=A0packages but =
I thought I had moved everything we needed to our local repository.=C2=A0 C=
an anyone tell me if I&#39;ve missed something?</div><div><br></div><div>Th=
anks,</div><div>Dave.</div><div><br></div><div>arget/etc/lighttpd/conf.d/mi=
me.conf<br>&gt;&gt;&gt; linux-tools =C2=A0Extracting<br>&gt;&gt;&gt; linux =
f593d9e1e347488358872bc8618180db7aca685c Downloading<br>Initialized empty G=
it repository in /home/fgdev/projects/buildroot/dl/linux/git/.git/<br>Fetch=
ing all references<br>remote: TF401019: The Git repository with name or ide=
ntifier linux does not exist or you do not have permissions for the operati=
on you are attempting.<br>fatal: Could not read from remote repository.<br>=
<br>Please make sure you have the correct access rights<br>and the reposito=
ry exists.<br>Detected a corrupted git cache.<br>Removing it and starting a=
fresh.<br>Initialized empty Git repository in /home/fgdev/projects/buildroo=
t/dl/linux/git/.git/<br>Fetching all references<br>remote: TF401019: The Gi=
t repository with name or identifier linux does not exist or you do not hav=
e permissions for the operation you are attempting.<br>fatal: Could not rea=
d from remote repository.<br><br>Please make sure you have the correct acce=
ss rights<br>and the repository exists.<br>Detected a corrupted git cache.<=
br>This is the second time in a row; bailing out<br>--2023-11-23 11:49:35--=
 =C2=A0<a href=3D"http://sources.buildroot.net/linux/linux-f593d9e1e3474883=
58872bc8618180db7aca685c.tar.gz">http://sources.buildroot.net/linux/linux-f=
593d9e1e347488358872bc8618180db7aca685c.tar.gz</a><br>Resolving <a href=3D"=
http://sources.buildroot.net">sources.buildroot.net</a> (<a href=3D"http://=
sources.buildroot.net">sources.buildroot.net</a>)... 2606:4700:20::ac43:483=
8, 2606:4700:20::681a:125, 2606:4700:20::681a:25, ...<br>Connecting to <a h=
ref=3D"http://sources.buildroot.net">sources.buildroot.net</a> (<a href=3D"=
http://sources.buildroot.net">sources.buildroot.net</a>)|2606:4700:20::ac43=
:4838|:80... connected.<br>HTTP request sent, awaiting response... 404 Not =
Found<br>2023-11-23 11:49:35 ERROR 404: Not Found.<br><br>--2023-11-23 11:4=
9:35-- =C2=A0<a href=3D"http://sources.buildroot.net/linux-f593d9e1e3474883=
58872bc8618180db7aca685c.tar.gz">http://sources.buildroot.net/linux-f593d9e=
1e347488358872bc8618180db7aca685c.tar.gz</a><br>Resolving <a href=3D"http:/=
/sources.buildroot.net">sources.buildroot.net</a> (<a href=3D"http://source=
s.buildroot.net">sources.buildroot.net</a>)... 2606:4700:20::ac43:4838, 260=
6:4700:20::681a:125, 2606:4700:20::681a:25, ...<br>Connecting to <a href=3D=
"http://sources.buildroot.net">sources.buildroot.net</a> (<a href=3D"http:/=
/sources.buildroot.net">sources.buildroot.net</a>)|2606:4700:20::ac43:4838|=
:80... connected.<br>HTTP request sent, awaiting response... 404 Not Found<=
br>2023-11-23 11:49:35 ERROR 404: Not Found.<br><br>make[1]: *** [package/<=
a href=3D"http://pkg-generic.mk:146">pkg-generic.mk:146</a>: /home/fgdev/pr=
ojects/buildroot/output/build/linux-f593d9e1e347488358872bc8618180db7aca685=
c/.stamp_downloaded] Error 1<br>make: *** [Makefile:84: _all] Error 2<br></=
div></div>

--0000000000007002b0060ad6a7f9--

--===============7965908618948104423==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7965908618948104423==--
