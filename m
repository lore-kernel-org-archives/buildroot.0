Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76D99C433EF
	for <buildroot@archiver.kernel.org>; Thu, 17 Mar 2022 22:01:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0744560A4F;
	Thu, 17 Mar 2022 22:01:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kAfgRkNKQsWz; Thu, 17 Mar 2022 22:01:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C36E060AD0;
	Thu, 17 Mar 2022 22:01:00 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2FDBF1BF315
 for <buildroot@lists.busybox.net>; Thu, 17 Mar 2022 22:00:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 294FA403E0
 for <buildroot@lists.busybox.net>; Thu, 17 Mar 2022 22:00:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XvHLZtagBuhi for <buildroot@lists.busybox.net>;
 Thu, 17 Mar 2022 22:00:57 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-il1-x12e.google.com (mail-il1-x12e.google.com
 [IPv6:2607:f8b0:4864:20::12e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 94CEF40183
 for <buildroot@buildroot.org>; Thu, 17 Mar 2022 22:00:57 +0000 (UTC)
Received: by mail-il1-x12e.google.com with SMTP id i2so3640242ila.2
 for <buildroot@buildroot.org>; Thu, 17 Mar 2022 15:00:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=TeMv9q1+le5yuVNK8gOA246298GNp/HBR8fTwo2uxH0=;
 b=VTnCtnHid1FVLfryH6+SDzHUb3EK5ZWSO/wHM3GjqkMIUevjEUgAUzVa4CUjqkqUFy
 4jpegKoDLAaIF6Epb5gUkqdb4atXHGMZQWa4fcWQxROp32CkiXZp6qf9I6X/GL/HNLfI
 2LpP6rpMfHTSBur+CaqGn4ghxkwE1QxrA4m0qFY18uSbFPS9XmA4MdmDs8clh+7BwQxZ
 X+v46m7ZHu7D7JBaVLzGmg9cKWEhP6sxrFUeSIw3ksqrGKl8hX+VLtrc4RCop9G4J8UP
 ZkBNn+WamVI7l37/qDMSdXC8uTqaBekPxBeE2IvQFfmrICCavnj/6s4RIrCZfBE4y0tI
 rigg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TeMv9q1+le5yuVNK8gOA246298GNp/HBR8fTwo2uxH0=;
 b=NpCnQm1D6oYjVdN1UfPTWnYfelEsh6hrIbPYXfh2Imgt8w1+XbCdZoXIu3x93WqIV2
 Ce9joT7YVNFbe52xikREnZg3Vy8Xx/i2NGmFSFnxuH6mI6oARFg4abRcXhDk0zo3X3Ra
 Mr1MySCSgeKvY5xKP0vznDSIwiQ7xbyu1nalcRuaD9WLmw4Wl/j5wjfGEtaFvudPoP/1
 kJL/3PJfqa9LhdMnZjjLmuOben1kw1OdE8/caymDZD9TOmOai3VWBAT5WV2/cS2Ofu9s
 FftyakVFgaGA9FMQkWrFimhcjifJUh7XqeCRS0A47j+uIvXAq2a3Jhh5J1g5NKPnvXSF
 +5aA==
X-Gm-Message-State: AOAM531H/ftLZASWzm5wG0nINeDBoxie+KYo0Hgv5QyOzXAtStaU61fd
 Yd6Y2dMBpMl2eYfNVu208bRhjRZlUNTzQWbIlecb192ysrUCIg==
X-Google-Smtp-Source: ABdhPJxh29bDW1AOc5+dP7I27I1DvZKD9GA6QJuLZ8NGnzRgjr3FlQLseFl5o2JHa6reZZoar11KLvq3wUX2sYKerLI=
X-Received: by 2002:a92:c261:0:b0:2c7:c60d:cb78 with SMTP id
 h1-20020a92c261000000b002c7c60dcb78mr3281796ild.213.1647554456613; Thu, 17
 Mar 2022 15:00:56 -0700 (PDT)
MIME-Version: 1.0
References: <CADYjeSuE2XuTiRYno_TJ=2RmJxjeSSca=Lx8vc5iYfhNRkx44Q@mail.gmail.com>
 <9fd77043-72b7-d337-d871-76918570ef35@mind.be>
In-Reply-To: <9fd77043-72b7-d337-d871-76918570ef35@mind.be>
From: Sourabh Hegde <hrsourabh011@gmail.com>
Date: Thu, 17 Mar 2022 23:00:45 +0100
Message-ID: <CADYjeSsU6S94FJV+zHmbQF63+5vx2oMeGxW84LAKjVu2Os4fwg@mail.gmail.com>
To: Arnout Vandecappelle <arnout@mind.be>
Subject: Re: [Buildroot] How to run sshd deamon with read-only fs?
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
Content-Type: multipart/mixed; boundary="===============7142208088869491703=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============7142208088869491703==
Content-Type: multipart/alternative; boundary="0000000000002279f305da712ae5"

--0000000000002279f305da712ae5
Content-Type: text/plain; charset="UTF-8"

Hello Arnout,

Thanks for the answer. I will try to implement the above solution.

But I wanted ssh connection to transfer files to board. I tried with "scp"
but I get:

ssh: connect to host 192.168.x.xxx port 22: Connection refused
lost connection

Since there is no sshd running, scp won't be an option I think.

Is there any other way to copy files to board?


On Thu, 17 Mar 2022 at 22:05, Arnout Vandecappelle <arnout@mind.be> wrote:

>
>
> On 17/03/2022 15:45, Sourabh Hegde wrote:
> > Hello All,
> >
> > I am facing an issue while running OpenSSH demon in Buildroot 2022
> release.
> >
> > The output of "systemctl status sshd" results in
> >
> > sshd.service - OpenSSH server daemon
> >       Loaded: loaded (/usr/lib/systemd/system/sshd.service; enabled;
> vendor prese
> >       Active: failed (Result: exit-code) since Tue 2022-01-18 13:16:03
> UTC; 9min
> >      Process: 1703 ExecStartPre=/usr/bin/ssh-keygen -A (code=exited,
> status=0/SUC
> >      Process: 1704 ExecStart=/usr/sbin/sshd -D -e (code=exited,
> status=1/FAILURE)
> >     Main PID: 1704 (code=exited, status=1/FAILURE)
> >          CPU: 27ms
> >
> > Jan 18 13:16:02 br2rauc systemd[1]: Starting OpenSSH server daemon...
> > Jan 18 13:16:03 br2rauc ssh-keygen[1703]: ssh-keygen: generating new
> host keys:
> > Jan 18 13:16:03 br2rauc ssh-keygen[1703]: ssh-keygen: generating new
> host keys:
> > Jan 18 13:16:03 br2rauc ssh-keygen[1703]: ssh-keygen: generating new
> host keys:
> > Jan 18 13:16:03 br2rauc ssh-keygen[1703]: ssh-keygen: generating new
> host keys:
> > Jan 18 13:16:03 br2rauc systemd[1]: Started OpenSSH server daemon.
> > Jan 18 13:16:03 br2rauc sshd[1704]: sshd: no hostkeys available --
> exiting.
> > Jan 18 13:16:03 br2rauc systemd[1]: sshd.service: Main process exited,
> code=exit
> > Jan 18 13:16:03 br2rauc systemd[1]: sshd.service: Failed with result
> 'exit-code'
> >
> > # ps aux | grep ssh
> >    253 root     grep ssh
> >
> > So, there is not sshd deamon running. And also no key files present in
> /etc/ssh/
> >
> > I ran "/usr/bin/ssh-keygen -A" manually but this gives:
> >
> > ssh-keygen: generating new host keys: RSA Could not save your private
> key in
> > /etc/ssh/ssh_host_rsa_key.XXXXUBHAIv: Read-only file system
> > ssh-keygen: generating new host keys: DSA Could not save your private
> key in
> > /etc/ssh/ssh_host_dsa_key.XXXXq0KiIl: Read-only file system
> > ssh-keygen: generating new host keys: ECDSA Could not save your private
> key in
> > /etc/ssh/ssh_host_ecdsa_key.XXXXibybTV: Read-only file system
> > ssh-keygen: generating new host keys: ED25519 Could not save your
> private key in
> > /etc/ssh/ssh_host_ed25519_key.XXXXzI2JnB: Read-only file system
> >
> > Yes, I do have a Read-only file system. But is it not possible to work
> with a
> > read-only filesystem and ssh?
>
>   Indeed, ssh daemon with readonly rootfs requires special treatment.
> Someone
> has gone through the effort for dropbear, but not for openssh.
>
>   Basically, how it is solved for dropbear is:
>
> - build time, create a symlink from /etc/dropbear to /var/run/dropbear
> (/var/run
> is a writeable tmpfs).
> - runtime, in the init script and in the systemd service file, check if
> /etc/dropbear is a symlink to tmpfs. If yes, try to remove the symlink. If
> that
> succeeds, the rootfs is writeable and the keys can be generated there. If
> the
> remove failed, the symlink is still there, and the key generation
> succeeds. If
> it's not a symlink, the rootfs was modified so either it's writeable, or
> the
> keys are already there (or they're not and there's nothing we can do about
> it).
>
>   For openssh it will be even more complicated, because /etc/sshd contains
> the
> config file as well as the keys. So you probably need to change the config
> to
> put the keys in a different place before you can use the same trick.
>
>   If you manage to solve this, please send a patch to the list for others
> to enjoy!
>
>
>   Oh, and the usual solution is that you have a different partition that
> is
> writeable, and make /etc/sshd a symlink to that in the rootfs overlay. But
> you
> still have to make sure then that the directory is created if it doesn't
> exist
> yet, and you still have the problem of the config file being in the same
> directory as the keys.
>
>
>   Regards,
>   Arnout
>
>
> >
> > In the menuconfig I have:
> >
> > OpenSSH.PNG
> >
> > Can anyone please let me know if there is a workaround? Is
> changing rootfs to
> > r/w is the only solution?
> >
> > Does selecting "System Configuration"-->"remount root filesystem
> read-write
> > during boot" will do the trick?
> >
> > Your help will be much appreciated.
> >
> > Thanks in advance,
> >
> > -Sourabh
> >
> >
> > _______________________________________________
> > buildroot mailing list
> > buildroot@buildroot.org
> > https://lists.buildroot.org/mailman/listinfo/buildroot
>

--0000000000002279f305da712ae5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello=C2=A0Arnout,<div><br></div><div>Thanks for the answe=
r. I will try to implement the above solution.</div><div><br></div><div>But=
 I wanted ssh connection to transfer files to board. I tried with &quot;scp=
&quot; but I get:</div><div><br></div><div><pre style=3D"margin-top:0px;pad=
ding:12px;border:0px;font-variant-numeric:inherit;font-variant-east-asian:i=
nherit;font-stretch:inherit;line-height:1.30769;font-size:13px;vertical-ali=
gn:baseline;box-sizing:inherit;width:auto;max-height:600px;overflow:auto;bo=
rder-radius:5px"><code style=3D"margin:0px;padding:0px;border:0px;font-styl=
e:inherit;font-variant:inherit;font-weight:inherit;font-stretch:inherit;lin=
e-height:inherit;vertical-align:baseline;box-sizing:inherit;background-colo=
r:transparent;white-space:inherit;border-radius:0px">ssh: connect to host 1=
92.168.x.xxx port 22: Connection refused
lost connection</code></pre><pre style=3D"margin-top:0px;padding:12px;borde=
r:0px;font-variant-numeric:inherit;font-variant-east-asian:inherit;font-str=
etch:inherit;line-height:1.30769;font-size:13px;vertical-align:baseline;box=
-sizing:inherit;width:auto;max-height:600px;overflow:auto;border-radius:5px=
"><code style=3D"margin:0px;padding:0px;border:0px;font-style:inherit;font-=
variant:inherit;font-weight:inherit;font-stretch:inherit;line-height:inheri=
t;vertical-align:baseline;box-sizing:inherit;background-color:transparent;w=
hite-space:inherit;border-radius:0px"><font face=3D"arial, sans-serif">Sinc=
e there is no sshd running, scp won&#39;t be an option I think.</font></cod=
e></pre><pre style=3D"margin-top:0px;padding:12px;border:0px;font-variant-n=
umeric:inherit;font-variant-east-asian:inherit;font-stretch:inherit;line-he=
ight:1.30769;font-size:13px;vertical-align:baseline;box-sizing:inherit;widt=
h:auto;max-height:600px;overflow:auto;border-radius:5px"><code style=3D"mar=
gin:0px;padding:0px;border:0px;font-style:inherit;font-variant:inherit;font=
-weight:inherit;font-stretch:inherit;line-height:inherit;vertical-align:bas=
eline;box-sizing:inherit;background-color:transparent;white-space:inherit;b=
order-radius:0px"><font face=3D"arial, sans-serif">Is there any other way t=
o copy files to board? </font></code></pre></div></div><br><div class=3D"gm=
ail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, 17 Mar 2022 at 22:=
05, Arnout Vandecappelle &lt;<a href=3D"mailto:arnout@mind.be">arnout@mind.=
be</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
"><br>
<br>
On 17/03/2022 15:45, Sourabh Hegde wrote:<br>
&gt; Hello All,<br>
&gt; <br>
&gt; I am facing an issue while running OpenSSH demon=C2=A0in Buildroot 202=
2 release.<br>
&gt; <br>
&gt; The output of &quot;systemctl status sshd&quot; results in<br>
&gt; <br>
&gt; sshd.service - OpenSSH server daemon<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0Loaded: loaded (/usr/lib/systemd/system/sshd=
.service; enabled; vendor prese<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0Active: failed (Result: exit-code) since Tue=
 2022-01-18 13:16:03 UTC; 9min<br>
&gt;=C2=A0 =C2=A0 =C2=A0 Process: 1703 ExecStartPre=3D/usr/bin/ssh-keygen -=
A (code=3Dexited, status=3D0/SUC<br>
&gt;=C2=A0 =C2=A0 =C2=A0 Process: 1704 ExecStart=3D/usr/sbin/sshd -D -e (co=
de=3Dexited, status=3D1/FAILURE)<br>
&gt;=C2=A0 =C2=A0 =C2=A0Main PID: 1704 (code=3Dexited, status=3D1/FAILURE)<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 CPU: 27ms<br>
&gt; <br>
&gt; Jan 18 13:16:02 br2rauc systemd[1]: Starting OpenSSH server daemon...<=
br>
&gt; Jan 18 13:16:03 br2rauc ssh-keygen[1703]: ssh-keygen: generating new h=
ost keys:<br>
&gt; Jan 18 13:16:03 br2rauc ssh-keygen[1703]: ssh-keygen: generating new h=
ost keys:<br>
&gt; Jan 18 13:16:03 br2rauc ssh-keygen[1703]: ssh-keygen: generating new h=
ost keys:<br>
&gt; Jan 18 13:16:03 br2rauc ssh-keygen[1703]: ssh-keygen: generating new h=
ost keys:<br>
&gt; Jan 18 13:16:03 br2rauc systemd[1]: Started OpenSSH server daemon.<br>
&gt; Jan 18 13:16:03 br2rauc sshd[1704]: sshd: no hostkeys available -- exi=
ting.<br>
&gt; Jan 18 13:16:03 br2rauc systemd[1]: sshd.service: Main process exited,=
 code=3Dexit<br>
&gt; Jan 18 13:16:03 br2rauc systemd[1]: sshd.service: Failed with result &=
#39;exit-code&#39;<br>
&gt; <br>
&gt; # ps aux | grep ssh<br>
&gt;=C2=A0 =C2=A0 253 root =C2=A0 =C2=A0 grep ssh<br>
&gt; <br>
&gt; So, there is not sshd deamon=C2=A0running. And also no key files prese=
nt in /etc/ssh/<br>
&gt; <br>
&gt; I ran &quot;/usr/bin/ssh-keygen -A&quot; manually but this gives:<br>
&gt; <br>
&gt; ssh-keygen: generating new host keys: RSA Could not save your private =
key in <br>
&gt; /etc/ssh/ssh_host_rsa_key.XXXXUBHAIv: Read-only file system<br>
&gt; ssh-keygen: generating new host keys: DSA Could not save your private =
key in <br>
&gt; /etc/ssh/ssh_host_dsa_key.XXXXq0KiIl: Read-only file system<br>
&gt; ssh-keygen: generating new host keys: ECDSA Could not save your privat=
e key in <br>
&gt; /etc/ssh/ssh_host_ecdsa_key.XXXXibybTV: Read-only file system<br>
&gt; ssh-keygen: generating new host keys: ED25519 Could not save your priv=
ate key in <br>
&gt; /etc/ssh/ssh_host_ed25519_key.XXXXzI2JnB: Read-only file system<br>
&gt; <br>
&gt; Yes, I do have a Read-only file system. But is it not possible to work=
 with a <br>
&gt; read-only filesystem and ssh?<br>
<br>
=C2=A0 Indeed, ssh daemon with readonly rootfs requires special treatment. =
Someone <br>
has gone through the effort for dropbear, but not for openssh.<br>
<br>
=C2=A0 Basically, how it is solved for dropbear is:<br>
<br>
- build time, create a symlink from /etc/dropbear to /var/run/dropbear (/va=
r/run <br>
is a writeable tmpfs).<br>
- runtime, in the init script and in the systemd service file, check if <br=
>
/etc/dropbear is a symlink to tmpfs. If yes, try to remove the symlink. If =
that <br>
succeeds, the rootfs is writeable and the keys can be generated there. If t=
he <br>
remove failed, the symlink is still there, and the key generation succeeds.=
 If <br>
it&#39;s not a symlink, the rootfs was modified so either it&#39;s writeabl=
e, or the <br>
keys are already there (or they&#39;re not and there&#39;s nothing we can d=
o about it).<br>
<br>
=C2=A0 For openssh it will be even more complicated, because /etc/sshd cont=
ains the <br>
config file as well as the keys. So you probably need to change the config =
to <br>
put the keys in a different place before you can use the same trick.<br>
<br>
=C2=A0 If you manage to solve this, please send a patch to the list for oth=
ers to enjoy!<br>
<br>
<br>
=C2=A0 Oh, and the usual solution is that you have a different partition th=
at is <br>
writeable, and make /etc/sshd a symlink to that in the rootfs overlay. But =
you <br>
still have to make sure then that the directory is created if it doesn&#39;=
t exist <br>
yet, and you still have the problem of the config file being in the same <b=
r>
directory as the keys.<br>
<br>
<br>
=C2=A0 Regards,<br>
=C2=A0 Arnout<br>
<br>
<br>
&gt; <br>
&gt; In the menuconfig I have:<br>
&gt; <br>
&gt; OpenSSH.PNG<br>
&gt; <br>
&gt; Can anyone please let me know if there is a workaround? Is changing=C2=
=A0rootfs to=C2=A0 <br>
&gt; r/w is the only solution?<br>
&gt; <br>
&gt; Does selecting &quot;System Configuration&quot;--&gt;&quot;remount roo=
t filesystem read-write <br>
&gt; during boot&quot; will do the trick?<br>
&gt; <br>
&gt; Your help will be much appreciated.<br>
&gt; <br>
&gt; Thanks in advance,<br>
&gt; <br>
&gt; -Sourabh<br>
&gt; <br>
&gt; <br>
&gt; _______________________________________________<br>
&gt; buildroot mailing list<br>
&gt; <a href=3D"mailto:buildroot@buildroot.org" target=3D"_blank">buildroot=
@buildroot.org</a><br>
&gt; <a href=3D"https://lists.buildroot.org/mailman/listinfo/buildroot" rel=
=3D"noreferrer" target=3D"_blank">https://lists.buildroot.org/mailman/listi=
nfo/buildroot</a><br>
</blockquote></div>

--0000000000002279f305da712ae5--

--===============7142208088869491703==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7142208088869491703==--
