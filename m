Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9C26C433EF
	for <buildroot@archiver.kernel.org>; Wed, 23 Mar 2022 14:01:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 66DD4403AE;
	Wed, 23 Mar 2022 14:01:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id doDT7GXsOekn; Wed, 23 Mar 2022 14:01:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 90418400FE;
	Wed, 23 Mar 2022 14:01:38 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6768E1BF57B
 for <buildroot@lists.busybox.net>; Wed, 23 Mar 2022 14:01:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 54851400FE
 for <buildroot@lists.busybox.net>; Wed, 23 Mar 2022 14:01:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tEEtvFo1Cyuw for <buildroot@lists.busybox.net>;
 Wed, 23 Mar 2022 14:01:35 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-qk1-x72d.google.com (mail-qk1-x72d.google.com
 [IPv6:2607:f8b0:4864:20::72d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3B54C400D0
 for <buildroot@buildroot.org>; Wed, 23 Mar 2022 14:01:35 +0000 (UTC)
Received: by mail-qk1-x72d.google.com with SMTP id g8so1082556qke.2
 for <buildroot@buildroot.org>; Wed, 23 Mar 2022 07:01:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=j6oaDhrmfAeclKh8oglzN/oYZEpN3HWTDPWNMr31njU=;
 b=dp6SWM13huE+MFRPwGHctyPJmwxwuCQP6yFmCG8IazYUSLuFKliajuYm3cOjo6YtU7
 5fuqcY25V0fQlLD05tonSAPMwJoBQfTht+DIEPOKBn1udRrQ8C/gtX4SwNRlK2Mtw6T9
 A7LN8zBh068ONpAnId8+UPVeia4k2q7bXmKZdDZR3xrQpcwbaotc+wiLjWw0ydQXuEeH
 ZGcXv8mSbC+lRkjRA+3gxffbqs612y/dl0JV9c+8gHy6G2IMdTN4S/Pn7aYZT485ESyn
 lGQOH6evWC3p+06Y7N6eDXgL3JGcOW1gxnAPv+f1pP6fRyoaN+3lrA7ZnppLRyVn/H0r
 tTEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=j6oaDhrmfAeclKh8oglzN/oYZEpN3HWTDPWNMr31njU=;
 b=yZ+QQIqpDESf6wh1IO/TUQ/nJ5I06dqXbavbRRoEi+ufM5vOo6uwRobw6LHrD+UsBv
 gbFH3UE6/ZQpGzBRN1qIwT7fW4XP1GbPyIg2DzD89EaUo27tLmmS4O+YWTl2N+O/vfX7
 5ycrOp71G3jT+uylpz94pJnpGKfy2DPFTHx8vcx4dr/yxGO8lk4GrIdPv8zFWrF4NAdD
 Xv5TdUJocd8n0qh6LuDwflYJz8r3ZB19FmOXEobV7izSCZHRh5/oggQRsM39WrjMYFD8
 ObxnGZmpB00K1Dg6nDThweV+SwzpVOeqnEluHCAYJx3GebpbCW+wTw6mlySRcM7Yl2kP
 dFaA==
X-Gm-Message-State: AOAM533syknaUwasEgNcmPZ/og0JOYiuQ3SMrtZf4cFLctP11XBdt8Cu
 ieJKqu3DsXTYDpkz/jqFjspqi6M0nAxwpVPdcwAX7rixWE0=
X-Google-Smtp-Source: ABdhPJxZXi8mDbQ9N47h065LXxnicgZQKRCqmk5G+SVM9DpI724yjAxhOVlzHvNSc7kRz/swB4xfNtV+t+Xh/d7NxLE=
X-Received: by 2002:a05:620a:4409:b0:67d:af50:e422 with SMTP id
 v9-20020a05620a440900b0067daf50e422mr17583448qkp.405.1648044093858; Wed, 23
 Mar 2022 07:01:33 -0700 (PDT)
MIME-Version: 1.0
References: <CACaKL1wxLACzdRqojEaji9p70okZ+EcBMJkUNOwYuDyvU-5AuQ@mail.gmail.com>
 <6aaa39df-836f-055e-6f40-a077f690b669@mind.be>
In-Reply-To: <6aaa39df-836f-055e-6f40-a077f690b669@mind.be>
From: Jacques Samoun <jacques.samoun33@gmail.com>
Date: Wed, 23 Mar 2022 16:01:23 +0200
Message-ID: <CACaKL1yd+73B=tZvQadGKVku0sfuWt50SGyL7VW25GhxOdvtwQ@mail.gmail.com>
To: Arnout Vandecappelle <arnout@mind.be>
Subject: Re: [Buildroot] cannot make the device_table
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
Cc: Buildroot Mailing List <buildroot@buildroot.org>
Content-Type: multipart/mixed; boundary="===============5556983070995311357=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============5556983070995311357==
Content-Type: multipart/alternative; boundary="000000000000c9eee405dae32a64"

--000000000000c9eee405dae32a64
Content-Type: text/plain; charset="UTF-8"

Hi Arnout

sorry for this delay. Indeed i was meaning doing a "ls -ls /dev/tty*" after
boot.
I was expecting to see there that the rights and group are like in the
device_table.txt
But it is not.

Jacques

On Tue, Mar 8, 2022 at 12:36 AM Arnout Vandecappelle <arnout@mind.be> wrote:

>
>
> On 06/03/2022 13:46, Jacques Samoun wrote:
> > Hello,
> > despite all my tries, i just cannot make the "device_table" feature work
> as
> > described in the manual.
> > Basically, i am trying to set 666 rights to /dev/tty + add a dialout
> group, so i
> > created the following file (device_table.txt"
> >
> > /dev/tty c 666 root dialout 5 0 - - -
> >
> > and have set the correct variable in menuconfig. I know for sure that
> the build
> > has handled this file ... but looking at the /dev/tty, it is clear that
> nothing
> > has happened, the permissions are still 600 and the dialout group has
> not been set.
>
>   When you say "looking at /dev/tty", do you mean looking at the contents
> of the
> tarball (or rootfs), or do you mean what appears after boot? Unless you
> have a
> very specific configuration (i.e. device managemnt: Static using device
> table),
> /dev will be a devtmpfs and the kernel will override anything you have set
> in
> device_table. So in that case you need dynamic handling using udev or mdev.
>
>
>   Regards,
>   Arnout
>
> >
> > Am I missing something ?
> >
> > _______________________________________________
> > buildroot mailing list
> > buildroot@buildroot.org
> > https://lists.buildroot.org/mailman/listinfo/buildroot
>

--000000000000c9eee405dae32a64
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Arnout<div><br></div><div>sorry for this delay. Indeed =
i was meaning=C2=A0doing a &quot;ls -ls /dev/tty*&quot; after boot.</div><d=
iv>I was expecting to see there that the rights and group are like in the d=
evice_table.txt</div><div>But it is not.</div><div><br></div><div>Jacques</=
div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_at=
tr">On Tue, Mar 8, 2022 at 12:36 AM Arnout Vandecappelle &lt;<a href=3D"mai=
lto:arnout@mind.be">arnout@mind.be</a>&gt; wrote:<br></div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex"><br>
<br>
On 06/03/2022 13:46, Jacques Samoun wrote:<br>
&gt; Hello,<br>
&gt; despite all my tries, i just cannot make the &quot;device_table&quot; =
feature work as <br>
&gt; described in the manual.<br>
&gt; Basically, i am trying to set 666 rights to /dev/tty + add a dialout g=
roup, so i <br>
&gt; created the following file (device_table.txt&quot;<br>
&gt; <br>
&gt; /dev/tty c 666 root dialout 5 0 - - -<br>
&gt; <br>
&gt; and have set the correct variable in menuconfig. I know for sure that =
the build <br>
&gt; has handled this file ... but looking at the /dev/tty, it is clear tha=
t nothing <br>
&gt; has happened, the permissions are still 600 and the dialout group has =
not been set.<br>
<br>
=C2=A0 When you say &quot;looking at /dev/tty&quot;, do you mean looking at=
 the contents of the <br>
tarball (or rootfs), or do you mean what appears after boot? Unless you hav=
e a <br>
very specific configuration (i.e. device managemnt: Static using device tab=
le), <br>
/dev will be a devtmpfs and the kernel will override anything you have set =
in <br>
device_table. So in that case you need dynamic handling using udev or mdev.=
<br>
<br>
<br>
=C2=A0 Regards,<br>
=C2=A0 Arnout<br>
<br>
&gt; <br>
&gt; Am I missing something ?<br>
&gt; <br>
&gt; _______________________________________________<br>
&gt; buildroot mailing list<br>
&gt; <a href=3D"mailto:buildroot@buildroot.org" target=3D"_blank">buildroot=
@buildroot.org</a><br>
&gt; <a href=3D"https://lists.buildroot.org/mailman/listinfo/buildroot" rel=
=3D"noreferrer" target=3D"_blank">https://lists.buildroot.org/mailman/listi=
nfo/buildroot</a><br>
</blockquote></div>

--000000000000c9eee405dae32a64--

--===============5556983070995311357==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5556983070995311357==--
