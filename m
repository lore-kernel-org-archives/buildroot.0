Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C29E1C43219
	for <buildroot@archiver.kernel.org>; Thu, 24 Nov 2022 19:00:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1690C60C24;
	Thu, 24 Nov 2022 19:00:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1690C60C24
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jbEm3avnY8TE; Thu, 24 Nov 2022 19:00:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 392DF60BE7;
	Thu, 24 Nov 2022 19:00:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 392DF60BE7
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id EE5F81BF375
 for <buildroot@lists.busybox.net>; Thu, 24 Nov 2022 19:00:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C9CD660BE7
 for <buildroot@lists.busybox.net>; Thu, 24 Nov 2022 19:00:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C9CD660BE7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zInEVWs3XYiA for <buildroot@lists.busybox.net>;
 Thu, 24 Nov 2022 19:00:15 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 09D2160B8A
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com
 [IPv6:2607:f8b0:4864:20::102e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 09D2160B8A
 for <buildroot@buildroot.org>; Thu, 24 Nov 2022 19:00:14 +0000 (UTC)
Received: by mail-pj1-x102e.google.com with SMTP id
 k2-20020a17090a4c8200b002187cce2f92so5815021pjh.2
 for <buildroot@buildroot.org>; Thu, 24 Nov 2022 11:00:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=A16uyzyu+5mvwW5kHMCd03YOtnljOTTt9VfCrnY9JnA=;
 b=N7K7/AQTmxEgAQmzw+ekURfnN2v8Os77uDDTNzKmVhw1ErfgcaFdgw7uv7C+Ko3L1l
 MIpKTRL8NTVUuwy+u+RbkaOU96N4V8l3ToixtBkId8pbu60MV/YCLf7HzVJ4VR1xBxrO
 y7fRq3fb4ruJwzm1GHznBOthAIjGFyMEB38AvZ5Cxb7EXPaKOM3UIZV+MAb8Au6PjfT7
 uDXQWpPM2iLqSEtMgCLzihZPEXKziHoVHGZl4yJ3BOJYVS0Q2MDIhoA7kIl31pSbsqFt
 scyWwaN6Rvl4PRS4X019ClMDRkux6dvbRm5E0BlU0GIWiI8SY2LqkACPmJIv/f8eX5r4
 wFqA==
X-Gm-Message-State: ANoB5pkWCfNVOCahnHDcNioMKrmtpA3FjCqaNsfEHw+Yv50S4T1Tq3OY
 kmau+zT95gzhdwPVvMwYLavGNw2sB6s0dFnth3eoO56J
X-Google-Smtp-Source: AA0mqf7lIB69HWo7MnmE2jAM3aCpHqqQu1+DEboRkv27H+Fmbp3OilLVUCDjBTwvlkTz5hy2mGXbWJ+6ZGY7C8n5gHQ=
X-Received: by 2002:a17:902:ab46:b0:186:8502:cde5 with SMTP id
 ij6-20020a170902ab4600b001868502cde5mr16709202plb.121.1669316414320; Thu, 24
 Nov 2022 11:00:14 -0800 (PST)
MIME-Version: 1.0
References: <mailman.9442.1669275362.179200.buildroot@buildroot.org>
 <cd5a955627dfcf09eefb5e58c355bd4b@umbiko.net>
In-Reply-To: <cd5a955627dfcf09eefb5e58c355bd4b@umbiko.net>
From: Charles Lohr <lohr85@gmail.com>
Date: Thu, 24 Nov 2022 11:00:03 -0800
Message-ID: <CAGu26P-uy3k2p4zsSPJawoqii3gRVW2ZVppdj7HbfET8cPftGg@mail.gmail.com>
To: Andreas Ziegler <br015@umbiko.net>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=A16uyzyu+5mvwW5kHMCd03YOtnljOTTt9VfCrnY9JnA=;
 b=pAU9vmODj0lXT/7WYXBnQjoERvoaaMI+K5z0/l7Fh0BhEAqGfjjkEwi5ME11Mio59D
 hkiaBFAg/DymfHyrH7EnFb4IMVqNHIOsvKC2DAUrz/AJzr1EPP1rg2B99x7flzZOAvs+
 ZfoDEAIsNSuVHnLToSFxOpgtpUZqpZXYsUBWKEesWKSKSlsOxkpBCFQy37gUXjMbnMjQ
 VhqtEBXpqFsAYbOi7IJC5ax30wQX85qtMfaqG3RPXk01uVWccLqhRLyEa8mm7sFErB9n
 2f0zIK8CsPxqOY3wFVVYHbZf3sbUWaL+P/3qmq78o9eYOyNI601m4Hfg46hFlCoXR9yj
 /r9Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=pAU9vmOD
Subject: Re: [Buildroot] CPIO Kernel Image Build Order for initramfs
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
Content-Type: multipart/mixed; boundary="===============3630977643300342341=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3630977643300342341==
Content-Type: multipart/alternative; boundary="000000000000e4b72205ee3c03bd"

--000000000000e4b72205ee3c03bd
Content-Type: text/plain; charset="UTF-8"

Thank you!

On Thu, Nov 24, 2022, 04:00 Andreas Ziegler <br015@umbiko.net> wrote:

> Hi Charles,
>
> On 2022-11-21 06:26, Charles Lohr <lohr85@gmail.com> wrote:
> > (Forgive me if this list isn't for questions, please direct me to the
> > right
> > place. This is my first message to the list)
> >
> > I want to build full executable images, with the rootfs built into the
> > kernel without compression, so I'm using CPIO.  But, buildroot doesn't
> > seem
> > to like this when starting from a clean slate.
>
> You can enable this under 'Filesystem images' -> 'Initial RAM filesystem
> linked into Linux kernel' (BR2_TARGET_ROOTFS_INITRAMFS). This will
> execute the steps you now perform manually.
>
> > It wants to build the kernel before the image, but if I do that, I get
> > this
> > error.
> >
> > make[4]: *** No rule to make target '../../images/rootfs.cpio', needed
> > by
> > 'usr/initramfs_inc_data'.  Stop.
> >
> > Right now, my process is: touch an empty images/rootfs.cpio file,
> > compile,
> > touch the kernel config, recompile and this works but it's yucky.
> >
> > What is the "right" answer?
> >
> > Charles
>
> Kind regards,
> Andreas
>

--000000000000e4b72205ee3c03bd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Thank you!</div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Thu, Nov 24, 2022, 04:00 Andreas Ziegler &=
lt;<a href=3D"mailto:br015@umbiko.net">br015@umbiko.net</a>&gt; wrote:<br><=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-le=
ft:1px #ccc solid;padding-left:1ex">Hi Charles,<br>
<br>
On 2022-11-21 06:26, Charles Lohr &lt;<a href=3D"mailto:lohr85@gmail.com" t=
arget=3D"_blank" rel=3D"noreferrer">lohr85@gmail.com</a>&gt; wrote:<br>
&gt; (Forgive me if this list isn&#39;t for questions, please direct me to =
the <br>
&gt; right<br>
&gt; place. This is my first message to the list)<br>
&gt; <br>
&gt; I want to build full executable images, with the rootfs built into the=
<br>
&gt; kernel without compression, so I&#39;m using CPIO.=C2=A0 But, buildroo=
t doesn&#39;t <br>
&gt; seem<br>
&gt; to like this when starting from a clean slate.<br>
<br>
You can enable this under &#39;Filesystem images&#39; -&gt; &#39;Initial RA=
M filesystem <br>
linked into Linux kernel&#39; (BR2_TARGET_ROOTFS_INITRAMFS). This will <br>
execute the steps you now perform manually.<br>
<br>
&gt; It wants to build the kernel before the image, but if I do that, I get=
 <br>
&gt; this<br>
&gt; error.<br>
&gt; <br>
&gt; make[4]: *** No rule to make target &#39;../../images/rootfs.cpio&#39;=
, needed <br>
&gt; by<br>
&gt; &#39;usr/initramfs_inc_data&#39;.=C2=A0 Stop.<br>
&gt; <br>
&gt; Right now, my process is: touch an empty images/rootfs.cpio file, <br>
&gt; compile,<br>
&gt; touch the kernel config, recompile and this works but it&#39;s yucky.<=
br>
&gt; <br>
&gt; What is the &quot;right&quot; answer?<br>
&gt; <br>
&gt; Charles<br>
<br>
Kind regards,<br>
Andreas<br>
</blockquote></div>

--000000000000e4b72205ee3c03bd--

--===============3630977643300342341==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3630977643300342341==--
