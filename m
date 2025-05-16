Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA8CBC3ABC9
	for <buildroot@archiver.kernel.org>; Fri, 16 May 2025 15:59:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 621C940C4E;
	Fri, 16 May 2025 15:59:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bHuziC4FsAok; Fri, 16 May 2025 15:59:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8F16B40C90
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8F16B40C90;
	Fri, 16 May 2025 15:59:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id CDC57185
 for <buildroot@buildroot.org>; Fri, 16 May 2025 15:59:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B3D61837CD
 for <buildroot@buildroot.org>; Fri, 16 May 2025 15:59:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QaGimwwfiKrM for <buildroot@buildroot.org>;
 Fri, 16 May 2025 15:59:14 +0000 (UTC)
X-Greylist: delayed 314 seconds by postgrey-1.37 at util1.osuosl.org;
 Fri, 16 May 2025 15:59:12 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E46BA835C9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E46BA835C9
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.126.134;
 helo=mout.kundenserver.de;
 envelope-from=nicolas.cavallari@green-communications.fr; receiver=<UNKNOWN> 
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.134])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E46BA835C9
 for <buildroot@buildroot.org>; Fri, 16 May 2025 15:59:12 +0000 (UTC)
Received: from [192.168.0.66] ([88.171.60.104]) by mrelayeu.kundenserver.de
 (mreue010 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MbAtM-1urTze0xuC-00nexl; Fri, 16 May 2025 17:53:54 +0200
Message-ID: <ac6a0b1e-eaf1-4d63-9363-f5c080467191@green-communications.fr>
Date: Fri, 16 May 2025 17:53:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Cherniaev Andrei <dungeonlords789@naver.com>, buildroot@buildroot.org,
 peter@korsgaard.com
Cc: Bernd Kuhls <bernd@kuhls.net>, Eric Le Bihan <eric.le.bihan.dev@free.fr>
References: <20250516153801.354271-1-dungeonlords789@naver.com>
Content-Language: en-US
From: Nicolas Cavallari <Nicolas.Cavallari@green-communications.fr>
Autocrypt: addr=Nicolas.Cavallari@green-communications.fr; keydata=
 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
In-Reply-To: <20250516153801.354271-1-dungeonlords789@naver.com>
X-Provags-ID: V03:K1:/ekTI+TpV0fZsSydXWW0MJejQYALptQ9O8BA6Qepg+li/GUClkt
 i37IMn1BfGv7I9L1O7ISGQfRMluDIcuJiEwiMT2KGnGlZTCG/WG8N8tKseIIqcqqTD7nXkD
 FggAuFegSCovURGimXgWt+81/1XuUYlYHan9IHovNeaA3akAzNhuq7VeKBnWC5DLdxq4CJ9
 WMcFfYXQIInn4qpYPIFRg==
UI-OutboundReport: notjunk:1;M01:P0:zBv8pd0b3ug=;ZVaFICHzWya6yC+zPm+pyyGfZtz
 oV8qAniOjsMTTWrQfXbHDJPugU5+LQbxgn8PejBGh3yos86bdve+3/0xswSC9SEVxOMqpjzA5
 OmuidrPe72DIHJWJNozXdpF/tkf9fvMJYbJtCukEo3p1tr3eljEmgR5D/WLaD8C25FJAanPmh
 16r4VlRhk/g1+0TpbAzYudbGtidss2KMApAMk/9RizHMBObi6vhNBi5ciJIFXycppmFKYriSv
 9M2+ZzgyP+Qc7X/BIsyZ1nz/AQjUI2rBOqHAYzB2JeC3hqUaD9QkrnobTBhM8HY/SMakTEZr1
 U7mtWc/z14XiCfjprjfIuspARX1Q0J0Kg711J4nA/6ilufSRhZGwvz3jn7KAtg9fZ8rhdbp2v
 +G28A2THhW4bIzvbC/IuhFLzDDSYIgIuJR1ilAvy9xZMMafHiVhithy5s7Y/bb25KlJk16+KU
 uFsFxAh/x/78sG/ft3Jrx2B8BUxLxo3wzGVuuQqP9qAyNPUiXXbcfjuTOMgnxDutKXQSQZihf
 bxdLdfPsBLBikPPyGA9j6EGCLLQ965ZjAEyjniRanCIkB2sXR1CSWikJnpsEFT1fvADpwvX8p
 f4V3D669VvjyWYaf4kTQgyMRfmh6xnpqqKRLuGDxHM2C4Lfv3hSsYxvXqU7eQabp//0d3eNPE
 KxboQUeskjCtiEA3BVdZKZMQeKPX39rQ5yRSndtG1e2sKGD/FYJOYGwZi98VHDDRVOqy+5sQQ
 BFNaMKZKgQDwtPRaPdFkfCw6APd4Xrcq9pkMO19Hndov2fyvNM1BHYgalxcYv8Tz+pK3uEPm2
 3KBR0NyN2Afgby2Nynf7oNTbIOUQihtanMebBVH8eYKDHHNcLw0CVriZ9k80tRgNKQEVBGgbn
 FM+5FQpR4gWvlt/xzkbdZpFer/OijQNyE8iB97OINH8eBsJZCPSlbblUlqICiqacBuHf2VTZz
 qkKPiXy4r3jTwrhe/YLCr8z82MoFpMZokp5hiYqoS9U0lVALBRV25kXNLEA3MiDsLT8w0Z/a6
 UCPP9z2/HV3VubkI8F/0bcMwTHFgnVwRRJ3yOIOBNXecoOHE6A/kiMvBRqPn9uOcf7goOGrl8
 MfiXV+k5WlXfteVxOnFTteqFn6gpVSZSxfmlFnOevbTCG+MywJJeSYIwJPVb4isFFXk19XUyV
 u4NyMYNn8TqHLoKR0ip0no5Wjbk5YZlbNHAx4XtZw6ljUkB7LGyrOnQXmx9jjL/rey0QXRAUR
 utpBgxRRFWP2wGLPsB+lptyjfecWpYVfLpJ6BqlFPQ0NOTduxhihEAd2AEeerGGBQ/BhiB6xX
 ty5xjGt5qBiwN5DH5UgTUjhmHwr4Uxq+733zzi38sFlrHIBhsW9wHD92lTShThXciEEMtHPSb
 OutFFDH32wN1JPpF/vM0gSARCiHUDYuy9voz4u36KepGRSQYh5C8MJvazInMbrEuX6giaceXb
 LG/F0HA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=green-communications.fr
Subject: Re: [Buildroot] [PATCH] package/libopenh264: switch to meson
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

On 16/05/2025 17:37, Cherniaev Andrei wrote:
> Modern build system meson was added to openh264 because of many reasons, details https://github.com/cisco/openh264/pull/2955 buildroot should prefer modern build system.
> 
> Signed-off-by: Cherniaev Andrei <dungeonlords789@naver.com>
> ---
>   package/libopenh264/libopenh264.mk | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/libopenh264/libopenh264.mk b/package/libopenh264/libopenh264.mk
> index 9ae996fee1..87bd537fe7 100644
> --- a/package/libopenh264/libopenh264.mk
> +++ b/package/libopenh264/libopenh264.mk
> @@ -55,4 +55,4 @@ define LIBOPENH264_INSTALL_TARGET_CMDS
>   		DESTDIR=$(TARGET_DIR) PREFIX=/usr install
>   endef
>   
> -$(eval $(generic-package))
> +$(eval $(meson-package))

This change is likely not enough to use meson. It is likely that buildroot would 
still be using make with this patch.

To use meson, you would need to convert the LIBOPENH264_MAKE_OPTS into 
LIBOPENH264_CONF_OPTS and remove most LIBOPENH265_*_CMDS variables.

Then, you should test with utils/test-pkg as described in the Buildroot 
documentation, to make sure it works on all architectures.

https://buildroot.org/downloads/manual/manual.html#testing-package
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
