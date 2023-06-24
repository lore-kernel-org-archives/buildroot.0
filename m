Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8699CEB64DA
	for <buildroot@archiver.kernel.org>; Sat, 24 Jun 2023 07:31:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C47F44173C;
	Sat, 24 Jun 2023 07:31:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C47F44173C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id r4297Q6f2Zmc; Sat, 24 Jun 2023 07:31:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BE46E417CA;
	Sat, 24 Jun 2023 07:31:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BE46E417CA
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BB20D1BF2C8
 for <buildroot@lists.busybox.net>; Sat, 24 Jun 2023 07:31:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 944A482043
 for <buildroot@lists.busybox.net>; Sat, 24 Jun 2023 07:31:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 944A482043
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hIHVJQEr1Cwb for <buildroot@lists.busybox.net>;
 Sat, 24 Jun 2023 07:31:29 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AA6F682031
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AA6F682031
 for <buildroot@buildroot.org>; Sat, 24 Jun 2023 07:31:28 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost ([62.216.208.189]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1McH9Y-1peipu3cT6-00chAS; Sat, 24
 Jun 2023 09:30:38 +0200
Date: Sat, 24 Jun 2023 09:30:37 +0200
From: Peter Seiderer <ps.report@gmx.net>
To: Hasan Karaman <hk@hasankaraman.dev>
Message-ID: <20230624093037.1501a619@gmx.net>
In-Reply-To: <9bdad434-d2a1-0988-8d17-3cd2f23448c2@hasankaraman.dev>
References: <9bdad434-d2a1-0988-8d17-3cd2f23448c2@hasankaraman.dev>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-suse-linux-gnu)
MIME-Version: 1.0
X-Provags-ID: V03:K1:EBPbMF0IPVwHZNDA03HHTN0299xVeaW8rgjsvUw3tQoDgO9P5fd
 jpwB9H+1PFcH97fEfGpNzwmyDVORmqoYuUIe9askVFgVA4c+OhcUTY7OId635IOtZVe0OqL
 0yGyGoN61rXxay9fTmwDDLB2sw1fAFG+sR3hiUh5pzBzGX9AkjtskrxXK0PlL0HEqx3kx7t
 EPckpEtdmD0T2BhFy8Ufg==
UI-OutboundReport: notjunk:1;M01:P0:e4C01G6Gdxg=;zNHve7O/+WXUPrXW2ovnPd6/41s
 idKdZbh+/zN/ZyfapdWGnAn9HtlrLoWjWNqOXslBjNB+wdH3mTo9OaqbRhiUW1utDRU6poBEx
 S1h3QGthll9fq6dq9qWA7K2b2dEaukoRAovg3ewbKNu8Qf6z4yRJSfS3Pr2Og8FA/jHWNIqxT
 e2zr04yCXo3lacmfEASRX3tuFDE1tS3DaWcMVmxMGRYhAo2OWbHaZiuMR9V9GcKDLOWqBh79T
 zSYBwmdl+9cUADLMW9KBTBNA072TRScGbPjZUSsvL/Dsan1s61RNwXulWoss2S6ZIpN/feaCQ
 eJZKNzAodAlPnsU7HbOUvKcuKs5dGyta1Ogzl9MOarPIW6JfJWNjaub8r1DiF+X136vHXuFe2
 qRU41NGbLX2Jj3PW9/nXIYI27oKQPTF3UHu5sNoXT3SyKiBqWfNeTfoCvYbQ+qaSfvrcwYLYO
 3W4HAlUqSPAj9YUIvZ7gyBlXe/2ahCKsA7Ol+AFJfuBMqfhfDQ5QOq3zps2PuRePK/Rnfuwvi
 DxDg3Dn8zmhFhXwKHvWOsK74EHnHVj2iil91PYbdzyWYHfE8kZWP7xyFZTay0ox2YhBfGX0T0
 lPudMxl8n3iVe//+k/vrpH2+6ufbHBvMjt8XjA59roWDnFwFEMY4irbsbKe7CV3/Ihat4Jr90
 pv80G5kZ1Bep6EY0XGDOJXfgpZ0sAmOiytAi8+1PZonf5Cv/ZPl7b+cJDuoR9cyjVMTcp9KRG
 w/XbIavsBH1ferLLbVnDWNpJFrnNP3DEu7QBEOXVlYpk+TvMc95nU/m1UVNlNw0bP7WeTbbPX
 VMC6SEVAOCULyjXKBqoYQpnHutVoGfa9wdcw549BHbkoG9JluFCpzk83HEXB0g8dFNrmZNNkN
 RXlA8H36b5EIxVzOwkA5m8dqw6G5AGPnl2DAMLzh9DF8zqbFZPbOWrYUGS6EtjuZU/u5oURkc
 aybCAD7+Je7I8/7mR1G2AE4HW8I=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gmx.net; 
 s=s31663417; t=1687591839; x=1688196639; i=ps.report@gmx.net;
 bh=RyLLjCoQgDpvqrrOxU1tw3LVRFSyOK25nUj7p2SJ7o8=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=sEPB23J2M4MUTNGAMjt9OLrskIv8qP7MMWQGgw+Fz2MEz1eF+fDf5y5qCjATwLrTnS32Q5S
 cem2b0QRLR4DkeZAwTxI/vETlYeBTu5VtlrvZYXXoMIwhHLl41OsrzlfLu3kWIFr6/soAfGzg
 ZhhZexzxhA8H1x0/DIYL76ANiBSzWleuy/xOYw3NQcTw6fTLwGn3qJSEpNaAVauGGa/igAMWp
 UgdnrfEqDdrm872I08lV3gbSuP6HV2fa9mTjX3XyCqJTEcIMkpdBpkPBSJNokhqvG/Z3j7vUx
 KvMophqMByXXw1l/kfpu7wCC8SWyGoP4sM/xhebGRmVzjevPhmLw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.net header.i=ps.report@gmx.net
 header.a=rsa-sha256 header.s=s31663417 header.b=sEPB23J2
Subject: Re: [Buildroot] FBTFT extension does not work out of the box
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Hasan,

On Fri, 23 Jun 2023 21:22:50 +0300, Hasan Karaman <hk@hasankaraman.dev> wrote:

> What I do is:
>
> make orangepi_zero_defconfig
>
> make menuconfig
>
> Kernel > Linux Kernel Extensions > FB TFT Drivers
>
> https://github.com/notro/fbtft cannot be compiled with mainline kernel.
> So I use my modified version of fbtft driver:
>
> https://github.com/grizzlei/fbtft
>
> And when I replace
> buildoot/output/build/linux-6.1.14/drivers/video/fbdev/fbtft with my
> code, this time i get compilation errors caused by CONFIG_FB_DEFERRED_IO
> macro not being defined. Does FBTFT support depend on other features?
>

Maybe do not use the out of tree version, use the kernel mainline one
(drivers/staging/fbtft) as stated here [1]:

	2015-01-19
	The FBTFT drivers are now in the Linux kernel staging tree:
	https://git.kernel.org/cgit/linux/kernel/git/gregkh/staging.git/tree/drivers/staging/fbtft?h=staging-testing
	Development in this github repo has ceased.

Regards,
Peter

[1] https://github.com/notro/fbtft/commit/855b2908380e8ca996768bf94cb4d8573690bc30
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
