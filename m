Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CB88C54E71
	for <buildroot@archiver.kernel.org>; Fri, 22 Mar 2024 07:11:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D78128236A;
	Fri, 22 Mar 2024 07:10:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id K6jGI6-DnB-1; Fri, 22 Mar 2024 07:10:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 672178235E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 672178235E;
	Fri, 22 Mar 2024 07:10:58 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B3CD41BF3C2
 for <buildroot@lists.busybox.net>; Fri, 22 Mar 2024 07:10:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id ADBBB40431
 for <buildroot@lists.busybox.net>; Fri, 22 Mar 2024 07:10:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OvQqlZ8sZQRs for <buildroot@lists.busybox.net>;
 Fri, 22 Mar 2024 07:10:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::1036; helo=mail-pj1-x1036.google.com;
 envelope-from=francois.perrad@gadz.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 20B554012F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 20B554012F
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com
 [IPv6:2607:f8b0:4864:20::1036])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 20B554012F
 for <buildroot@buildroot.org>; Fri, 22 Mar 2024 07:10:53 +0000 (UTC)
Received: by mail-pj1-x1036.google.com with SMTP id
 98e67ed59e1d1-29de4c33441so1270128a91.1
 for <buildroot@buildroot.org>; Fri, 22 Mar 2024 00:10:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711091453; x=1711696253;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=XhALf5MdxprnPtYVVb85UGOvWk6UOAGs/nCxV9Gk/do=;
 b=fWn6C4OqgdC6IMpQz0ylGkYhkd8FdPb4pjo5t5cZYDoTzXg076G1ZHGgg60/2UrrSR
 rU9pdYVfJXIv75aA7KDSJeMJmkAMYZyIeatHqUYGpxmyotVwYhHpTLedb4YOxZnTH/q0
 O80S6VCI4p2qz9oXyjLieSAW5AfDXHPN4WU8QbjTHzOnJg6H0G10z5lmtvKyX7SiamS0
 B8WXk6pq2kOUoqOTPeZf9FI4RyhD5o7kbOMfsLDXQj7fhvyZSAJNXZ5yPYEVTKWDhCEV
 1K9WAq0yoWN/TFl1z7Ykg55t5oc6VJ2z1L2AZJxS9VkbPM8z+eUWJn1mviPwwc6hebO5
 1ZcQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVMeMTo44sckx/KjIQHiZOvdQg8tWyfflgs9E+d0+dkqcisAuKipgucy+/ztg4lAp25AnE4/sgqXnt/gEFR58pypue70C3DsA==
X-Gm-Message-State: AOJu0YybsIskGTHrrPjH2LMkc+Ahyt5eaGURbJz4Ltvm5KyCuiHzJod4
 LMxi1QODO6BqUL2KUYpMFkJSMo4Yqr39AxzLG2tsPzoK3kmQI/U40/mtgOqSj0D1j3WwnsLfZPy
 Lar/XT/XfLSaHtHni57s0XzVFco3ae/gVU/OK
X-Google-Smtp-Source: AGHT+IEOsp2STOai2azuzaGCH/q/1bGIInhWttOhBA/vXVXoQNWBLBCZND2Ao93O82V980QJtfRISFMuPgQj6YdPHb8=
X-Received: by 2002:a17:90a:ce04:b0:29b:a8a6:c6a7 with SMTP id
 f4-20020a17090ace0400b0029ba8a6c6a7mr1388502pju.13.1711091452499; Fri, 22 Mar
 2024 00:10:52 -0700 (PDT)
MIME-Version: 1.0
References: <CAMV0Ro8PH6Q4FJfv6OUXpxDPHCNEXt4b3N7_sRLP-RpH07s_bg@mail.gmail.com>
 <0609b565-6298-407c-b7b1-2d32424c802b@mind.be>
 <CAMV0Ro_Fo3QLHk4RcDxUsjdQHUWFi2LYb6+wRnDyOK+7hPOCDA@mail.gmail.com>
