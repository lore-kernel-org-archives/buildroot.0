Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A98FCD0405
	for <buildroot@archiver.kernel.org>; Mon,  5 Jan 2026 21:01:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 109CB40878;
	Mon,  5 Jan 2026 21:01:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id B6sWzcEnWdG2; Mon,  5 Jan 2026 21:01:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A0171402C5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767646913;
	bh=38mllLtF6iXuhqqMoaX1+Z2Q1Pym7QHLgvC/S8TNEw4=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=AD6Ur4BAeAoL9tRRCsZCr/CyPCxuEz2XwtsNaI5C04T2/P81fzJgMxqrxqvB6pAyh
	 Pa620ybwrkIGR7zd7ft4hULRYDwGm2LpJpk82qOqGVOUtBU1Oix/e3U0EQUnHNMLsC
	 XnQ+bDcEw2anK5VM+WIvaadkiVR/Mxj4yH21VWC5cbSMhj5moh0Sh+x992pFDv2pXn
	 wJHZbDQWd3UDBo5w6et7ZTsll2kg9Xli4bTYU/14PanCPUZodsGfdYBdmb850Ah3q4
	 9HoMT2c1/TyEiM0963Thet+HFpLE5jR1WGiFGTic+BhalsexnIA982/TAuuTKSszx8
	 ghF8EEelQGswQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A0171402C5;
	Mon,  5 Jan 2026 21:01:53 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id CEBBC249
 for <buildroot@buildroot.org>; Mon,  5 Jan 2026 21:01:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B4F81608A1
 for <buildroot@buildroot.org>; Mon,  5 Jan 2026 21:01:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tADAHf21cRvl for <buildroot@buildroot.org>;
 Mon,  5 Jan 2026 21:01:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 0BF836067E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0BF836067E
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0BF836067E
 for <buildroot@buildroot.org>; Mon,  5 Jan 2026 21:01:50 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 05DFEB0053E;
 Mon,  5 Jan 2026 22:01:46 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 05 Jan 2026 22:01:46 +0100
MIME-Version: 1.0
Date: Mon, 05 Jan 2026 22:01:46 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
In-Reply-To: <20260104174707.3909632-1-james.hilliard1@gmail.com>
References: <20260104174707.3909632-1-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.12
Message-ID: <3d23ac456a10f4025b085c3ec88a5cc0@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1767646909;
 bh=PWY1tuk7Jc7n536twP28swQtihSOgbvKN4ns5RCeZMM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=lYWqdHN6vw7rUlWWBopo8tHSYGzzwVHRSVbGYOb98lAyBBQ13tRKGRezJa0m3iCIp
 baBLfEivoNOvMQhrO6EuoTfDs+rbtrhEs2XNhCWVCdreLsNhBRk6QCUEePWiquVCcu
 W9VeahVnRn9ehFSdlPRDAbjP/Es+jdQcAbRId2aeRiLozEw+kks20gSq1isc86GYgm
 D1tjtl1+4khqReWA1fLQLUl1I1oX6gew9Vez3cTyzKaGFDzSxPt6XWn3GdYSyh+goQ
 e4a7m3qWV+834oiF3+7bP4kVtYje1+9bWOk6gYixl/hBMpEfWEgTNwXoeeYGjaMT2s
 aLDhnAVWNZxWA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=lYWqdHN6
Subject: Re: [Buildroot] [PATCH v2 1/3] package/python-librt: new package
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

On 04/01/2026 18:47, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Series applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
