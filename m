Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F40FA606A31C
	for <buildroot@archiver.kernel.org>; Thu, 12 Nov 2026 20:24:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=oadW2mY3
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1736840DD1;
	Thu, 12 Nov 2026 20:24:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uyT_O8g9Umjz; Thu, 12 Nov 2026 20:24:42 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 4233740D25
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794515082;
	b=DMIEqfPONxu5hsLCGnlVGEZOFU6kT5QufcX2PyRMRKFU09dr07GHnxMB90fVS6cs6hIU
	 WzhV9JLlvKtJBbh1x8ivBJHAubHUOpelezxPc1IcLWOOnPfSB8Hci684ZM93rktlKY2Hw
	 8S3in7Ua1mAjH4ip8fTAbzb2Ne1dEETCCmwhqDH8QebYMmiv8RArG/6pQQtMzF4dICPD6
	 trFFesfi5kyNHFCwBsH4GA1rNASlEiOWKBJFcsH6gt6B9TmhzqZmdP5ikmK17py0suW0v
	 Rojex0iCb5QdIG5w91nq4MQ4XH+bHQD6wRn9QErQ4w8FnFuvBJL/49bqcuubO15SDSg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794515082;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=c4wERTPZN/8OCtltjX9yPTqrJu72DQ0n+vUWDsAA46s=;
	b=Aj3B2HJJtcSOqRtXd9Q4FFAPlBi9igL4zZvizQ96IJydg0JHiQmnbV4nDNUqeo55Q7YK
	 yxofIZPkkJlU9WX8Yi26aIp5PBa+ZOKKh0RnQBSDhXn51CMS5AEgM2SBw+hwsScHZpdlw
	 zk/xSjqO56Blo31tg8u8PTbeWTi4hkEZJ9V0oDDngz978VhLlNm9r/VDZo8YjMWf1FMcs
	 SD7Tx695Y3d90yZtg0sLqveAe4EP+xIwcOXi8jEpvruPeBSBJy1D2icC5dj8JYSDxqRXm
	 TAu2AS8ZIh0A2z+stNfhlVo+A//SVLbyi11USAEH1+Tndfqlmbd8E8DZyIxx5Gwb8fw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794515082;
	bh=c4wERTPZN/8OCtltjX9yPTqrJu72DQ0n+vUWDsAA46s=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=oadW2mY3NPtdpX0N87LYT4qyfm9D2okT5KJgC097lBZCrNM1Owo88aT039cacQDOo
	 HbVcf8uLZsDoqjTI+oLC5u/QHucv1AtidoUt3hJcrt1TQRuvOhMWQXdMMI49sYGsm8
	 o8e9a/Kd07BPIdpFMTfHG7hZoZnadoZgSxBW8tp4ILS/dgfXKVJB6SR5vM5UGVo1fE
	 2egiXea7H0HUQZbc9wqSOV6UsxdtY3iMjTWKpQsoOhMFxQ95Wa4vPmlVWZOpGlVLMd
	 K2xjuFg1D25EOcASwCTyHn0z4kg/SlhTn+Ht0ULcf24ArTF1SRh4Xaj+2kI5wNCq/J
	 rVv3l/078Dmdw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4233740D25;
	Thu, 12 Nov 2026 20:24:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 6839DF46
 for <buildroot@buildroot.org>; Thu, 12 Nov 2026 20:24:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 450C18168D
 for <buildroot@buildroot.org>; Thu, 12 Nov 2026 20:24:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3VAGQfPh7Mao for <buildroot@buildroot.org>;
 Thu, 12 Nov 2026 20:24:39 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org ECE9681689
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp1.osuosl.org (Postfix) with ESMTPS id ECE9681689
 for <buildroot@buildroot.org>; Thu, 12 Nov 2026 20:24:38 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.4])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 871A060132;
 Thu, 12 Nov 2026 21:24:34 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by localhost with HTTP
 (HTTP/1.0 POST); Thu, 12 Nov 2026 21:24:34 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Thu, 12 Nov 2026 21:24:34 +0100
To: Peter Seiderer <ps.report@gmx.net>
Cc: buildroot@buildroot.org, Bernd Kuhls <bernd@kuhls.net>
In-Reply-To: <20261112191820.1758859-1-ps.report@gmx.net>
References: <20261112191820.1758859-1-ps.report@gmx.net>
User-Agent: Webmail Free/1.6.21
Message-ID: <5f78b9dd471d8421688c0ea292afd292@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH v1] package/apache: security bump version to
 2.4.71
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-11.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_PASS autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 12/11/2026 20:18, Peter Seiderer via buildroot wrote:
> - bump version to 2.4.71 (for details see [1])
> - fixes CVE-2026-119618, CVE-2026-109163, CVE-2026-106023
> 
> [1] https://archive.apache.org/dist/httpd/CHANGES_2.4.71
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
