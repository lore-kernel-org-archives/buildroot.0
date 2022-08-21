Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C82BEC00140
	for <buildroot@archiver.kernel.org>; Sun, 21 Aug 2022 17:05:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2914E60BB4;
	Sun, 21 Aug 2022 17:05:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2914E60BB4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2cRMa-SYVHfD; Sun, 21 Aug 2022 17:05:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1542960B43;
	Sun, 21 Aug 2022 17:05:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1542960B43
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E2AA91BF30E
 for <buildroot@lists.busybox.net>; Sun, 21 Aug 2022 17:05:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C3C8781926
 for <buildroot@lists.busybox.net>; Sun, 21 Aug 2022 17:05:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C3C8781926
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4NnkdOdJ-qd7 for <buildroot@lists.busybox.net>;
 Sun, 21 Aug 2022 17:05:18 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9C8668144E
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9C8668144E
 for <buildroot@buildroot.org>; Sun, 21 Aug 2022 17:05:18 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id 2so3161643edx.2
 for <buildroot@buildroot.org>; Sun, 21 Aug 2022 10:05:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=yRxnaLPLNe5Kv2JFmj/wwHh4a059haMUOFvaGZxRJMY=;
 b=bY3gZNApBp254TQnXI6YYGNuuL2nU03Q3SXUqc9Ycs35ulmoub12RX9Kzb4t2LtlBr
 je3/RfFRdqeH8KyqE+bbK4vmmzPGkJfGzakrCcA8O6k37IYR5DAI149BJ0obu6suu1o4
 6MTzLRmuKqhMtIHU+T/OQjCBBdmxnhGADHF10b8ew8sqo58M74SsmsChtevZBVkf7mU/
 5nicU2/XQpzxC5jxgv7fxyCEjj2Cr9Q0g5ozlcPdr9cj7X6B4tl4Lc4ILDtuDi1NFcEg
 ckiJvQfCIQWx2TGleBMHRR7u2aPrL0lZJxMweNkOXvGkioiyDxa68Dx9T6McUHrmiM4o
 jAeg==
X-Gm-Message-State: ACgBeo30NLJ30R6EmIb2vYIU3mdSDoVyoAoLQNSRuXQw2daJspKINLqj
 RlsyUUNetW2MohuqEijkuSr8bHMmCklYycT+
X-Google-Smtp-Source: AA6agR4rrfwK8XATbNMgtxcSb4E8QDbE4W7i541LWAUtxCpKwxI8tJFN/xaVB9mkOgoT1y32P2EvaQ==
X-Received: by 2002:a05:6402:5201:b0:446:cfe7:9f0c with SMTP id
 s1-20020a056402520100b00446cfe79f0cmr290584edd.16.1661101516458; 
 Sun, 21 Aug 2022 10:05:16 -0700 (PDT)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com.
 [209.85.208.53]) by smtp.gmail.com with ESMTPSA id
 cw21-20020a056402229500b0043aba618bf6sm6791800edb.80.2022.08.21.10.05.15
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 21 Aug 2022 10:05:15 -0700 (PDT)
Received: by mail-ed1-f53.google.com with SMTP id o22so11174355edc.10
 for <buildroot@buildroot.org>; Sun, 21 Aug 2022 10:05:15 -0700 (PDT)
X-Received: by 2002:a05:6402:2547:b0:43e:4cc4:85d3 with SMTP id
 l7-20020a056402254700b0043e4cc485d3mr13108112edb.233.1661101514879; Sun, 21
 Aug 2022 10:05:14 -0700 (PDT)
MIME-Version: 1.0
References: <20220127062504.1835450-1-christian@paral.in>
 <20220127062504.1835450-2-christian@paral.in>
 <20220127090141.7d0645f2@windsurf>
 <CA+h8R2oKO-hhmn9eOQoj4fX9ZYXBCVPqqe8knbrOq46c3s6E9w@mail.gmail.com>
 <20220821151450.GX2775145@scaer>
