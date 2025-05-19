Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4067C2D0CD
	for <buildroot@archiver.kernel.org>; Mon, 19 May 2025 05:33:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4B9F060C10;
	Mon, 19 May 2025 05:33:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Hc1ra18oz0IC; Mon, 19 May 2025 05:33:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 907BE60BF2
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 907BE60BF2;
	Mon, 19 May 2025 05:33:29 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id EADCF193
 for <buildroot@buildroot.org>; Mon, 19 May 2025 05:33:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D0470402BC
 for <buildroot@buildroot.org>; Mon, 19 May 2025 05:33:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7Yx10NvvMClZ for <buildroot@buildroot.org>;
 Mon, 19 May 2025 05:33:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=89.221.237.222;
 helo=send127.i.mail.ru; envelope-from=fido_max@inbox.ru; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 648D64018E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 648D64018E
Received: from send127.i.mail.ru (send127.i.mail.ru [89.221.237.222])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 648D64018E
 for <buildroot@buildroot.org>; Mon, 19 May 2025 05:33:25 +0000 (UTC)
Received: by exim-smtp-7b66877447-w854h with esmtpa (envelope-from
 <fido_max@inbox.ru>)
 id 1uGt7p-000000008kI-2bbu; Mon, 19 May 2025 08:33:22 +0300
Message-ID: <994831f7-d311-4cf2-b140-fe99c36dc746@inbox.ru>
Date: Mon, 19 May 2025 08:33:21 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Peter Korsgaard <peter@korsgaard.com>, buildroot@buildroot.org
References: <20250517161505.3294288-1-peter@korsgaard.com>
Content-Language: en-US
In-Reply-To: <20250517161505.3294288-1-peter@korsgaard.com>
X-Mailru-Src: smtp
X-4EC0790: 10
X-7564579A: 646B95376F6C166E
X-77F55803: 4F1203BC0FB41BD908BCBE83E15C9C15A4C64FF5B7A185310527C34CE1A9E019182A05F5380850404F935F66BF3F1BBA3DE06ABAFEAF6705856139AD2A3DF9ED8E9A87BD3FA7A4424ED41D986C17A953
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE711269A7C2F827F16EA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F7900637FE9EFE935CD7C6AE8638F802B75D45FF914D58D5BE9E6BC1A93B80C6DEB9DEE97C6FB206A91F05B253618A06055246042E070BE324C7D3C4130C020CAC97A361BB0A4F435E46E6718B35066C979671628AA50765F790063783E00425F71A4181389733CBF5DBD5E913377AFFFEAFD269176DF2183F8FC7C0B272A53F9BBAC8E28941B15DA834481FCF19DD082D7633A0EF3E4896CB9E6436389733CBF5DBD5E9D5E8D9A59859A8B6325E13D6FBBA02DFCC7F00164DA146DA6F5DAA56C3B73B237318B6A418E8EAB86D1867E19FE14079C09775C1D3CA48CF17B107DEF921CE791DD303D21008E298D5E8D9A59859A8B6D082881546D9349175ECD9A6C639B01B78DA827A17800CE7D151390FFDBF6399731C566533BA786AA5CC5B56E945C8DA
X-87b9d050: 1
X-C1DE0DAB: 0D63561A33F958A556F42DDA69DDE3925002B1117B3ED696ADF044D769FD48ABC81EEE05487B0209823CB91A9FED034534781492E4B8EEADD0953842B444AAC3BDAD6C7F3747799A
X-C8649E89: 1C3962B70DF3F0ADBF74143AD284FC7177DD89D51EBB7742424CF958EAFF5D571004E42C50DC4CA955A7F0CF078B5EC49A30900B95165D346BEB6F73FB9D1E4A664DD9B14471B259813A649F1CC20A088EE735693F70D57F52624AB74D21797A1D7E09C32AA3244CEA495CE8E3EF49AB77DD89D51EBB7742D4FC13904A15E30FEA455F16B58544A2E30DDF7C44BCB90D57ADA2CBCE38F05762A0BE504FE5E636F1E3461735CEBA253FCF178C6DD14203
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu53w8ahmwBjZKM/YPHZyZHvz5uv+WouB9+ObcCpyrx6l7KImUglyhkEat/+ysWwi0gdhEs0JGjl6ggRWTy1haxBpVdbIX1nthFXMZebaIdHP2ghjoIc/363UZI6Kf1ptIMVT0GoR8ZYDe7QWTycGRvSbY=
X-Mailru-Sender: 689FA8AB762F7393FE9E42A757851DB6ABE59A84D17259CE0102773862B8F25E5C189CDCD317D2FB90DE4A6105A3658D481B2AED7BCCC0A49AE3A01A4DD0D55C6C99E19F044156F45FEEDEB644C299C0ED14614B50AE0675
X-Mras: Ok
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=inbox.ru; 
 s=mail4; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References
 :To:Subject:MIME-Version:Date:Message-ID:From:Sender:Reply-To:To:Cc:
 Content-Type:Content-Transfer-Encoding:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive:X-Cloud-Ids:Disposition-Notification-To;
 bh=gM6LG+g0ClHBC/8UuNQMtqR3OM2joUgRV3tGlRDCz0c=; t=1747632806; x=1747722806; 
 b=Uppi0BomF3goAfgo4ypzzo/W3aDupkxZ5dhX7Nf2i1uwmWoZDK0FJ3P6/PRUZW73qL56QUrfn/U
 pRnTO4zcZ7uaReVKmEQ1oHnDkhZteZY+xQBKqK6CqkMJ4D07Ia1uJM3YwXaCATLWQca6MH8rbZg2U
 fSzHyWSSscoZuEFVyj7clrmZRMDpgyYrVp9j64j/NEMbKbgm1tdOQkNIbQAEP44T2ZYfVUolf0lLb
 Xiik1vvdPgJRY8Lw1Vb/t/8t6GGtHEQ3qYyVV+XEjrHEaSbcY/QaMqkjMzA6VG4YGe+OKC5v/D3oc
 RK9OPkW7qF3EP82Ooz+djiX2aAiGIyqfS8iw==;
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=inbox.ru
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=inbox.ru header.i=@inbox.ru header.a=rsa-sha256
 header.s=mail4 header.b=Uppi0Bom
X-Mailman-Original-Authentication-Results: exim-smtp-7b66877447-w854h;
 auth=pass
 smtp.auth=fido_max@inbox.ru smtp.mailfrom=fido_max@inbox.ru
Subject: Re: [Buildroot] [PATCH] package/postgresql: security bump to
 version 17.5
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

17.05.2025 19:15, Peter Korsgaard wrote:
> Fixes the following security issue:
> 
> CVE-2025-4207: PostgreSQL GB18030 encoding validation can read one byte past
> end of allocation for text that fails validation
> 
> A buffer over-read in PostgreSQL GB18030 encoding validation allows a
> database input provider to achieve temporary denial of service on platforms
> where a 1-byte over-read can elicit process termination.  This affects the
> database server and also libpq.
> 
> https://www.postgresql.org/about/news/postgresql-175-169-1513-1418-and-1321-released-3072/
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>


Reviewed-by: Maxim Kochetkov <fido_max@inbox.ru>

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
