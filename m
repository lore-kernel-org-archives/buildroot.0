Return-Path: <SRS0=oNq7=PI=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B8FBC433F5
	for <buildroot@archiver.kernel.org>; Wed, 20 Oct 2021 13:38:18 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A4A8D610A2
	for <buildroot@archiver.kernel.org>; Wed, 20 Oct 2021 13:38:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A4A8D610A2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmx.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 65CB540743;
	Wed, 20 Oct 2021 13:38:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zyM-obc82P2S; Wed, 20 Oct 2021 13:38:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A464B406AB;
	Wed, 20 Oct 2021 13:38:15 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 149E41BF3A6
 for <buildroot@lists.busybox.net>; Wed, 20 Oct 2021 13:38:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EA638406AB
 for <buildroot@lists.busybox.net>; Wed, 20 Oct 2021 13:38:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id V2D4Nr7ytuT7 for <buildroot@lists.busybox.net>;
 Wed, 20 Oct 2021 13:38:11 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BE1854067E
 for <buildroot@buildroot.org>; Wed, 20 Oct 2021 13:38:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1634737088;
 bh=3w4rBk8LHpDggJ2s9oQ3j4xA/Y1MZZOI02p3LRJCPEo=;
 h=X-UI-Sender-Class:From:To:Subject:Date:In-Reply-To:References;
 b=df6zooG86eVeVTajLLB4rdhy1iucdZLGbpLo1DjANWENjUglyK1Mg5tgiAPF0Wc6+
 Wsa/dHI+o7lDzz0gehk3mcRaRpwkJe3RnqSsMJWn8tVWSO6EZRyA9mS+vZU0HzGGl2
 ncvpIYBTwgUmprtLrD3p0JdOg/RJwedyNoODXX8g=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [217.231.235.79] ([217.231.235.79]) by web-mail.gmx.net
 (3c-app-gmx-bap28.server.lan [172.19.172.98]) (via HTTP); Wed, 20 Oct 2021
 15:38:08 +0200
MIME-Version: 1.0
Message-ID: <trinity-09b27e65-87f1-4757-866e-d1edf67f30e9-1634737088797@3c-app-gmx-bap28>
From: Steve <sleepy_dog@gmx.de>
To: buildroot@buildroot.org
Date: Wed, 20 Oct 2021 15:38:08 +0200
Importance: normal
Sensitivity: Normal
In-Reply-To: <e9c4ad82-8cdd-9c17-6d77-8ebf2449fb37@mind.be>
References: <trinity-007290bc-de5f-4ff6-86dc-7caa998c06c5-1634729803292@3c-app-gmx-bap28>
 <e9c4ad82-8cdd-9c17-6d77-8ebf2449fb37@mind.be>
X-UI-Message-Type: mail
X-Priority: 3
X-Provags-ID: V03:K1:taYPF6tNcxy4Y4078Qn0Bra7M1TH26wZKYXqL6w3/z7SjX5c1JBHbCeEeekVJkPFX1aCg
 Npq9oFIYgMAt8RadgFmV0DhwHlMZBgLgPSx+vYDr2XR0LX7T27RnLOQHIaExph2ywtTih+GVPc8w
 eonRkcYSU9tb3veM9tZrUC8tNaf1VaHa6lKurDCeqGSfV2dJzvM9AaVTRuNMKPgg5/aYHaxnvh3g
 VGXnCXG42iYsWyUiPsGXFDXL1LO2nGHBD4VbSaFnfqnRnhbp2tMFuBjuyLz2ekDBR0dl2wS9PAEF
 A4=
X-UI-Out-Filterresults: notjunk:1;V03:K0:U987kjJc/No=:H1wd0oJxpYKz2aUtjK96rO
 FW3cLDwBvkla2X5wabTre8UEWjvQ+WIrt5BUfWpNWJktTHazzyoGkBXbSbw4gj0L2NYnCu+q8
 AI+tsKjUo6iyCXOXtIWNGcjlcQx46og1CyARCrPMU+nKo86+grJq39rB4nTAHol9z5BIbBo3E
 UHwJysENebUiBe01kFOePqidwmRPlyfbQ8ip9CGnr1I0df9NW9f8VnkPAM2qpQKJ3FL/HExLM
 geNAXip21RS65FFQPicknlAP2/9pGoJnjBDopU1rRBwa5rmjBaYbw4d+VBLQVVjT8KDhb4nO3
 zBgNKlWX8tTtGkdYLSmNlfRyrYYNIjDJft2g0amrs1a7RV6fdeNnWPPyRl3U5f3DUlCsqi+83
 Tvck41OYLn2XTik7ULstq1cdxyCbKNV+R9rdJeqOob5KPDfadOuIKMs/wTzeNdYoFkZmUKYhf
 0IicsdQHMsl56s07uoHfy2EMAZiDAkyZS2GRq83z9lmqUOchrYkUc4UUeZA2oVQDHisPv5fbz
 w+t2+8kA/FWFDc1dujOH+twdgqfla9nYMlbVb95OMaBdimh9Sjpv6AB0QrcRps2l+7O4TQ0m8
 pU7sQJyCzO7VO/b/4UiNLsPAJHIvu1yufEDFM3V82cUaT5QRo8OHHoK1kz0phnF+gwFHdOybp
 R7HPc6xmGXpKkdOOod9tANY0CvtOX3/ngf9LVTc7n/8N/2PIbHrA10LmVLD3w5yU5OAcJRJU7
 cZaNYNWEEDwpiv9/wjCVUIf5ZO3eR/+GLVCmkvHsMMa0dM0J2AiQN+anNtndixWwTFrCRhfqv
 0UpyL4q
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
Content-Type: multipart/mixed; boundary="===============7282135358870911838=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============7282135358870911838==
Content-Type: text/html; charset=UTF-8

<html><head></head><body><div style="font-family: Verdana;font-size: 12.0px;"><div>&nbsp;</div>

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
<div name="quote" style="margin:10px 5px 5px 10px; padding: 10px 0 10px 10px; border-left:2px solid #C3D9E5; word-wrap: break-word; -webkit-nbsp-mode: space; -webkit-line-break: after-white-space;">
<div style="margin:0 0 10px 0;"><b>Von:</b>&nbsp;&quot;Arnout Vandecappelle&quot; &lt;arnout@mind.be&gt;<br/>
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
</div></div></body></html>

--===============7282135358870911838==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7282135358870911838==--