In-Reply-To: <CAMV0Ro_Fo3QLHk4RcDxUsjdQHUWFi2LYb6+wRnDyOK+7hPOCDA@mail.gmail.com>
From: =?UTF-8?Q?Fran=C3=A7ois_Perrad?= <francois.perrad@gadz.org>
Date: Fri, 22 Mar 2024 08:10:41 +0100
Message-ID: <CAAE6iEVY1DyO-HRHAOvfoSTB5F1cgiUtRem4wTf8mGOCSKNxtg@mail.gmail.com>
To: Akhilesh Nema <nemaakhilesh@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gadz.org; s=google; t=1711091453; x=1711696253; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=XhALf5MdxprnPtYVVb85UGOvWk6UOAGs/nCxV9Gk/do=;
 b=davvB/xIMwqJFTzB507oxsKZ6gpZS7W7MuVvGNAO/ehqNX461DH+HYS1Dz7LzJePxa
 EWR8Qc5lyY/bifN8t6/ThEiPIOlVNsKfs3HQE48Q/6Hksn8ckXey8L3vM1flCgR6f/+w
 Asf5e9otS4XarELxf5qp/asMOWpO6lReDB23Nh0n0j6jLYQqDfyhTHYc5iDoX70J1RMO
 sKD/FzzD+M8CferS2U2OnIXPFe/HTVkX96b4tnezmzG7Kpa+hb8+e0oFUlKR0ucuOjY5
 t1b1qjDt34VZtGeWnxNEGYqvOe2EEzNhiopfyhHLx/DHOcwixtB10rMVVv//vefd7SuV
 KiLw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gadz.org
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gadz.org header.i=@gadz.org header.a=rsa-sha256
 header.s=google header.b=davvB/xI
Subject: Re: [Buildroot] AUH (auto-upgrade-helper) for the Buildroot
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
Cc: buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============0359240092257065852=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0359240092257065852==
Content-Type: multipart/alternative; boundary="000000000000355c3d06143a86ac"

--000000000000355c3d06143a86ac
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le ven. 22 mars 2024 =C3=A0 01:12, Akhilesh Nema <nemaakhilesh@gmail.com> a
=C3=A9crit :

> Hi Arnout,
>
> Thank you for providing such a comprehensive response.
>
> On Wed, Mar 20, 2024 at 10:21=E2=80=AFAM Arnout Vandecappelle <arnout@min=
d.be>
> wrote:
>
>>
>>
>> On 19/03/2024 22:02, Akhilesh Nema wrote:
>> > Hi Buildroot Experts,
>> >
>> > Around 80% of the commits on the Buildroot involve package upgrades.
>> > (As of March 18, 2024)
>> > Total number of commits on the br master         - 71554
>> > Total number of commits on the package folder - 57305
>> >
>> > Yocto has an AUH tool to perform trivial upgrades.
>>
>>   I believe in Yocto, AUH is only used to help people preparing patches.
>> The
>> update is not actually performed automatically, right? The only thing
>> that
>> happens automatically is that there's a server that runs AUH (weekly
>> IIRC) and
>> sends the results (including patches) to the mailing list.
>>
> Yes, it seems that  the Yocto Server is running it bi-weekly, and patches
> are submitted to the mailing-list/patchwork for review.
>
> https://patchwork.yoctoproject.org/project/oe-core/list/?series=3D&submit=
ter=3D&state=3D*&q=3DAUH&archive=3Dboth&delegate=3D
>
> Update is not performed automatically.
>
>
>>   For sure, in Buildroot, we don't want fully automatic package bumps. W=
e
>> definitely want all package bumps to be runtime tested by someone!
>>
>>   That said, something that helps prepare an update is certainly welcome=
.
>>
>>
>> > It would be great if AUH (
>> https://git.yoctoproject.org/auto-upgrade-helper
>> > <https://git.yoctoproject.org/auto-upgrade-helper>) will be available
>> for the
>> > Buildroot. Is there a plan to support AUH or a similar tool on
>> Buildroot?
>>
>>   The existing yocto tool is certainly not going to work as is, it relie=
s
>> on a
>> bunch of OpenEmbedded specific features (like devtool).
>>
>>   The way this should work in Buildroot context is probably:
>>
>> - a util (in utils/ directory) that uses release-monitoring to find out
>> the
>> latest version of a package, and that updates the .mk and .hash files
>> accordingly. It could perhaps also write a commit message.
>>
>> - a tool that completes the update flow for a (set of) packages by also
>> running
>> make legal-info on them, and running br-test-pkg and checkpackage.
>> Ideally also
>> the runtime tests for that package, though it may be difficult to find
>> them.
>> Note that this tool will still need to get a config fragment as input,
>> because
>> br-test-pkg requires it.
>>
>>   With that in place, we could install a cron job on a server somewhere
>> to
>> regularly perform this. But, as said before, the patches would still nee=
d
>> to be
>> runtime tested!
>>
> These are great ideas. I hope to see AUH port added to Buildroot soon.
>
>
Actually, each monday, the autobuilder report contains a section about
out-dated packages (based on data retrieved from
https://release-monitoring.org)

some specific infrastructures supply already more helps.
1) a tool which generates most of the BR package (Config.in, foo.mk,
foo.hash)
    - in the infrastructure for Python: a script utils/scanpypi (which
retrieves data from pypi.org)
    - in the infrastructure for LuaRocks: a luarocks plugin (which
retrieves data from luarocks.org)
    - in the infrastructure for Perl/CPAN: a script utils/scancpan (which
retrieves data from metacpan.org)
2) an upgrade helper
    - in the infrastructure for LuaRocks, as the upstream name is stored in
