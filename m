Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB413C3271E
	for <buildroot@archiver.kernel.org>; Thu, 11 Jul 2024 05:56:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9DB6C6086A;
	Thu, 11 Jul 2024 05:56:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JxWveFmHZ0KP; Thu, 11 Jul 2024 05:56:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A5CF5610E0
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A5CF5610E0;
	Thu, 11 Jul 2024 05:56:57 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4F0B51BF599
 for <buildroot@lists.busybox.net>; Thu, 11 Jul 2024 05:56:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 479B6416E8
 for <buildroot@lists.busybox.net>; Thu, 11 Jul 2024 05:56:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nneSmf4bFcvb for <buildroot@lists.busybox.net>;
 Thu, 11 Jul 2024 05:56:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.250.0.168;
 helo=mx.adeep.su; envelope-from=adeep@lexina.in; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 8A821416E5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8A821416E5
Received: from mx.adeep.su (mx.adeep.su [185.250.0.168])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8A821416E5
 for <buildroot@buildroot.org>; Thu, 11 Jul 2024 05:56:53 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 2EFF11C8E4; Thu, 11 Jul 2024 08:56:43 +0300 (MSK)
Message-ID: <fcdc3e33-99c6-488c-9231-4169b9201ce1@lexina.in>
Date: Thu, 11 Jul 2024 08:56:42 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
References: <20240619075547.1390096-1-adeep@lexina.in>
 <20240711001637.4fe27e3d@windsurf>
Content-Language: ru
Autocrypt: addr=adeep@lexina.in; keydata=
 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
In-Reply-To: <20240711001637.4fe27e3d@windsurf>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lexina.in; s=dkim; 
 t=1720677406; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references:autocrypt;
 bh=F67rJvrI/0AvdR2ONCdx9aLMDibbxn66VEJ5Oygptuw=;
 b=ircc+fwiPYGEWyxncgTS5cWb51W0syzNQ0P0onwzacmzsiPu8F5/iwpaDuA64IsyJy6HtB
 r6JxyWK+CL0xQAr7JpRs53hEKlhKGLZEmP3CRUUOQYWUhsITsZNv1/tGgHnCw/PHassYNy
 pFDu2Auerxv1sMgfNzGvIsred39Ntf6JbgegMgkkU4L0Y+tWVbf9rYkoEZ3ooEmj1EuNUk
 NWdvLykaDhfalpHRxua3eZmT7i+VJ2m4iEkYBVpy7lSTEk21to3Fq52xK6CGhdSdblHKID
 2/ni4WiRy/RU37bff2hCxK9yoimZhMk+DSIA1/s5UYJApycqnJHyEvblNSjTsw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=lexina.in
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=lexina.in header.i=@lexina.in header.a=rsa-sha256
 header.s=dkim header.b=ircc+fwi
Subject: Re: [Buildroot] [PATCH v1] package/rtl8822cs bump driver version to
 latest
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
From: Viacheslav via buildroot <buildroot@buildroot.org>
Reply-To: Viacheslav <adeep@lexina.in>
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi!

11/07/2024 01.16, Thomas Petazzoni via buildroot wrote:
> On Wed, 19 Jun 2024 10:55:40 +0300
> Viacheslav Bocharov via buildroot <buildroot@buildroot.org> wrote:
> 
>> - Update driver for kernel 6.9+
>> - Fix warning/errors on build
>>
>> Fixes: http://autobuild.buildroot.net/results/82dd4d986c0ddfb48e7316473186ef4c9d8ee783
>>
>> Signed-off-by: Viacheslav Bocharov <adeep@lexina.in>
>> ---
>>   package/rtl8822cs/rtl8822cs.hash | 3 ++-
>>   package/rtl8822cs/rtl8822cs.mk   | 2 +-
>>   2 files changed, 3 insertions(+), 2 deletions(-)
> 
> Thanks for your patch, I've applied to master.
> 
> One question: https://github.com/jethome-ru/rtl88x2cs says "** USE
> RTW88 NOT THIS DRIVER **", so why are we using it? It seems like you
> are the person maintaining this driver.

RTW88 in-kernel driver has some problems at this moment: no working AP 
mode, wifi connection fails after 2-3 days, speed issues.

The comment appeared when JetHub devices switched to the rtw88 driver. 
After we switched back to rtl88x2cs, I decided to keep the comment as 
motivation for development and to identify issues in rtw88.
However, in production, we and some other boards use the rtl88x2cs 
driver and we maintain it as necessary.


Since this question has been asked more than once, I decided to modify 
the description a bit. Now that alarming message will no longer be there)

--
Regards,
Viacheslav
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
