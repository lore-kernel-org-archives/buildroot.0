Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6FE0C7EE22
	for <buildroot@archiver.kernel.org>; Tue,  9 May 2023 20:08:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DA38D42753;
	Tue,  9 May 2023 20:08:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DA38D42753
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9y5iyCbkwOf1; Tue,  9 May 2023 20:08:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3F7B842742;
	Tue,  9 May 2023 20:08:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3F7B842742
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2ED471BF2FF
 for <buildroot@lists.busybox.net>; Tue,  9 May 2023 20:08:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 12D0A42719
 for <buildroot@lists.busybox.net>; Tue,  9 May 2023 20:08:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 12D0A42719
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7zG6Ex5M74dH for <buildroot@lists.busybox.net>;
 Tue,  9 May 2023 20:08:51 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 462AD41E0B
Received: from smtpcmd10102.aruba.it (smtpcmd10102.aruba.it [62.149.156.102])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 462AD41E0B
 for <buildroot@buildroot.org>; Tue,  9 May 2023 20:08:50 +0000 (UTC)
Received: from [192.168.50.220] ([146.241.104.90])
 by Aruba Outgoing Smtp  with ESMTPSA
 id wTddpqvJ4M1GywTdepw5q4; Tue, 09 May 2023 22:08:47 +0200
Content-Type: multipart/mixed; boundary="------------qkNCtwo8qzq5LwY8nR9Pc1UV"
Message-ID: <30561c36-fde3-db5e-82e5-b71732eaa1fa@benettiengineering.com>
Date: Tue, 9 May 2023 22:08:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
To: Adrian Perez de Castro <aperez@igalia.com>, buildroot@buildroot.org
References: <20230423214014.2963361-1-aperez@igalia.com>
 <20230424004642.GB1857231@igalia.com> <20230509153301.GD2291742@igalia.com>
Content-Language: en-US
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <20230509153301.GD2291742@igalia.com>
X-CMAE-Envelope: MS4xfBeJtQpBS5gy9Do591Yc37jjY1kXVwY2QGvFN+mbAyr58CaMl3PUeHAQCn0iz2TO75lQzF4S1dF97I1gx6w42B0zt+fpvPS4Aa4h+keDgXZAre+6elIM
 o+QRqaYnzbsV/DPbB4gMc+dkXxuCCX7PI+Eqwv3OmeMdNed71NBfSiQPNt5glntdQQV2FforpqzXv3tiic/9UKT5cq+Y+F2J1dCs71YaXgBpYI7XcOl6fu8H
 OR8Z9dZ48fYJ3WYukZyCnw==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1683662927; bh=PqPocbgfZcUxfpLME84cbP3xboYjCMYajFWiY3gBtBc=;
 h=Content-Type:Date:MIME-Version:Subject:To:From;
 b=InNq2z1jO0ZrUZndgpIeZUfUbu18lKU3MmY2dUzRjOxjjA0PM7+ZTab1R60C5hxqE
 1dBNFfmBWId47d/mvmRd0Zqx0nQewN4W1H7T6ufrmZ/QoXgf9cWi79pMM/UUOg2H1R
 RIAMOLdk4/hpv4JY7DdSOIcjQ63d4quQIYa/qxdEAtcf6WjUHdv7XwrTs542LkbMhS
 sEE7J4Otzvn56piTEAsNtkfxQ6AwFUCISamp0VIAA+jsfsoFrH/y8BK1l8lNQPeIpd
 ho+bIOC6kh24Z1eSod2srQUkYbD9H1cA7QUTt2rM+jO1hBPN+1FLC1PJzbiutmHxfr
 4OEmxG2CdoqUw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=InNq2z1j
Subject: Re: [Buildroot] [PATCH] package/sunxi-mali-utgard: support the
 wayland driver
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
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This is a multi-part message in MIME format.
--------------qkNCtwo8qzq5LwY8nR9Pc1UV
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Adrian,

On 09/05/23 14:33, Adrian Perez de Castro wrote:
> On Mon, 24 Apr 2023 00:46:42 +0300 Adrian Perez de Castro <aperez@igalia.com> wrote:
>> Hi,
>>
>> On Mon, 24 Apr 2023 00:40:14 +0300 Adrian Perez de Castro <aperez@igalia.com> wrote:
>>> Add a choice to allow using the Wayland variant of the Mali driver. When
>>> selected, the package is marked as provider for libgbm as libMali.so
>>> includes the symbols and a libgbm.so symlink is installed; and both
>>> BR2_PACKAGE_HAS_{LIBGBM,LIBEGL_WAYLAND} are selected accordingly.
>>>
>>> Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
>>
>> With this I have been able to build WebKitGTK, WPEWebKit, and the Cage
>> compositor without trouble, but unfortunately I do not have the hardware
>> to test it... so I cannot really tell whether things work as expected.
> 
> I forgot to mention that building WebKit{GTK,WPE} needs a small patch
> for version 2.38.x, which was already submitted a little while ago:
> 
>    https://patchwork.ozlabs.org/project/buildroot/patch/20230423213233.2961770-1-aperez@igalia.com/
> 
> Note to self: submit also this for package/webkitgtk O:-)