the variable LUA_FOO_NAME_UPSTREAM, the luarocks plugin can be rerunned by
the target lua-foo-upgrade
    - in the infrastructure for Perl/CPAN, as the upstream name is stored
in the variable PERL_FOO_BAR_DISTNAME, the script scancpan can be rerunned
by the target perl-foo-bar-upgrade

Regards,
Fran=C3=A7ois


> Still there are some packages without a mapping on release-monitoring.org
> (327, source - http://autobuild.buildroot.org/stats/master.html)
> Some of the mappings are broken. (for example
> https://release-monitoring.org/project/21837/.)
> Buildroot may also apply an alternate (or supplement) method similar to
> the one used by Yocto to check the availability of a new version.
>
> https://github.com/openembedded/openembedded-core/blob/master/meta/lib/oe=
/recipeutils.py#L1012
>
>>
>>   Regards,
>>   Arnout
>>
>>
>> >
>> > The usage of AUH can be found here -
>> >
>> https://docs.yoctoproject.org/dev-manual/upgrading-recipes.html#using-th=
e-auto-upgrade-helper-auh
>> <
>> https://docs.yoctoproject.org/dev-manual/upgrading-recipes.html#using-th=
e-auto-upgrade-helper-auh
>> >
>> >
>> > Benefits of this tool are self explanatory.
>> >
>> > Thanks
>> > Akhilesh
>> >
>> > _______________________________________________
>> > buildroot mailing list
>> > buildroot@buildroot.org
>> > https://lists.buildroot.org/mailman/listinfo/buildroot
>
>
> Thanks
> Akhilesh
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
>

--000000000000355c3d06143a86ac
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0ven. 22 mars 2024 =C3=A0=C2=
=A001:12, Akhilesh Nema &lt;<a href=3D"mailto:nemaakhilesh@gmail.com">nemaa=
khilesh@gmail.com</a>&gt; a =C3=A9crit=C2=A0:<br></div><blockquote class=3D=
"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(2=
04,204,204);padding-left:1ex"><div dir=3D"ltr"><div dir=3D"ltr">Hi Arnout,<=
/div><div dir=3D"ltr"><br></div><div>Thank you for providing such a compreh=
ensive response.</div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Wed, Mar 20, 2024 at 10:21=E2=80=AFAM Arnout Vandecappel=
le &lt;<a href=3D"mailto:arnout@mind.be" target=3D"_blank">arnout@mind.be</=
a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><b=
r>
<br>
On 19/03/2024 22:02, Akhilesh Nema wrote:<br>
&gt; Hi Buildroot Experts,<br>
&gt; <br>
&gt; Around 80% of the commits on the Buildroot involve package upgrades.<b=
r>
&gt; (As of March 18, 2024)<br>
&gt; Total number of commits on the br master=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0- 71554<br>
&gt; Total number of commits on the package folder - 57305<br>
&gt; <br>
&gt; Yocto has an AUH tool to perform trivial upgrades.<br>
<br>
=C2=A0 I believe in Yocto, AUH is only used to help people preparing patche=
s. The <br>
update is not actually performed automatically, right? The only thing that =
<br>
happens automatically is that there&#39;s a server that runs AUH (weekly II=
RC) and <br>
sends the results (including patches) to the mailing list.<br></blockquote>=
<div>Yes, it seems that=C2=A0 the Yocto Server is running it bi-weekly, and=
 patches are submitted to the mailing-list/patchwork for review.</div><div>=
