Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80DF5C433F5
	for <buildroot@archiver.kernel.org>; Thu,  3 Mar 2022 06:13:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DADB584123;
	Thu,  3 Mar 2022 06:13:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9lbTktRsam10; Thu,  3 Mar 2022 06:13:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 030548411B;
	Thu,  3 Mar 2022 06:13:06 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 981BD1BF8A8
 for <buildroot@lists.busybox.net>; Thu,  3 Mar 2022 06:13:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8320A8410A
 for <buildroot@lists.busybox.net>; Thu,  3 Mar 2022 06:13:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MslrfqjgX4Hx for <buildroot@lists.busybox.net>;
 Thu,  3 Mar 2022 06:13:04 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com
 [209.85.208.179])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2F37084109
 for <buildroot@buildroot.org>; Thu,  3 Mar 2022 06:13:03 +0000 (UTC)
Received: by mail-lj1-f179.google.com with SMTP id t14so5371944ljh.8
 for <buildroot@buildroot.org>; Wed, 02 Mar 2022 22:13:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yXgTffA2vUQ19D1fIvUFeUhgEO5FrRwT/0LaA6wG8tI=;
 b=mGuEyqopLtDSeoo7pLVPD4aIsEPPAUxZVo9A7vUMz9+DPEeJWjK9DIisWBmNjrVae5
 xJll97xkQD651snBnZbdh1YEIuhKeeSyD6sqAB6Y+jzsCEed1WqXDkrYzaCVbm8V1a+s
 AaQf0BHXiptmLbJSDVa1aYxu3Apl8N9aivzcpXoEn9ITdhg4SILuvikkiYZMK59Od1R5
 EYtje8RRWcjDdozhiKSkQQrWRvI+lEL+gAf0f0Y38KxBTfoaFUTdpeUKTJgz9TZvEd+G
 AmrS5Y+CkG3FGSKXpLAfIspOfjCRJok9k0F16rjjho6OtcGk770xhJn4SurX7vGYveNX
 saBg==
X-Gm-Message-State: AOAM533LRSgZasdrBbPf9Amt3JTeTl3wd4tsZzmKvBLIIHmwakqKGT4X
 BxSnLPhK9IG+lof7ZxaJ84FBXBeYkV8Yl+RqsKkMz1etTx3sDA==
X-Google-Smtp-Source: ABdhPJwp+uqoW/l1bp7HICJrigubjLhnfLTc24Sk6GSHKR+K9IAX4DH7+fiYUhydn0yXuWctkl8gcsLoyUn7EhprFQ4=
X-Received: by 2002:a05:651c:49d:b0:244:ca08:f811 with SMTP id
 s29-20020a05651c049d00b00244ca08f811mr22395676ljc.379.1646287982089; Wed, 02
 Mar 2022 22:13:02 -0800 (PST)
MIME-Version: 1.0
References: <87pmn6y8hv.fsf@dell.be.48ers.dk>
In-Reply-To: <87pmn6y8hv.fsf@dell.be.48ers.dk>
From: =?UTF-8?Q?Fran=C3=A7ois_Perrad?= <francois.perrad@gadz.org>
Date: Thu, 3 Mar 2022 07:12:50 +0100
Message-ID: <CAB0FRsseLgz+bpirX0XScARnNhxox-36V5a0O9fm8QMK1o2t_A@mail.gmail.com>
To: Peter Korsgaard <peter@korsgaard.com>
Subject: Re: [Buildroot] Buildroot 2022.02-rc3 released
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
Cc: buildroot <buildroot@buildroot.org>
Content-Type: multipart/mixed; boundary="===============0869719523152169869=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0869719523152169869==
Content-Type: multipart/alternative; boundary="0000000000005eec6f05d94a4ab5"

--0000000000005eec6f05d94a4ab5
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le lun. 28 f=C3=A9vr. 2022 =C3=A0 22:41, Peter Korsgaard <peter@korsgaard.c=
om> a
=C3=A9crit :

> Hi,
>
> Buildroot 2022.02-rc3 is released - Go download it at:
>
> http://buildroot.net/downloads/buildroot-2022.02-rc3.tar.gz
>
> or
>
> http://buildroot.net/downloads/buildroot-2022.02-rc3.tar.xz
>
>
These 2 links are broken.

Fran=C3=A7ois

$ wget http://buildroot.net/downloads/buildroot-2022.02-rc3.tar.gz
--2022-03-03 07:11:19--
http://buildroot.net/downloads/buildroot-2022.02-rc3.tar.gz
Resolving buildroot.net (buildroot.net)... 140.211.167.122
Connecting to buildroot.net (buildroot.net)|140.211.167.122|:80...
connected.
HTTP request sent, awaiting response... 404 Not Found
2022-03-03 07:11:19 ERROR 404: Not Found.



> Or get it from Git:
>
> git://git.buildroot.net/buildroot
>
> Another week, another release candidate.
>
>
>

--0000000000005eec6f05d94a4ab5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0lun. 28 f=C3=A9vr. 2022 =C3=
=A0=C2=A022:41, Peter Korsgaard &lt;<a href=3D"mailto:peter@korsgaard.com">=
peter@korsgaard.com</a>&gt; a =C3=A9crit=C2=A0:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">Hi,<br>
<br>
Buildroot 2022.02-rc3 is released - Go download it at:<br>
<br>
<a href=3D"http://buildroot.net/downloads/buildroot-2022.02-rc3.tar.gz" rel=
=3D"noreferrer" target=3D"_blank">http://buildroot.net/downloads/buildroot-=
2022.02-rc3.tar.gz</a><br>
<br>
or<br>
<br>
<a href=3D"http://buildroot.net/downloads/buildroot-2022.02-rc3.tar.xz" rel=
=3D"noreferrer" target=3D"_blank">http://buildroot.net/downloads/buildroot-=
2022.02-rc3.tar.xz</a><br>
<br></blockquote><div><br></div><div>These 2 links are broken.</div><div><b=
r></div><div>Fran=C3=A7ois <br></div><div><br></div><div>$ wget <a href=3D"=
http://buildroot.net/downloads/buildroot-2022.02-rc3.tar.gz">http://buildro=
ot.net/downloads/buildroot-2022.02-rc3.tar.gz</a><br>--2022-03-03 07:11:19-=
- =C2=A0<a href=3D"http://buildroot.net/downloads/buildroot-2022.02-rc3.tar=
.gz">http://buildroot.net/downloads/buildroot-2022.02-rc3.tar.gz</a><br>Res=
olving <a href=3D"http://buildroot.net">buildroot.net</a> (<a href=3D"http:=
//buildroot.net">buildroot.net</a>)... 140.211.167.122<br>Connecting to <a =
href=3D"http://buildroot.net">buildroot.net</a> (<a href=3D"http://buildroo=
t.net">buildroot.net</a>)|140.211.167.122|:80... connected.<br>HTTP request=
 sent, awaiting response... 404 Not Found<br>2022-03-03 07:11:19 ERROR 404:=
 Not Found.<br></div><div><br></div><div>=C2=A0</div><blockquote class=3D"g=
mail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204=
,204,204);padding-left:1ex">
Or get it from Git:<br>
<br>
git://<a href=3D"http://git.buildroot.net/buildroot" rel=3D"noreferrer" tar=
get=3D"_blank">git.buildroot.net/buildroot</a><br>
<br>
Another week, another release candidate.<br>
<br><br>
</blockquote></div></div>

--0000000000005eec6f05d94a4ab5--

--===============0869719523152169869==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0869719523152169869==--
