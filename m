Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74FA1C2A062
	for <buildroot@archiver.kernel.org>; Sun,  4 Jan 2026 13:29:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2EAE0606F0;
	Sun,  4 Jan 2026 13:29:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id u4hr3946QNBM; Sun,  4 Jan 2026 13:29:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4818C60646
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767533356;
	bh=zuXHI8rQbp0Ikz6KmsDQOk++ooA78uehPlfAMf+8Z2w=;
	h=Date:To:Cc:References:From:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=aqFWP4lf01yDVBaudDgQPdsHCMRB2qMvBTDuMb6lVS+C1zyre4H0uodp8NpMtPT4K
	 UZMeJxtxAo+pUSLte3sXEzfJ5apNdZUvaKVP2gmQpb+SQm5VuiIX3rPn0AVdMDOJk8
	 WSV1ymDDGzAdAZz64LayRPfnYIis/5IOirDtLZXj4EDqVULbYNTLrgaKiFGarZ1+aw
	 Lbdbio0T94W9rD2EWr2vO/mbbTH5qeNVevBug9Mp6ekHtlulSL0JZEE4Z8F0EtBAsK
	 pgIm8yf2gTCJ5qmqBDROEgctXDXbKpNFEafy8rg6I3mkM1RhQU6iaYLnrSyUHnKSlQ
	 lvNXRibORbGrA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4818C60646;
	Sun,  4 Jan 2026 13:29:16 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id CDDF92DF
 for <buildroot@buildroot.org>; Sun,  4 Jan 2026 13:29:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CB86C404D9
 for <buildroot@buildroot.org>; Sun,  4 Jan 2026 13:29:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id f7So5Ukfs1zr for <buildroot@buildroot.org>;
 Sun,  4 Jan 2026 13:29:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.158.218;
 helo=smtpcmd01-sp1.aruba.it;
 envelope-from=giulio.benetti@benettiengineering.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org ECB62404A1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ECB62404A1
Received: from smtpcmd01-sp1.aruba.it (smtpcmd01-sp1.aruba.it [62.149.158.218])
 by smtp4.osuosl.org (Postfix) with ESMTPS id ECB62404A1
 for <buildroot@buildroot.org>; Sun,  4 Jan 2026 13:29:11 +0000 (UTC)
Received: from [192.168.50.220] ([84.33.84.190]) by Aruba SMTP with ESMTPSA
 id cOAOviYbvGVgvcOAOvaTPk; Sun, 04 Jan 2026 14:29:08 +0100
Message-ID: <9705aeaf-cc8c-45e6-9067-41bf0e89486b@benettiengineering.com>
Date: Sun, 4 Jan 2026 14:29:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org, Romain Naour <romain.naour@gmail.com>
References: <20251003225823.3871690-1-giulio.benetti@benettiengineering.com>
 <20251003225823.3871690-2-giulio.benetti@benettiengineering.com>
 <20260101171216.4c560d17@windsurf>
Content-Language: en-US
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <20260101171216.4c560d17@windsurf>
X-CMAE-Envelope: MS4xfHfCxMO5gOhdgEhUSDTaWQQshnm95BsN19Ag7+z6hfTKcpiKNK3iapU4+nDewFZ4ok5NtRUDXf91HU9avyHHSco/6QlBdUFaQ4/P2273K6LpQoAciC1q
 5OR3dNPFuvBKwNVddm2Uh+mEFyVLMDkQdTdyKGiqv9sBpmstyGhp1yotH9JrbO9b5zrPgWE2mu1Sf2+4nfaKknAO/CnhYicLfVPqrs82MvK5VtnvIsSxw88C
 +fIV01G1970pxqtdH6h0E8saWKCmdEIOYh51dtI6DqC687dHIMGIZ5dL+XFlBUoW
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1767533348; bh=0iKNApl+5+kXtqED63LFqh9ZtKcmKTb88w4qppAL6Ic=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=FPnWrJik16LMyRVrf7nMAWnxBEV2uvH9QS0qaeidL0TWuCNvT6ckHJcYkdkqaN2Pn
 GMNBAaynQ/a90V44gPRPZoL4vpRr9ZnB2He1nZz+whD3RCSyaO6DfMAqN9k75BFWJK
 1L5xSUMtaSBShhwW9OQ1wx4djyPjjfCP7KICX3/PiadPnqoe4rU7XAJIo2qZ8bvuF6
 YXZh1hRmywdYDDvnNmDYmKKafzRBAGI9iatHg/YZMVb69APMSBj8IQc1+0xjmtBWNu
 kQTE4Yu4ubIyhiFb7e0ONxxUR+eHhNLts+DsckOvfXVA8dhCbpZKmbdANsVtU/6YAg
 xf7//sriPIoBg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=FPnWrJik
Subject: Re: [Buildroot] [PATCH 1/1] package/efl: bump to version 1.28.1
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

On 1/1/26 17:12, Thomas Petazzoni wrote:
> Hello Giulio,
> 
> Thanks for this work!
> 
> On Sat,  4 Oct 2025 00:58:23 +0200
> Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:
> 
>> Some important addition and several bug fixes for gcc-15. Some of those
>> fixes are committed but not part of version 1.28.1 so they are added as
>> local patches while dropping old patches except the tslib one.
>>
>> See Release Notes of all versions:
>> https://www.enlightenment.org/news/2025-03-17-efl-1.28.1
>> https://www.enlightenment.org/news/2025-01-11-efl-1.28.0
>> https://www.enlightenment.org/news/2023-12-23-efl-1.27.0
>>
>> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> 
> Applied to master, thanks!
> 
> You had forgotten two things:
> 
> - make check-package, which pointed issues in .checkpackageignore
> - make legal-info, which pointed issues with license files

Thank you for all *your* fixes

> If you are brave and want to tackle upstreaming the patch 0001, it
> would definitely be nice :-)

I had sent the patch to their ML and realized only today they require
a PR, so I've opened it here:
https://git.enlightenment.org/enlightenment/efl/pulls/103

Best regards
-- 
Giulio Benetti
CEO&CTO@Benetti Engineering
https://www.linkedin.com/company/benetti-engineering/
https://www.linkedin.com/in/giulio-benetti-79975951/

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