In-Reply-To: <20220821151450.GX2775145@scaer>
Date: Sun, 21 Aug 2022 10:05:04 -0700
X-Gmail-Original-Message-ID: <CA+h8R2r=AHWazfhD_ySbFOenc=dY3bt5t2PnLHEPQbMUmQJ19A@mail.gmail.com>
Message-ID: <CA+h8R2r=AHWazfhD_ySbFOenc=dY3bt5t2PnLHEPQbMUmQJ19A@mail.gmail.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=paral.in; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=yRxnaLPLNe5Kv2JFmj/wwHh4a059haMUOFvaGZxRJMY=;
 b=PQwFa0mnztqUUrpqzAMvsq0n0oyeNdG4/uv43QK8n5h1Fu88+cLs1faUoWvJAJUxys
 q9CEwWXnTDhDDOX/EgtdCQB5nQprxzm7nSX3MEG5LLUaqTyq7eEFUi9Po9Y8wbnnAf80
 SlvmDAQkOL9LU8egPxYvAEPvIpkpnGuqpvDTKeyhDLj7MI43SRPHb5HcrFNM4Tei4N3c
 hKM9y8CLbIdWTRNlYAvovMF8N2cn27Cj3XxFbBYdI3TWmZSZnW7l5/iddGa4erjwCMHb
 RY4yS1zC61MIvDelF5NaO1h0akJwRaAYUkz8kTK9ewKaoGPsYdv8z0C4vaANUIINicpi
 zrsw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=paral.in header.i=@paral.in
 header.a=rsa-sha256 header.s=google header.b=PQwFa0mn
Subject: Re: [Buildroot] [PATCH v3 2/2] package/buildah: new package
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
From: Christian Stewart via buildroot <buildroot@buildroot.org>
Reply-To: Christian Stewart <christian@paral.in>
Cc: Christian Stewart <christian@paral.in>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Buildroot Mailing List <buildroot@buildroot.org>
Content-Type: multipart/mixed; boundary="===============0526042069326342565=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0526042069326342565==
Content-Type: multipart/alternative; boundary="000000000000bafb2e05e6c35512"

--000000000000bafb2e05e6c35512
Content-Type: text/plain; charset="UTF-8"

Yann,

On Sun, Aug 21, 2022, 8:14 AM Yann E. MORIN <yann.morin.1998@free.fr> wrote:

> On 2022-01-26 12:25 -0800, Christian Stewart via buildroot spake thusly:
> > Adds both host and target packages for buildah.
>
> I would question the need for having buildah on the target. Buildah is
> advertised as: "A tool that facilitates building OCI container images."
> I don't see a good reason for building images *on* the target. Please
> explain in the commit log why that would make sense to have buildah on
> the target.
>

Building container images with a tool like "docker build" on the target is
an extremely common practice. There are numerous reasons to do so. Almost
none of the container images I use on devices were built ahead of time,
rather on the target device. I don't see why it's necessary to explain that
on every commit message.

> The buildah tree does not ship with a default policy.json file, and
> instead
> > relies on packagers to provide one. A patch is added to create a basic
> barebones
> > policy.json which is installed to /etc/containers/policy.json with a
> hook.
>
> Don't add a patch; just add that as a file in the Buildroot tree, e.g.
> package/buildah/policy.json, and install that from the package dir, i.e
> $(BUILDAH_PKGDIR)/policy.json rather than from $(@D)/..../policy.json.
>

Did a similar thing to this with the upcoming podman package. Will update.

On 2022-01-27 12:31 -0800, Christian Stewart via buildroot spake thusly:
> > On Thu, Jan 27, 2022 at 12:01 AM Thomas Petazzoni
> > <thomas.petazzoni@bootlin.com> wrote:
> > > Considering that there are runtime dependency concerns, it would be
> > > nice to have a simple test case in support/testing/.
> > OK, something like "buildah pull" or so?
>
> A runtime test should validate that the package works as expected, in a
> minimal way. So, if 'buildah pull' can prove that runtime dependencies
> are exercised, then that's OK, yes.
>
> Obviously if runtiem dependencies are only required for specific cases
> and only "loaded" when needed, we will not notice any missing ones. But
> having an exhaustive test is not very important either; we do not want
> to have to run the full project's test-suite...
>

I would argue that in this case if the package compiles at all it will
work, as per the upstream tests. Not sure if it's really worth the time to
add the extra test here.

> > However, for LDFLAGS, it's a bit weird, as normally,
> > > LDFLAGS are different between host and target. However here, there are
> > > mostly used to pass these version-related -X options, that are in fact
> > > the same between host and target. Should we have a separate variable to
> > > pass those flags ? Not sure.
> > They are quite common for Go packages - could call them DEFINES or
> > something similar.
>
> But with LDFLAGS, it is possible to pass flags to the actual linker,
> with -extldflags something-something, so they should not be
> automatically inherited.
>
> And if we had something the DEFINES you hint at, they would again be
> different by default, because the host and target builds do not follow
> the same logic.
>

We are defining the Version here, which is the same on the host and target.

Thanks,
Christian

