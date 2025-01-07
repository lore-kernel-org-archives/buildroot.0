Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB84CE77197
	for <buildroot@archiver.kernel.org>; Tue,  7 Jan 2025 18:26:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A42F6402DB;
	Tue,  7 Jan 2025 18:26:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IF_iwlyz252l; Tue,  7 Jan 2025 18:26:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2C944403C3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2C944403C3;
	Tue,  7 Jan 2025 18:26:01 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 9ECD57AA
 for <buildroot@buildroot.org>; Tue,  7 Jan 2025 18:25:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 962EC401B7
 for <buildroot@buildroot.org>; Tue,  7 Jan 2025 18:25:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3aUgInzvZPrQ for <buildroot@buildroot.org>;
 Tue,  7 Jan 2025 18:25:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 4AD654016B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4AD654016B
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4AD654016B
 for <buildroot@buildroot.org>; Tue,  7 Jan 2025 18:25:55 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 790FE13F86E;
 Tue,  7 Jan 2025 19:25:52 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:36712])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 07 Jan 2025 19:25:52 +0100
MIME-Version: 1.0
Date: Tue, 07 Jan 2025 19:25:52 +0100
From: Julien Olivain <ju.o@free.fr>
To: Akhilesh Nema <nemaakhilesh@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <CAMV0Ro-_qiPc2i1xFPw4v0M2D-4xUu_=PR9ReCdTFjmMesRR6Q@mail.gmail.com>
References: <20250106024626.151525-1-nemaakhilesh@gmail.com>
 <d7c115a2a0d39baa4ddce696257ac360@free.fr>
 <CAMV0Ro-_qiPc2i1xFPw4v0M2D-4xUu_=PR9ReCdTFjmMesRR6Q@mail.gmail.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <c3536041e305ce5b1f012850c0926e05@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1736274353;
 bh=KD9ifd7ithiBxBoRGvglaO04pT8lsu96xm6gWlme0a4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=vHzZ4Zrbw5aLxCYbvbNmzCuafbKr9v9hPYaOKRJnuXLDmwjbjFSM8G9hNyPmckqo0
 FKs1UBV4eu0Z3PiRMLcUTzbwiq3x9zGGIVucCLcKnaaWTLD8cyYrm/5Ko/Ompke8xI
 NwVxkMSbYJVt3gAD1ZIbhf/mJhtRhMtHqL72s3okPApWgJgOrQ+Aozx9BLiw4XzT/l
 MvlCjtqHNHJYiAC9t5OSTLdJfUVIaVvs9kAvl7DwVWRCos6c/D2xkpO3XedHLMBMpx
 1Ner8lNEYCrTXzgRXqvl43tduzxGOX62iSBqA6/nI27t1uNkm1Teie0nnzT8cy7YFu
 WR5L3QfgiwVVQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=vHzZ4Zrb
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

Hi Akhilesh,

On 07/01/2025 03:14, Akhilesh Nema wrote:
> Hi Julien,
> 
>> On 06/01/2025 03:46, Akhilesh Nema wrote:
>>> Fixes CVE-2024-26306.
>> 
>> You mention here "CVE-2024-26306". It seems this CVE was already
>> fixed
>> in
>> Buildroot commit:
>> 
> https://gitlab.com/buildroot.org/buildroot/-/commit/9d9a0db3d8b471ccf1721312450337ff53ed4a35
> 
> Yes, there was a typo in the message. This version bump has a fix for
> the CVE-2024-53580.

Thanks for the confirmation.

I also fixed the a "make check-package" error, and I applied to master.

> Thanks
> Akhilesh

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