<a href=3D"https://patchwork.yoctoproject.org/project/oe-core/list/?series=
=3D&amp;submitter=3D&amp;state=3D*&amp;q=3DAUH&amp;archive=3Dboth&amp;deleg=
ate=3D" target=3D"_blank">https://patchwork.yoctoproject.org/project/oe-cor=
e/list/?series=3D&amp;submitter=3D&amp;state=3D*&amp;q=3DAUH&amp;archive=3D=
both&amp;delegate=3D</a><br></div><div>=C2=A0</div><div>Update is not perfo=
rmed automatically.</div><div><br></div><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pad=
ding-left:1ex">
<br>
=C2=A0 For sure, in Buildroot, we don&#39;t want fully automatic package bu=
mps. We <br>
definitely want all package bumps to be runtime tested by someone!<br>
<br>
=C2=A0 That said, something that helps prepare an update is certainly welco=
me.<br>
<br>
<br>
&gt; It would be great if AUH (<a href=3D"https://git.yoctoproject.org/auto=
-upgrade-helper" rel=3D"noreferrer" target=3D"_blank">https://git.yoctoproj=
ect.org/auto-upgrade-helper</a> <br>
&gt; &lt;<a href=3D"https://git.yoctoproject.org/auto-upgrade-helper" rel=
=3D"noreferrer" target=3D"_blank">https://git.yoctoproject.org/auto-upgrade=
-helper</a>&gt;) will be available for the <br>
&gt; Buildroot. Is there a plan to support AUH or a similar tool on Buildro=
ot?<br>
<br>
=C2=A0 The existing yocto tool is certainly not going to work as is, it rel=
ies on a <br>
bunch of OpenEmbedded specific features (like devtool).<br>
<br>
=C2=A0 The way this should work in Buildroot context is probably:<br>
<br>
- a util (in utils/ directory) that uses release-monitoring to find out the=
 <br>