--000000000000bafb2e05e6c35512
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div>Yann,<br><br><div class=3D"gmail_quote"><div dir=3D"=
ltr" class=3D"gmail_attr">On Sun, Aug 21, 2022, 8:14 AM Yann E. MORIN &lt;<=
a href=3D"mailto:yann.morin.1998@free.fr">yann.morin.1998@free.fr</a>&gt; w=
rote:</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bor=
der-left:1px #ccc solid;padding-left:1ex">
On 2022-01-26 12:25 -0800, Christian Stewart via buildroot spake thusly:<br=
>
&gt; Adds both host and target packages for buildah.<br>
<br>
I would question the need for having buildah on the target. Buildah is<br>
advertised as: &quot;A tool that facilitates building OCI container images.=
&quot;<br>
I don&#39;t see a good reason for building images *on* the target. Please<b=
r>
explain in the commit log why that would make sense to have buildah on<br>
the target.<br></blockquote></div></div><div dir=3D"auto"><br></div><div di=
r=3D"auto">Building container images with a tool like &quot;docker build&qu=
ot; on the target is an extremely common practice. There are numerous reaso=
ns to do so. Almost none of the container images I use on devices were buil=
t ahead of time, rather on the target device. I don&#39;t see why it&#39;s =
necessary to explain that on every commit message.</div><div dir=3D"auto"><=
br></div><div dir=3D"auto"><div class=3D"gmail_quote"><blockquote class=3D"=
gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-=
left:1ex">&gt; The buildah tree does not ship with a default policy.json fi=
le, and instead<br>
&gt; relies on packagers to provide one. A patch is added to create a basic=
 barebones<br>
&gt; policy.json which is installed to /etc/containers/policy.json with a h=
ook.<br>
<br>
Don&#39;t add a patch; just add that as a file in the Buildroot tree, e.g.<=
br>
package/buildah/policy.json, and install that from the package dir, i.e<br>
$(BUILDAH_PKGDIR)/policy.json rather than from $(@D)/..../policy.json.<br><=
/blockquote></div></div><div dir=3D"auto"><br></div><div dir=3D"auto">Did a=
 similar thing to this with the upcoming podman package. Will update.</div>=
<div dir=3D"auto"><br></div><div dir=3D"auto"><div class=3D"gmail_quote"><b=
lockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px =
#ccc solid;padding-left:1ex">
On 2022-01-27 12:31 -0800, Christian Stewart via buildroot spake thusly:<br=
>
&gt; On Thu, Jan 27, 2022 at 12:01 AM Thomas Petazzoni<br>
&gt; &lt;<a href=3D"mailto:thomas.petazzoni@bootlin.com" target=3D"_blank" =
rel=3D"noreferrer">thomas.petazzoni@bootlin.com</a>&gt; wrote:<br>
&gt; &gt; Considering that there are runtime dependency concerns, it would =
be<br>
&gt; &gt; nice to have a simple test case in support/testing/.<br>
&gt; OK, something like &quot;buildah pull&quot; or so?<br>
<br>
A runtime test should validate that the package works as expected, in a<br>
minimal way. So, if &#39;buildah pull&#39; can prove that runtime dependenc=
ies<br>
are exercised, then that&#39;s OK, yes.<br>
<br>
Obviously if runtiem dependencies are only required for specific cases<br>
and only &quot;loaded&quot; when needed, we will not notice any missing one=
s. But<br>
having an exhaustive test is not very important either; we do not want<br>
to have to run the full project&#39;s test-suite...<br></blockquote></div><=
/div><div dir=3D"auto"><br></div><div dir=3D"auto">I would argue that in th=
is case if the package compiles at all it will work, as per the upstream te=
sts. Not sure if it&#39;s really worth the time to add the extra test here.=
</div><div dir=3D"auto"><br></div><div dir=3D"auto"><div class=3D"gmail_quo=
te"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-lef=
t:1px #ccc solid;padding-left:1ex">
&gt; &gt; However, for LDFLAGS, it&#39;s a bit weird, as normally,<br>
&gt; &gt; LDFLAGS are different between host and target. However here, ther=
e are<br>
&gt; &gt; mostly used to pass these version-related -X options, that are in=
 fact<br>
&gt; &gt; the same between host and target. Should we have a separate varia=
ble to<br>
&gt; &gt; pass those flags ? Not sure.<br>
&gt; They are quite common for Go packages - could call them DEFINES or<br>
&gt; something similar.<br>
<br>
But with LDFLAGS, it is possible to pass flags to the actual linker,<br>
with -extldflags something-something, so they should not be<br>
automatically inherited.<br>
<br>
And if we had something the DEFINES you hint at, they would again be<br>
different by default, because the host and target builds do not follow<br>
the same logic.<br></blockquote></div></div><div dir=3D"auto"><br></div><di=
v dir=3D"auto">We are defining the Version here, which is the same on the h=
ost and target.</div><div dir=3D"auto"><br></div><div dir=3D"auto">Thanks,<=
/div><div dir=3D"auto">Christian</div></div>

--000000000000bafb2e05e6c35512--

--===============0526042069326342565==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0526042069326342565==--
