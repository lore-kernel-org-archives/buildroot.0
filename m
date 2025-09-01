Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D64CCA0FFD
	for <buildroot@archiver.kernel.org>; Mon,  1 Sep 2025 09:39:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2AB1F4142A;
	Mon,  1 Sep 2025 09:39:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id n6bG0CosuPUN; Mon,  1 Sep 2025 09:39:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1663E41183
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1663E41183;
	Mon,  1 Sep 2025 09:39:37 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id BD2EB169
 for <buildroot@buildroot.org>; Mon,  1 Sep 2025 09:39:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A376440488
 for <buildroot@buildroot.org>; Mon,  1 Sep 2025 09:39:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 92YvSSfeh79w for <buildroot@buildroot.org>;
 Mon,  1 Sep 2025 09:39:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 9F9144044B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9F9144044B
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9F9144044B
 for <buildroot@buildroot.org>; Mon,  1 Sep 2025 09:39:34 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id B78AFB978501; Mon,  1 Sep 2025 08:14:31 +0200 (CEST)
Message-ID: <3a717f19-f959-4dd2-85cf-6cf8c2f6a431@rnout.be>
Date: Mon, 1 Sep 2025 08:14:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Devoogdt <thomas@devoogdt.com>, Julien Olivain <ju.o@free.fr>
Cc: buildroot@buildroot.org
References: <6e3994b190d42c3e8f45481e7f3438c9@free.fr>
 <20250828071402.175523-1-thomas@devoogdt.com>
 <540122c2-746a-4f61-a2b8-8c046e3cff3d@rnout.be>
 <59a73efb7423ad217e51fb3331e4c386@free.fr>
 <CACXRmJgv=j7ph+vt8ooftAmQPqinG4j-W4Ub=1Ty1e6ibkQ+AQ@mail.gmail.com>
Content-Language: en-GB, fr-BE
In-Reply-To: <CACXRmJgv=j7ph+vt8ooftAmQPqinG4j-W4Ub=1Ty1e6ibkQ+AQ@mail.gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1756707272; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=lC+755T+IhnEhMLsqL8nwW6lRSD5ATX2fIjuMpOpw+E=;
 b=J7bCvixsKE9AvBw9/rvN8haO5Uf6AYqdXEyLGnuyHtPJepedXghZ+m2mocyjTTcAgJgvCA
 yEhH9aw4IE35mhmyBk6SSgWCcbN/suFoCaSjYPpwLl/9XdDdJ+8dycFWN1OOLSpKp3r0Sv
 MiTrOOJi0/hz6oxH8SxHFBb7lZhpYPBENAy3FKYyO4zdAecFTOH6Qa1LdgUdVIGxVrtxE+
 oWiSmjEyRXgXSFaWunJULekBZhPKqhK8587z+VCV2vnrYJ7LCriefW/Y1p23BnfzOjTOzF
 nlUgYA4w2yCzcvMen/72iuKmLLUlVsHf5bObYxtgWIru/hkMCs2Cn8iAXHcl/g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=J7bCvixs
Subject: Re: [Buildroot] [PATCH next v2] package/lighttpd: bump to 1.4.81
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



On 30/08/2025 16:18, Thomas Devoogdt wrote:
> Hi Arnout, Julien,
> 
> 
> I also noticed that my patch was applied to master and not next. I was
> also not one hundred percent sure about the legacy options I've added,
> but now it's indeed wrong. I assume that you will add a fixup commit
> for that?
> 
> 
> Kind regards,
> 
> Thomas

  Fixed on master. Thanks for noticing Julien!

  Regards,
  Arnout

> 
> Op za 30 aug 2025 om 15:51 schreef Julien Olivain <ju.o@free.fr>:
>>
>> Hi Arnout,
>>
>> On 29/08/2025 19:23, Arnout Vandecappelle wrote:
>>> On 28/08/2025 09:14, Thomas Devoogdt wrote:
>>>> News:
>>>> - https://www.lighttpd.net/2025/8/13/1.4.80/
>>>
>>>   Contains:
>>>
>>> detect and issue error trace for HTTP/2 MadeYouReset VU#767506
>>> CVE-2025-8671
>>>
>>>> - https://www.lighttpd.net/2025/8/17/1.4.81/
>>>
>>>   Contains:
>>>
>>> security: fix to reject disallowed trailers
>>>
>>>   So I've marked this as a security bump and applied to master, thanks.
>>
>> Since the original submission was not containing those security
>> references,
>> I suggested to mark it as "next". See:
>> https://lore.kernel.org/buildroot/6e3994b190d42c3e8f45481e7f3438c9@free.fr/
>>
>> But since it is now merged in master the legacy option
>> BR2_PACKAGE_LIGHTTPD_LIBEV should have been moved below the
>> "Legacy options removed in 2025.08" (rather than 2025.11).
>>
>>>
>>>   Regards,
>>>   Arnout
>>
>> Best regards,
>>
>> Julien.
>>

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
