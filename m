Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 013A7C3DA6D
	for <buildroot@archiver.kernel.org>; Mon, 19 May 2025 06:50:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 803DE60D96;
	Mon, 19 May 2025 06:50:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9YHvxEWqg_kZ; Mon, 19 May 2025 06:50:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A4DB760D72
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A4DB760D72;
	Mon, 19 May 2025 06:50:38 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 7359C1BA
 for <buildroot@buildroot.org>; Mon, 19 May 2025 06:50:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 597D1404DD
 for <buildroot@buildroot.org>; Mon, 19 May 2025 06:50:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GFc-RDdos3Yj for <buildroot@buildroot.org>;
 Mon, 19 May 2025 06:50:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=89.221.237.201;
 helo=send106.i.mail.ru; envelope-from=fido_max@inbox.ru; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org ADF194022A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ADF194022A
Received: from send106.i.mail.ru (send106.i.mail.ru [89.221.237.201])
 by smtp2.osuosl.org (Postfix) with ESMTPS id ADF194022A
 for <buildroot@buildroot.org>; Mon, 19 May 2025 06:50:29 +0000 (UTC)
Received: by exim-smtp-7b66877447-jd7n8 with esmtpa (envelope-from
 <fido_max@inbox.ru>)
 id 1uGuKO-00000000Gwo-12EA; Mon, 19 May 2025 09:50:24 +0300
Message-ID: <3b35f517-7ea6-47ce-8dac-c7132abf2bb9@inbox.ru>
Date: Mon, 19 May 2025 09:50:24 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Scott Fan <fancp2007@gmail.com>, buildroot@buildroot.org
References: <20250519060531.982830-1-fancp2007@gmail.com>
Content-Language: en-US
In-Reply-To: <20250519060531.982830-1-fancp2007@gmail.com>
X-Mailru-Src: smtp
X-4EC0790: 10
X-7564579A: 646B95376F6C166E
X-77F55803: 4F1203BC0FB41BD908BCBE83E15C9C156F44A7C32907AA98DA99A95FFED92801182A05F5380850400FB9FC4694635A473DE06ABAFEAF6705A4C0F85D97A4809DADF8A7CD0672FC7B2D7423A3730B9CE4
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE7E50EC9128971FD6EEA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F7900637AC83A81C8FD4AD23D82A6BABE6F325AC2E85FA5F3EDFCBAA7353EFBB55337566C9A72302B2DF38EA65A189007D91AFB92C8FF6EDF29B7E74C16D679DDE99ACFF8EEF46B7454FC60B9742502CCDD46D0D21E93C0F2A571C7BF6B57BC7E64490618DEB871D839B73339E8FC8737B5C22491638054B7D09EC08CC7F00164DA146DAFE8445B8C89999729449624AB7ADAF37F6B57BC7E64490611E7FA7ABCAF51C92176DF2183F8FC7C068077CCD40B79AC98941B15DA834481F9449624AB7ADAF372E808ACE2090B5E14AD6D5ED66289B5259CC434672EE63711DD303D21008E298D5E8D9A59859A8B6B372FE9A2E580EFC725E5C173C3A84C3727597FF642BA4D735872C767BF85DA2F004C90652538430E4A6367B16DE6309
X-C1DE0DAB: 0D63561A33F958A58708D864DC7D491E5002B1117B3ED6966107959F4C541D47B48B7A7F94616420823CB91A9FED034534781492E4B8EEAD85CCBA673D36D1A4BDAD6C7F3747799A
X-C8649E89: 1C3962B70DF3F0ADE00A9FD3E00BEEDF3FED46C3ACD6F73ED3581295AF09D3DF87807E0823442EA2ED31085941D9CD0AF7F820E7B07EA4CFD54F5B3DC5362B9D9B08B42E5C28074EF091E87F840599AC1C6BAA959FA771CF3D4CAFFB26F46A3D230DABA77443319C00FC82247622D6AB7929DDE3F14B2611437815B1A451B7F3111DC66A97D0BFE2913E6812662D5F2A17D6C1CDD2003EB8E03787203701020945C72C348FB7EED3
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu53w8ahmwBjZKM/YPHZyZHvz5uv+WouB9+ObcCpyrx6l7KImUglyhkEat/+ysWwi0gdhEs0JGjl6ggRWTy1haxBpVdbIX1nthFXMZebaIdHP2ghjoIc/363UZI6Kf1ptIMVT0GoR8ZYDe7yGpG8vJUg1Q=
X-Mailru-Sender: 689FA8AB762F7393FE9E42A757851DB6638FF75C72B700177626FE2EF197CA4AB31CF4C512BA075C90DE4A6105A3658D481B2AED7BCCC0A49AE3A01A4DD0D55C6C99E19F044156F45FEEDEB644C299C0ED14614B50AE0675
X-Mras: Ok
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=inbox.ru; 
 s=mail4; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References
 :To:Subject:MIME-Version:Date:Message-ID:From:Sender:Reply-To:To:Cc:
 Content-Type:Content-Transfer-Encoding:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive:X-Cloud-Ids:Disposition-Notification-To;
 bh=ZgppYHuqBwcIYgGYwE4pINRKbxN8jkp1/xqzsNDCPEg=; t=1747637432; x=1747727432; 
 b=s4w59JbmgqLaov7vCKgDdoEBwQPCEPyISD9iSlt8+UxR8BAS+CI2Ms+MO6t+YALzNI5kWNfwppr
 4pAGvKSOD8SW4Yst9G6jZ3Lul/6qlvasna9Rsyv8XbyQpWCJ8S5EGk4QqPJWsrLzMLfM/0Cv/5g2+
 +xlaUXmxrMJe/6qWV8pQWdO8iZ+h06ziyR+RZAfRGRp95ftiI+3EQrv8u6yZE47L6JKzQPOhmvHt7
 ltQk3SwO/PPV7qzz3609hx17dYqvlv976rLH2vDvp1J5g+lTbu1vmScKpdalEvg6BLM3EzI6YGZEL
 2Z0NvdJCx7OA/r8axpMZbnsWCc7xlEdJDL/w==;
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=inbox.ru
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=inbox.ru header.i=@inbox.ru header.a=rsa-sha256
 header.s=mail4 header.b=s4w59Jbm
X-Mailman-Original-Authentication-Results: exim-smtp-7b66877447-jd7n8;
 auth=pass
 smtp.auth=fido_max@inbox.ru smtp.mailfrom=fido_max@inbox.ru
Subject: Re: [Buildroot] [PATCH] package/timescaledb: bump version to 2.20.0
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

19.05.2025 09:05, Scott Fan wrote:
> Release notes: https://github.com/timescale/timescaledb/blob/2.20.0/CHANGELOG.md
> 
> Add the PG_PATH variable to ensure that CMake can find the "pg_config" program.
> Otherwise, the following error will be reported.
> CMake Error at CMakeLists.txt:85 (message):
>    Unable to find 'pg_config'
> 
> Signed-off-by: Scott Fan <fancp2007@gmail.com>

Reviewed-by: Maxim Kochetkov <fido_max@inbox.ru>

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
