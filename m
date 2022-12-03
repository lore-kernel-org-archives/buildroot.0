Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80381C4708D
	for <buildroot@archiver.kernel.org>; Sat,  3 Dec 2022 17:26:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2E7BB40108;
	Sat,  3 Dec 2022 17:26:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2E7BB40108
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id labI7E1m1mvW; Sat,  3 Dec 2022 17:26:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 79AEA40102;
	Sat,  3 Dec 2022 17:26:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 79AEA40102
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0EDFA1BF32E
 for <buildroot@lists.busybox.net>; Sat,  3 Dec 2022 17:26:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DD82C606F9
 for <buildroot@lists.busybox.net>; Sat,  3 Dec 2022 17:26:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DD82C606F9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6_BZycuny5mZ for <buildroot@lists.busybox.net>;
 Sat,  3 Dec 2022 17:26:11 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 10359606E6
Received: from smtpdh16-2.aruba.it (smtpdh16-2.aruba.it [62.149.155.101])
 by smtp3.osuosl.org (Postfix) with ESMTP id 10359606E6
 for <buildroot@buildroot.org>; Sat,  3 Dec 2022 17:26:10 +0000 (UTC)
Received: from [192.168.50.18] ([146.241.87.80])
 by Aruba Outgoing Smtp  with ESMTPSA
 id 1WHBp1BVAvUYN1WHBplTdi; Sat, 03 Dec 2022 18:26:09 +0100
Message-ID: <d9e758a6-c84d-67af-16a0-692235894d64@benettiengineering.com>
Date: Sat, 3 Dec 2022 18:26:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20221203172347.331603-1-fontaine.fabrice@gmail.com>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <20221203172347.331603-1-fontaine.fabrice@gmail.com>
X-CMAE-Envelope: MS4xfJBO3dAK5uS1af01nlFUm1sGLcDAEMtyX9mDLm9xWBp9SMtjcLEtfav6g+AZvA0wMoH4TW8f3vjvYSu2mBXbqzFKG/45MHjnQlv7TJhqVATiriYKPxQ9
 +zYcFep/TiFy5PKeNWD+O4de62af1keBQrTUZXosDL2j16nExjDiG1ShV3UXF2L5CKgrNAb0tqjacJ0Et9B9ubkmtGVqT8jomstmvnEzNwshM6u7LYerWshR
 mwYZqPx+z/XROZQmNNxZXhxDe0GhG/m5mdstC8Zb8+g=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1670088369; bh=bgTzkxWir8I0vt19ZWAL+ZypAHRJITZMQnLdiyk11CA=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=LiJO/LLi9h7CsDls4C439rw1cbL812Gnhpej+iVxeZQw+BCCZO/v/abrF4FsiGp4J
 fbgz1DxJBbec7dhxNTiEYnbEu6TsGNP2v7JKQnaP7ertXYI/2ZPrdcsY/RN2hNa4iM
 BX4R4FbQEZ9WIJ0Hjmx/OB6y/P5uLzsnnw8xvOfc4DwLT8eVhk/ij8SJGsJEriTz0D
 vHvqrL/8EGG8mbcdzMqT8uZYQQWqvuyh9AFDBA+t/gR9mm2Dv9/rwVlFk6A19tSf61
 6pRcks0TalzrRQXnZRjb8TVWOUuuzJLeuZviAvuqkVYfT77LLngIOe7F8742rgCtYv
 IWVGmO7Yst3hQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=LiJO/LLi
Subject: Re: [Buildroot] [PATCH 1/1] package/rtl8723bu: add
 RTL8723BU_LINUX_CONFIG_FIXUPS
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

Hi Fabrice,

thank you but there is my pending patch for this here:
https://patchwork.ozlabs.org/project/buildroot/patch/20220919132035.479510-1-giulio.benetti@benettiengineering.com/

Best regards
-- 
Giulio Benetti
CEO/CTO@Benetti Engineering sas

Il 03/12/2022 18:23, Fabrice Fontaine ha scritto:
> Fix the following build failures raised since the addition of the
> package in commit 80d22997334b0ad76f488913e1159b922804c579:
> 
> ERROR: modpost: "usb_alloc_urb" [/home/autobuild/autobuild/instance-2/output-1/build/rtl8723bu-d79a676a8d3f0bb6ac8af126689c6ac6869cb6f2/./8723bu.ko] undefined!
> ERROR: modpost: "usb_free_urb" [/home/autobuild/autobuild/instance-2/output-1/build/rtl8723bu-d79a676a8d3f0bb6ac8af126689c6ac6869cb6f2/./8723bu.ko] undefined!
> 
> [...]
> 
> ERROR: modpost: ".wiphy_apply_custom_regulatory" [/home/thomas/autobuild/instance-1/output-1/build/rtl8723bu-d79a676a8d3f0bb6ac8af126689c6ac6869cb6f2/./8723bu.ko] undefined!
> ERROR: modpost: ".cfg80211_remain_on_channel_expired" [/home/thomas/autobuild/instance-1/output-1/build/rtl8723bu-d79a676a8d3f0bb6ac8af126689c6ac6869cb6f2/./8723bu.ko] undefined!
> 
> Fixes:
>   - http://autobuild.buildroot.org/results/ab6482975befba0ad74bb7d91b37373b9b0f300e
>   - http://autobuild.buildroot.org/results/7f3637760ad88d314e6812865f3667d1de091957
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>   package/rtl8723bu/rtl8723bu.mk | 8 ++++++++
>   1 file changed, 8 insertions(+)
> 
> diff --git a/package/rtl8723bu/rtl8723bu.mk b/package/rtl8723bu/rtl8723bu.mk
> index 3da8d9cecf..9113a3ef0a 100644
> --- a/package/rtl8723bu/rtl8723bu.mk
> +++ b/package/rtl8723bu/rtl8723bu.mk
> @@ -16,5 +16,13 @@ define RTL8723BU_INSTALL_TARGET_CMDS
>   	$(INSTALL) -D -m 644 $(@D)/rtl8723b_fw.bin $(TARGET_DIR)/lib/firmware/rtl_bt/rtl8723b_fw.bin
>   endef
>   
> +define RTL8723BU_LINUX_CONFIG_FIXUPS
> +	$(call KCONFIG_ENABLE_OPT,CONFIG_NET)
> +	$(call KCONFIG_ENABLE_OPT,CONFIG_WIRELESS)
> +	$(call KCONFIG_ENABLE_OPT,CONFIG_CFG80211)
> +	$(call KCONFIG_ENABLE_OPT,CONFIG_USB_SUPPORT)
> +	$(call KCONFIG_ENABLE_OPT,CONFIG_USB)
> +endef
> +
>   $(eval $(kernel-module))
>   $(eval $(generic-package))

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
