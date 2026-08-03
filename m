Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FCE3C55182
	for <buildroot@archiver.kernel.org>; Mon,  3 Aug 2026 19:35:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E60026071C;
	Mon,  3 Aug 2026 19:35:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lbGtL3oyn4Ts; Mon,  3 Aug 2026 19:35:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 25676606D4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785785747;
	bh=eT3EVlD34alZFlTAyngi/cyLJBNzoOg+C2bCaP4wA6A=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=swNLf5aucs2dWkiFtZtwtNb0e1Xng3hdxIRWOmk0M/6Lq0BzIYQ8Es5PcXx2bFE9y
	 TPfBjY7J/crzd7FaYWkAcaHHke8fUDrXeD2e+WZBUu4GVbgynsgeMpGtOImHodsQHe
	 iRiF8TxBXPtiOS9H093EyW9nD3ZABp0yo4Pz8XA0r8DNNZzN4wEWXPCQ7dEOMjkKUK
	 MFvoxpnpTSXWBScD4Le+K2ayfhJ1wY1JS8uUBSizfvM5laswhUTNdko8lrRfd3nVo1
	 5XrtK+h1KPo4YRcVmHj2dswJ9eH2KL4uLLslbYiPZ8iivgSlj+50qsiUVN4eV3RT7B
	 Yb/RkO4DzniCg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 25676606D4;
	Mon,  3 Aug 2026 19:35:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 7FB7C2DE
 for <buildroot@buildroot.org>; Mon,  3 Aug 2026 19:35:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 713AD80BAA
 for <buildroot@buildroot.org>; Mon,  3 Aug 2026 19:35:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eVsxZT8nSfBm for <buildroot@buildroot.org>;
 Mon,  3 Aug 2026 19:35:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 9FED080B5C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9FED080B5C
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9FED080B5C
 for <buildroot@busybox.net>; Mon,  3 Aug 2026 19:35:44 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 718EA2003C1;
 Mon,  3 Aug 2026 21:35:41 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 03 Aug 2026 21:35:41 +0200
MIME-Version: 1.0
Date: Mon, 03 Aug 2026 21:35:41 +0200
To: Francois Perrad <francois.perrad.86@gmail.com>
Cc: buildroot@busybox.net
In-Reply-To: <20260803065940.224429-2-francois.perrad.86@gmail.com>
References: <20260803065940.224429-1-francois.perrad.86@gmail.com>
 <20260803065940.224429-2-francois.perrad.86@gmail.com>
User-Agent: Webmail Free/1.6.17
Message-ID: <91dcb8c0a8c5986b685464dd02ac109b@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1785785742;
 bh=FP3pk+4Yw/sFXE+kNkEjXoFCqNg38h11ileWBHWMlRU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=HmUMLK1UEKJLiaK2JNrlbjsQrHhprsQXjRf/+2Szmhho2PHpMCfiLYimnmyE7TRnI
 GX1MMaFh70dQDPJ2wksETuYjrTPFBNrZnNnwOzUwVCHI+xE8ERwbxR881h4dIAd7/h
 +YTdUxTTnHw2Ux02cpPew4OA6Z7x1YcPFSy8AC9+LrtZpaRF1Pf9s9ugzF0nC8Fa6L
 2IYpwGT0dBUIOBrwBZTHT9JZLJlO3l1l+7eSuAQyerfG7kBofPfHS0+4ZxhAtST/9w
 VXsZAOyLaVwDy7JCUA0AhOJyCGQAC6SZMy1GRqeREr8IP75I0o6QWdXzgNtVCj3rlF
 19TtC18A6Iadw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=HmUMLK1U
Subject: Re: [Buildroot] [PATCH v4 1/8] package/qbe: new host package
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

On 03/08/2026 08:59, Francois Perrad wrote:
> dependency for host-hare
> 
> Signed-off-by: Francois Perrad <francois.perrad.86@gmail.com>

Series applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
