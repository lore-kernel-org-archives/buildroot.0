Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 425FCE77199
	for <buildroot@archiver.kernel.org>; Sun,  5 Jan 2025 11:31:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E12FF80EC2;
	Sun,  5 Jan 2025 11:31:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6z2X4asSfrzG; Sun,  5 Jan 2025 11:31:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0844180EC7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0844180EC7;
	Sun,  5 Jan 2025 11:31:38 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 5C881D92
 for <buildroot@buildroot.org>; Sun,  5 Jan 2025 11:31:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 39FDA400AF
 for <buildroot@buildroot.org>; Sun,  5 Jan 2025 11:31:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id e5dIdqDV2xBQ for <buildroot@buildroot.org>;
 Sun,  5 Jan 2025 11:31:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.18;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 9D67D40181
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9D67D40181
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9D67D40181
 for <buildroot@buildroot.org>; Sun,  5 Jan 2025 11:31:34 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.24] ([84.249.220.44]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M6Db0-1tNoD24AGm-00BhkF; Sun, 05
 Jan 2025 12:31:29 +0100
Message-ID: <be707020-b53c-42f1-9ef0-4d45762bc40e@gmx.de>
Date: Sun, 5 Jan 2025 13:31:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Nikita Kiryushin <kiryushin@ancud.ru>
Cc: buildroot@buildroot.org
References: <20241121140134.3476-1-kiryushin@ancud.ru>
 <20250103234012.2bc31c96@windsurf>
 <d2e86197-9f6c-44c5-81f1-457d081144d1@gmx.de>
Content-Language: en-US, de-DE-1901, de-DE
Autocrypt: addr=fiona.klute@gmx.de; keydata=
 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
In-Reply-To: <d2e86197-9f6c-44c5-81f1-457d081144d1@gmx.de>
X-Provags-ID: V03:K1:abf05Q+y9o5L/AqKmo8asSGcPzY/k1K3nZ4LALNBGCJTYL8kpgu
 wwb62xqj+CqBc0Psg98tNPynJWb4J8fBgnEcIY2rIiCCO+DHee1Lo98ARvmgyF2nDaKe4wR
 aSrRXyIyFkxmex7Iyt/RzmySklsVfjC7+Mi4d68tw6lysnHWFBsDTPuCQz/96PT9AA/FPvu
 x8xUsfWzNjwcZdUcn7T1w==
UI-OutboundReport: notjunk:1;M01:P0:IS3FGQE8Zb8=;sVU1V2LQrK3V+0z/eOWZAoRqqL/
 i/SZikm6VWm2ttNDlPELs2rDSHbwoMy/79Tc2NOakgKh6VF0d/PVaR+3cwdTJVtcHAb3eVhqX
 6yglNvjOV5HJt+f5txxxCKKN8l9XCrWIPLtyrzZugsj7Gco3rIhwhBJ2DxyXwk2GyoUBpaKY7
 JbguvNQyAw39prVc3qCNDDExChEC0HxeBMZPZZhzmTa+lGkzKUVVNvgL2fL1S4PTjz0v/oELU
 yDdaMM/2WFvCw87krC52MIXQDqH8cCjbQK4T/euNlOzEAWL8nzJudHWdysUym1hoqfuY2DBn+
 usBUZoQQvOb3fohxnVqlSg+LkutLc68+siFQgQRBXPpnwjSdQdoIjRS4YUisVPPMxe130oP6u
 fj99OQ/r56g4Uj1XBBiGAuWvmm9FaXZSWhZh19ZFh1qa0ueG9GETqr7k8nKjJjW5MZ0r0Np4K
 hk/ZRk11sjGqxXN5dlUMdMag1LrYRZpSVjiTEGGG8x0yNMj/kBPUriZTc495s6/EgI/zgMVLI
 JdinKbj6Qzi+aE+StotWMD3cOfmXnsFkWxG4hp0wgKRhNlw/FEqUwet3t4RO4t1cvvGt+2Nm9
 Bf/0uoTyVK1bMuWYEZHGUdgdU95lE/wS9brAlq4aY2IPa8f+/2xjFYk6DQlJJHU75mAi/UiUX
 t0WgrzlggQgEWG11/4gvbuS2B0/t0JnA6JrHlnuJAud54AUvJmzLEHkQMRNZ5+eJntsaBJibT
 paouf6Hmy5mXRNYPNR2PIUmAvahFdSuNplaJbaHgdmBqo4Ynjq+dG2Oq6Gb21sPQsaghUR1xd
 dy2M9fnoWrE7AnHo35N/2YTNzCyXV+wcJFpO0CwIUdNNo+9CY1MXRn7w+LJ3ycaHnBD+fx55I
 QGzcCJSWCMdM6E3DgCzikNhya0hd3aHwGrfE8oTrOhdU72HBJS8Qy1ECGNZdP4Q+Qgue7BJOS
 1icaVXlfv+dmR77zjfZXC4eiYoIq0cpR1iqBmifYHHsRGIYm5dEGvMwFFFPtZ+Wb1tSALfur2
 V+Ju7bA47oJTpFdyNQtNHlm97tErEtmwy5tXOrnfrHR2F3VrITwBXUwPjvBvxrgoSWCvIIJmt
 6CKiBTEU8hyvVcGSSzl2uDDqyAvG/s
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1736076689; x=1736681489; i=fiona.klute@gmx.de;
 bh=qys9mZ6f+XmAHNU1t8Hh0EdB7zxzOGZWOx3wDb4mXs4=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:From:To:
 Cc:References:In-Reply-To:Content-Type:Content-Transfer-Encoding:
 cc:content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=pQOp1jxxB16rq+TLZFIfYlDnLsL+TbITo4RyVwyab6uhp0xKzg892LZRzaAUtitw
 tpkKk/pZebgOK0h2cQbERKtY4d4/MoVi0r5mU56Ao08uriOJs3+vDvUNw5GB8eN0h
 WuUr/HnptXnQi86kvMIirHn3NdLv4Ph1XfB81E2XtVb+Llv6Gp6s3iG4By0iAV+e+
 Jm9RgkmGZ2ereYmCEiujvCtkKvHcLxlZSRWqEteKnK/uNdR2SQRWLY0SeXgtTKoul
 e/muDxsimiqgT/hQPx9c0pCvdWE/mtncIYHKYItoOlOvkYzNEcBz/vB03CRqAjh+o
 4VLqoSJ52+4LJmnZVA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.de header.i=fiona.klute@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=pQOp1jxx
Subject: Re: [Buildroot] [PATCH 1/1] package/dbus: set session-socket-dir to
 /tmp
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Am 05.01.25 um 13:29 schrieb Fiona Klute:
> Am 04.01.25 um 00:40 schrieb Thomas Petazzoni:
>> Hello Nikita,
>>
>> +Fiona in Cc.
>>
>> On Thu, 21 Nov 2024 17:01:34 +0300
>> Nikita Kiryushin <kiryushin@ancud.ru> wrote:
>>
>>> dbus has a session socket directory configuration setting,
>>> that, if not set, will be autodeducted based on env vars
>>> during configuration time.
>>>
>>> Becuse of that, builder's environment variables may be used,
>>> which will lead to an image with a broken session bus while
>>> leaking builder's details to the image.
>>>
>>> Add an explicit setting of session-socket-dir to /tmp dir.
>>>
>>> Signed-off-by: Nikita Kiryushin <kiryushin@ancud.ru>
>>
>> This looks reasonable to me. It also fixes
>> https://gitlab.com/buildroot.org/buildroot/-/issues/67 where a
>> few more details are given.
>>
>> Fiona, could you review this patch, and give your opinion? It would be
>> much appreciated!
>
> Looks reasonable to me, all it does is set the default (see
> DEFAULT_SOCKET_DIR in dbus' configure.ac) explicitly so it won't be
> overwritten by environment variables of the build system. Allowing
> override from environment in the first place seems like an odd choice to
> me, but that's an upstream decision, maybe it's convenient during
> development.

Sorry about the extra mail, forgot to add:

Reviewed-by: Fiona Klute <fiona.klute@gmx.de>

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
