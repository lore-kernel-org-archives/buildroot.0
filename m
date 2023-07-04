Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 304E3EB64DA
	for <buildroot@archiver.kernel.org>; Tue,  4 Jul 2023 20:30:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9BCC4408FD;
	Tue,  4 Jul 2023 20:30:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9BCC4408FD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id c-dnHfvNrExy; Tue,  4 Jul 2023 20:30:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 19E4D40929;
	Tue,  4 Jul 2023 20:30:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 19E4D40929
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 701721BF42E
 for <buildroot@lists.busybox.net>; Tue,  4 Jul 2023 20:30:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 549BF40929
 for <buildroot@lists.busybox.net>; Tue,  4 Jul 2023 20:30:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 549BF40929
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lyBiX6wxUkCE for <buildroot@lists.busybox.net>;
 Tue,  4 Jul 2023 20:30:49 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A6B7F408FD
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [IPv6:2a00:1450:4864:20::236])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A6B7F408FD
 for <buildroot@buildroot.org>; Tue,  4 Jul 2023 20:30:48 +0000 (UTC)
Received: by mail-lj1-x236.google.com with SMTP id
 38308e7fff4ca-2b69dcf45faso98226671fa.0
 for <buildroot@buildroot.org>; Tue, 04 Jul 2023 13:30:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688502646; x=1691094646;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=m3O3TKmAbcJEndqKJrb4QGtUGN6wCZ9gy4GOV09HmmE=;
 b=kRjMzj59Sygl9JNxQ/tSNwefKp4deTRNrUfEW1/esszL0bZ5BObqVMzZymE1djKftT
 0l6HwnqB7iaTPXOic47uj2yB/OFy/ppfBim3TX4gpkrKfrAal9KNfZJfPrnVvw/Abv4c
 H4Y8brRUnGKY2xPZ9PjGwwjtccVEwsYPtbqqSlvFZxG5IM7BIdQTXf/ZIXFfRvboqcs6
 e7KRBg+0VRjpXP+jniGh/N9qty1j8s5JsrYvAmOZeV/3VY/NJjxu+aR/RfChUX2NZuyb
 cZXM0litEujLhfYSKWQuJGlJVug6/qDhfQSgm0UNw+/gLZPrFh4j/bzd7VPyRShrJbvn
 qoMw==
X-Gm-Message-State: ABy/qLadSkQ0yVi2pauUtE+orWsmASCHkKUrMK/wQ2dYmEWozPe37bFH
 o/hNcmMtijb2pNPU9FNetl+DEzbc70gXp2P+M/L+rA==
X-Google-Smtp-Source: APBJJlER5X8mxR5goIGkcHA4PLr9kGZN9fY8o88JYEjowCMlhOuAqGpHJhqQ6FCS3L9n3cU0hs81gvr0OcAoe2V57Hw=
X-Received: by 2002:ac2:5e69:0:b0:4f8:66e1:14e3 with SMTP id
 a9-20020ac25e69000000b004f866e114e3mr8983510lfr.17.1688502646214; Tue, 04 Jul
 2023 13:30:46 -0700 (PDT)
MIME-Version: 1.0
References: <20230608085015.1075425-1-sebastian.weyer@smile.fr>
 <20230703224149.51f6ac85@windsurf>
 <CADSVbUsPFy5-CZ22BUU_dYAGc-=ycpJYAKSmdj7nYm96Nn5PBQ@mail.gmail.com>
 <20230704153345.153f73ac@windsurf>
 <CADSVbUvonajc2AXV8pZq9_8zxADf0zcW95p-ygSvwqMJSWu-yA@mail.gmail.com>
