Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 836B7C6FD1D
	for <buildroot@archiver.kernel.org>; Wed, 15 Mar 2023 09:47:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1759560BBC;
	Wed, 15 Mar 2023 09:47:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1759560BBC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id v0aHT9734Q5j; Wed, 15 Mar 2023 09:47:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 624C660B6E;
	Wed, 15 Mar 2023 09:47:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 624C660B6E
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 888611BF2C1
 for <buildroot@lists.busybox.net>; Wed, 15 Mar 2023 09:47:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6864840354
 for <buildroot@lists.busybox.net>; Wed, 15 Mar 2023 09:47:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6864840354
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3Hik_fwfFpsu for <buildroot@lists.busybox.net>;
 Wed, 15 Mar 2023 09:47:36 +0000 (UTC)
X-Greylist: delayed 00:07:05 by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B89BB40352
Received: from smtpcmd0757.aruba.it (smtpcmd0757.aruba.it [62.149.156.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B89BB40352
 for <buildroot@buildroot.org>; Wed, 15 Mar 2023 09:47:35 +0000 (UTC)
Received: from [172.20.10.9] ([151.36.255.68])
 by Aruba Outgoing Smtp  with ESMTPSA
 id cNcQpowqeBDVWcNcRpLpPe; Wed, 15 Mar 2023 10:40:27 +0100
Message-ID: <784fc65f-e0c7-29d1-5c43-1918fc811c47@benettiengineering.com>
Date: Wed, 15 Mar 2023 10:40:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Content-Language: en-US, it
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20230314085947.231281ad@windsurf>
 <20230314123030.2523162-1-giulio.benetti@benettiengineering.com>
 <20230314233719.55e2f430@windsurf>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <20230314233719.55e2f430@windsurf>
X-CMAE-Envelope: MS4xfMjiFgiKcQoxJ41+2Fyz6nHJbAfhC0r/o2DlbkiNu7aw31Vx8KjLikzyydO0y8DuVomygIJUAZcCXl1WQByIfTPnVjS3MmF1ui6DbXJOEOJnryxBQSCM
 DF6sp2/c0Oq7TjC8mGt6TN84XO4bv+RHZx0hVL+ku3S6mZaufmYM3FCVRqoapsNFyl7jl6HT+b55hnWMpR7nAQmL36s4RLjEKtAEyqdR11rc5QTLc7DM6fiE
 42vBGJrHuw+x45iC0gyrQ1PAPOf53aojoQDMUeNzTxg=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1678873227; bh=gkyo4pUd3knQKOG71aUwm4zpFCe1XM540B1UD8kqM0g=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=UhbpJQAQQC1AfZF5UhUFJxO37kqXi/zJ2CEf+t/vm4q3rUI8IXmakEfeLbokwau/V
 Hlo2e3HhYWJenhnN2r7ZdSTpK0+JUgRjoBmVhoxyYhu4WoISNQDXu0J1+3EPqzRYrw
 KgZBtMMjsHtn7QeVLpo3scKLQwEPQnNLfGzT03MwhxSXXeGAv4nZ5aY+hSQTW3+kkg
 bK2tE5uSzbnmwOBy0FYM9onvow9ytU6gy2GdxZybj9zXQYjR+WPC1VEKA0uICSrGqo
 LPY4JiAz36uf7nnBZ1D2vgnDX162RJSc5uHh2A3qKbxjzopJSTZ9klv4Yj4eirPgCa
 afIoUxJcsBL1g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=UhbpJQAQ
Subject: Re: [Buildroot] [PATCH v2] package/swugenerator: new package
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Thomas,

On 14/03/23 23:37, Thomas Petazzoni via buildroot wrote:
> Hello Giulio,
> 
> On Tue, 14 Mar 2023 13:30:30 +0100
> Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:
> 
>> Add swugenerator as host utility to generate images for swupdate with all
>> the possible options available like encryption, passkey etc. Let's also
>> add Giulio Benetti as package maintainer to DEVELOPERS file.
>>
>> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> 
> I was about to apply... but realized that both setup.py and
> requirements.txt indicate that the libconf Python module was needed as
> a dependency, and we have no package for it in Buildroot, and therefore
> it's not selected as a runtime dependency of host-swugenerator.
> 
> Could you double check this perhaps, and make sure host-swugenerator
> works with the python installed as $(HOST_DIR)/bin/python3 ?

You are right, I'm not very used to python. So yes it fails on runtime
on a machine where I don't have libconf installed and it's required.
So I'm going to provide a patch for adding host-python-libconf package
too and make swugenerator depend on it.

Thank you!
Best regards
-- 
Giulio Benetti
Benetti Engineering sas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
