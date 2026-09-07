Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A29CDC79F99
	for <buildroot@archiver.kernel.org>; Mon,  7 Sep 2026 18:43:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 639CC6068A;
	Mon,  7 Sep 2026 18:43:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Odc2ZIsidRmi; Mon,  7 Sep 2026 18:43:26 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 8C6FD6066D
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788806606;
	b=Egc7vt/qQItWhfRV04gKSqD/8yhN9P4oscET81h9tULMTLiFepOAWHTejk++EcedXYYs
	 y3LVCz2NHryrpyNYhI3VPtwUAiv3UE35KpLa+0VGUnufpjDDSM0v1l+M2o4X86y4hhKuj
	 Nv8SRABSwnuK72EQXMpr1v3VVA5yQ29ivVbgxp1imRDZSBUdG7eCimWzI8Ywq3dbuemCm
	 uiwwkVi3YOIKGaTBF7XjXz/648opWGwRJc7LYhyivcivAD9/tV8BDdN+M4VcQMZREdOC0
	 CdxJcyMb5TWG3Yynp+yquv7HiI2DEv6+xEpnS1ESuYzps5GR/DWoHJ3Q6bn9nyORARg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788806606;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=SFEhBxRZ/3gxKX3pRjOCIxwUMU03im/IxxW/Qh42zgA=;
	b=Fu130CYESePGr82wlttXP1Bstt1+vWvZe2Q6azO1/18RADcDfHOXyGawQJPaUPRRKZ19
	 NnIdiynJvXJptT8/iNNTZiXsd2EB/BFvz3/T6ixr560kuOhbe4HNC/zs89mx/Dp5WZ9JR
	 9z2YzsfUNpVjpsQDKTsJ0bfOmMxxPGu8+iAgUadRJf8CbyPDbmq1fJsZSlplRmJL8BuoG
	 LVdPcmLYxKw76ZgbHLuXprJOOWXM84MbeNMPfhAWehvDAULT6NE+3ehGz6qlPEhaaiS5S
	 fuu/y286liiPfYUtrODLHR3Jy2IPxY1cRRRjpubRLUcS6x67tfJUKi6aOgI21TJKcvw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788806606;
	bh=SFEhBxRZ/3gxKX3pRjOCIxwUMU03im/IxxW/Qh42zgA=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=YgBk20uLziGpp0phaIAFEttBb7ksoeMfmAR8EcgXFFeVSi6bcxjC/6Dew8ny4OigB
	 7E0kucmO3OkFVceWSs0qanz630Dq4bshMI3YG9/Gx8izFFi5BhCJdquyNzSSGLrAHh
	 F4tdU2ip08ZefRJHpZuMc2B8/ql82wV6Js2ZfpACgzzwYlEH7zwNgujtF+Ye+LTose
	 DS31Z5tPgT2Tp/mYBNDtCzeKoQzhF0dJX2hms7HBBeU4p+Jei1f//fPv6ci5zaL534
	 y1qTvZAEXm1WUQJlj9c3JK41tVnNV35zLGqO1/w1brQDTvcjtRwlkhlJvRLnpJ7mYV
	 zuYhrTfoH4asQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8C6FD6066D;
	Mon,  7 Sep 2026 18:43:26 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 4972929B
 for <buildroot@buildroot.org>; Mon,  7 Sep 2026 18:43:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3B9CC60675
 for <buildroot@buildroot.org>; Mon,  7 Sep 2026 18:43:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Pbg4F57-JjuI for <buildroot@buildroot.org>;
 Mon,  7 Sep 2026 18:43:24 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 419D960662
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788806604;
 b=GJ2AATE2Z2AThU/gu7QADB/ZS9MvIzHQPeFgam/yq42H2UeM+Bsi5OS50G9vmY/1uegV
 jlscigIqAIfpOraTQQzQMSQGLjju0jwz5+TRz7gGqZgn+zQSSeJZ/4Q2oXTtibf9RlAJy
 9/DV443mXQK4twbqyJ7o3Ij1sP8tAJlWHQeXI63wwkpstFv+wD7q1uS+nf4wdCqRMZR2h
 r+IqBdxvmpbV4rsUeLd7V3i0bJMDeFYhDapfDY1Qfj3on3NZc5cO8bgNLgYVSfI1UMZ/m
 5kQ1gx/YPAUn9/FhnXkUcaJLyJ6wib+BUc+vDujQmtohdi5Cj0iKRoXRQhDQcaVY8bw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788806604;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=2r/pkvWdi9N3iDehk2OAvoQMY+ox/+nUMXp0Jdp53n8=;
 b=mmTToa8gUKzQtbgBWw/ZD6HSs30J2XCUziMgrxizi/CAZQqAnthWj/qClNxFEgf6D4hr
 XCl1xqwaC37A8qwclm1fU9e1D4agf98sS5r9DqWs54oBycgxSmpKdoExqCNkpRT7mP9zo
 OUPVD/yRHf6o71Nr43UiVN/yyKo0OCi3qM77OT9Giox0iRlKpzMyEGbeRTDuJQWNAMDuT
 ZCAG8rDsThg6tO2BEqdmq6a7GqJ32gY8Gy6mHL2fUCHSwAqOGSy1d94x444tT+4FG1spY
 UXK9KVmoxgv7DV3TMEIHVe7Hip6Rez5x8wbc1VDHVb0ugFHrKhRAtLe8voMXmyrsRHA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=free.fr; 
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=nKWZNCdI; 
 arc=none smtp.remote-ip=212.27.42.5
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 419D960662
 for <buildroot@buildroot.org>; Mon,  7 Sep 2026 18:43:23 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 81A2C5FFB7;
 Mon,  7 Sep 2026 20:43:19 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 07 Sep 2026 20:43:19 +0200
MIME-Version: 1.0
Date: Mon, 07 Sep 2026 20:43:19 +0200
To: Baruch Siach <baruch@tkos.co.il>
Cc: buildroot@buildroot.org, Bernd Kuhls <bernd@kuhls.net>
In-Reply-To: <48f3d7ba06cc6490b6c018243840d9900adf0dfe.1788802568.git.baruch@tkos.co.il>
References: <48f3d7ba06cc6490b6c018243840d9900adf0dfe.1788802568.git.baruch@tkos.co.il>
User-Agent: Webmail Free/1.6.19
Message-ID: <9709563bcf3d6d4b00541cd32057a655@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH] package/strace: fix build with uclibc
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 07/09/2026 19:36, Baruch Siach via buildroot wrote:
> Commit a1e25fe7051 ("package/strace: bump version to 7.2") breaks 
> strace
> build with uclibc because of missing header. Add a patch to fix that.
> 
> Fixes:
> https://autobuild.buildroot.org/results/054705652027d990fb1b418ed4a3c129fb0cdfe3/
> 
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
