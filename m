Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B47CDC43334
	for <buildroot@archiver.kernel.org>; Thu, 16 Jun 2022 07:36:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3424941A51;
	Thu, 16 Jun 2022 07:36:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UvfqbbHZJnIf; Thu, 16 Jun 2022 07:36:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0137141A3A;
	Thu, 16 Jun 2022 07:36:44 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A95AC1BF95C
 for <buildroot@lists.busybox.net>; Thu, 16 Jun 2022 07:36:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9FE4984028
 for <buildroot@lists.busybox.net>; Thu, 16 Jun 2022 07:36:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OJDSD719cuY7 for <buildroot@lists.busybox.net>;
 Thu, 16 Jun 2022 07:36:42 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.135])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8383A84027
 for <buildroot@busybox.net>; Thu, 16 Jun 2022 07:36:41 +0000 (UTC)
Received: from [192.168.0.66] ([92.154.77.116]) by mrelayeu.kundenserver.de
 (mreue011 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MfYgC-1nUa2I2BpY-00g10g; Thu, 16 Jun 2022 09:36:38 +0200
Message-ID: <a06bfa3d-2225-0777-4d51-b1ec91489287@green-communications.fr>
Date: Thu, 16 Jun 2022 09:36:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Content-Language: en-US
To: Oscar Gomez Fuente <oscargomezf@gmail.com>, buildroot@busybox.net
References: <CALtfCQZti1YpcOR4D4=KVyH3abkwihtt5W4MUKzcqZybbO_xgQ@mail.gmail.com>
From: Nicolas Cavallari <Nicolas.Cavallari@green-communications.fr>
In-Reply-To: <CALtfCQZti1YpcOR4D4=KVyH3abkwihtt5W4MUKzcqZybbO_xgQ@mail.gmail.com>
X-Provags-ID: V03:K1:p/2U6zlJMK6gsNp1Jbj+SofB5dIiAS9ukAk1zXxXs+NB6gvHa2m
 M0FsTxVkqw/sDjfdVybPB6ifYsXbWgolmsty3O0WUssk1xLW+9nyu/9KhpgxRBWeZJYb1yU
 Tj5IOmITMFEyVo0Kl215aIubxeantnDkgt3ziC5az7zTHdneX1nM/ytEX08Cp+X01Lb2y4f
 6RIEyDNDalJf2G+EacHFw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:PxZUB1ynKJ4=:lJMv13gvTtp9+eySO2hFEK
 ONzGFCkPFsh4nIGvT+1CyrbE5u7NeSHLctkUQcEjWZzHlsj9op30iClxUQB+ms7RfSDB/GbC3
 tEjN5hBKtGkKXPmiYkRJCnuWXv7p4nQ+o54mG1Bb4a9yajvumt2XeC8LeNgSnbzUmSXBBSzNr
 uiK4nXgDohA49cqLqoHzlUDaLiouPgfs9hhlq+dHSL684OV60NfllG9CD/wd0TgevvEHfuOpC
 SwNiOShvkHll3VSOo65bL4//1ABhE2usBC4u+7E1BSwslsdZeANWD1diVbeUA8mVitAhp5nzy
 x+l5T6Wt4AJpPNcKcSCAYCxKD/GBtgNiV4YW+uy5sP2Vlw3s4rlh7UwuvqvsbHtQn0UAerxGt
 4XImdcaFylAhU+ogJOccb1+Jr44anh5ZT9s0VYZsHVMt1U4VXdgRUTgDRwKhLti2EQKU9Nfr+
 J2idrteOQeh0EYZs01uDYkfE51jGgtW0XQwfRIOhzRUxtvHXhAk/tttYlMYM7kj/PN6kUQak+
 /lS2KuAoB8MFCOrnzYhtfyaTyvH/8NCzBzEhKi+AZ1W9UCr3RUsCHpE+I/h47lZb5fgNdheKf
 /6OEXkdep3vc5npzghFJVPON/PpfT2+pL3pShxIPvXQBKTllzOSvDw4xhhvQ6asnh9xSoNOzh
 EyFVkiWohUdTZ1zdGb1RG+G9DimeBFglqWQln+qYNl24bzcqrF406lEsCgNfz/ZkEqVwj4uze
 16fqBckfAlCkeDWQXUZsOEE3t1TgFiGeCUVLcWj9OuXr52yE7yS+MBDtE5mRutOKGBirq1n0D
 FgDs4rm
Subject: Re: [Buildroot] Using two package mutually exclusive
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 16/06/2022 08:16, Oscar Gomez Fuente wrote:
> Hi everyone,
> 
> 
> I am having some kind of problems using Config.in in my own packages.
> I have my own directory on: [BUILDROOT_PATH]/packages/my_folder
> 
> And I have two packages: package_a and package_b:
> 
> 1. [BUILDROOT_PATH]/packages/my_folder/package_a
> 2. [BUILDROOT_PATH]/packages/my_folder/package_b
> 
> The Config.in in the package_a is that:
> 
> config BR2_PACKAGE_A
>      bool "a"
>      default n
>      depends on !BR2_PACKAGE_B
> comment "You cannot use the package A because package B is selected"
>      depends on BR2_PACKAGE_B
> 
> And the Config.in in the package_b is like that:
> 
> config BR2_PACKAGE_B
>      bool "b"
>      default n
>      depends on !BR2_PACKAGE_A
> comment "You cannot use the package B because package A is selected"
>      depends on BR2_PACKAGE_A
> 
> Therefore, when package A is selected it shouldn't have to appear the
> package B and viceversa, but it didn't work and I don't know why.
> 
> I realize that if I  select and deselect another different package on
> the same page, it works. It seems to be the screen is not updated.
> 
> Does anyone know why?

You are also probably getting a warning about a circular dependency in the 
console. This is because Kconfig's dependency resolution is fairly limited.

The easiest way to fix it is to add a "depend on !BR_OTHER_PACKAGE" on only one 
package.  This is enough to prevent both from being selected at the same time
and keep Kconfig happy.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
