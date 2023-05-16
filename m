Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6643C77B75
	for <buildroot@archiver.kernel.org>; Tue, 16 May 2023 18:44:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 79F9940BAF;
	Tue, 16 May 2023 18:44:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 79F9940BAF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bMa0t7MYamr3; Tue, 16 May 2023 18:44:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id AE693408DD;
	Tue, 16 May 2023 18:44:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AE693408DD
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C1C601BF295
 for <buildroot@lists.busybox.net>; Tue, 16 May 2023 18:44:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9785783F5E
 for <buildroot@lists.busybox.net>; Tue, 16 May 2023 18:44:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9785783F5E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VDA_JVl1fk-H for <buildroot@lists.busybox.net>;
 Tue, 16 May 2023 18:44:36 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 87B5783F41
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com
 [IPv6:2607:f8b0:4864:20::102e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 87B5783F41
 for <buildroot@busybox.net>; Tue, 16 May 2023 18:44:36 +0000 (UTC)
Received: by mail-pj1-x102e.google.com with SMTP id
 98e67ed59e1d1-24e2bbec3d5so10422926a91.3
 for <buildroot@busybox.net>; Tue, 16 May 2023 11:44:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684262676; x=1686854676;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=SZKcc8gmB0RmhZYEEwcJGilr09DXdT/Wy2poQ3TB1i8=;
 b=VUv9y0L7/1z4oCENJjYkN6Ds3B57tbZRJTXCnGhlQ6PeGY9nP5t4wwPhzInBouMifC
 5cIIjF2V3Fsk6H6m+67C8JtEe55J91RMqZw31nU3X+g22jyRmVKHYlFdvKaKZIN2/9OE
 3q2XJ/zxMElFY9pPaCXYAz3/PYnw8QB8CrP4wThyJsOUW5mjYkd1WnkdwRAEUDGTqDIX
 nEULdosA+N3x6zAgdmF3oU1fa1rOqHJ6OZerjI8imQPJcsdi8DTZHyqF1Ocv8nEgEx3P
 FNrICwpJi0VsWfgczyTLC/8WakKZg/RE7MjZJapX9qrTGqjjD1GjXNqsJ8hdaW06E/7N
 e0oA==
X-Gm-Message-State: AC+VfDwcxE9NTlq7NN9NV71ZmlF0elL/h5mqoq61lqzlHaxVfA5kaIUJ
 /F2jMi/QRR/eviqaKfi7ch8aAerLD1b6Sr8comJUYlaSZMw71nUE/sI=
X-Google-Smtp-Source: ACHHUZ62dbUPPGzv1dpFvHjlW5y0Bw4RXxv2GShsCzRvsVQ2wszTcFPcvtJzI0V7X8kNu4DUPDwnmrVlnDAb2oJe6ps=
X-Received: by 2002:a17:90a:7801:b0:24e:16aa:48 with SMTP id
 w1-20020a17090a780100b0024e16aa0048mr37560857pjk.15.1684262675827; Tue, 16
 May 2023 11:44:35 -0700 (PDT)
MIME-Version: 1.0
References: <20230429200133.152499-1-francois.perrad@gadz.org>
 <87wn1sik1p.fsf@dell.be.48ers.dk>
In-Reply-To: <87wn1sik1p.fsf@dell.be.48ers.dk>
From: =?UTF-8?Q?Fran=C3=A7ois_Perrad?= <francois.perrad@gadz.org>
Date: Tue, 16 May 2023 20:44:24 +0200
Message-ID: <CAAE6iEVDu0uRt4OncRAs-LdgwO=oVu89h0bboxEHR=enP=eQjg@mail.gmail.com>
To: Peter Korsgaard <peter@korsgaard.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gadz.org; s=google; t=1684262676; x=1686854676;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=SZKcc8gmB0RmhZYEEwcJGilr09DXdT/Wy2poQ3TB1i8=;
 b=L/7pXMqm77MyLJlvGtzT9ReWGWosojRyGEEGqevkkAd4zcmyAAsKzqXWwQM4NVETQn
 lyauUZ0sBlRWjUelGzUOAE8DYgOzwZJ9ZB9zZLTgpk+nFwKEDYRlAPrrJobqbr/U7HSG
 5ugFDokF3LGyTwdhUWrXx3MRnleHJguS4mdoxtDzY+LDwkoMXUr0ZmtASRHbJ4lqOB3u
 5tD89jnbzZkW63mYdGc30B35S9Zj+hEFBS4fTo44FTqgG7cV676fDJXOoENfI9PEx2gF
 dTOFKROkAQsUL0HBcdx5mvIkyDIoV8L/4lRCppVY3kyRkfZ1cDDRjD37XTqomMfkvQsv
 dL7Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gadz.org header.i=@gadz.org
 header.a=rsa-sha256 header.s=google header.b=L/7pXMqm
Subject: Re: [Buildroot] [PATCH] package/lua: bump to version 5.4.5
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
Cc: buildroot@busybox.net
Content-Type: multipart/mixed; boundary="===============1072595585879291655=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1072595585879291655==
Content-Type: multipart/alternative; boundary="000000000000806aa605fbd3f6bd"

--000000000000806aa605fbd3f6bd
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le lun. 1 mai 2023 =C3=A0 09:32, Peter Korsgaard <peter@korsgaard.com> a =
=C3=A9crit :

> >>>>> "Francois" =3D=3D Francois Perrad <fperrad@gmail.com> writes:
>
>  > Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
>
> Committed, thanks.
>
>
Lua 5.4.5 was a failure. And it was retracted, see
http://lua-users.org/lists/lua-l/2023-05/msg00014.html

Please upgrade with Lua 5.4.6, see
https://patchwork.ozlabs.org/project/buildroot/patch/20230514144512.9794-1-=
francois.perrad@gadz.org/

Fran=C3=A7ois

--=20
> Bye, Peter Korsgaard
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
>

--000000000000806aa605fbd3f6bd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0lun. 1 mai 2023 =C3=A0=C2=A00=
9:32, Peter Korsgaard &lt;<a href=3D"mailto:peter@korsgaard.com">peter@kors=
gaard.com</a>&gt; a =C3=A9crit=C2=A0:<br></div><blockquote class=3D"gmail_q=
uote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,2=
04);padding-left:1ex">&gt;&gt;&gt;&gt;&gt; &quot;Francois&quot; =3D=3D Fran=
cois Perrad &lt;<a href=3D"mailto:fperrad@gmail.com" target=3D"_blank">fper=
rad@gmail.com</a>&gt; writes:<br>
<br>
=C2=A0&gt; Signed-off-by: Francois Perrad &lt;<a href=3D"mailto:francois.pe=
rrad@gadz.org" target=3D"_blank">francois.perrad@gadz.org</a>&gt;<br>
<br>
Committed, thanks.<br>
<br></blockquote><div><br></div><div>Lua 5.4.5 was a failure. And it was re=
tracted, see <a href=3D"http://lua-users.org/lists/lua-l/2023-05/msg00014.h=
tml">http://lua-users.org/lists/lua-l/2023-05/msg00014.html</a></div><div><=
br></div><div>Please upgrade with Lua 5.4.6, see <a href=3D"https://patchwo=
rk.ozlabs.org/project/buildroot/patch/20230514144512.9794-1-francois.perrad=
@gadz.org/">https://patchwork.ozlabs.org/project/buildroot/patch/2023051414=
4512.9794-1-francois.perrad@gadz.org/</a></div><div><br></div><div>Fran=C3=
=A7ois<br></div><div><br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">
-- <br>
Bye, Peter Korsgaard<br>
_______________________________________________<br>
buildroot mailing list<br>
<a href=3D"mailto:buildroot@buildroot.org" target=3D"_blank">buildroot@buil=
droot.org</a><br>
<a href=3D"https://lists.buildroot.org/mailman/listinfo/buildroot" rel=3D"n=
oreferrer" target=3D"_blank">https://lists.buildroot.org/mailman/listinfo/b=
uildroot</a><br>
</blockquote></div></div>

--000000000000806aa605fbd3f6bd--

--===============1072595585879291655==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1072595585879291655==--
