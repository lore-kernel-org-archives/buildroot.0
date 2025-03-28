Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9272C36010
	for <buildroot@archiver.kernel.org>; Fri, 28 Mar 2025 08:07:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 52138612AA;
	Fri, 28 Mar 2025 08:07:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GGbfX-aBkJZF; Fri, 28 Mar 2025 08:07:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8E0F47082B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8E0F47082B;
	Fri, 28 Mar 2025 08:07:12 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id D96AD12A
 for <buildroot@buildroot.org>; Fri, 28 Mar 2025 08:07:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C32E470815
 for <buildroot@buildroot.org>; Fri, 28 Mar 2025 08:07:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id prVtcZYAAlCo for <buildroot@buildroot.org>;
 Fri, 28 Mar 2025 08:07:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=89.221.237.221;
 helo=send126.i.mail.ru; envelope-from=fido_max@inbox.ru; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 5EB6B70837
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5EB6B70837
Received: from send126.i.mail.ru (send126.i.mail.ru [89.221.237.221])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5EB6B70837
 for <buildroot@buildroot.org>; Fri, 28 Mar 2025 08:07:08 +0000 (UTC)
Received: by exim-smtp-78d4fbc7f9-ltzfz with esmtpa (envelope-from
 <fido_max@inbox.ru>)
 id 1ty4k5-00000000FOv-1C8M; Fri, 28 Mar 2025 11:07:05 +0300
Message-ID: <6ac3af59-b287-49de-8303-681116ec7768@inbox.ru>
Date: Fri, 28 Mar 2025 11:07:04 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Scott Fan <fancp2007@gmail.com>, buildroot@buildroot.org
References: <20250325014602.1168402-1-fancp2007@gmail.com>
Content-Language: en-US
In-Reply-To: <20250325014602.1168402-1-fancp2007@gmail.com>
X-Mailru-Src: smtp
X-4EC0790: 10
X-7564579A: 646B95376F6C166E
X-77F55803: 4F1203BC0FB41BD9A360261D1766EAAE2CEC989D154AEC03D62A88D91B045B7F182A05F538085040B6B0B05C9DD550213DE06ABAFEAF6705992CF38C063C4240DA214197AF4D340D83CBAA0A329D8B6B
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE7F1942E6D70B4A2F0EA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F7900637AC83A81C8FD4AD23D82A6BABE6F325AC2E85FA5F3EDFCBAA7353EFBB553375661C72F8825BA4B78E341DB6B9F5264E8323BA0F28A92578D7DB2DAE5948F570FF8EEF46B7454FC60B9742502CCDD46D0D706E30CA52318619F6B57BC7E64490618DEB871D839B73339E8FC8737B5C224911E5B64A728E1589CC7F00164DA146DAFE8445B8C89999729449624AB7ADAF37F6B57BC7E64490611E7FA7ABCAF51C92176DF2183F8FC7C07C37DE3F426B52F18941B15DA834481F9449624AB7ADAF372E808ACE2090B5E14AD6D5ED66289B5278DA827A17800CE754F43A495B1ACFC12EB15956EA79C166176DF2183F8FC7C0D05AD665AB97B35D725E5C173C3A84C3335407143AA9223635872C767BF85DA2F004C90652538430E4A6367B16DE6309
X-C1DE0DAB: 0D63561A33F958A5E9750928B585857A5002B1117B3ED6967985B2973FF319051BDDAE3D1EA49BEA823CB91A9FED034534781492E4B8EEAD2B25D9E4C92BC8ACBDAD6C7F3747799A
X-C8649E89: 1C3962B70DF3F0ADE00A9FD3E00BEEDF3FED46C3ACD6F73ED3581295AF09D3DF87807E0823442EA2ED31085941D9CD0AF7F820E7B07EA4CF21B7BB7BBE4AA94A86818401AA90A767E2FCA6C368FFBF7DC485B67D9CFBD46BC9FF4CCC84A62DB75B8A6FADB96A467091E676E37F21291EBFC6AF87BB37F530558B6873E1A8161F111DC66A97D0BFE2913E6812662D5F2A17D6C1CDD2003EB8E03787203701020945C72C348FB7EED3
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu53w8ahmwBjZKM/YPHZyZHvz5uv+WouB9+ObcCpyrx6l7KImUglyhkEat/+ysWwi0gdhEs0JGjl6ggRWTy1haxBpVdbIX1nthFXMZebaIdHP2ghjoIc/363UZI6Kf1ptIMVZ8CcAyMfNWT9wwPcNUn/2c=
X-Mailru-Sender: 689FA8AB762F739381B31377CF4CA21958ED7422EC37D8EA9355D46C0D197EE18F2380F6D1BC243F90DE4A6105A3658D481B2AED7BCCC0A49AE3A01A4DD0D55C6C99E19F044156F45FEEDEB644C299C0ED14614B50AE0675
X-Mras: Ok
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=inbox.ru; 
 s=mail4; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References
 :To:Subject:MIME-Version:Date:Message-ID:From:Sender:Reply-To:To:Cc:
 Content-Type:Content-Transfer-Encoding:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive:X-Cloud-Ids:Disposition-Notification-To;
 bh=JRgkHlOx8LEWiEYmXUBvu+HBzgb8Z+ExpcdgFOHTs6w=; t=1743149229; x=1743239229; 
 b=uCI1iDc6SIcIGPHD6UFp3EWqllT08FGp4aaf3HsZXayXBihq0LYMbChDP0YGnRkykALzW+aF3pl
 1JlgA11IhlntoLIDRqSfQlpriKluyAt/lP+YgdC3nump4yJeMDkFT80UsUMOejpLJegWA5BXZOpoX
 eYKyUx5PEniA7KKuV1nJu/oQ5ca5eibR7eASfLXDbeWb8LeM7wpGYq+DNRTpORZhTR1gJxIE23WXB
 fV3l0J+e0upp6ooAZqaHxiYaaKSiDsLfrtLLN6PdTcxWclA/DjbHKKJkXCfJWcDK9tipLQfBmqoWU
 xTBCAz9dp+odqxA0vogRH1PpHAUbQE4opxpw==;
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=inbox.ru
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=inbox.ru header.i=@inbox.ru header.a=rsa-sha256
 header.s=mail4 header.b=uCI1iDc6
X-Mailman-Original-Authentication-Results: exim-smtp-78d4fbc7f9-ltzfz;
 auth=pass
 smtp.auth=fido_max@inbox.ru smtp.mailfrom=fido_max@inbox.ru
Subject: Re: [Buildroot] [PATCH] package/timescaledb: bump version to 2.19.0
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

25.03.2025 04:45, Scott Fan wrote:
> Release notes: https://github.com/timescale/timescaledb/blob/2.19.0/CHANGELOG.md
> 
> Signed-off-by: Scott Fan <fancp2007@gmail.com>

Reviewed-by: Maxim Kochetkov <fido_max@inbox.ru>

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
