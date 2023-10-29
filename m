Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F3B1C4332F
	for <buildroot@archiver.kernel.org>; Sun, 29 Oct 2023 13:27:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 004616005E;
	Sun, 29 Oct 2023 13:27:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 004616005E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7Dfo05bG7fSZ; Sun, 29 Oct 2023 13:27:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B60F761497;
	Sun, 29 Oct 2023 13:27:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B60F761497
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5BBFF1BF59A
 for <buildroot@lists.busybox.net>; Sun, 29 Oct 2023 13:27:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 33C3061497
 for <buildroot@lists.busybox.net>; Sun, 29 Oct 2023 13:27:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 33C3061497
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KZdZJIrb1eAl for <buildroot@lists.busybox.net>;
 Sun, 29 Oct 2023 13:27:44 +0000 (UTC)
Received: from mx1.sberdevices.ru (mx2.sberdevices.ru [45.89.224.132])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4F20B6005E
 for <buildroot@buildroot.org>; Sun, 29 Oct 2023 13:27:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4F20B6005E
Received: from p-infra-ksmg-sc-msk02 (localhost [127.0.0.1])
 by mx1.sberdevices.ru (Postfix) with ESMTP id E01BE120003;
 Sun, 29 Oct 2023 16:27:39 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru E01BE120003
