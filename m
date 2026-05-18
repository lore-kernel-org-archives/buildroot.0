Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34B5ECD4F4A
	for <buildroot@archiver.kernel.org>; Mon, 18 May 2026 20:31:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0099C6076C;
	Mon, 18 May 2026 20:31:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id P7AIQVYwzqYb; Mon, 18 May 2026 20:31:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A98DE60741
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1779136310;
	bh=63iOErts/4T9SNN5YStOKCqlZXPJAVI1xQfxem7zuCs=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=WhSsxB0mVrSgeN6/5D16CHyCpEhr7oOlke9UjB+IAn9lcm+Pcji/aheiFTnSNBPZF
	 o9yQkZD/EezoOU08z1qGAyXMq6KLjSuCHmh7aOb7jRFWTSxhMavXetLC4D3gM4Bcih
	 w5YuN+xh5Y1JnAyo51qaSIxPYtyVnZQzXyeSmwerU+1YopDoXNTzCjfr07io9+zxBD
	 IYimyVQz0jrAX9U6GN1AmXfJUTDNIf9ZWyVEh1oVyZX25R8OOLgOKyFSg6Ez/lF+JM
	 t38LKlEJWotlrEbKzrZh2BpZ+5ekeIsGMBu7KoNNGNKkk8W2FvQ5Zg8bCEuo1f9uC9
	 vEAIcNzaH2z7w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A98DE60741;
	Mon, 18 May 2026 20:31:50 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id D13891B2
 for <buildroot@buildroot.org>; Mon, 18 May 2026 20:31:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B6DD7409AF
 for <buildroot@buildroot.org>; Mon, 18 May 2026 20:31:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NqjJyb0Grc3c for <buildroot@buildroot.org>;
 Mon, 18 May 2026 20:31:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org B34AE409AC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B34AE409AC
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B34AE409AC
 for <buildroot@uclibc.org>; Mon, 18 May 2026 20:31:48 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id EDC12B97BDDC; Mon, 18 May 2026 22:31:45 +0200 (CEST)
Message-ID: <3d090bc3-d851-4d60-9a00-740f0d51a103@rnout.be>
Date: Mon, 18 May 2026 22:31:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Waldemar Brodkorb <wbx@openadk.org>
Cc: Bernd Kuhls <bernd@kuhls.net>, buildroot@uclibc.org,
 Vincent Stehle <vincent.stehle@laposte.net>
References: <69fea782.050a0220.8af99.ac9e__38452.1139830881$1778296731$gmane$org@mx.google.com>
 <pan$51872$1013c278$a74b50e3$2f703bba@ID-313208.user.individual.net>
 <82c062f9-6151-4363-8344-f0fdba96f032@rnout.be>
 <agtXnGstcPCbQEyK@waldemar-brodkorb.de>
Content-Language: en-GB, fr-BE
In-Reply-To: <agtXnGstcPCbQEyK@waldemar-brodkorb.de>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1779136306; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=dLbWBAGejpbwnMZ5GMBMFKqPUAzpTGctwiZMHkjslO0=;
 b=j4ecFGlljqDLHdPD/6cLLbY1ZSi7Cxkto0o0gxHHpd0MEGMIOd5ZMEQ/zvHcAiRH6nymly
 w2IHl/HzUUred4IpYR/LO5bkbZI/G/FnkHDfNWFMMVpOgTyYSdnlZvlW4SHo14Qc902VvY
 wskKfRedBDmY60Skv1c9sDjOq3mv9kFye1KM5/xs8IY9ONyZENzhNdVXry2kNo2x4Cu5W+
 1Godwx21Ay4nvQ2qpndKyCiSLiT5eYYt2TH2/sSgITLULqV/Sg91FVMipf5XOIGGgrkcQv
 OxIF0T/WDESLfcO8SbHI0vgKjtbha7cHM5obs7aFFD9wWc++rrIJfCFwkBt98g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=j4ecFGll
Subject: Re: [Buildroot] HPPA fails to build , was: Analysis of build errors,
 was: Re: [autobuild.buildroot.org] Daily results for 2026-05-08
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



On 18/05/2026 20:17, Waldemar Brodkorb wrote:
> Hi Arnout,
> Arnout Vandecappelle via buildroot wrote,
> 
>>   Hi Vincent,
>>
>> On 09/05/2026 09:00, Bernd Kuhls wrote:
>>>> glibc-2.43-22-g8362e8ce10b2... | 2
>>> fails only on hppa, no upstream fix in sight, what about reverting
>>> 1822f07e94951c5a37f78c1009d54fc95d01d39c?
>>
>>   Since glibc is the only libc for HP-PA, I think this means we'll have to
>> throw out HP-PA entirely. Or do you see a solution?
> 
> That is not entirely true :). uClibc-ng has support for HP-PA, but only
> static support no ld.so support.

  I meant, the only libc that Buildroot supports (at the moment).

  I'm definitely not going to invest any effort in HP-PA. We only added support 
for it because it seemed low-effort (from a maintainer POV).

  Regards,
  Arnout

> 
> best regards
>   Waldemar

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
