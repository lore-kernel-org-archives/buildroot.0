Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97E52C02181
	for <buildroot@archiver.kernel.org>; Sun, 26 Jan 2025 10:23:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 04D8060855;
	Sun, 26 Jan 2025 10:23:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZbyD00teiilA; Sun, 26 Jan 2025 10:23:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E11786063C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E11786063C;
	Sun, 26 Jan 2025 10:23:24 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id D579E94A
 for <buildroot@buildroot.org>; Sun, 26 Jan 2025 10:23:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BF60C40207
 for <buildroot@buildroot.org>; Sun, 26 Jan 2025 10:23:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tbYvy0xD1z3J for <buildroot@buildroot.org>;
 Sun, 26 Jan 2025 10:23:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=vjardin@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 4C99E40132
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4C99E40132
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4C99E40132
 for <buildroot@buildroot.org>; Sun, 26 Jan 2025 10:23:21 +0000 (UTC)
Received: from [10.125.102.231] (unknown [78.243.227.35])
 (Authenticated sender: vjardin@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id 18A5319F5A7;
 Sun, 26 Jan 2025 11:23:12 +0100 (CET)
From: Vincent Jardin <vjardin@free.fr>
To: Brandon Maier <brandon.maier@gmail.com>, <buildroot@buildroot.org>,
 Julien Olivain <ju.o@free.fr>, <thomas.petazzoni@bootlin.com>
CC: Eric Le Bihan <eric.le.bihan.dev@free.fr>, Robin Jarry <robin@jarry.cc>
Date: Sun, 26 Jan 2025 11:23:12 +0100
Message-ID: <194a2230680.2856.ffe91ee9dc07baa0c1c4561a0e181c1b@free.fr>
In-Reply-To: <D6XYG4LBE2LC.38QNBW4XAS9FG@gmail.com>
References: <D67L0SLHFKBX.2N0314A43JOJC@gmail.com>
 <20250102164630.25695-1-vjardin@free.fr>
 <20250102164630.25695-3-vjardin@free.fr>
 <D6XYG4LBE2LC.38QNBW4XAS9FG@gmail.com>
User-Agent: AquaMail/1.54.1 (build: 105401536)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1737886999;
 bh=BZ76+SL3oGoi7GRowWjpTRcNX+dVZ2Dc7b99D05doEU=;
 h=From:To:CC:Date:In-Reply-To:References:Subject:From;
 b=AWqZqJ+Bt6bEY+Qq0bjjgpfndFMvyZ28W/mPhp4klYss+CJh62siXOYtVWXb49g17
 xo/hyvzr8fDPsvNWmkEeLHkHhkQ9orHn1RGDIvJMA9xcG9ciPy4j/KMGL4o1cbEJ81
 deDqMrGaR5LRVn4PZGT3mBGV792ERbV5CzRg3u352elEX/gqSWnmT2GXnsDgEyf9HM
 H63yZqpTdbGF3xwtKtZW+U7KGSbvub02G0au5iU6nRV1lPDJUussH1gTFOphbgOBk5
 o48nR/wvQrXEE4yhaPN2ssI2YCnuSZehBlLPR3Xsss6StBzPqolRf2zQPFn9uHqPO0
 +3JMx21Pzc5Kg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=AWqZqJ+B
Subject: Re: [Buildroot] [PATCH v6 2/2]
 doc/manual/adding-packages-meson.adoc: tags
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============2202562488982469023=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This is a multi-part message in MIME format.
--===============2202562488982469023==
Content-Type: multipart/alternative; boundary="194a223076431432856c20587"

This is a multi-part message in MIME format.
--194a223076431432856c20587
Content-Type: text/plain; format=flowed; charset="UTF-8"
Content-Transfer-Encoding: 8bit



Le 10 janvier 2025 01:09:24 "Brandon Maier" <brandon.maier@gmail.com> a écrit :

> On Thu Jan 2, 2025 at 10:46 AM CST, Vincent Jardin wrote:
>> Described the usage of FOO_MESON_INSTALL_TAGS=YES which decreases
>> the footprint of the target since only the runtime will be installed.
>> All the other development header files or libraries will be installed
>> into the staging folder.
>>
>> Signed-off-by: Vincent Jardin <vjardin@free.fr>
>> Suggested-by: Brandon Maier <brandon.maier@gmail.com>
>
> Reviewed-by: Brandon Maier <brandon.maier@gmail.com>

I understand that this serie is OK. Can it be merged ?
  https://patchwork.ozlabs.org/project/buildroot/list/?series=438648

Thank you,
  Vincent


>
>
>> ---
>> docs/manual/adding-packages-meson.adoc | 5 +++++
>> 1 file changed, 5 insertions(+)
>>
>> diff --git a/docs/manual/adding-packages-meson.adoc 
>> b/docs/manual/adding-packages-meson.adoc
>> index 01891e03cc..b7c987ddd1 100644
>> --- a/docs/manual/adding-packages-meson.adoc
>> +++ b/docs/manual/adding-packages-meson.adoc
>> @@ -124,6 +124,11 @@ will therefore only use a few of them.
>> +c_link_args+, +cpp_args+, +cpp_link_args+, +sys_root+, and
>> +pkg_config_libdir+.
>>
>> +* +FOO_MESON_INSTALL_TAGS+, can be set to +YES+ to enable meson's 
>> `--runtime` and
>> +  `--devel` installation modes for the target and staging folders, 
>> respectively.
>> +  This configuration is necessary to prevent meson from installing development
>> +  artifacts into the target folder.
>> +
>> * +FOO_NINJA_ENV+, to specify additional environment variables to pass to
>> +ninja+, meson companion tool in charge of the build operations. By default,
>> empty.


--194a223076431432856c20587
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.=
w3.org/TR/html4/loose.dtd">
<html>
<body>
<div dir=3D"auto">
<div dir=3D"auto"><br></div><div dir=3D"auto"><br></div>
<div id=3D"aqm-original" style=3D"color: black;">
<div dir=3D"auto">Le 10 janvier 2025 01:09:24 "Brandon Maier" &lt;brandon.m=
aier@gmail.com&gt; a =C3=A9crit :</div>
<div><br></div>
<blockquote type=3D"cite" class=3D"gmail_quote" style=3D"margin: 0 0 0 0.75=
ex; border-left: 1px solid #808080; padding-left: 0.75ex;">
<div dir=3D"auto">On Thu Jan 2, 2025 at 10:46 AM CST, Vincent Jardin wrote:=
</div>
<blockquote type=3D"cite" class=3D"gmail_quote" style=3D"margin: 0 0 0 0.75=
ex; border-left: 1px solid #0099CC; padding-left: 0.75ex;">
<div dir=3D"auto">Described the usage of FOO_MESON_INSTALL_TAGS=3DYES which=
 decreases</div>
<div dir=3D"auto">the footprint of the target since only the runtime will b=
e installed.</div>
<div dir=3D"auto">All the other development header files or libraries will =
be installed</div>
<div dir=3D"auto">into the staging folder.</div>
<div dir=3D"auto"><br></div>
<div dir=3D"auto">Signed-off-by: Vincent Jardin &lt;vjardin@free.fr&gt;</di=
v>
<div dir=3D"auto">Suggested-by: Brandon Maier &lt;brandon.maier@gmail.com&g=
t;</div>
</blockquote>
<div dir=3D"auto"><br></div>
<div dir=3D"auto">Reviewed-by: Brandon Maier &lt;brandon.maier@gmail.com&gt=
;</div></blockquote></div><div dir=3D"auto"><br></div><div dir=3D"auto">I u=
nderstand that this serie is OK. Can it be merged ?</div><div dir=3D"auto">=
  <a href=3D"https://patchwork.ozlabs.org/project/buildroot/list/?series=3D=
438648">https://patchwork.ozlabs.org/project/buildroot/list/?series=3D43864=
8</a></div><div dir=3D"auto"><br></div><div dir=3D"auto">Thank you,</div><d=
iv dir=3D"auto">&nbsp; Vincent&nbsp;</div><div dir=3D"auto"><br></div><div =
dir=3D"auto"><br></div><div id=3D"aqm-original" style=3D"color: black;" dir=
=3D"auto"><blockquote type=3D"cite" class=3D"gmail_quote" style=3D"margin: =
0 0 0 0.75ex; border-left: 1px solid #808080; padding-left: 0.75ex;"><div d=
ir=3D"auto"></div>
<div dir=3D"auto"><br></div>
<blockquote type=3D"cite" class=3D"gmail_quote" style=3D"margin: 0 0 0 0.75=
ex; border-left: 1px solid #0099CC; padding-left: 0.75ex;">
<div dir=3D"auto">---</div>
<div dir=3D"auto">docs/manual/adding-packages-meson.adoc | 5 +++++</div>
<div dir=3D"auto">1 file changed, 5 insertions(+)</div>
<div dir=3D"auto"><br></div>
<div dir=3D"auto">diff --git a/docs/manual/adding-packages-meson.adoc b/doc=
s/manual/adding-packages-meson.adoc</div>
<div dir=3D"auto">index 01891e03cc..b7c987ddd1 100644</div>
<div dir=3D"auto">--- a/docs/manual/adding-packages-meson.adoc</div>
<div dir=3D"auto">+++ b/docs/manual/adding-packages-meson.adoc</div>
<div dir=3D"auto">@@ -124,6 +124,11 @@ will therefore only use a few of the=
m.</div>
<div dir=3D"auto">+c_link_args+, +cpp_args+, +cpp_link_args+, +sys_root+, a=
nd</div>
<div dir=3D"auto">+pkg_config_libdir+.</div>
<div dir=3D"auto"><br></div>
<div dir=3D"auto">+* +FOO_MESON_INSTALL_TAGS+, can be set to +YES+ to enabl=
e meson's `--runtime` and</div>
<div dir=3D"auto">+ &nbsp;`--devel` installation modes for the target and s=
taging folders, respectively.</div>
<div dir=3D"auto">+ &nbsp;This configuration is necessary to prevent meson =
from installing development</div>
<div dir=3D"auto">+ &nbsp;artifacts into the target folder.</div>
<div dir=3D"auto">+</div>
<div dir=3D"auto">* +FOO_NINJA_ENV+, to specify additional environment vari=
ables to pass to</div>
<div dir=3D"auto">+ninja+, meson companion tool in charge of the build oper=
ations. By default,</div>
<div dir=3D"auto">empty.</div>
</blockquote>
</blockquote>
</div><div dir=3D"auto"><br></div>
</div></body>
</html>

--194a223076431432856c20587--


--===============2202562488982469023==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2202562488982469023==--