this is a curse, neither that patch fixes the previous build failure :-/
Attached you find the defconfig I use for olinuxino lime.
Can you confirm that it fails at you too?

Thank you!

Best regards
-- 
Giulio Benetti
CEO/CTO@Benetti Engineering sas

>>> ---
>>>   package/sunxi-mali-utgard/Config.in           | 23 +++++++++++++++++++
>>>   .../sunxi-mali-utgard/sunxi-mali-utgard.mk    | 18 ++++++++++++---
>>>   2 files changed, 38 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/package/sunxi-mali-utgard/Config.in b/package/sunxi-mali-utgard/Config.in
>>> index 59ac21f5ab..0856f220fd 100644
>>> --- a/package/sunxi-mali-utgard/Config.in
>>> +++ b/package/sunxi-mali-utgard/Config.in
>>> @@ -18,6 +18,9 @@ config BR2_PACKAGE_PROVIDES_LIBEGL
>>>   config BR2_PACKAGE_PROVIDES_LIBGLES
>>>   	default "sunxi-mali-utgard"
>>>   
>>> +config BR2_PACKAGE_PROVIDES_LIBGBM
>>> +	default "sunxi-mali-utgard" if BR2_PACKAGE_SUNXI_MALI_UTGARD_WAYLAND
>>> +
>>>   choice
>>>   	prompt "Version"
>>>   	default BR2_PACKAGE_SUNXI_MALI_UTGARD_R6P2 if BR2_PACKAGE_SUNXI_MALI_MAINLINE_R6P2 # legacy
>>> @@ -38,6 +41,26 @@ config BR2_PACKAGE_SUNXI_MALI_UTGARD_REVISION
>>>   	default "r6p2"	if BR2_PACKAGE_SUNXI_MALI_UTGARD_R6P2
>>>   	default "r8p1"	if BR2_PACKAGE_SUNXI_MALI_UTGARD_R8P1
>>>   
>>> +choice
>>> +	prompt "Platform"
>>> +	default BR2_PACKAGE_SUNXI_MALI_UTGARD_FBDEV
>>> +	help
>>> +	  Select the target EGL platform.
>>> +
>>> +config BR2_PACKAGE_SUNXI_MALI_UTGARD_FBDEV
>>> +	bool "fbdev"
>>> +config BR2_PACKAGE_SUNXI_MALI_UTGARD_WAYLAND
>>> +	bool "wayland"
>>> +	select BR2_PACKAGE_HAS_LIBEGL_WAYLAND
>>> +	select BR2_PACKAGE_HAS_LIBGBM
>>> +
>>> +endchoice
>>> +
>>> +config BR2_PACKAGE_SUNXI_MALI_UTGARD_PLATFORM
>>> +	string
>>> +	default "fbdev" if BR2_PACKAGE_SUNXI_MALI_UTGARD_FBDEV
>>> +	default "wayland" if BR2_PACKAGE_SUNXI_MALI_UTGARD_WAYLAND
>>> +
>>>   endif
>>>   
>>>   comment "sunxi-mali-utgard needs an EABIhf glibc toolchain"
>>> diff --git a/package/sunxi-mali-utgard/sunxi-mali-utgard.mk b/package/sunxi-mali-utgard/sunxi-mali-utgard.mk
>>> index f693667955..23c6e8ec6e 100644
>>> --- a/package/sunxi-mali-utgard/sunxi-mali-utgard.mk
>>> +++ b/package/sunxi-mali-utgard/sunxi-mali-utgard.mk
>>> @@ -24,9 +24,9 @@ endif
>>>   define SUNXI_MALI_UTGARD_INSTALL_STAGING_CMDS
>>>   	mkdir -p $(STAGING_DIR)/usr/lib $(STAGING_DIR)/usr/include
>>>   
>>> -	cp -rf $(@D)/$(SUNXI_MALI_UTGARD_REV)/$(SUNXI_MALI_UTGARD_ARCH)/fbdev/*.so* \
>>> +	cp -rf $(@D)/$(SUNXI_MALI_UTGARD_REV)/$(SUNXI_MALI_UTGARD_ARCH)/$(BR2_PACKAGE_SUNXI_MALI_UTGARD_PLATFORM)/*.so* \
>>>   		$(STAGING_DIR)/usr/lib/
>>> -	cp -rf $(@D)/include/fbdev/* $(STAGING_DIR)/usr/include/
>>> +	cp -rf $(@D)/include/$(BR2_PACKAGE_SUNXI_MALI_UTGARD_PLATFORM)/* $(STAGING_DIR)/usr/include/
>>>   
>>>   	$(INSTALL) -D -m 0644 package/sunxi-mali-utgard/egl.pc \
>>>   		$(STAGING_DIR)/usr/lib/pkgconfig/egl.pc
>>> @@ -34,9 +34,21 @@ define SUNXI_MALI_UTGARD_INSTALL_STAGING_CMDS
>>>   		$(STAGING_DIR)/usr/lib/pkgconfig/glesv2.pc
>>>   endef
>>>   
>>> +ifeq ($(BR2_PACKAGE_SUNXI_MALI_UTGARD_WAYLAND),y)
>>> +define SUNXI_MALI_UTGARD_INSTALL_FIXUP_STAGING_PC_FILES
>>> +	sed -e '/^Cflags:/s/$$/ -DWL_EGL_PLATFORM/' \
>>> +		-e '/^Requires:/s/$$/ wayland-client wayland-server/' \
>>> +		-i $(STAGING_DIR)/usr/lib/pkgconfig/egl.pc
>>> +	sed -e '/^Requires:/s/$$/ wayland-client wayland-server/' \
>>> +		-i $(STAGING_DIR)/usr/lib/pkgconfig/glesv2.pc
>>> +endef
>>> +SUNXI_MALI_UTGARD_POST_INSTALL_TARGET_HOOKS += SUNXI_MALI_UTGARD_INSTALL_FIXUP_STAGING_PC_FILES
>>> +SUNXI_MALI_UTGARD_DEPENDENCIES += wayland
>>> +endif
>>> +
>>>   define SUNXI_MALI_UTGARD_INSTALL_TARGET_CMDS
>>>   	mkdir -p $(TARGET_DIR)/usr/lib
>>> -	cp -rf $(@D)/$(SUNXI_MALI_UTGARD_REV)/$(SUNXI_MALI_UTGARD_ARCH)/fbdev/*.so* \
>>> +	cp -rf $(@D)/$(SUNXI_MALI_UTGARD_REV)/$(SUNXI_MALI_UTGARD_ARCH)/$(BR2_PACKAGE_SUNXI_MALI_UTGARD_PLATFORM)/*.so* \
>>>   		$(TARGET_DIR)/usr/lib/
>>>   endef
>>>   
>>> -- 
>>> 2.40.0
>>>
>>> _______________________________________________
>>> buildroot mailing list
>>> buildroot@buildroot.org
>>> https://lists.buildroot.org/mailman/listinfo/buildroot
>>>
>>
>> Cheers,
>> —Adrián
>> _______________________________________________
>> buildroot mailing list
>> buildroot@buildroot.org
>> https://lists.buildroot.org/mailman/listinfo/buildroot
> 
> Cheers,
> —Adrián
> 
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

--------------qkNCtwo8qzq5LwY8nR9Pc1UV
Content-Type: text/plain; charset=UTF-8; name="lime_mali_wl_defconfig"
Content-Disposition: attachment; filename="lime_mali_wl_defconfig"
Content-Transfer-Encoding: base64

QlIyX2FybT15CkJSMl9jb3J0ZXhfYTc9eQpCUjJfUEFDS0FHRV9IT1NUX0xJTlVYX0hFQURF
UlNfQ1VTVE9NXzZfMT15CkJSMl9UT09MQ0hBSU5fQlVJTERST09UX0NYWD15CkJSMl9UQVJH
RVRfR0VORVJJQ19IT1NUTkFNRT0iYTIwLW9saW51eGlubyIKQlIyX1RBUkdFVF9HRU5FUklD
X0lTU1VFPSJXZWxjb21lIHRvIE9MaW51WGlubyEiCkJSMl9UQVJHRVRfR0VORVJJQ19HRVRU
WV9QT1JUPSJ0dHlTMCIKQlIyX1NZU1RFTV9ESENQPSJldGgwIgpCUjJfUk9PVEZTX09WRVJM
QVk9ImJvYXJkL29saW1leC9hMjBfb2xpbnV4aW5vL3Jvb3Rmc19vdmVybGF5IgpCUjJfUk9P
VEZTX1BPU1RfSU1BR0VfU0NSSVBUPSJzdXBwb3J0L3NjcmlwdHMvZ2VuaW1hZ2Uuc2giCkJS
Ml9ST09URlNfUE9TVF9TQ1JJUFRfQVJHUz0iLWMgYm9hcmQvb2xpbWV4L2EyMF9vbGludXhp
bm8vZ2VuaW1hZ2UuY2ZnIgpCUjJfTElOVVhfS0VSTkVMPXkKQlIyX0xJTlVYX0tFUk5FTF9D
VVNUT01fVkVSU0lPTj15CkJSMl9MSU5VWF9LRVJORUxfQ1VTVE9NX1ZFUlNJT05fVkFMVUU9
IjYuMS4yMiIKQlIyX0xJTlVYX0tFUk5FTF9ERUZDT05GSUc9InN1bnhpIgpCUjJfTElOVVhf
S0VSTkVMX0NPTkZJR19GUkFHTUVOVF9GSUxFUz0iYm9hcmQvb2xpbWV4L2EyMF9vbGludXhp
bm8vbGludXgtZGlzYWJsZS1saW1hLmZyYWdtZW50IgpCUjJfTElOVVhfS0VSTkVMX0RUU19T
VVBQT1JUPXkKQlIyX0xJTlVYX0tFUk5FTF9JTlRSRUVfRFRTX05BTUU9InN1bjdpLWEyMC1v
bGludXhpbm8tbGltZSIKQlIyX0xJTlVYX0tFUk5FTF9JTlNUQUxMX1RBUkdFVD15CkJSMl9Q
QUNLQUdFX1NVTlhJX1RPT0xTPXkKQlIyX1BBQ0tBR0VfU1VOWElfTUFMSV9VVEdBUkQ9eQpC
UjJfUEFDS0FHRV9TVU5YSV9NQUxJX1VUR0FSRF9XQVlMQU5EPXkKQlIyX1BBQ0tBR0VfWkxJ
Ql9ORz15CkJSMl9QQUNLQUdFX0xJQkdUSzM9eQpCUjJfUEFDS0FHRV9XRUJLSVRHVEs9eQpC
UjJfUEFDS0FHRV9XRUJLSVRHVEtfU0FOREJPWD15CkJSMl9QQUNLQUdFX1dFQktJVEdUS19I
VFRQUz15CkJSMl9QQUNLQUdFX1dQRUJBQ0tFTkRfRkRPPXkKQlIyX1BBQ0tBR0VfUENSRT15
CkJSMl9QQUNLQUdFX1BDUkVfVUNQPXkKQlIyX1RBUkdFVF9ST09URlNfRVhUMj15CkJSMl9U
QVJHRVRfUk9PVEZTX0VYVDJfND15CiMgQlIyX1RBUkdFVF9ST09URlNfVEFSIGlzIG5vdCBz
ZXQKQlIyX1RBUkdFVF9VQk9PVD15CkJSMl9UQVJHRVRfVUJPT1RfQlVJTERfU1lTVEVNX0tD
T05GSUc9eQpCUjJfVEFSR0VUX1VCT09UX0NVU1RPTV9WRVJTSU9OPXkKQlIyX1RBUkdFVF9V
Qk9PVF9DVVNUT01fVkVSU0lPTl9WQUxVRT0iMjAyMy4wNCIKQlIyX1RBUkdFVF9VQk9PVF9C
T0FSRF9ERUZDT05GSUc9IkEyMC1PTGludVhpbm8tTGltZSIKQlIyX1RBUkdFVF9VQk9PVF9O
RUVEU19EVEM9eQpCUjJfVEFSR0VUX1VCT09UX05FRURTX1BZTElCRkRUPXkKQlIyX1RBUkdF
VF9VQk9PVF9ORUVEU19PUEVOU1NMPXkKQlIyX1RBUkdFVF9VQk9PVF9TUEw9eQpCUjJfVEFS
R0VUX1VCT09UX1NQTF9OQU1FPSJ1LWJvb3Qtc3VueGktd2l0aC1zcGwuYmluIgpCUjJfUEFD
S0FHRV9IT1NUX0dFTklNQUdFPXkKQlIyX1BBQ0tBR0VfSE9TVF9VQk9PVF9UT09MUz15Cg==


--------------qkNCtwo8qzq5LwY8nR9Pc1UV
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--------------qkNCtwo8qzq5LwY8nR9Pc1UV--
