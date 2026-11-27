Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17ED5606A31E
	for <buildroot@archiver.kernel.org>; Fri, 27 Nov 2026 14:59:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=QIiheLQ+
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 771F2404C0;
	Fri, 27 Nov 2026 14:59:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iENBXfFpjqy7; Fri, 27 Nov 2026 14:59:18 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org A25A440A70
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795791558;
	b=OIAfPdjUDCrQn0CGIPh3qd+XlV2CzG2np4zcFoqp8tY7IEqMAjqptE7w1ALC5btsDlwB
	 H/q+TEMSPkn35fuh3Tx8F/ViPdQi/h2DKVZDqypI4+UQhxxKRmfRqxMwfwyAHO6z39qvx
	 5U7toHDZwToY8ryyMA9OwyFyHLhoircOQrbsZGM/LnACpq1UG8Cud5opKJapH2/TT+W4o
	 3k3Dncv+4ZOG8ky2cM+kgx4gdAMltobdF7AAZc3sBxDEc8Lg7MWYnB422b7qQ+mKH7tQ+
	 MQsvVMGtgEaiQ/ZsAZC6Loa5V9GsfQZpolpQ3Giaduo6lHRUMs6gYfSFWAKvx8KdsjA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795791558;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:To:References:
	 Content-Language:In-Reply-To:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=0jDAYXJgV/t351EMbnuashAacexjHp4YZ6PRrSdFuaM=;
	b=fymYLtq978W1QpciTtuE19kFar7pfeF1Y2zJHnD7/ahArKDb7osyd/g2zUkuMjSz7kPW
	 cZ6TI1MhpTOyogu4MyNX55Mpz1p8rI4J6mdbqFHSUuDCdpxNHVGQMZvozJmuOYNAde2q+
	 G/YlQ2zeyMWAP06z7N39Dt2lQiIrGsXBi/U2ONL7eSg3WnDrv88cFF+1ZMMEHPHXMTAdc
	 /ilyaQMVPT27rm/6jA0YaLrMxau+eomSv3FQcSG8BbpEexrjjkJ4zUe2mxlwpyo4a8fIV
	 t9zAqWAFq99D3MeFiqOSedUaQwkARkRMkiqLTzm+ijf1p+XFclnVH28DMvfwbqzhJzA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795791558;
	bh=0jDAYXJgV/t351EMbnuashAacexjHp4YZ6PRrSdFuaM=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=QIiheLQ+y8vyBY1J9KlNbUCdYy/KFrfQA3A/pY5tytGphVamC9YjVivVVBNw/tBDl
	 U9YHqeYm9ks+bgu9+lsOILj3WWZQcctDzCEjRbG1fABI0NUnNIsTN2DPnFTkr1ATXP
	 oMZtieuoeDPL3fQhUFoNjkWXh2oJJXYSt2wgPB4vkihEc96vmlp1SQ6U0Dz6MjfylK
	 Fu9b8slbfTAS1XUdYZ/ZSMmSBMjWFwh2qTS9ZtETfyxlr54dfepprmk8A4P5M8iqXd
	 /wNlk4luA21nFwNRp3PoIew62ibBWkn/fttJKwI1MvIg6R0yiXYwtH3tSHIb09yUDY
	 JGte3gdpMMkxw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A25A440A70;
	Fri, 27 Nov 2026 14:59:18 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 73CD2373
 for <buildroot@buildroot.org>; Fri, 27 Nov 2026 14:59:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 65AE681246
 for <buildroot@buildroot.org>; Fri, 27 Nov 2026 14:59:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SBRNCykPNVjG for <buildroot@buildroot.org>;
 Fri, 27 Nov 2026 14:59:16 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 3DAE78121F
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3DAE78121F
 for <buildroot@buildroot.org>; Fri, 27 Nov 2026 14:59:15 +0000 (UTC)
Received: from [192.168.178.20] (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id 49EE52C850D8;
 Fri, 27 Nov 2026 15:59:13 +0100 (CET)
Message-ID: <371c805c-4a81-4a84-bae9-cee64518df2b@bubu1.eu>
Date: Fri, 27 Nov 2026 15:59:12 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Waldemar Brodkorb <wbx@openadk.org>, buildroot@buildroot.org
References: <av_1cutwNfEvosnM@waldemar-brodkorb.de>
Content-Language: en-US
In-Reply-To: <av_1cutwNfEvosnM@waldemar-brodkorb.de>
Subject: Re: [Buildroot] [PATCH] package/asterisk: bump to 24.0.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Reply-To: Marcus Hoffmann <buildroot@bubu1.eu>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-17.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 11/20/26 08:23, Waldemar Brodkorb wrote:
> Update to latest LTS.
> See here for a ChangeLog:
> https://downloads.asterisk.org/pub/telephony/asterisk/ChangeLog-24-current.html
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> ---
Applied to next, thanks!
I had to fix the license info though, there were some changes in the 
24.0.0 release (and also something missing since this package was 
intreoduced). See 
https://gitlab.com/buildroot.org/buildroot/-/commit/55bd43e4a8822fa9f609ee911fdee8c6bc69bd70

Best,
Marcus
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