In-Reply-To: <CADSVbUvonajc2AXV8pZq9_8zxADf0zcW95p-ygSvwqMJSWu-yA@mail.gmail.com>
From: Sebastian WEYER <sebastian.weyer@smile.fr>
Date: Tue, 4 Jul 2023 22:30:34 +0200
Message-ID: <CADSVbUvdMDg2t4ydUmF0eunnert+cCvK7wrSiW4=bUdQ8u=urA@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20221208.gappssmtp.com; s=20221208; t=1688502646; x=1691094646;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=m3O3TKmAbcJEndqKJrb4QGtUGN6wCZ9gy4GOV09HmmE=;
 b=lxk6kxTT20wycBZGM/utrN2BtaJaa8fkH6KwL0aKuzmTiGVXJ41k4Dd7J+KEkNpUg+
 HGSUHKkDCtp+L6xJicaH6mFXwz6kazJUqQbkNqhR4k8aokthjRvvZGlWTnASKbgsHhvS
 ykakjXscjW5SzK4wxKGgrLIdPXkn6rcoKXrlouz5rvWGxtmfCYNNK95RnMM2IpDswydC
 21n4J7h0IzlusFuusZ3PIH5pFfU0FUJPTJVVlL+C5nuaO7iQtuWiEz+iPxF1w0un5zg6
 ZrdyHXzoOT/CYmnYmfv6e1gxVth3XFTBYsiKLRGlxGLZ7aewa8YTjF+vKWL/RJQBEWlB
 9fAg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20221208.gappssmtp.com
 header.i=@smile-fr.20221208.gappssmtp.com header.a=rsa-sha256
 header.s=20221208 header.b=lxk6kxTT
Subject: Re: [Buildroot] [PATCH 1/1] package/rust-bindgen: new host package
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
Cc: Romain Naour <romain.naour@smile.fr>, buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============3913325038917671906=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3913325038917671906==
Content-Type: multipart/alternative; boundary="0000000000006e284205ffaf2800"

--0000000000006e284205ffaf2800
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello again,

After this discussion I did some more digging again and it seems there has
been quite a lot of work done on the rust-for-linux project since the last
time I had a look into it.
On their development branch, they already updated the bindgen version to
0.65.1:
https://github.com/Rust-for-Linux/linux/commit/53dd54f5ff9930e410db3c1c0419=
adbc1c3fa00c
This would suggest to me that they'll soon try to integrate it into the
next merge window along with the update to rustc v1.70.0.
Therefore I think it should be fine to add the package in this version.

Best regards,
Sebastian

On Tue, Jul 4, 2023 at 4:24=E2=80=AFPM Sebastian WEYER <sebastian.weyer@smi=
le.fr>
wrote:

> Hello Thomas,
>
> Yes, the kernel only supports bindgen in version 0.56.0 (released in
> November 2020!).
> Since the support for Rust in the kernel for now is only very rudimentary
> and this is not the only difficulty (lack of minimum version of rustc for
> example and lack of architecture support) I think for now it is not that
> big of a deal.
>
> Best regards,
> Sebastian
>
>
> On Tue, Jul 4, 2023 at 3:33=E2=80=AFPM Thomas Petazzoni <
> thomas.petazzoni@bootlin.com> wrote:
>
>> Hello Sebastian,
>>
>> On Tue, 4 Jul 2023 12:50:16 +0200
>> Sebastian WEYER <sebastian.weyer@smile.fr> wrote:
>>
>> > Thank you for your feedback.
>> > It was an oversight to leave the comment as is, as initially the packa=
ge
>> > was added with a version <0.63.0.
>> > Do you think a comment explaining the command line options being
>> deprecated
>> > should stay? Also considering that the Kernel still uses these options
>> for
>> > its Rust modules.
>>
>> Ah, so the proposed version of rust-bindgen would not work to support
>> the in-kernel Rust support? This is a bit unfortunate.
>>
>> Regarding the comment, I'm not sure they make sense. If we start
>> documenting all what's no longer supported by a given package,
>> Buildroot would be full of comments related to obsolete features :-)
>>
>> Thomas
>> --
>> Thomas Petazzoni, co-owner and CEO, Bootlin
>> Embedded Linux and Kernel engineering and training
>> https://bootlin.com
>>
>
>
> --
> [image: eco] Pour la plan=C3=A8te, n'imprimez ce mail que si c'est n=C3=
=A9cessaire
> [image: SMILE] <http://www.smile.eu/>
>
> 10-12 Rue Nicolas Appert
> 44100 NANTES
> *Sebastian WEYER*
> Stagiaire production
>
> [image: email] sebastian.weyer@smile.fr
> [image: url] http://www.smile.eu
>
> [image: Twitter] <https://twitter.com/GroupeSmile> [image: LinkedIn]
> <https://www.linkedin.com/company/smile> [image: Github]
> <https://github.com/Smile-SA>
>


