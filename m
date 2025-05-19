Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44CB7C2D0CD
	for <buildroot@archiver.kernel.org>; Mon, 19 May 2025 07:49:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id ED40F40CBE;
	Mon, 19 May 2025 07:49:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uoXvIIaZBh61; Mon, 19 May 2025 07:49:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4239C40CE0
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4239C40CE0;
	Mon, 19 May 2025 07:49:00 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id B7C11E4
 for <buildroot@buildroot.org>; Mon, 19 May 2025 07:48:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A9138810E9
 for <buildroot@buildroot.org>; Mon, 19 May 2025 07:48:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id s_cnzP9USwos for <buildroot@buildroot.org>;
 Mon, 19 May 2025 07:48:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A9CF780F3B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A9CF780F3B
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A9CF780F3B
 for <buildroot@buildroot.org>; Mon, 19 May 2025 07:48:57 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id CBC0B1C0DFB; Mon, 19 May 2025 09:48:54 +0200 (CEST)
Message-ID: <e4279e52-3afe-4c7e-942d-3b57de398e24@rnout.be>
Date: Mon, 19 May 2025 09:48:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: iliana etaoin <iliana@buttslol.net>, buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Bernd Kuhls <bernd@kuhls.net>
References: <20250516114626.110630-1-thomas.petazzoni@bootlin.com>
 <abf4bfef-d537-46e7-8d4d-68e934b7e8a7@rnout.be>
 <185A5F74-35DD-4F40-B7C3-7AA39E06087D@buttslol.net>
Content-Language: en-GB, fr-BE
In-Reply-To: <185A5F74-35DD-4F40-B7C3-7AA39E06087D@buttslol.net>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1747640935; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=AxqYmwKy2JEgDuvXXn2kkj1JWxQgkxYH3rfGfNEpaak=;
 b=MsqWy+cq7nEB3Ygk6Ubvum72nSyFKyLaye7taonkCHpLrQP/Gs170DwsbIixZXsVRrCyVs
 NpkK2wVP57NIZERjoBeUzxUg12cw0KIgMM5Wvbh5uigeLkf4pyuX9XVHjKsXQ2FwVJv5u8
 aXppwn/L9kpKG8UXVutrKapk2ch4pWi99EQFr+CYKajlsT7kQDNt1CkYLoRk7GWNJjmFOL
 K9BBSsfxKbdnZDouDgc1r6BvntALolV6B5OPszWri1inTjhlosrR4M2cWkSDA3QyJCa92F
 GUMPFssDXgFwVUJXMIBln5yI1b7Uvyyhqfckm85Tb+DlPR+ezgsh1GohY+vWQA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=rnout.be header.i=@rnout.be header.a=rsa-sha256
 header.s=dkim header.b=MsqWy+cq
Subject: Re: [Buildroot] [PATCH] package/libcap: backport upstream patch to
 fix build on Xtensa
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 19/05/2025 05:16, iliana etaoin wrote:
>> On May 18, 2025, at 07:41, Arnout Vandecappelle via buildroot <buildroot@buildroot.org> wrote:
>>
>>
>>
>> On 16/05/2025 13:46, Thomas Petazzoni via buildroot wrote:
>>> Following the bump of libcap to version 2.76 in commit
>>> e2eb2ee58b9f70ebb83231537cca19bd28fa48de, the build started failing on
>>> Xtensa. The bug was reported upstream at
>>> https://bugzilla.kernel.org/show_bug.cgi?id=219915 and was
>>> subsequently fixed by upstream commit:
>>>    https://git.kernel.org/pub/scm/libs/libcap/libcap.git/commit/?id=6cdd8cd72ebcedd6b1b6c989a7e5722d5d87f35c
>>> Which we backport in this commit.
>>> Fixes:
>>>    https://autobuild.buildroot.org/results/b9ff9258f407898eeee80dd8cc4dd1d777f44c06
>>> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
>>
>> Applied to 2025.02.x, thanks.
>>
>> Regards,
>> Arnout
> 
> 2025.02.x still has libcap 2.73. I don't think this patch should have been applied to the stable branch; libcap no longer builds successfully for me in 2025.02.2.

  Indeed, I'm releasing 2025.02.3 now with a revert of that patch.

  Thanks, and sorry for the trouble,
  Arnout

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
