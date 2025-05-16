Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98592C3ABD8
	for <buildroot@archiver.kernel.org>; Fri, 16 May 2025 10:24:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5988883AA2;
	Fri, 16 May 2025 10:24:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7a3NOKe9RG9M; Fri, 16 May 2025 10:24:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8007983A77
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8007983A77;
	Fri, 16 May 2025 10:24:27 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id E2CAF13D
 for <buildroot@buildroot.org>; Fri, 16 May 2025 10:24:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D464040ACD
 for <buildroot@buildroot.org>; Fri, 16 May 2025 10:24:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fQtC6Ky7x15L for <buildroot@buildroot.org>;
 Fri, 16 May 2025 10:24:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.155.101;
 helo=smtpdh16-2.aruba.it; envelope-from=giulio.benetti@benettiengineering.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 74A4E40415
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 74A4E40415
Received: from smtpdh16-2.aruba.it (smtpdh16-2.aruba.it [62.149.155.101])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 74A4E40415
 for <buildroot@buildroot.org>; Fri, 16 May 2025 10:24:22 +0000 (UTC)
Received: from [192.168.50.220] ([84.33.84.190]) by Aruba SMTP with ESMTPSA
 id FsEmuOGlBD5sdFsEmu6OTD; Fri, 16 May 2025 12:24:20 +0200
Message-ID: <50959b28-a19e-4413-9d52-21d20938553c@benettiengineering.com>
Date: Fri, 16 May 2025 12:24:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: buildroot@buildroot.org
References: <20250515203739.1238211-1-giulio.benetti@benettiengineering.com>
 <20250516090548.1e689598@booty>
Content-Language: en-US
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <20250516090548.1e689598@booty>
X-CMAE-Envelope: MS4xfLOYeSnDZWbfTHm9gV6FSHbiCkGYyHKznbwSq554aq1u8kiC3+l6FK2MQD5JbxV39fIJc2Rvor1C5RlXUcoWB0HkDCrlxI/MlJAiIR7VnZ2XzGSQZkoR
 Z9mzKzCAqPWm8NueWivvvTupf/x9O85NZVUmoQP7/mwZH2g+Polb3lzPKPuN9Konyoc6JC5B2UMA9LuFkH3nl2Fv0/R+F07m9DDR6yjvxi7k8f01s6fOv84S
 uBAQU2z7U74p0GAk+/FmGA==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1747391060; bh=2N5E2xPUeq9oXmk9ehUIa8LinlkVllPNADnTOERD8kU=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=V3liQHlFWT6fR9xblVJmGbkAH1Rdt9s7yuX5Us+9XUbyIoPDzyJ78Ry7VjU98/Ub+
 XgR0go+WJXDi438IjTlHUDXz5YMI7lErw0ZEhHUaWatKiqs0bJ2eEHWseQiXiBICC8
 FZKYbGbo3O9evAS6qmTh8qPcFkefu/7z3PkhKXWJzyGU6wQ7VSSbK0d8TFSlTTtUeb
 hAMMh0npBSuWopv/zDNd1QjBBfyv0J0LlnltxGS61jVP9dD4HkmOFFkIajEWpnwhB3
 mabn71zWwSKVqUvUSbBJfG6QWS/cTN9J0a+yXnSBALjOK22wNaN3Z0K7QoKUvImXc2
 O0fuDhmp69EPQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=temperror header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=V3liQHlF
Subject: Re: [Buildroot] [PATCH] Fix building with Linux 6.14
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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

Hi Luca,

On 5/16/25 09:05, Luca Ceresoli wrote:
> Hello Giulio,
> 
> On Thu, 15 May 2025 22:37:39 +0200
> Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:
> 
>> Add local patch pending upstream to fix build failure with Linux 6.14.
>>
>> Fixes:
>> https://autobuild.buildroot.org/results/065b9afc1c6f9f5561547b12171269adc8c12275
>>
>> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> 
> The Subject should have a "package/rtl8188eu: " prefix.

Oops, thank you for pointing. Just sent v2

>> diff --git a/package/rtl8188eu/0002-Fix-build-with-Linux-6.14.patch b/package/rtl8188eu/0002-Fix-build-with-Linux-6.14.patch
>> new file mode 100644
>> index 0000000000..a05a760d22
>> --- /dev/null
>> +++ b/package/rtl8188eu/0002-Fix-build-with-Linux-6.14.patch
>> @@ -0,0 +1,33 @@
>> +From 0363681349f683050bc9a265db8310e8c4eb6534 Mon Sep 17 00:00:00 2001
>> +From: Giulio Benetti <giulio.benetti@benettiengineering.com>
>> +Date: Thu, 15 May 2025 22:32:48 +0200
>> +Subject: [PATCH] Fix build with Linux 6.14
>> +
>> +Commit:
>> +https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=7a53af85d3bbdbe06cd47b81a6d99a04dc0a3963
>> +adds argument "unsigned int link_id" to get_tx_power(), so let's add it to
>> +cfg80211_rtw_get_txpower() according to Linux version.
>> +
>> +Upstream: https://github.com/lwfinger/rtl8188eu/pull/464
>> +Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
>> +---
>> + ioctl_cfg80211.c | 3 +++
>> + 1 file changed, 3 insertions(+)
>> +
>> +diff --git a/ioctl_cfg80211.c b/ioctl_cfg80211.c
>> +index 270cfce..04434fa 100644
>> +--- a/ioctl_cfg80211.c
>> ++++ b/ioctl_cfg80211.c
>> +@@ -3240,6 +3240,9 @@ static int cfg80211_rtw_set_txpower(struct wiphy *wiphy,
>> + static int cfg80211_rtw_get_txpower(struct wiphy *wiphy,
>> + #if (LINUX_VERSION_CODE >= KERNEL_VERSION(3, 8, 0))
>> + 	struct wireless_dev *wdev,
>> ++#endif
>> ++#if (LINUX_VERSION_CODE >= KERNEL_VERSION(6, 14, 0))
>> ++	unsigned int link_id,
> 
> The patch looks OK otherwise, so with the subject line fixed you can
> add:
> 
> +Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> 
> However, as the upstream maintainer Larry Finger passed away last year
> [1], I don't think those out of tree drivers will be maintained in the
> future. 

Oh, I didn't know this. I'm very sorry about this :-/

> Some fork might appear, but an option to seriously consider is
> to just deprecate and then remove this package in Buildroot and
> recommend using the rtl8xxxu driver that is in mainline Linux.
> package/rtl8188eu/Config.in already recommends the mainline driver for
> kernels since 3.12, which was released 12 years ago...
> 
> [1] https://lwn.net/Articles/979419/

If we're going to use latest Linux kernel yes, but for older Linux
versions those are best drivers AFAIK.

Yes, we need to deal with this. I keep patching basically almost all
external rtlxxx drivers in Buildroot and not few of them are from
Larry Finger.

-- 
Giulio Benetti
CEO&CTO@Benetti Engineering sas

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
