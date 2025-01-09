Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 746D5E77197
	for <buildroot@archiver.kernel.org>; Thu,  9 Jan 2025 09:08:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1841180A95;
	Thu,  9 Jan 2025 09:08:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id B0XKbCyJ9brD; Thu,  9 Jan 2025 09:08:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3294D80A98
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3294D80A98;
	Thu,  9 Jan 2025 09:08:14 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 075D6942
 for <buildroot@buildroot.org>; Thu,  9 Jan 2025 09:08:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0298960735
 for <buildroot@buildroot.org>; Thu,  9 Jan 2025 09:08:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hz11RaJ5lgqT for <buildroot@buildroot.org>;
 Thu,  9 Jan 2025 09:08:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 2D25C605E4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2D25C605E4
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2D25C605E4
 for <buildroot@buildroot.org>; Thu,  9 Jan 2025 09:08:10 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 2013853012; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 09 Jan 2025 09:08:06 +0000 (UTC)
Message-ID: <8a01f4f9-8b7a-4947-9fef-07fa3bdaec66@korsgaard.com>
Date: Thu, 9 Jan 2025 10:08:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Julien Olivain <ju.o@free.fr>, Akhilesh Nema <nemaakhilesh@gmail.com>
Cc: buildroot@buildroot.org
References: <20250106024626.151525-1-nemaakhilesh@gmail.com>
 <d7c115a2a0d39baa4ddce696257ac360@free.fr>
 <CAMV0Ro-_qiPc2i1xFPw4v0M2D-4xUu_=PR9ReCdTFjmMesRR6Q@mail.gmail.com>
 <c3536041e305ce5b1f012850c0926e05@free.fr>
Content-Language: en-US
From: Peter Korsgaard <peter@korsgaard.com>
In-Reply-To: <c3536041e305ce5b1f012850c0926e05@free.fr>
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=GChu0jBlqGjbkTD4wKpjlS570K9KraIQWWhX5rwiH1t2i0A5sW1ClyG4+mzw+44L/lpo5bA5pU63EXXJOyeq+G+kebbfXzGiQkL4HcfAhNcUwSPN+7feu8VFe2u/qC5vKWgAnnQLbtYNQ2GorSpMO7Vavcpk6lB5TKsB75Xo7hq8i2wdmHsf8QyfRDMOapFZgtdZdYSkHNvovq9V0Jj9369gQHpsUo3J+0X4j1SAlGaQxXVQG12gouYuS5BgAv6l41qRmJ/aQc+YZW0iBuOTWd417pgiM53CnAjI0lJIl6NaEBNLALuXL9ebeqRp7jmkvkrqcutDgsN5r93Dz+wKdQ==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=1tuX5r6Yk9G12osQV3tNznS6XGOZBYItZ+C0ZoIewag=;
 h=Feedback-ID:Received:Date:Subject:To:From; 
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=GChu0jBl
Subject: Re: [Buildroot] [PATCH 1/1] package/iperf3: security bump to
 version 3.18
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

On 1/7/25 19:25, Julien Olivain wrote:
> Hi Akhilesh,
> 
> On 07/01/2025 03:14, Akhilesh Nema wrote:
>> Hi Julien,
>>
>>> On 06/01/2025 03:46, Akhilesh Nema wrote:
>>>> Fixes CVE-2024-26306.
>>>
>>> You mention here "CVE-2024-26306". It seems this CVE was already
>>> fixed
>>> in
>>> Buildroot commit:
>>>
>> https://gitlab.com/buildroot.org/buildroot/-/ 
>> commit/9d9a0db3d8b471ccf1721312450337ff53ed4a35
>>
>> Yes, there was a typo in the message. This version bump has a fix for
>> the CVE-2024-53580.
> 
> Thanks for the confirmation.
> 
> I also fixed the a "make check-package" error, and I applied to master.

Committed to 2024.02.x and 2024.11.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