latest version of a package, and that updates the .mk and .hash files <br>
accordingly. It could perhaps also write a commit message.<br>
<br>
- a tool that completes the update flow for a (set of) packages by also run=
ning <br>
make legal-info on them, and running br-test-pkg and checkpackage. Ideally =
also <br>
the runtime tests for that package, though it may be difficult to find them=
. <br>
Note that this tool will still need to get a config fragment as input, beca=
use <br>
br-test-pkg requires it.<br>
<br>
=C2=A0 With that in place, we could install a cron job on a server somewher=
e to <br>
regularly perform this. But, as said before, the patches would still need t=
o be <br>
runtime tested!<br></blockquote><div>These are great ideas. I=C2=A0hope to =
see AUH port added to Buildroot soon.<br></div><div><br></div></div></div><=
/blockquote><div><br></div><div>Actually, each monday, the autobuilder repo=
rt contains a section about out-dated packages (based on data retrieved fro=
m <a href=3D"https://release-monitoring.org">https://release-monitoring.org=
</a>)<br><br>some specific infrastructures supply already more helps.<br>1)=
 a tool which generates most of the BR package (Config.in, <a href=3D"http:=
//foo.mk">foo.mk</a>, foo.hash)<br>=C2=A0 =C2=A0 - in the infrastructure fo=
r Python: a script utils/scanpypi (which retrieves data from <a href=3D"htt=
p://pypi.org">pypi.org</a>)<br>=C2=A0 =C2=A0 - in the infrastructure for Lu=
aRocks: a luarocks plugin (which retrieves data from <a href=3D"http://luar=
ocks.org">luarocks.org</a>)<br>=C2=A0 =C2=A0 - in the infrastructure for Pe=
rl/CPAN: a script utils/scancpan (which retrieves data from <a href=3D"http=
://metacpan.org">metacpan.org</a>)<br>2) an upgrade helper<br>=C2=A0 =C2=A0=
 - in the infrastructure for LuaRocks, as the upstream name is stored in th=
e variable LUA_FOO_NAME_UPSTREAM, the luarocks plugin can be rerunned by th=
e target lua-foo-upgrade<br>=C2=A0 =C2=A0 - in the infrastructure for Perl/=
CPAN, as the upstream name is stored in the variable PERL_FOO_BAR_DISTNAME,=
 the script scancpan can be rerunned by the target perl-foo-bar-upgrade</di=
v><div><br></div><div>Regards,<br></div><div>Fran=C3=A7ois<br></div><div>=
=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"l=
tr"><div class=3D"gmail_quote"><div></div><div>Still there are some package=
s without a mapping on <a href=3D"http://release-monitoring.org" target=3D"=
_blank">release-monitoring.org</a> (327, source - <a href=3D"http://autobui=
ld.buildroot.org/stats/master.html" target=3D"_blank">http://autobuild.buil=
droot.org/stats/master.html</a>)<br></div><div>Some of the mappings are bro=
ken. (for example <a href=3D"https://release-monitoring.org/project/21837/"=
 target=3D"_blank">https://release-monitoring.org/project/21837/</a>.)<br>B=
uildroot may also apply an alternate (or supplement) method similar to the =
one used by Yocto to check the availability of a new version.<br><a href=3D=
"https://github.com/openembedded/openembedded-core/blob/master/meta/lib/oe/=
recipeutils.py#L1012" target=3D"_blank">https://github.com/openembedded/ope=
nembedded-core/blob/master/meta/lib/oe/recipeutils.py#L1012</a><br></div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex"><br>
=C2=A0 Regards,<br>
=C2=A0 Arnout<br>
<br>
<br>
&gt; <br>
&gt; The usage of AUH can be found here - <br>
&gt; <a href=3D"https://docs.yoctoproject.org/dev-manual/upgrading-recipes.=
html#using-the-auto-upgrade-helper-auh" rel=3D"noreferrer" target=3D"_blank=
">https://docs.yoctoproject.org/dev-manual/upgrading-recipes.html#using-the=
-auto-upgrade-helper-auh</a> &lt;<a href=3D"https://docs.yoctoproject.org/d=
ev-manual/upgrading-recipes.html#using-the-auto-upgrade-helper-auh" rel=3D"=
noreferrer" target=3D"_blank">https://docs.yoctoproject.org/dev-manual/upgr=
ading-recipes.html#using-the-auto-upgrade-helper-auh</a>&gt;<br>
&gt; <br>
&gt; Benefits of this tool are self explanatory.<br>
&gt; <br>
&gt; Thanks<br>
&gt; Akhilesh<br>
&gt; <br>
&gt; _______________________________________________<br>
&gt; buildroot mailing list<br>
&gt; <a href=3D"mailto:buildroot@buildroot.org" target=3D"_blank">buildroot=
@buildroot.org</a><br>
&gt; <a href=3D"https://lists.buildroot.org/mailman/listinfo/buildroot" rel=
=3D"noreferrer" target=3D"_blank">https://lists.buildroot.org/mailman/listi=
nfo/buildroot</a></blockquote><div class=3D"gmail_quote"><br></div>Thanks<b=
r><div>Akhilesh=C2=A0</div></div></div>
_______________________________________________<br>
buildroot mailing list<br>
<a href=3D"mailto:buildroot@buildroot.org" target=3D"_blank">buildroot@buil=
droot.org</a><br>
<a href=3D"https://lists.buildroot.org/mailman/listinfo/buildroot" rel=3D"n=
oreferrer" target=3D"_blank">https://lists.buildroot.org/mailman/listinfo/b=
uildroot</a><br>
</blockquote></div></div>

--000000000000355c3d06143a86ac--

--===============0359240092257065852==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0359240092257065852==--
