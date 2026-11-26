Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC089606A31E
	for <buildroot@archiver.kernel.org>; Thu, 26 Nov 2026 14:53:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=O77+Utf5
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9037D60AD3;
	Thu, 26 Nov 2026 14:53:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Y6fnA4jRi3IM; Thu, 26 Nov 2026 14:53:33 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 94CBA60AA0
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795704813;
	b=puRdfHrgzybI9aj/vTAtYzmvIzt41/D8WH4/4pRH6/H2fc1aZyoXWem912Vm6N7/lUFP
	 ekugNR3rmVbGbvDCdPeI+kMzcgbk2ko9scXwEPjqCbZPX3ZXuHyrPNUjrDmdGmQb1pUc5
	 ATLxYmhc1AoEj2Ejv6JdKURzNcr3YxELog0y3ekuUbls7QbLfgGT9WRmEHqDVA//PhGla
	 LOmfjSvpDq7LYgoJHwIfyHrVIBdE/5QiZAM3C4qINL1NuUa7zliH1dCBw/4V06ZcDydeM
	 4V6q18arStcwGoXgi9/IXZcQL1yG75bdh+Py7QIGSyDdKXTE6jmnov5PDlBiKfyn4YQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795704813;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:To:References:
	 Content-Language:In-Reply-To:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=m4Dwroyu13Z9Te3l7pp/Tit8lHnbEmCLpOaXrM18AtY=;
	b=nS96aBTKiv3I4b9niH8shrtMr8gdyp5LFQ8Ga4L9yD0Rkhi9CBLppFUc3hLTFzknNg/L
	 PTWVx7quIt7DpJ6lXvVKTAqep808DhmT24DG7MpQxBYZ0LiJv323Lr61uxkCWqA6OiR5S
	 ndKsq3KG1rH7WoKxIviNMVKDjsCgbXlyMIM+pPB5Smj9VErbz6zKRXuyh7/yHXYKigYXL
	 pLBvE3lEBeJUuNRpx3un0YVfMsOHUB7qGlhAvIjZapkydrdEhxDBeX7yW4Tn7dSHEygpp
	 /7iLtEStLokRc9kGFbjrldIRl7oDVClsd2euIkPhsxgB5j8/7dtqL1JL3dDkTZndeAg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795704813;
	bh=m4Dwroyu13Z9Te3l7pp/Tit8lHnbEmCLpOaXrM18AtY=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=O77+Utf527X2DLd1kIMKUacgBzwTwYQH0QtTBUpwcaQMt2mwYZtMAeihA9uAuJS1A
	 /ZV4B8lhsei+sGNMtwwqxdQpLo9Hzgm3iw0QiWtOLiVSHt/tkLiypVpmxYvRGd1E7a
	 vVoRsHsBcsufcdLbi1KjW5Rka3x8ygks0GkDLjAzWFRxYKLh5eCOKvH/bpJBWPpflV
	 9kY/xzP0tn8raWGtwfwVWCrFIRsPeEGFdOzFM2QV13SMIFhsKVho2Rq8vg3M4dgzkC
	 XlF8PG1IX10dEiPMrY+3sX0VTx1/beDJ91X1eanRGBBk6jwoDaSi0CFlksp+IRL9Ek
	 z+67KWQUYvf3g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 94CBA60AA0;
	Thu, 26 Nov 2026 14:53:33 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id D37FA32D
 for <buildroot@buildroot.org>; Thu, 26 Nov 2026 14:53:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BA09F40503
 for <buildroot@buildroot.org>; Thu, 26 Nov 2026 14:53:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RdBbFtguwLef for <buildroot@buildroot.org>;
 Thu, 26 Nov 2026 14:53:31 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 8F55B404A4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8F55B404A4
 for <buildroot@buildroot.org>; Thu, 26 Nov 2026 14:53:29 +0000 (UTC)
Received: from [192.168.178.20] (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id CB45D2C81C06;
 Thu, 26 Nov 2026 15:53:27 +0100 (CET)
Message-ID: <0037ca22-9075-4cc1-b21d-5a0bba6598ff@bubu1.eu>
Date: Thu, 26 Nov 2026 15:53:27 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Shubham Chakraborty <chakrabortyshubham66@gmail.com>,
 buildroot@buildroot.org
References: <20261126071654.153422-1-chakrabortyshubham66@gmail.com>
Content-Language: en-US
In-Reply-To: <20261126071654.153422-1-chakrabortyshubham66@gmail.com>
Subject: Re: [Buildroot] [PATCH] package/htop: bump to version 3.5.3
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

Hi Shubham,

On 11/26/26 08:16, Shubham Chakraborty wrote:
> For changelog, see:
> https://github.com/htop-dev/htop/blob/3.5.3/ChangeLog
> 
> Tested using:
>   utils/test-pkg -p htop
>   (Result: 6 builds, 2 skipped, 0 build failed)
> 
> Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
> ---
Applied to master after marking this as a security bump.
The 3.5.2 update fixes three security issues (published as GHSA's). The 
Additionally the 3.5.3 update claims to fix an old CVE from 2024. (it 
doesn't really, see the commit message for details:
https://gitlab.com/buildroot.org/buildroot/-/commit/cf84d1d2a5aed1a07a3e933c3da08725baa71f83)

(It would be nice if I wouldn't have to do all this research myself when 
applying your patches. But also htop is really not doing great in 
presenting their security relevant fixes in their changelog :-/)

Thanks for your contribution!
Marcus
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
