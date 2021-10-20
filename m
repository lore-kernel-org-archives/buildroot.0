Return-Path: <SRS0=oNq7=PI=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40E8CC433EF
	for <buildroot@archiver.kernel.org>; Wed, 20 Oct 2021 15:44:02 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6177060FC3
	for <buildroot@archiver.kernel.org>; Wed, 20 Oct 2021 15:44:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6177060FC3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmx.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id EAE274011B;
	Wed, 20 Oct 2021 15:44:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kJuG7M2qzVtr; Wed, 20 Oct 2021 15:43:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id BCF62401BE;
	Wed, 20 Oct 2021 15:43:58 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 85FAB1BF426
 for <buildroot@lists.busybox.net>; Wed, 20 Oct 2021 15:43:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 73202401BE
 for <buildroot@lists.busybox.net>; Wed, 20 Oct 2021 15:43:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7uEHTkyThXi3 for <buildroot@lists.busybox.net>;
 Wed, 20 Oct 2021 15:43:55 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 626C74011B
 for <buildroot@buildroot.org>; Wed, 20 Oct 2021 15:43:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1634744633;
 bh=cYhrE/wh767fS9LzZfGJC4T8TjPGRseHbL8S5bcOf/Q=;
 h=X-UI-Sender-Class:From:To:Subject:Date;
 b=XnMGiQbY7I1WrDc14pLzISmphSewYC3XjWaPfnb33jjJuyJDLmatR3rf9T5YNkE++
 HGpam8iSp5HDfcPcHlHw4ANvpxzoUCKCT076j/LMhBaHD8qc21TI3e+veEWMjXK0ad
 f9coQaTYMpQwMTJqIHZIBi+4owwjji42K0o7YlLo=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [217.231.235.79] ([217.231.235.79]) by web-mail.gmx.net
 (3c-app-gmx-bs04.server.lan [172.19.170.53]) (via HTTP); Wed, 20 Oct 2021
 17:43:53 +0200
MIME-Version: 1.0
Message-ID: <trinity-dc4ab719-19de-44d9-91e5-8759fd281837-1634744633437@3c-app-gmx-bs04>
From: Steve <sleepy_dog@gmx.de>
To: buildroot@buildroot.org
Date: Wed, 20 Oct 2021 17:43:53 +0200
Importance: normal
Sensitivity: Normal
X-Priority: 3
X-Provags-ID: V03:K1:5v5/utFAJ6p8zxjp3NDRbsudYXvJtGVwZQZmNYDw+mGlvT8ebgWf0PIdt+IUTLzD7xdju
 J7DvMIK9cBJ3yP6WW5HmvipE5/KvU62lwkIKwtS4/zLqvb2oO9efIgQUYjzR2LDo7bA7wTkgtAjF
 sA3lPFFfyNR43lT3exWywiZFtmZSAlSVNWcG6LXTQPvx4FKsczGa0lqzJRYw5nf1/T1R07El83j8
 5EzjOlDRIiC8LIEOFx9wwJRVYN5SdIviYLImDwdyF2C/fnlIOQB186tsyEYRE3In+9S2mjTy/sn1
 Zs=
X-UI-Out-Filterresults: notjunk:1;V03:K0:zZdUMZYuHTg=:sSBmK6z2YGRuDOgKUrC8tS
 yOV9fQl278XofAsfp9zlHSc8sQoQsQaOV9rOR4oNC3p041uRba9cV3LEPQCFUI7gcavr1XYfq
 CI5bx2XM4Vn+pWX3Z//dbe/B5dEZTyWZUEZg3YIm56rCd+mwobGzHjz24JeKzBgL3WiV+ajYc
 oVeePtRiyi49CHUSgbCtbX0uSHujFmQz7dCQrFnH0HN6ByrgpACG9WEds2cSdc7MtI5y/l7+e
 K0649VyakRYk0EUZWMtjL9SJsqq3eKxSvNSybmNl2NAv+TKwoiTXk86LRKK4xnpCSFFL732Lm
 fIOIZ3apPysGsXZLElz62K2UJKR7Q6wD7LyOkGomrkI98QITkgBjpxndaqKqHIv44Jn6YUaQt
 nbdkP8WuU21PuYc+akdtrNfbrutg/b/D6DF/GyuXM5iHmurfZnyYe2So9GyoUyX7DkqgFG8O9
 z/PKtHB87fLLmpBWLumCy5R1FdlNe1yhZUnSEy7Hd0Po7su7p/i17cjnZXPh+WY6YuyGZwHwK
 kzAolKrDqMLpdQ6hBwzYat6yu0n4Lqxb6BzUSvuDGS+
Subject: Re: [Buildroot] openssh - kernel messages upon connection attempts
 (always ending with "connection reset" at the other end)
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
Content-Type: multipart/mixed; boundary="===============6849848213617817040=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6849848213617817040==
Content-Type: text/html; charset=UTF-8

<html><head></head><body><div style="font-family: Verdana;font-size: 12.0px;"><div style="font-family: Verdana;font-size: 12.0px;">
<div>Adding to the below, as for SELinux being there:<br/>
<br/>
Apparently, at least on normal systems, you&#39;d see a folder:&nbsp;
<pre><code>  /sys/kernel/security/selinux</code></pre>
<br/>
Is this diffeent for buildroot?<br/>
On the system in question, /sys/kernel/security is empty.<br/>
<br/>
There is a process &quot;kauditd&quot; running, but no other process containing &quot;audit&quot;. From what I read, kaudit is the kernel counterpart, and there should be a userspace matching process also?</div>

<div>&nbsp;</div>

<div>&nbsp;</div>

<div>(my previous mail, for reference)</div>

<div>--------------------------------------------------------------------------------</div>