--=20
[image: eco] Pour la plan=C3=A8te, n'imprimez ce mail que si c'est n=C3=A9c=
essaire
[image: SMILE] <http://www.smile.eu/>

10-12 Rue Nicolas Appert
44100 NANTES
*Sebastian WEYER*
Stagiaire production

[image: email] sebastian.weyer@smile.fr
[image: url] http://www.smile.eu

[image: Twitter] <https://twitter.com/GroupeSmile> [image: LinkedIn]
<https://www.linkedin.com/company/smile> [image: Github]
<https://github.com/Smile-SA>

--0000000000006e284205ffaf2800
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello again,<div><br></div><div>After this discussion I di=
d some more digging again and it seems there has been quite a lot of work d=
one on the rust-for-linux project since the last time I had a look into it.=
</div><div>On their development branch, they already updated the bindgen ve=
rsion to 0.65.1:=C2=A0<a href=3D"https://github.com/Rust-for-Linux/linux/co=
mmit/53dd54f5ff9930e410db3c1c0419adbc1c3fa00c">https://github.com/Rust-for-=
Linux/linux/commit/53dd54f5ff9930e410db3c1c0419adbc1c3fa00c</a><br>This wou=
ld suggest to me that they&#39;ll soon try to integrate it into the next me=
rge window along with the update to rustc v1.70.0.</div><div>Therefore I th=
ink it should be fine to add the package in this version.</div><div><br></d=
iv><div>Best regards,</div><div>Sebastian</div></div><br><div class=3D"gmai=
l_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Jul 4, 2023 at 4:24=
=E2=80=AFPM Sebastian WEYER &lt;<a href=3D"mailto:sebastian.weyer@smile.fr"=
>sebastian.weyer@smile.fr</a>&gt; wrote:<br></div><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,20=
4,204);padding-left:1ex"><div dir=3D"ltr">Hello Thomas,<div><br></div><div>=
Yes, the kernel only supports bindgen in version 0.56.0 (released in Novemb=
er 2020!).=C2=A0</div><div>Since the support for Rust in the kernel for now=
 is only very rudimentary and this is not the only difficulty (lack of mini=
mum version of rustc for example and lack of architecture support) I think =
for now it is not that big of a deal.</div><div><br></div><div>Best regards=
,</div><div>Sebastian</div><div><br></div></div><br><div class=3D"gmail_quo=
te"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Jul 4, 2023 at 3:33=E2=80=
=AFPM Thomas Petazzoni &lt;<a href=3D"mailto:thomas.petazzoni@bootlin.com" =
target=3D"_blank">thomas.petazzoni@bootlin.com</a>&gt; wrote:<br></div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left=
:1px solid rgb(204,204,204);padding-left:1ex">Hello Sebastian,<br>
<br>
On Tue, 4 Jul 2023 12:50:16 +0200<br>
Sebastian WEYER &lt;<a href=3D"mailto:sebastian.weyer@smile.fr" target=3D"_=
blank">sebastian.weyer@smile.fr</a>&gt; wrote:<br>
<br>
&gt; Thank you for your feedback.<br>
&gt; It was an oversight to leave the comment as is, as initially the packa=
ge<br>
&gt; was added with a version &lt;0.63.0.<br>
&gt; Do you think a comment explaining the command line options being depre=
cated<br>
&gt; should stay? Also considering that the Kernel still uses these options=
 for<br>