Received: from p-i-exch-sc-m01.sberdevices.ru (p-i-exch-sc-m01.sberdevices.ru
 [172.16.192.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mx1.sberdevices.ru (Postfix) with ESMTPS;
 Sun, 29 Oct 2023 16:27:38 +0300 (MSK)
Received: from [192.168.1.13] (100.64.160.123) by
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.37; Sun, 29 Oct 2023 16:27:37 +0300
Message-ID: <5ee15a06-a3d5-4920-a7af-195f9e2aca05@salutedevices.com>
Date: Sun, 29 Oct 2023 16:27:37 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "Yann E. MO RIN" <yann.morin.1998@free.fr>
References: <20231027161010.980901-1-ovlevin@salutedevices.com>
 <20231028225038.GG687180@scaer>
In-Reply-To: <20231028225038.GG687180@scaer>
X-Originating-IP: [100.64.160.123]
X-ClientProxiedBy: p-i-exch-sc-m01.sberdevices.ru (172.16.192.107) To
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 180965 [Oct 29 2023]
X-KSMG-AntiSpam-Version: 6.0.0.2
X-KSMG-AntiSpam-Envelope-From: ovlevin@salutedevices.com
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 543 543
 1e3516af5cdd92079dfeb0e292c8747a62cb1ee4, {Tracking_uf_ne_domains},
 {Tracking_from_domain_doesnt_match_to}, salutedevices.com:7.1.1;
 www.kernel.org:7.1.1; github.com:7.1.1; 127.0.0.199:7.1.2;
 p-i-exch-sc-m01.sberdevices.ru:7.1.1,5.0.1; lists.buildroot.org:7.1.1;
 d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;
 100.64.160.123:7.1.2, FromAlignment: s, ApMailHostAddress: 100.64.160.123
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean, bases: 2023/10/29 11:52:00
X-KSMG-LinksScanning: Clean, bases: 2023/10/29 11:52:00
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960,
 bases: 2023/10/29 12:01:00 #22345651
X-KSMG-AntiVirus-Status: Clean, skipped
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=salutedevices.com; s=mail; t=1698586059;
 bh=Fuhyz7qAbuDKvDUDxeO1r2xGN2XeY9dq+JJmDvkDalw=;
 h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type:From;
 b=ekvrZEKecPiuT1FVrdKsIdrGUupg8XtGRExldxdb02OzLSwf48CjQcw9XdFSbEipU
 XMqp0ipAR0C8hSCc8PuRCoVXz+tje8+vUj2Z/Bymy5kmbyIyA67eSzq35KiENUTqWJ
 HZ3al1rxSw/QEnj8zNPSqHNhoAq1uLCm0ZZR7FQyUw9aUbL6r1L8pF/8t7dp5K7ORd
 OMFHvAVNloSZ85fDi9j0erevvgQCviHtm7v1g8h+REM52ZOZabvXMvcvbeX2O4RLaJ
 g5S1/usA5iD3oUH66rkwF4H9ZXmScv/Rp4VMdvZAFdGeqvb/F4J3epDUvTb3lBknB4
 OKOFYDaFEcaYg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=salutedevices.com
 header.i=@salutedevices.com header.a=rsa-sha256 header.s=mail
 header.b=ekvrZEKe
Subject: Re: [Buildroot] [PATCH 1/1] package/fscryptctl: add choice between
 v1 and v2 versions
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
From: Oleg Lyovin via buildroot <buildroot@buildroot.org>
Reply-To: Oleg Lyovin <ovlevin@salutedevices.com>
Cc: olegartys@gmail.com, John Keeping <john@metanate.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Yann, All,

On 29.10.2023 01:50, Yann E. MO RIN wrote:
> Oleg, All,
> 
> +John for commit b832f6eb9d
> 
> On 2023-10-27 19:10 +0300, Oleg Lyovin via buildroot spake thusly:
>> b832f6eb9d bumped fscryptctl to the version that
>> does not support fscrypt v1. However, there may be
>> active users that already has v1 configuration without
>> an ability to migrate to v2, so the above change would
>> break them.
>>
>> This patch adds the option to choice which fscryptctl
>> version to use assuming v2 by default.
> 
> It is very exceptional that we allow chosing a version, so you'll need
> to provide more explanations than "without an ability to migrate to v2".
> 
> Why is it not possible for those users to migrate?
> 
> Note that commit b832f6eb9d stated:
>     There are unlikely to be many v1 users and the format has some known
>     vulnerabilities so no compatibility option is included.
> 
> So this was a mindful decision not to provide such compatibility,
> especially because of the vulnerability issues.
> 
> In the odd case that we do indeed need to provide that choice, then
> there is no need to split in two, as it is totally possible to write
> everything in a single .mk in conditional blocs. E.g. (elided for
> brevity):
> 
>     choice
>         prompt "fscryptctl variant"
> 
>     config BR2_PACKAGE_FSCRYPTCTL_V1
>         bool "v1 (deprecated)"
> 
>     config BR2_PACKAGE_FSCRYPTCTL_V2
>         bool "v2"
> 
>     endchoice
> 
>     config BR2_PACKAGE_FSCRYPTCTL_VERSION
>         string
>         default "f037dcf4354ce8f25d0f371b58dfe7a7ac27576f" if BR2_PACKAGE_FSCRYPTCTL_V1
>         default "1.0.0" if BR2_PACKAGE_FSCRYPTCTL_V2
> 
> and then in the .mk:
> 
>     FSCRYPTCTL_VERSION = $(call qstrip,$(BR2_PACKAGE_FSCRYPTCTL_VERSION))
>     FSCRYPTCTL_GIT_VERSION = $(if $(BR2_PACKAGE_FSCRYPTCTL_V2),v)$(FSCRYPTCTL_VERSION)
>     FSCRYPTCTL_SITE = $(call github,google,fscryptctl,$(FSCRYPTCTL_GIT_VERSION))
> 
>     FSCRYPTCTL_CFLAGS = $(TARGET_CFLAGS)
>     ifeq ($(BR2_PACKAGE_FSCRYPTCTL_V2),y)
>     FSCRYPTCTL_CFLAGS += -std=c99
>     endif
> 
>     define FSCRYPTCTL_BUILD_CMDS
>         $(MAKE) -C $(@D) $(TARGET_CONFIGURE_OPTS) \
>             CFLAGS="$(FSCRYPTCTL_CFLAGS)" fscryptctl
>     endef
> 
>     define FSCRYPTCTL_INSTALL_TARGET_CMDS
>         $(INSTALL) -m 0755 -D $(@D)/fscryptctl $(TARGET_DIR)/usr/bin/fscryptctl
>     endef
> 
>     $(eval $(generic-package))
> 
> Toally untested, and missing all the rest of the usual variables...
> 
> But of course, this still needs a good explanations why this is needed.
> 
> Regards,
> Yann E. MORIN.
> 
>> Signed-off-by: Oleg Lyovin <ovlevin@salutedevices.com>
>> ---
>>  package/fscryptctl/Config.in                  | 22 +++++++++++++++++++
>>  package/fscryptctl/fscryptctl.mk              | 22 +------------------
>>  .../fscryptctl_v1/fscryptctl_v1.hash          |  3 +++
>>  .../fscryptctl/fscryptctl_v1/fscryptctl_v1.mk | 20 +++++++++++++++++
>>  .../fscryptctl_v2.hash}                       |  2 +-
>>  .../fscryptctl/fscryptctl_v2/fscryptctl_v2.mk | 21 ++++++++++++++++++
>>  6 files changed, 68 insertions(+), 22 deletions(-)
>>  create mode 100644 package/fscryptctl/fscryptctl_v1/fscryptctl_v1.hash
>>  create mode 100644 package/fscryptctl/fscryptctl_v1/fscryptctl_v1.mk
>>  rename package/fscryptctl/{fscryptctl.hash => fscryptctl_v2/fscryptctl_v2.hash} (81%)
>>  create mode 100644 package/fscryptctl/fscryptctl_v2/fscryptctl_v2.mk
>>
>> diff --git a/package/fscryptctl/Config.in b/package/fscryptctl/Config.in
>> index 91b9ba8ebe..2fb7176ad9 100644
>> --- a/package/fscryptctl/Config.in
>> +++ b/package/fscryptctl/Config.in
>> @@ -10,3 +10,25 @@ config BR2_PACKAGE_FSCRYPTCTL
>>  	  (BR2_TARGET_ROOTFS_EXT2_MKFS_OPTIONS="-O encrypt -b 4096")
>>  
>>  	  https://github.com/google/fscryptctl
>> +
>> +if BR2_PACKAGE_FSCRYPTCTL
>> +
>> +choice
>> +	prompt "fscryptctl variant"
>> +	default BR2_PACKAGE_FSCRYPTCTL_V2
>> +	help
>> +	  Select the version of fscrypt.
>> +
>> +config BR2_PACKAGE_FSCRYPTCTL_V2
>> +	bool "fscrpyctl_v2"
>> +	help
>> +	  Support the latest fscrypt v2 implementation.
>> +
>> +config BR2_PACKAGE_FSCRYPTCTL_V1
>> +	bool "fscryptctl_v1"
>> +	help
>> +	  v1 is deprecated, enable this only for legacy configurations.
>> +
>> +endchoice
>> +
>> +endif
>> diff --git a/package/fscryptctl/fscryptctl.mk b/package/fscryptctl/fscryptctl.mk
>> index 0546f67a1f..e3571f4e07 100644
>> --- a/package/fscryptctl/fscryptctl.mk
>> +++ b/package/fscryptctl/fscryptctl.mk
>> @@ -1,21 +1 @@
>> -################################################################################
>> -#
>> -# fscryptctl
>> -#
>> -################################################################################
>> -
>> -FSCRYPTCTL_VERSION = 1.0.0
>> -FSCRYPTCTL_SITE = $(call github,google,fscryptctl,v$(FSCRYPTCTL_VERSION))
>> -FSCRYPTCTL_LICENSE = Apache-2.0
>> -FSCRYPTCTL_LICENSE_FILES = LICENSE
>> -
>> -define FSCRYPTCTL_BUILD_CMDS
>> -	$(MAKE) -C $(@D) $(TARGET_CONFIGURE_OPTS) \
>> -		CFLAGS="$(TARGET_CFLAGS) -std=c99" fscryptctl
>> -endef
>> -
>> -define FSCRYPTCTL_INSTALL_TARGET_CMDS
>> -	$(INSTALL) -m 0755 -D $(@D)/fscryptctl $(TARGET_DIR)/usr/bin/fscryptctl
>> -endef
>> -
>> -$(eval $(generic-package))
>> +include $(sort $(wildcard package/fscryptctl/*/*.mk))
>> diff --git a/package/fscryptctl/fscryptctl_v1/fscryptctl_v1.hash b/package/fscryptctl/fscryptctl_v1/fscryptctl_v1.hash
>> new file mode 100644
>> index 0000000000..f810aaacb5
>> --- /dev/null
>> +++ b/package/fscryptctl/fscryptctl_v1/fscryptctl_v1.hash
>> @@ -0,0 +1,3 @@
>> +# Locally calculated
>> +sha256  970a8febbcbf315313711d8a7ee3d954dea593d8087744d3cba65f6cb4bebcc1  fscryptctl_v1-f037dcf4354ce8f25d0f371b58dfe7a7ac27576f.tar.gz
>> +sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
>> diff --git a/package/fscryptctl/fscryptctl_v1/fscryptctl_v1.mk b/package/fscryptctl/fscryptctl_v1/fscryptctl_v1.mk
>> new file mode 100644
>> index 0000000000..c1c1ab34f2
>> --- /dev/null
>> +++ b/package/fscryptctl/fscryptctl_v1/fscryptctl_v1.mk
>> @@ -0,0 +1,20 @@
>> +################################################################################
>> +#
>> +# fscryptctl_v1
>> +#
>> +################################################################################
>> +
>> +FSCRYPTCTL_V1_VERSION = f037dcf4354ce8f25d0f371b58dfe7a7ac27576f
>> +FSCRYPTCTL_V1_SITE = $(call github,google,fscryptctl,$(FSCRYPTCTL_V1_VERSION))
>> +FSCRYPTCTL_V1_LICENSE = Apache-2.0
>> +FSCRYPTCTL_V1_LICENSE_FILES = LICENSE
>> +
>> +define FSCRYPTCTL_V1_BUILD_CMDS
>> +	$(MAKE) -C $(@D) $(TARGET_CONFIGURE_OPTS) fscryptctl
>> +endef
>> +
>> +define FSCRYPTCTL_V1_INSTALL_TARGET_CMDS
>> +	$(INSTALL) -m 0755 -D $(@D)/fscryptctl $(TARGET_DIR)/usr/bin/fscryptctl
>> +endef
>> +
>> +$(eval $(generic-package))
>> diff --git a/package/fscryptctl/fscryptctl.hash b/package/fscryptctl/fscryptctl_v2/fscryptctl_v2.hash
>> similarity index 81%
>> rename from package/fscryptctl/fscryptctl.hash
>> rename to package/fscryptctl/fscryptctl_v2/fscryptctl_v2.hash
>> index 0dcca6893e..61ff022310 100644
>> --- a/package/fscryptctl/fscryptctl.hash
>> +++ b/package/fscryptctl/fscryptctl_v2/fscryptctl_v2.hash
>> @@ -1,3 +1,3 @@
>>  # Locally calculated
>> -sha256  3828d5ad9b93664b9fec0174fc5d8e96d7b021a7896da74efe18fabe5f01d638  fscryptctl-1.0.0.tar.gz
>> +sha256  3828d5ad9b93664b9fec0174fc5d8e96d7b021a7896da74efe18fabe5f01d638  fscryptctl_v2-1.0.0.tar.gz
>>  sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
>> diff --git a/package/fscryptctl/fscryptctl_v2/fscryptctl_v2.mk b/package/fscryptctl/fscryptctl_v2/fscryptctl_v2.mk
>> new file mode 100644
>> index 0000000000..847a7bbcda
>> --- /dev/null
>> +++ b/package/fscryptctl/fscryptctl_v2/fscryptctl_v2.mk
>> @@ -0,0 +1,21 @@
>> +################################################################################
>> +#
>> +# fscryptctl_v2
>> +#
>> +################################################################################
>> +
>> +FSCRYPTCTL_V2_VERSION = 1.0.0
>> +FSCRYPTCTL_V2_SITE = $(call github,google,fscryptctl,v$(FSCRYPTCTL_V2_VERSION))
>> +FSCRYPTCTL_V2_LICENSE = Apache-2.0
>> +FSCRYPTCTL_V2_LICENSE_FILES = LICENSE
>> +
>> +define FSCRYPTCTL_V2_BUILD_CMDS
>> +	$(MAKE) -C $(@D) $(TARGET_CONFIGURE_OPTS) \
>> +		CFLAGS="$(TARGET_CFLAGS) -std=c99" fscryptctl
>> +endef
>> +
>> +define FSCRYPTCTL_V2_INSTALL_TARGET_CMDS
>> +	$(INSTALL) -m 0755 -D $(@D)/fscryptctl $(TARGET_DIR)/usr/bin/fscryptctl
>> +endef
>> +
>> +$(eval $(generic-package))
>> -- 
>> 2.42.0.270.gbcb6cae296
>>
>> _______________________________________________
>> buildroot mailing list
>> buildroot@buildroot.org
>> https://lists.buildroot.org/mailman/listinfo/buildroot
> 

> It is very exceptional that we allow chosing a version, so you'll need
> to provide more explanations than "without an ability to migrate to v2".

Thanks a lot for your comments. Indeed, I haven't found any cases like this among the current buildroot packages,
so it seems I should have written the cover letter for the patch.

Let me try to describe my motivation for it.

> Note that commit b832f6eb9d stated:
>     There are unlikely to be many v1 users and the format has some known
>     vulnerabilities so no compatibility option is included.
> 
> So this was a mindful decision not to provide such compatibility,
> especially because of the vulnerability issues.

The same explanation is given in the original commit that completely removes fscrypt v1 support in the fscryptctl tool:

    commit d2066cded914860164ffacebc24ea0afc0b57963
    Author: Eric Biggers <ebiggers@google.com>
    Date:   Tue Feb 2 15:52:59 2021 -0800

        Remove support for v1 encryption policies
        
        Since not many people are using fscryptctl yet, and v1 encryption
        policies have some annoying limitations which people keep running into,
        and all major users of filesystem encryption have already switched to v2
        by default, it's better to just drop the fscryptctl support for v1
        policies and only support v2.  This keeps things much simpler going
        forward, and reduces the chance that people misconfigure things.
        
        If anyone really needs to continue to use v1-encrypted directories with
        fscryptctl (despite the known limitations with key visibility and so
        on), they can just use an older version of fscryptctl.


Based on that, the original motivation of removing v1 support from the fscryptctl is to make the tool simpler,
so users won't be able to make an initial fscrypt setup with fscrypt v1, which is no doubt worse than v2.
Also, the author assumes that "not many people are using fscryptctl", so there are not many already
configured v1 installations, but if there are, users can just use an older version of the fscryptctl tool.

This is exactly what my patch is intended for: to give buildroot users an ability to use buildroots fscryptctl
package for configurations with already existing v1-encrypted directories. Still, it chooses fscrypt v2 by default.

Moreover, it is worth noticing, that fscrypt v1 support is still existing in linux kernel mainline,
and I didn't find any news that the maintainers are going to remove it.

> Why is it not possible for those users to migrate?

buildroot is often used with embedded devices, and embedded devices often have limited disk space. As far as I understand,
the only way to migrate from fscrypt v1 to v2 is to create v2-encrypted volume and then **copy** all the data into it.
Without taking into account the technical difficulties of this task, it may be heavy load for storage device
and will require additional disk space: according to linux kernel documentation,
""moving" an unencrypted file into an encrypted directory, e.g. with the mv program, is implemented in userspace by a copy followed by a delete".
(https://www.kernel.org/doc/html/latest/filesystems/fscrypt.html?highlight=fscrypt#access-semantics)

> In the odd case that we do indeed need to provide that choice, then
> there is no need to split in two, as it is totally possible to write
> everything in a single .mk in conditional blocs

Thanks for the snippet, no doubt it is better to use a single .mk. However, I didn't find solution for having in a single .hash file
different entries for different fscryptctl versions depending on user choice.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