<div>
<div>&gt; This comes from SELinux. However, the raspberrypi3_defconfig enables AppArmor, not SELinux (and AFAIK AppArmor doesn&#39;t give messages like this). So somehow you did something weird there...<br/>
<br/>
&gt; Anyway, the problem is that your AppArmor or SELinux setup is not correct to allow sshd.<br/>
&nbsp;</div>

<div>Ok, I was not aware I need to do any setup of those things beyond selecting them in menuconfig.<br/>
Need to look into that.<br/>
Any quick pointers?<br/>
<br/>
All I did after running&nbsp;raspberrypi3_defconfig was to select a bunch of extra packages.<br/>
To the aforementioned openssh, openvpn, nano, htop; also add gdb, gdbserver.<br/>
I also set things to external toolchain (the ARM 2021 GCC chain that was offered).<br/>
In linux-menuconfig, I removed a lot of USB drivers I don&#39;t need, set stuff to gadget-only mode (I&#39;m actually using a CM3+ module, no regular raspi3), and set DWC2 to load, stuff like that.<br/>
That&#39;s basically about it.<br/>
Since i don&#39;t know yet how to do that within buildroot, I then run a script to mount the 2 internal partitions within sdcard.img, overwrite the cmdline.txt and config.txt files in the boot partition with mine (which do some UART pin remap and tings like that; no change of other behavior),<br/>
and to the ext4 partition, the /root folder gets 2 of my custom executables copied into,&nbsp;the /etc/init.d folder gets an extra script calling one of those executables.<br/>
Then sync, umount, compress to 7z; and that&#39;s what I put on my raspi module.<br/>
From the log I see that my custom stuff gets executed as supposed, i.e. it is not (forever) blocking any of the other init.d stuff or something like that.<br/>
<br/>
I&#39;m not aware of changes to the default behavior of things except the mentioned adding of packages and script.<br/>
In case I selected anything else in menuconfig which my have weird requirements, menuconfig would have told me so, I guess? (I have seen some warning about something a while back, I added in a requirement after finding the magic &quot;show other packages&quot; option or some such, and it stopped complaining)<br/>
<br/>
&nbsp;</div>

<div>&nbsp;
<div style="margin: 10.0px 5.0px 5.0px 10.0px;padding: 10.0px 0 10.0px 10.0px;border-left: 2.0px solid rgb(195,217,229);">
<div style="margin: 0 0 10.0px 0;"><b>Von:</b>&nbsp;&quot;Arnout Vandecappelle&quot; &lt;arnout@mind.be&gt;<br/>
<br/>
On 20/10/2021 13:36, Steve wrote:<br/>
&gt; Hello all,<br/>
&gt;<br/>
&gt; I recently downloaded buildroot and used the default config for RasperryPi3,<br/>
&gt; altered to add openssh, among a couple other things.<br/>
&gt; (no idea whether that matters, I am using a USB connection from the raspi<br/>
&gt; running g_cdc driver (ethernet + serial gadget), and am trying to ssh into it<br/>
&gt; from the USB host computer the raspi is plugged into)<br/>
&gt;<br/>
&gt; I have found that root ssh&#39;ing into the machine is off by default. So I altered<br/>
&gt; the sshd_config to, for now, say yes to PermitRootLogin. (I&#39;ll look into how to<br/>
&gt; add a non-root user later - but this here *should* normally work, right? UNless<br/>
&gt; something is broken)<br/>
&gt; Still, on the computer that tries to SSH into the buildroot raspi, I get<br/>
&gt; &quot;connection reset&quot; immediately.<br/>
&gt;<br/>
&gt; There is a kernel message for each such attempt:<br/>
&gt; &nbsp; &quot;audit: type=1326 audit (time...) auid=... uid=1000 gid=1000 ses=... pid=...<br/>
&gt; comm=&quot;sshd&quot; exe=&quot;/usr/sbin/sshd&quot; sig=31 arch=40000028 syscall=413 compat=0<br/>
&gt; ip=... code=0x0&quot;<br/>
<br/>
This comes from SELinux. However, the raspberrypi3_defconfig enables AppArmor,<br/>
not SELinux (and AFAIK AppArmor doesn&#39;t give messages like this). So somehow you<br/>
did something weird there...<br/>
<br/>
Anyway, the problem is that your AppArmor or SELinux setup is not correct to<br/>
allow sshd.<br/>
<br/>
The htop problem might be the same.<br/>
<br/>
Regards,<br/>
Arnout<br/>
<br/>
&gt;<br/>
&gt; (the dots replace numbers I guess are pointless to type)<br/>
&gt;<br/>
&gt; I searched a bit around and found threads in forums with similar seeming<br/>
&gt; problems but somewhat different numbers in the message, claims of some problem<br/>
&gt; with this stuff and libc6 and linux versions prior to 5.1, well if I &quot;uname -a&quot;<br/>
&gt; here, it says &quot;5.10.46-v7&quot;, I guess that one should not have *that* problem,<br/>
&gt; unless it has nothing to do with that.<br/>
&gt;<br/>
&gt; Any ideas?<br/>
&gt;<br/>
&gt; _______________________________________________<br/>
&gt; buildroot mailing list<br/>
&gt; buildroot@buildroot.org<br/>
&gt; <a href="https://lists.buildroot.org/mailman/listinfo/buildroot" target="_blank">https://lists.buildroot.org/mailman/listinfo/buildroot</a><br/>
&gt;<br/>
_______________________________________________<br/>
buildroot mailing list<br/>
buildroot@buildroot.org<br/>
<a href="https://lists.buildroot.org/mailman/listinfo/buildroot" target="_blank">https://lists.buildroot.org/mailman/listinfo/buildroot</a></div>
</div>
</div>
</div>
</div></div></body></html>

--===============6849848213617817040==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6849848213617817040==--