&gt; its Rust modules.<br>
<br>
Ah, so the proposed version of rust-bindgen would not work to support<br>
the in-kernel Rust support? This is a bit unfortunate.<br>
<br>
Regarding the comment, I&#39;m not sure they make sense. If we start<br>
documenting all what&#39;s no longer supported by a given package,<br>
Buildroot would be full of comments related to obsolete features :-)<br>
<br>
Thomas<br>
-- <br>
Thomas Petazzoni, co-owner and CEO, Bootlin<br>
Embedded Linux and Kernel engineering and training<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer" target=3D"_blank">https:=
//bootlin.com</a><br>
</blockquote></div><br clear=3D"all"><div><br></div><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><d=
iv dir=3D"ltr">
    <img src=3D"http://ftp.smile.fr/client/Communication/signature/img/eco.=
png" alt=3D"eco" width=3D"13" height=3D"11">
            Pour la plan=C3=A8te, n&#39;imprimez ce mail que si c&#39;est n=
=C3=A9cessaire
    <table style=3D"padding:20px" border=3D"0"><tbody><tr><td style=3D"font=
-size:13px;color:rgb(255,128,84);text-align:center;padding-right:30px"><a h=
ref=3D"http://www.smile.eu/" target=3D"_blank">
                    <img style=3D"max-width: 100%; height: auto;" src=3D"ht=
tp://ftp.smile.fr/client/Communication/signature/img/Logo-new.png" alt=3D"S=
MILE">
                </a><br><br>
                    <p style=3D"line-height:15px">10-12 Rue Nicolas Appert<=
br>
44100 NANTES</p>
            </td>
            <td style=3D"border-left:1px solid rgb(59,127,254);padding-left=
:20px;font-size:13px;color:rgb(255,128,84)">
                <div style=3D"color:rgb(255,128,84);font-size:14px">
                    <b>Sebastian WEYER</b>
                </div>
                <div style=3D"color:rgb(59,127,254);font-size:13px">
                    Stagiaire production<br>
                   =20
                </div><br>
                <div style=3D"color:rgb(59,127,254);font-size:13px">
                    <span style=3D"white-space:nowrap"><img style=3D"margin=
-right: 5px;" src=3D"http://ftp.smile.fr/client/Communication/signature/img=
/mail.png" alt=3D"email" width=3D"12" height=3D"10">
                        <a href=3D"mailto:sebastian.weyer@smile.fr" style=
=3D"color:rgb(59,127,254);font-size:13px;text-decoration:none" target=3D"_b=
lank">sebastian.weyer@smile.fr</a>
                    </span>
                     <br>
                                                    <span style=3D"white-sp=
ace:nowrap"><img style=3D"margin-right: 5px;" src=3D"http://ftp.smile.fr/cl=
ient/Communication/signature/img/web.png" alt=3D"url" width=3D"12" height=
=3D"12">
<a href=3D"http://www.smile.eu" style=3D"color:rgb(59,127,254);font-size:13=
px;text-decoration:none" target=3D"_blank">http://www.smile.eu</a> =20
                  </span>
                                </div>

                <br>
                <div>
                    <span><a style=3D"margin-right:5px" href=3D"https://twi=
tter.com/GroupeSmile" target=3D"_blank"><img src=3D"http://ftp.smile.fr/cli=
ent/Communication/signature/img/rs-twitter.png" alt=3D"Twitter" style=3D"ma=
x-width: 100%; height: auto;"></a></span>
                    <span><a style=3D"margin-right:5px" href=3D"https://www=
.linkedin.com/company/smile" target=3D"_blank"><img src=3D"http://ftp.smile=
.fr/client/Communication/signature/img/rs-linkedin.png" alt=3D"LinkedIn" st=
yle=3D"max-width: 100%; height: auto;"></a></span>
                    <span><a style=3D"margin-right:5px" href=3D"https://git=
