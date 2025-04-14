Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E168C3601E
	for <buildroot@archiver.kernel.org>; Mon, 14 Apr 2025 06:10:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 34862402D1;
	Mon, 14 Apr 2025 06:10:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0MgqwfHOJbnK; Mon, 14 Apr 2025 06:10:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6793B40325
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6793B40325;
	Mon, 14 Apr 2025 06:10:32 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 7091B250
 for <buildroot@buildroot.org>; Mon, 14 Apr 2025 06:10:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6170040325
 for <buildroot@buildroot.org>; Mon, 14 Apr 2025 06:10:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ntUCoBOXDNTO for <buildroot@buildroot.org>;
 Mon, 14 Apr 2025 06:10:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=95.163.59.36;
 helo=send197.i.mail.ru; envelope-from=fido_max@inbox.ru; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 0B4AB402D1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0B4AB402D1
Received: from send197.i.mail.ru (send197.i.mail.ru [95.163.59.36])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0B4AB402D1
 for <buildroot@buildroot.org>; Mon, 14 Apr 2025 06:10:27 +0000 (UTC)
Received: by exim-smtp-7f9dfcd4bd-xgw92 with esmtpa (envelope-from
 <fido_max@inbox.ru>)
 id 1u4D1U-000000008lp-0elj; Mon, 14 Apr 2025 09:10:24 +0300
Message-ID: <c7ebfb35-d471-440e-b00f-e753f025d7a7@inbox.ru>
Date: Mon, 14 Apr 2025 09:10:23 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Scott Fan <fancp2007@gmail.com>, buildroot@buildroot.org
References: <20250414035423.1856226-1-fancp2007@gmail.com>
Content-Language: en-US
In-Reply-To: <20250414035423.1856226-1-fancp2007@gmail.com>
X-Mailru-Src: smtp
X-4EC0790: 10
X-7564579A: 646B95376F6C166E
X-77F55803: 4F1203BC0FB41BD9A2289E787AC5D91148CD3EC071CD04839824EFDA8C039625182A05F538085040286BADFA8ADBC03C3DE06ABAFEAF67056097AFD5133FBC3978761AB79451C628261E30AE1A3D84FE
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE728F774C865CF4B07EA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F7900637AC83A81C8FD4AD23D82A6BABE6F325AC2E85FA5F3EDFCBAA7353EFBB55337566F7393C1401261EF16D3AB909EB0195321EC0AA3542903DA97854A2967452E7F48EEF46B7454FC60B9742502CCDD46D0D2FFDA4F57982C5F4F6B57BC7E64490618DEB871D839B73339E8FC8737B5C224992B0BE0DA6BB795DCC7F00164DA146DAFE8445B8C89999729449624AB7ADAF37F6B57BC7E64490611E7FA7ABCAF51C92176DF2183F8FC7C07C37DE3F426B52F18941B15DA834481F9449624AB7ADAF372E808ACE2090B5E14AD6D5ED66289B5278DA827A17800CE76631511D42670FFE2EB15956EA79C166176DF2183F8FC7C0E4A630A5B664A4FF725E5C173C3A84C3FB9365559B687AC835872C767BF85DA2F004C90652538430E4A6367B16DE6309
X-C1DE0DAB: 0D63561A33F958A501B630F5DE80C16A5002B1117B3ED69682E0B2022E627B51108A05421C070DB8823CB91A9FED034534781492E4B8EEAD17AEC49845D0B908
X-C8649E89: 1C3962B70DF3F0ADE00A9FD3E00BEEDF3FED46C3ACD6F73ED3581295AF09D3DF87807E0823442EA2ED31085941D9CD0AF7F820E7B07EA4CFB6A744B35CF25C0B8A55C61E9817727BB63C203EC7CDA720316905D3FD6882F480BEFAEC9D272008F8F060CAED0E7FB75E9AF09E60F0ACB100374BAAECF801E67D97AEDDE502EABE111DC66A97D0BFE2913E6812662D5F2A17D6C1CDD2003EB8E03787203701020945C72C348FB7EED3
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu53w8ahmwBjZKM/YPHZyZHvz5uv+WouB9+ObcCpyrx6l7KImUglyhkEat/+ysWwi0gdhEs0JGjl6ggRWTy1haxBpVdbIX1nthFXMZebaIdHP2ghjoIc/363UZI6Kf1ptIMVS2bpaGes9W5SM7d9ZguQ8A=
X-Mailru-Sender: 689FA8AB762F7393FE9E42A757851DB673AA3B551BFF1C7EB05FC6B3E28BA0303762A315C7A0AD6790DE4A6105A3658D481B2AED7BCCC0A49AE3A01A4DD0D55C6C99E19F044156F45FEEDEB644C299C0ED14614B50AE0675
X-Mras: Ok
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=inbox.ru; 
 s=mail4; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References
 :To:Subject:MIME-Version:Date:Message-ID:From:Sender:Reply-To:To:Cc:
 Content-Type:Content-Transfer-Encoding:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive:X-Cloud-Ids:Disposition-Notification-To;
 bh=SWTqR5C3KEUj16rMP+PVBM/9+ZSvfM7oKq9qJYP8hfM=; t=1744611029; x=1744701029; 
 b=rgbMOsGvYfrPce5l2/wyAKLcK5CiBfHoV2eH1mw142LUrgVFetKwe8xaSrxCMgxrxAIt1qYiBA+
 pvrhOkBNokIN7JbMHx+p0e+eiIXuwI4P4BnWw8b6zZYU2u4fMygJvyjbX/nlzLRygPfNTisqpxhTv
 IlZTWaxI882pHsW2RsIsDSxaOYN0rwJJjoq4oq5Xg8oADtQkHVx5u/HMu1tHmLIa+Um8u8WUrHO7U
 yf78PL+rBgPDGI5jo1CFW2aSB5c6gzjko4XI+M3C1jk/KupjmOHYhE9Yszk4rLi+KWyvhXm17ttEG
 Hya+J1kKkx6bz+ocnm1BZg8I9GQmNf7vRiMQ==;
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=inbox.ru
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=inbox.ru header.i=@inbox.ru header.a=rsa-sha256
 header.s=mail4 header.b=rgbMOsGv
X-Mailman-Original-Authentication-Results: exim-smtp-7f9dfcd4bd-xgw92;
 auth=pass
 smtp.auth=fido_max@inbox.ru smtp.mailfrom=fido_max@inbox.ru
Subject: Re: [Buildroot] [PATCH] package/timescaledb: bump version to 2.19.2
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
From: Maxim Kochetkov via buildroot <buildroot@buildroot.org>
Reply-To: Maxim Kochetkov <fido_max@inbox.ru>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

14.04.2025 06:54, Scott Fan wrote:
> Release notes: https://github.com/timescale/timescaledb/blob/2.19.2/CHANGELOG.md
> 
> Signed-off-by: Scott Fan <fancp2007@gmail.com>

Reviewed-by: Maxim Kochetkov <fido_max@inbox.ru>


_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
