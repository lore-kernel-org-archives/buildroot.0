Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAE41C2A062
	for <buildroot@archiver.kernel.org>; Sun,  4 Jan 2026 16:54:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4D6CC80CFE;
	Sun,  4 Jan 2026 16:54:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1FFHu8Lm02q9; Sun,  4 Jan 2026 16:54:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7E68080CFF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767545690;
	bh=J+sy0mgyqirsx6INQ/ejD/FanOcAHeBK6Rd3wL44yAU=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=NcATRW7ypO3K+KrqRPGbQltO5RFXuyc8GOctjqLbv7AJZRghbgaCVxOrgF01DD8hr
	 VxYbMNCp3p67uAbp6NuKqz48eLDd1/SR+wjVc6xoNkaQDsPdU7VpUp/ue6cROtE7oQ
	 /lRDxilNvcYqh9odoql2Ti2ZMj09UxjMw4teOPSUEPWUTrS6MYtbix8t1lK/NET30B
	 NKcXqZrLsjT0dZHgZgllwLwdW+rB+iyqaXPGct1uoBWSeJEfxPIWP38PV4UdF7pign
	 KvNu7Pog+VQvEWCuE7oK43mR40Sd20KnMKHhEV2KTnuX1PFTQGl3j/4QVgY981vaIn
	 sDWTI1d9A1CGg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7E68080CFF;
	Sun,  4 Jan 2026 16:54:50 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 97418249
 for <buildroot@buildroot.org>; Sun,  4 Jan 2026 16:54:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 888A1606EB
 for <buildroot@buildroot.org>; Sun,  4 Jan 2026 16:54:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fUwkbwwXEGgL for <buildroot@buildroot.org>;
 Sun,  4 Jan 2026 16:54:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.22;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 2ACA2606C7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2ACA2606C7
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2ACA2606C7
 for <buildroot@buildroot.org>; Sun,  4 Jan 2026 16:54:44 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.7.2] ([85.22.121.67]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MuDbx-1vt8mE3bor-00rlLd; Sun, 04
 Jan 2026 17:54:35 +0100
Message-ID: <662857af-6295-4fd2-932d-05b0d3c32806@gmx.de>
Date: Sun, 4 Jan 2026 17:54:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: James Hilliard <james.hilliard1@gmail.com>, Julien Olivain
 <ju.o@free.fr>, buildroot@buildroot.org
References: <20260104143240.4126891-1-fiona.klute@gmx.de>
 <20260104174544.1313e0d8@windsurf>
Content-Language: en-US, de-DE-1901, de-DE
Autocrypt: addr=fiona.klute@gmx.de; keydata=
 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
In-Reply-To: <20260104174544.1313e0d8@windsurf>
X-Provags-ID: V03:K1:SfrNfdKyJUF12BlKjGTQ0eXF3OzaDNA7eNfjYYDhFBz1dteFRAq
 8PeRV2R104hayzvADg018xgcn8uQ4Fm3rW8OxhSYibUUEqsk8hnAn8Ix+eoSyMmiERomD0r
 5hZMrA6mQt0bw21ffdXSYOoiMPb9XaAQwWCfP002gcM9JjrdKO2r68plmPWOFlpPyOnJsPH
 PQDZBqRq4XHCFDpJmxRrw==
UI-OutboundReport: notjunk:1;M01:P0:RHzWYBKyArU=;lUOUg/+CufRu+PmeL3PCmW0GBOT
 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
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1767545676; x=1768150476; i=fiona.klute@gmx.de;
 bh=QgdwU7Mh94bpM2khXHhKXNrhEOZr0iSuag9V0ZZPJ4U=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=fLzBkSaUMq1sGuyzVCeZgKtVzcaIG84ial8yQ1EnJxRmusk0GBeJOlN5o5UGUBhQ
 QAla/mRkLE20HOP9FZ1Y1CzgmnW4C/m2Tuq+wCjwKC47V3GMnikekzGLiLdIe0UNI
 OKwP0alFkSktS/wB2roY5WvgFDhmowNR3SNBoXnGxkl1n3+8NZEXkKW9LRBEtlkTr
 Iin3td1KAm8juBYGrKCSwZO7beiLdd2KWjMmL93PH6XS+rXXvtxMclA1eAQwAQQDD
 7n1o+He4ThD6KJUa6rSMFThrtyfFrPjX097oHRIx+6WaFYojjx2B4THoBYohUTfPo
 qLb21YqvW1ZXNSuShQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.de header.i=fiona.klute@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=fLzBkSaU
Subject: Re: [Buildroot] [PATCH 1/2] package/python-rich: add missing
 dependency on zlib support in Python
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

Hi Thomas!

Am 04.01.26 um 17:45 schrieb Thomas Petazzoni via buildroot:
> Hello Fiona,
> 
> On Sun,  4 Jan 2026 15:32:39 +0100
> Fiona Klute <fiona.klute@gmx.de> wrote:
> 
>> This did not show in the runtime test for package/python-memray
>> because that package already has the dependency, so the Python zlib
>> module is present in the test.
>>
>> Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
> 
> Thanks for both patches. Since those are fixes, could you add in the
> commit log the details of which commit introduced the issue/regression?
> This always helps our LTS maintainers to figure out whether the fix
> needs to be backported or not.
> 
> Thanks a lot!
The packages were added in:
26bc4b51a808d73c09598035aa94f9c37b273218 package/python-rich: new package
c2df8bab97d7f7b8b61ce055b4820ceb1bd34a48 package/python-memray: new package

You merged both of them on Friday, so I'm pretty sure they're not in any 
LTS version. ;-)

Would you still like me to respin with a note about that?

Best regards,
Fiona

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
