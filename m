Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D35EC3ABDD
	for <buildroot@archiver.kernel.org>; Tue, 20 May 2025 10:34:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4D08340A78;
	Tue, 20 May 2025 10:34:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2JDWb19Cf1UC; Tue, 20 May 2025 10:34:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6EFE2407C4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6EFE2407C4;
	Tue, 20 May 2025 10:34:33 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id A4516E4
 for <buildroot@buildroot.org>; Tue, 20 May 2025 10:34:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8A826402D1
 for <buildroot@buildroot.org>; Tue, 20 May 2025 10:34:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cnCHmUdMrF6h for <buildroot@buildroot.org>;
 Tue, 20 May 2025 10:34:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.22;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 704D5402CE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 704D5402CE
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 704D5402CE
 for <buildroot@buildroot.org>; Tue, 20 May 2025 10:34:31 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.7.2] ([85.22.119.93]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MplXp-1ujFaT2AZh-00f3VX; Tue, 20
 May 2025 12:34:28 +0200
Message-ID: <031308f4-35e5-451f-8a6d-1e826ad69b75@gmx.de>
Date: Tue, 20 May 2025 12:34:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Marcus Hoffmann <buildroot@bubu1.eu>, buildroot@buildroot.org
References: <20250118133740.4001841-1-fiona.klute@gmx.de>
 <8eccd976-c4c1-4fdc-a3c5-340b4a7f979b@gmx.de>
 <6521217e-0d5a-42ae-a315-c533f0f66909@bubu1.eu>
Content-Language: en-US, de-DE-1901, de-DE
Autocrypt: addr=fiona.klute@gmx.de; keydata=
 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
In-Reply-To: <6521217e-0d5a-42ae-a315-c533f0f66909@bubu1.eu>
X-Provags-ID: V03:K1:Qq/A10O1oXzGGCIOU2+wWisdznrL/HgICOMoZPYUlwbuN02Myn3
 Yar6Dp6AVMDvLbsWJQ1h0BPfpTrfT0WN7SfjMFebGz7Jvy3FiOzlN4uZ6/NqV1q70GoGVHn
 NocuQL+/JfRrmDPFWi9plK+NALSsooEQH3MvCvFixykd3J4Y5yXjPbuh+lG4PTJ7Es3m9HP
 Puc0Foo7JO0UA1i2In1wQ==
UI-OutboundReport: notjunk:1;M01:P0:R6k3dOYH3NA=;/RnbqN38ZM/Uapn9OYgc/r9TC7q
 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
 F78AT6LVk4zbG7uzr3MvVr92Beblh8gHF9
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1747737268; x=1748342068; i=fiona.klute@gmx.de;
 bh=8ryE2uoan7aAzDtLFod2duSPHFqnY9iLiUPoBos4dm4=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=CHmWN78DpYpSUEwjd3Si/WyqWsOmID4KX55aweIlg5DvtBx+4qpOGUlPEuQCxdp1
 G4Jrv6gwmq7WMl/xKcyWQpgzyC1Dc/AGdoGq/yVECDqlomgfWRgwtxuLMoKtNuIbl
 Y64id+yv+4curelXSrNOJgH5EH7qEbRmtwaT9UgfYgXi0koHDVRstTIuhwGApOgER
 CiKlDl5cCJPM0d0g6jUKNE2JuN1CGXlYgkKMLo0M5YobhJXhZdWjPb60kd21czeaX
 Ivo1XXfqu9kK0bHG8htJBFC3E8AX5wMQcCGP1dvZ94RzXd2oSLzgcNIcLhWx6ttGT
 S2xXf9GB91YXZ+RocQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=CHmWN78D
Subject: Re: [Buildroot] [PATCH 1/1] package/wireless-regdb: sysv init
 script to set regdomain
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Marcus!

Am 19.05.25 um 21:03 schrieb Marcus Hoffmann via buildroot:
> Hi Fiona,
> 
> On 19.05.25 17:37, Fiona Klute via buildroot wrote:
>> Hi everyone,
>>
>> just want to check if there's any interest in merging this. It's 
>> trivial enough to maintain in an external tree otherwise, I just 
>> figured it might be useful for anyone who's also using a wireless 
>> setup that doesn't have a built-in way to set the regulatory domain 
>> (namely, NetworkManager).
> 
> We also use NetworkManager but systemd as our init system, so I ended up 
> writing a udev rule that calls a script, that sets the regulatory 
> domain. Would be nice to just universally have a solution for this, but 
> I guess having a SysV initscript is better than not having it?
NetworkManager requires udev (eudev) even without systemd, so a udev 
rule would actually work for me, too, as long as the script is 
configurable. I hadn't really thought about that because I'm setting the 
global regulatory domain, not a device one, but for most embedded 
systems "set during boot" and "set when a wifi device is added" will be 
close enough that the difference doesn't matter.

Anyone who uses wpa_supplicant, iwd, or hostapd can set the country code 
in the config there, so I'm not sure if there's much of a need for a 
non-udev solution.

Would you be willing to share your udev rule?

Best regards,
Fiona

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
