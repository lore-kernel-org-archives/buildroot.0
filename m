Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC848C6FD1F
	for <buildroot@archiver.kernel.org>; Sun, 19 Mar 2023 11:05:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 576F5408F3;
	Sun, 19 Mar 2023 11:05:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 576F5408F3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6hAsusEhNidz; Sun, 19 Mar 2023 11:05:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 77E1B408EF;
	Sun, 19 Mar 2023 11:05:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 77E1B408EF
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3D23E1BF86D
 for <buildroot@lists.busybox.net>; Sun, 19 Mar 2023 11:05:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 182A6408EF
 for <buildroot@lists.busybox.net>; Sun, 19 Mar 2023 11:05:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 182A6408EF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id G-TXQkjVaD-t for <buildroot@lists.busybox.net>;
 Sun, 19 Mar 2023 11:05:18 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A84AF408D7
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A84AF408D7
 for <buildroot@buildroot.org>; Sun, 19 Mar 2023 11:05:15 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [10.1.21.130] ([212.186.254.142]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Mjj87-1qNb3D3Ust-00lGmK; Sun, 19
 Mar 2023 12:05:12 +0100
Message-ID: <9128a137-3b67-82db-7f41-8d6a61e539ef@gmx.at>
Date: Sun, 19 Mar 2023 12:05:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Content-Language: en-US
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20230316204743.26192-1-dalang@gmx.at>
 <20230318232252.1a6ce79b@windsurf>
From: Daniel Lang <dalang@gmx.at>
In-Reply-To: <20230318232252.1a6ce79b@windsurf>
X-Provags-ID: V03:K1:YioPM95+m2EaZlj6r0qhfssckIO3aA9sKx74aJW/wODvQeoe561
 Z/NysyBDcMc0gNXELdcPIP84xjWqU162unzHhu28i3e1ZpuHqtAowEGVNnRlzubJ7NhUMf9
 s+NT5jArkXu6JGd67S/myySVh3Zy9hX2TnZxWqeDB8GXXy1w26AZFF3KcZK89jtCsbO+um6
 gLXo4B5mRJQPOp3sMG+pA==
UI-OutboundReport: notjunk:1;M01:P0:aVN6lF98Tgs=;jbwBm7PadzhNX8XPWVGjdn8Rdmx
 uSTL1IWJPcRuidKl6mJw+Li0FZbhXMfAT/h7sXN/5yP3X3lo+3pESUr76IotzQX7tWr29HCkF
 q8wDhjfmCVUIziijsLuFti2qnhfD811LVXxm1m/5WyKnF0MShhGaaUFNwnDYu+6+reNqzG+f8
 VMrVAvaCFlE8yuhCHdYUOGJvt/ksRE2O3HQRWvfu8CTSxH4wFlj/teSy52vJska+5gjkz7Q+g
 mioljZuf2p1rkmh7hO656G7tmD+vxj8udp2aNsdBxszmai0/uOdr4ynQWn+mlvTslggttLHOt
 PKYfHz3btN5zunN4ALA/nlnKQ5i7Z2Ige+GY3hBrU3HfZ3UNe4rUVZ/LYDacBvxYJmjME92t7
 jOtDx0bdsA8xGvZemF2FgP+h2EZGkgzrtMaOyfPMalhekg7xhh8oY8ueJOlLCq3X8NB1z2RI1
 0Qxh9i2Krpx111KlPh6itnOsIknK160K151WLKxwbdxPkPlsO44NzBE8JDnDJsE8XPW/J56R9
 DdWQQ3I5GyY7v8i+qNS4Oc5viG9tG3MzeDFlcdodvr59W2BBmRW8eGRQbwu1CfyB44HaGM6/S
 Kh3bOjyLxnT058oEGKFVxKRd6cNfvf0Hrs3413Av2ZMPoIoNZWZm5Z2gT5WPOFSJn8NJ9b7fy
 KrknaW5gbmKiNMXiM8BV5+BKqZ6ak/WnDCpBzSifYG+9cCruQf+PNYFC5I8nvCC8UV0CByjCX
 GpAN+fYjCAvGfSh5Urnpj/FEtc7alZEDtwyL72NeEn+r3Arz6u2TaJYmEQL+VplOeqtI9TfU1
 DY3n++IrfDJFW2zsSm1rITCE2g8BKUx631sggF0aKoqxjYHUMLAKx4QMZVNWMmcVXq/ayLktp
 w9HrnM/b26hgM5oVpZtnMdTElpuX+0xZ4IvusrNs6+WxUDyjDwfu2aqYfwYeBXTqG9hT67Rh9
 VkpV8ve3Oc5fAeSJv0YA8axPhXM=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gmx.at; s=s31663417; 
 t=1679223913; i=dalang@gmx.at;
 bh=En9RxDzVpO+ntbyADAqt2+WwehJgxk4pVYpHElPtX60=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
 b=i29iERxN0e1JpTGYtN7gkSwPTk3MsPIwwe8Szrw0nGfJTSqOjq6e6B7ruQVVx9H/Q
 GTSMIG0LpvE7kqNRzIPyVbotG4VxPztfjEEimrZsU1V08xSfOkbBhD3TRFpUeidbxt
 oluIhi4nKVenuuLz4ERPoSgBwBAY8IBdkhzkUUifh4qgcixjUdi0YzHDFrzCO+Fj4y
 4wwfF634KnvMn5XNHoifRjS6dt+15E1i+RWHsNeodrVZbzpzuqFixhNFjcyBclWIhQ
 Fj9U4oK77VkYuzVi/d1FjEhEk6qdGPpmtb3d0FQARonR0L4FWrd7s1TfSqIOl11ckF
 nvf4q6yqw/L0g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.at header.i=dalang@gmx.at
 header.a=rsa-sha256 header.s=s31663417 header.b=i29iERxN
Subject: Re: [Buildroot] [PATCH] package/ca-certificates: bump version to
 20230311
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
Cc: Martin Bark <martin@barkynet.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 18.03.23 23:22, Thomas Petazzoni wrote:
> On Thu, 16 Mar 2023 21:47:43 +0100
> Daniel Lang <dalang@gmx.at> wrote:
>
>> Signed-off-by: Daniel Lang <dalang@gmx.at>
>> ---
>>  ...2pem.py-make-cryptography-module-opt.patch | 10 ++++---
>>  ...2pem.py-Fix-compat-with-cryptography.patch | 29 -------------------
>>  package/ca-certificates/ca-certificates.hash  |  4 +--
>>  package/ca-certificates/ca-certificates.mk    |  4 +--
>>  4 files changed, 10 insertions(+), 37 deletions(-)
>>  delete mode 100644 package/ca-certificates/0002-mozilla-certdata2pem.py-Fix-compat-with-cryptography.patch
>
> I didn't look carefully, but it doesn't apply here:
>
> Applying patch #1757985 using "git am -s"
> Description: package/ca-certificates: bump version to 20230311
> Applying: package/ca-certificates: bump version to 20230311
> error: patch failed: package/ca-certificates/0001-mozilla-certdata2pem.py-make-cryptography-module-opt.patch:36
> error: package/ca-certificates/0001-mozilla-certdata2pem.py-make-cryptography-module-opt.patch: patch does not apply
> error: patch failed: package/ca-certificates/0002-mozilla-certdata2pem.py-Fix-compat-with-cryptography.patch:1
> error: package/ca-certificates/0002-mozilla-certdata2pem.py-Fix-compat-with-cryptography.patch: patch does not apply
> Patch failed at 0001 package/ca-certificates: bump version to 20230311
> hint: Use 'git am --show-current-patch=diff' to see the failed patch
> When you have resolved this problem, run "git am --continue".
> If you prefer to skip this patch, run "git am --skip" instead.
> To restore the original branch and stop patching, run "git am --abort".
> 'git am' failed with exit status 128
>
> Does your patch apply on the master branch?

It does locally, but unfortunately my private email provider
decided to start eating trailing white spaces. Will try to
figure out how to stop it from doing that.

Steve's patch [1] is probably applied by then, but would still
be helpful for the future.

Regards
Daniel

[1]: https://patchwork.ozlabs.org/project/buildroot/patch/20230319021851.2593117-1-me@stevenhay.com/

>
> Thomas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
