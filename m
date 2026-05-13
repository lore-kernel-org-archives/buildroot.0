Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 310F8CD4F24
	for <buildroot@archiver.kernel.org>; Wed, 13 May 2026 10:02:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 688E761125;
	Wed, 13 May 2026 10:02:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 99Sss7rcVWxX; Wed, 13 May 2026 10:02:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 02DB360E1E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778666553;
	bh=X4u4pl16VUKvBqQmQfZ5fPRblqcWVlcbtsmU7nolTj4=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=BDFb4H9Dr9F61n4LDJ75FeHNHbEapqV9eacOdxNJL9/Mkp3o97znLwW6X6f+1P68B
	 13eJIcV9LrE+gsVObFkmmKlI7E77x2L27oGCK0KbcCzFY2R6wamIF76as5kbWrRBBM
	 g8nAInjJynk6WbgqfyjXUZQAYxaCkIIKMkzArfQxxw+O5VBTE7JapgJgYQBZeZ+pfo
	 B+jxHak4ZmOVsaqIXEYVViwfXVEpnBeqWwHFNHHXc+q/8SuUeV+h051Slqs3IngcsX
	 Mgcc19KS/N7hnfXmLikMb4Akvp7QjHmaecFvOz3XcYv/m3Rrz/U4V29N2M+G0rhz98
	 83kSbEOCqLPtA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 02DB360E1E;
	Wed, 13 May 2026 10:02:33 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 09C3B270
 for <buildroot@buildroot.org>; Wed, 13 May 2026 10:02:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DBDE640962
 for <buildroot@buildroot.org>; Wed, 13 May 2026 10:02:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eVRdxQyIgZmp for <buildroot@buildroot.org>;
 Wed, 13 May 2026 10:02:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.21;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org D8DD640952
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D8DD640952
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D8DD640952
 for <buildroot@buildroot.org>; Wed, 13 May 2026 10:02:28 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MpDJX-1xBbW30SYJ-00ZWgX; Wed, 13
 May 2026 12:02:24 +0200
Message-ID: <f40ce0c6-0441-4aa0-91a6-fe80a66b2821@gmx.de>
Date: Wed, 13 May 2026 12:02:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Baruch Siach <baruch@tkos.co.il>, Joseph Kogut <joseph@anodize.com>
Cc: buildroot@buildroot.org, Romain Naour <romain.naour@gmail.com>
References: <20260512-qemu-v11-0-0-v1-1-776ebffbb3af@anodize.com>
 <87tsscyngb.fsf@tarshish>
Content-Language: en-US, de-DE-1901, de-DE
Autocrypt: addr=fiona.klute@gmx.de; keydata=
 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
In-Reply-To: <87tsscyngb.fsf@tarshish>
X-Provags-ID: V03:K1:RlbbWLWkzAwmgPSycERW/p+FzUoE80Rtfa9bGzMXHjLOVmbr5Tv
 GEhK4KfY8fcXut7coBtQPgNctV9XH7A0hAZhTlZI5JfFONyFo+EH6I4iy79OiwFwTNe0rla
 2SCZnXR7ztOh2HbQ21JoBby3C5/75IqWHWglHU9yrc+zqZFxHYVgRfGcdXfsJ0YbzWPopfT
 0bAAQadS9bF23kSBaTnfA==
UI-OutboundReport: notjunk:1;M01:P0:EL5ZGXR7tDk=;drBDNewTcsqrxmGBYBwQxRQFqbp
 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
 3Fjnkw==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1778666544; x=1779271344; i=fiona.klute@gmx.de;
 bh=X4ZgNNqo2rOKIet4rmGiiLT2Eyn2+/52NIsogR5dlF8=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=T8AxbtyjMVAWS/SmXYNpjYqrl2s1uh593LW/R1JtoDofQ81BDUEREMmIPrQEv7uO
 Sa7+LoShZXpPoHI6raZuZebNmbfN3L9+p7F0if/yO3rbtRuB7ersI2AeO9KR2p2ic
 ECckY1uTzGuyIsH9ock5i0ChgLhU8kfu/gGzFiiUzXI7VS5VBjEselrDWSV84fPcQ
 fGV5Jdz0o5Cq/fFPpg4rXHwq4SDs54hKaAFk+EPswEmMsjgaPhIdy9MoppdUo4l/D
 /gcc9dYulYq3bUvfvK9NB35CIXtPZpruIoc8oOLRmroaOChf9K9RgRsKcT/qvocY/
 gzlGzdb5g3BZ9bor7Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=T8Axbtyj
Subject: Re: [Buildroot] [PATCH RESEND] package/qemu: bump to version 11.0.0
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

Hi Baruch!

Am 13.05.26 um 05:53 schrieb Baruch Siach via buildroot:
> Hi Joseph,
> 
> On Tue, May 12 2026, Joseph Kogut wrote:
>> Changelog:
>> https://wiki.qemu.org/ChangeLog/11.0
>>
>> Note:
>>    Support for all 32-bit host systems has been removed.
>>
>> Signed-off-by: Joseph Kogut <joseph@anodize.com>
>> ---
>>   package/qemu/Config.in | 5 +----
>>   package/qemu/qemu.hash | 2 +-
>>   package/qemu/qemu.mk   | 2 +-
>>   3 files changed, 3 insertions(+), 6 deletions(-)
>>
>> diff --git a/package/qemu/Config.in b/package/qemu/Config.in
>> index 0b16c8c284..c735381b4b 100644
>> --- a/package/qemu/Config.in
>> +++ b/package/qemu/Config.in
>> @@ -1,11 +1,8 @@
>>   config BR2_PACKAGE_QEMU_ARCH_SUPPORTS_TARGET
>>   	bool
>>   	# Only tested on these architectures
>> +	default n if !BR2_ARCH_IS_64
>>   	default y if BR2_aarch64
>> -	default y if BR2_arm && !BR2_ARM_CPU_ARMV4 && !BR2_ARM_CPU_ARMV5
>> -	default y if BR2_i386
>> -	default y if BR2_mips
>> -	default y if BR2_mipsel
> 
> qemu 11 dropped 32-bit host support as you mentioned in commit log. But
> this config symbol indicates target support. qemu changelog does not
> mention removal of all 32-bit targets.

This is for building Qemu for the (Buildroot) target system though. That 
makes the Buildroot target the (Qemu) host (VMs running on the target), 
so it's affected by Qemu dropping 32-bit host support. The Buildroot 
host-qemu shouldn't be, unless someone is building on a 32-bit system 
(seems unlikely).

Best regards,
Fiona

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