hub.com/Smile-SA" target=3D"_blank"><img src=3D"http://ftp.smile.fr/client/=
Communication/signature/img/rs-github.png" alt=3D"Github" style=3D"max-widt=
h: 100%; height: auto;"></a></span>
                </div>
            </td>
        </tr>
        </tbody>
    </table></div></div>
</blockquote></div><br clear=3D"all"><div><br></div><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><d=
iv dir=3D"ltr">
    <img src=3D"http://ftp.smile.fr/client/Communication/signature/img/eco.=
png" alt=3D"eco" width=3D"13" height=3D"11">
            Pour la plan=C3=A8te, n&#39;imprimez ce mail que si c&#39;est n=
=C3=A9cessaire
    <table style=3D"padding:20px" border=3D"0"><tbody><tr><td style=3D"font=
-size:13px;color:rgb(255,128,84);text-align:center;padding-right:30px"><a h=
ref=3D"http://www.smile.eu/" target=3D"_blank">
                    <img style=3D"max-width: 100%; height: auto;" src=3D"ht=
tp://ftp.smile.fr/client/Communication/signature/img/Logo-new.png" alt=3D"S=
MILE">
                </a><br><br>
                    <p style=3D"line-height:15px">10-12 Rue Nicolas Appert<=
br>
44100 NANTES</p>
            </td>
            <td style=3D"border-left:1px solid rgb(59,127,254);padding-left=
:20px;font-size:13px;color:rgb(255,128,84)">
                <div style=3D"color:rgb(255,128,84);font-size:14px">
                    <b>Sebastian WEYER</b>
                </div>
                <div style=3D"color:rgb(59,127,254);font-size:13px">
                    Stagiaire production<br>
                   =20
                </div><br>
                <div style=3D"color:rgb(59,127,254);font-size:13px">
                    <span style=3D"white-space:nowrap"><img style=3D"margin=
-right: 5px;" src=3D"http://ftp.smile.fr/client/Communication/signature/img=
/mail.png" alt=3D"email" width=3D"12" height=3D"10">
                        <a href=3D"mailto:sebastian.weyer@smile.fr" style=
=3D"color:rgb(59,127,254);font-size:13px;text-decoration:none" target=3D"_b=
lank">sebastian.weyer@smile.fr</a>
                    </span>
                     <br>
                                                    <span style=3D"white-sp=
ace:nowrap"><img style=3D"margin-right: 5px;" src=3D"http://ftp.smile.fr/cl=
ient/Communication/signature/img/web.png" alt=3D"url" width=3D"12" height=
=3D"12">
<a href=3D"http://www.smile.eu" style=3D"color:rgb(59,127,254);font-size:13=
px;text-decoration:none" target=3D"_blank">http://www.smile.eu</a> =20
                  </span>
                                </div>

                <br>
                <div>
                    <span><a style=3D"margin-right:5px" href=3D"https://twi=
tter.com/GroupeSmile" target=3D"_blank"><img src=3D"http://ftp.smile.fr/cli=
ent/Communication/signature/img/rs-twitter.png" alt=3D"Twitter" style=3D"ma=
x-width: 100%; height: auto;"></a></span>
                    <span><a style=3D"margin-right:5px" href=3D"https://www=
.linkedin.com/company/smile" target=3D"_blank"><img src=3D"http://ftp.smile=
.fr/client/Communication/signature/img/rs-linkedin.png" alt=3D"LinkedIn" st=
yle=3D"max-width: 100%; height: auto;"></a></span>
                    <span><a style=3D"margin-right:5px" href=3D"https://git=
hub.com/Smile-SA" target=3D"_blank"><img src=3D"http://ftp.smile.fr/client/=
Communication/signature/img/rs-github.png" alt=3D"Github" style=3D"max-widt=
h: 100%; height: auto;"></a></span>
                </div>
            </td>
        </tr>
        </tbody>
    </table></div></div>

--0000000000006e284205ffaf2800--

--===============3913325038917671906==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3913325038917671906==--
