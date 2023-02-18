Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EE89C636CC
	for <buildroot@archiver.kernel.org>; Sat, 18 Feb 2023 12:54:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6DA0D60E7B;
	Sat, 18 Feb 2023 12:54:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6DA0D60E7B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LS3Xjr0NyF_j; Sat, 18 Feb 2023 12:54:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 999A160E33;
	Sat, 18 Feb 2023 12:54:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 999A160E33
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 970811BF5B4
 for <buildroot@lists.busybox.net>; Sat, 18 Feb 2023 12:54:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 715F241B59
 for <buildroot@lists.busybox.net>; Sat, 18 Feb 2023 12:54:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 715F241B59
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CcH8TeXUSGtt for <buildroot@lists.busybox.net>;
 Sat, 18 Feb 2023 12:54:25 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 34A5641A69
Received: from mail-oa1-x2f.google.com (mail-oa1-x2f.google.com
 [IPv6:2001:4860:4864:20::2f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 34A5641A69
 for <buildroot@buildroot.org>; Sat, 18 Feb 2023 12:54:25 +0000 (UTC)
Received: by mail-oa1-x2f.google.com with SMTP id
 586e51a60fabf-171b3af5e56so435625fac.8
 for <buildroot@buildroot.org>; Sat, 18 Feb 2023 04:54:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=OvxVYgYUG6GZOL4ssV0rpWiOoT4Ecb2NP5YFumRlLbs=;
 b=wcRBYME0wAQ2p//1w+v3Z5ZBcjUOVYocOm0SYu8n97jaS3nVFCLnYNUgP1kGu0C0De
 78bxuyAD3aHHKpjuyzcMtU3ZVvWmvTB2wVW/GrqT+A3xHQr0UEOhE8yt3En+CDlz9zM9
 9wRU58sDNDaiUasV7cyqx3gwFgPpzd80mdItX5hKYaRkUc90PWK4L+k/GgZkrONqJhef
 brKhwE2DHUqpDBB8mxxin7TeDSqL72GXffTty+evRmksv4w/yz4VJuaYKwqPM8hdfgiv
 ekfiPAL+Gi1opDvQLIdjhZb+fb/IkyYOqGWGBWMa3q+76QrFISbiOOBTb0k1m+lzEcVM
 Xiwg==
X-Gm-Message-State: AO0yUKWZlso9upyLrqlnqLsulH5khlQ7vvA86HQ0s83bxRiyj3f2t1Nk
 B//eSWRFO6/+8vYysjzRCixmXjLXVD+qAOAMZSI29CK0
X-Google-Smtp-Source: AK7set/dhqJGgHQFeDCbxsOTYPrVNh3yni2rm0wzYigmJ4ZRn/hLX8fYxGvoxkJt3nA4z2xGow/Xg2MM/ihbkdA94FA=
X-Received: by 2002:a05:6870:a18b:b0:16e:8b95:8548 with SMTP id
 a11-20020a056870a18b00b0016e8b958548mr680471oaf.208.1676724864079; Sat, 18
 Feb 2023 04:54:24 -0800 (PST)
MIME-Version: 1.0
References: <CADYjeStG8bZEBprwqez+_3+n-HZ5pG9p8mBySxV+4FU7GM0r3g@mail.gmail.com>
 <20230218121940.7442410e@windsurf>
In-Reply-To: <20230218121940.7442410e@windsurf>
From: Sourabh Hegde <hrsourabh011@gmail.com>
Date: Sat, 18 Feb 2023 13:54:15 +0100
Message-ID: <CADYjeSuzT5ueq5F5SQvib87d1HCKXLj565mW-Rm91N7Na1KrDQ@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=OvxVYgYUG6GZOL4ssV0rpWiOoT4Ecb2NP5YFumRlLbs=;
 b=XpQpzXUrYRU1qo7+tdxVGFAU+OXuQBVseAKZNPC9cMFGEHyrlLjl9EX5AixJdvxdIN
 nrqsBTytQyB82sTGO9laHPbhhYQbudHVPShzpuzvpSQCpyEacObMvaGw+AohQx8PPW9O
 +R0alK1DJTCzWvmhKUboDGAsFeDxW8xdgBZ6T/bKjk8uBsVZ+0eTjuJi8JOGGETfNNY2
 xTi7RtbJMVT1HQ0WmbLOGJvPOCDKY31lhjzIRfz7T33HfFTKt11KdiaORfaRL6d6giqG
 K47ueAjMi6T0DIzRop81qZrizXSkM7zlE6IwKR4AXBhJ42/vgIh9CsD+BYxBzzOPdnXU
 ehbA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=XpQpzXUr
Subject: Re: [Buildroot] Updating trust store using update-ca-certificates
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
Content-Type: multipart/mixed; boundary="===============8249485345006788541=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8249485345006788541==
Content-Type: multipart/alternative; boundary="000000000000e8da0405f4f8edba"

--000000000000e8da0405f4f8edba
Content-Type: text/plain; charset="UTF-8"

Hello Thomas,

Thanks for the update.

I was thinking the ca-certificates package will take care of this. Maybe I
was wrong.

So, how should we add local CA to the trust store in the target?

On Sat, 18 Feb 2023 at 12:19, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
wrote:

> On Fri, 17 Feb 2023 17:15:39 +0100
> Sourabh Hegde <hrsourabh011@gmail.com> wrote:
>
> > I am trying to add a custom CA to the trust store. I have copied the CA
> > file to "/usr/local/share/ca-certificates/" in the rootfs_overlay and
> also
> > has a .crt extension. Now after executing "make" the CA is not added to
> the
> > trust store in /etc/ssl/certs/ in the target. Anyways it's installed only
> > in "/usr/local/share/ca-certificates/" in the target. I thought
> > "update-ca-certificates" will add this during image build.
> > Can anyone please let me know what is missing here?
>
> What makes you think update-ca-certificates is run during the build? I
> don't remember Buildroot having anything that does this.
>
> Best regards,
>
> Thomas
> --
> Thomas Petazzoni, co-owner and CEO, Bootlin
> Embedded Linux and Kernel engineering and training
> https://bootlin.com
>

--000000000000e8da0405f4f8edba
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello Thomas,<div><br></div><div>Thanks for the=C2=A0updat=
e.</div><div><br></div><div>I was thinking the ca-certificates package will=
 take care of this. Maybe I was wrong.</div><div><br></div><div>So, how sho=
uld we add local CA to the trust store in the target?</div></div><br><div c=
lass=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Sat, 18 Feb 2=
023 at 12:19, Thomas Petazzoni &lt;<a href=3D"mailto:thomas.petazzoni@bootl=
in.com">thomas.petazzoni@bootlin.com</a>&gt; wrote:<br></div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid=
 rgb(204,204,204);padding-left:1ex">On Fri, 17 Feb 2023 17:15:39 +0100<br>
Sourabh Hegde &lt;<a href=3D"mailto:hrsourabh011@gmail.com" target=3D"_blan=
k">hrsourabh011@gmail.com</a>&gt; wrote:<br>
<br>
&gt; I am trying to add a custom CA to the trust store. I have copied the C=
A<br>
&gt; file to &quot;/usr/local/share/ca-certificates/&quot; in the rootfs_ov=
erlay and also<br>
&gt; has a .crt extension. Now after executing &quot;make&quot; the CA is n=
ot added to the<br>
&gt; trust store in /etc/ssl/certs/ in the target. Anyways it&#39;s install=
ed only<br>
&gt; in &quot;/usr/local/share/ca-certificates/&quot; in the target. I thou=
ght<br>
&gt; &quot;update-ca-certificates&quot; will add this during image build.<b=
r>
&gt; Can anyone please let me know what is missing here?<br>
<br>
What makes you think update-ca-certificates is run during the build? I<br>
don&#39;t remember Buildroot having anything that does this.<br>
<br>
Best regards,<br>
<br>
Thomas<br>
-- <br>
Thomas Petazzoni, co-owner and CEO, Bootlin<br>
Embedded Linux and Kernel engineering and training<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer" target=3D"_blank">https:=
//bootlin.com</a><br>
</blockquote></div>

--000000000000e8da0405f4f8edba--

--===============8249485345006788541==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8249485345006788541==--
