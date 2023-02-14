Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2B8AC05027
	for <buildroot@archiver.kernel.org>; Tue, 14 Feb 2023 21:22:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 426E060F88;
	Tue, 14 Feb 2023 21:22:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 426E060F88
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id InWu-D10p-hF; Tue, 14 Feb 2023 21:22:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9C2BF60F80;
	Tue, 14 Feb 2023 21:22:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9C2BF60F80
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9CDF51BF2B3
 for <buildroot@lists.busybox.net>; Tue, 14 Feb 2023 21:22:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7D86D408CC
 for <buildroot@lists.busybox.net>; Tue, 14 Feb 2023 21:22:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7D86D408CC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ETQCJoLlkCwj for <buildroot@lists.busybox.net>;
 Tue, 14 Feb 2023 21:22:23 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 718D4408B0
Received: from mail.tkos.co.il (golan.tkos.co.il [84.110.109.230])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 718D4408B0
 for <buildroot@buildroot.org>; Tue, 14 Feb 2023 21:22:23 +0000 (UTC)
Received: from tarshish (unknown [10.0.8.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.tkos.co.il (Postfix) with ESMTPS id A0C60440F78;
 Tue, 14 Feb 2023 23:18:07 +0200 (IST)
References: <SY2PR01MB277812C5F0180DAA6B2A1D2994A29@SY2PR01MB2778.ausprd01.prod.outlook.com>
User-agent: mu4e 1.8.13; emacs 28.2
To: Afshin Pir <Afshin.Pir@gallagher.com>
Date: Tue, 14 Feb 2023 23:20:10 +0200
In-reply-to: <SY2PR01MB277812C5F0180DAA6B2A1D2994A29@SY2PR01MB2778.ausprd01.prod.outlook.com>
Message-ID: <87v8k40wok.fsf@tarshish>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=tkos.co.il; s=default; t=1676409487;
 bh=6pvMSaDHnum5JXpu3oCvwFCRWk6ZtLgT4IT6ODv5Sok=;
 h=References:From:To:Cc:Subject:Date:In-reply-to:From;
 b=jaVprFWbTaFRjTgt27MtEleFLwjQLp+w26etZciDKTrziQGABejVVaEv1/4uTzEpc
 P5s27SMZRRY5N7qoUXjO3VsrWwf/Do+kmASmkJTnYvj0xdhog2IepTKRIMlDW8vz0g
 MYs0FTJt/sd3Od/Lmn6Ks6Hm/1O2xVrQe1aZCacfuSUFQtnNYE4YQ+2Emk6TO177mL
 SDB1B3gYONuelSDxJ92WlHZ/QUo9r5aNaqDULEJL+fmQWPh8+9wzUEUv/+HzRbp2u6
 quOkmIGK83MaWRrY+DA++yfjYtd1oA9tWUIH7Aw3c0tbLO1Bioh5epcyCCnJsVT2GN
 9OZVvv+7FQv7A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=tkos.co.il header.i=@tkos.co.il
 header.a=rsa-sha256 header.s=default header.b=jaVprFWb
Subject: Re: [Buildroot] Define dependency package only in staging
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
From: Baruch Siach via buildroot <buildroot@buildroot.org>
Reply-To: Baruch Siach <baruch@tkos.co.il>
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Afshin,

On Tue, Feb 14 2023, Afshin Pir wrote:
> I wonder if it is possible that to force the dependant package to be
> installed only in staging folder. For example, I have written package
> A which depend on Package B like this:
>
> config BR2_PACKAGE_A
>                bool "my-a-provider"
>                select BR2_PACKAGE_B
>                help
>                        Test A Package
>
> The problem is that the above configuration installs B in the target,
> but in reality, it is enough to be installed in staging directory
> (since it provides a header-only version). In there anyway to define a
> dependency for staging only?

'<PKG>_INSTALL_TARGET = NO' might help you.

baruch

-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch@tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
