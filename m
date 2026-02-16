Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 738E5E8382D
	for <buildroot@archiver.kernel.org>; Mon, 16 Feb 2026 20:19:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 36A2060DDD;
	Mon, 16 Feb 2026 20:19:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kvVpEIcJcTNx; Mon, 16 Feb 2026 20:19:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1F5E560A65
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771273167;
	bh=6M+pXADky441nlSczglzegcFJNCz6G+oCIMd1iKLK9c=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=LeFVv9nwCh7Mk+Mbnqxd0r/+zKqZ/yKL36okivYkrK2LePvyYJfw7oXLi24MGC/hb
	 uc761kI3rDVjylg6osDFU+WZJZbjOrQZaVvOnc1fJai8dBHja3vFro2mMV6lmjbEOK
	 /8PVjYUAMUrcD6C6CoEm23xLPhpwqUkIvJ4clVcT6kd/YREjMHKEvYydiognD7aspx
	 oBe+3pfct1DPTlTfOlIMEB76Hx/zsyp8knEJg7iWd3MJdf9NnQWmOCV4uVMsSaggVX
	 0cSMS5gdPWoVBWCGaD0tyAKWxA0qp2XoCLSuvttA6ZmOMA7YGRHOGv8LzzZd/SLZPe
	 GSbVfkHaxoQxA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1F5E560A65;
	Mon, 16 Feb 2026 20:19:27 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id AA10A35B
 for <buildroot@buildroot.org>; Mon, 16 Feb 2026 20:19:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8F2E340C52
 for <buildroot@buildroot.org>; Mon, 16 Feb 2026 20:19:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tTOv2FAcxynl for <buildroot@buildroot.org>;
 Mon, 16 Feb 2026 20:19:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org C0E5840C4D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C0E5840C4D
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C0E5840C4D
 for <buildroot@buildroot.org>; Mon, 16 Feb 2026 20:19:24 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 28F8019F574;
 Mon, 16 Feb 2026 21:19:20 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 16 Feb 2026 21:19:20 +0100
MIME-Version: 1.0
Date: Mon, 16 Feb 2026 21:19:20 +0100
To: Titouan Christophe <titouan.christophe@mind.be>
Cc: buildroot@buildroot.org, Pierre Ducroquet <pinaraf@pinaraf.info>
In-Reply-To: <20260216163057.360035-1-titouan.christophe@mind.be>
References: <20260216163057.360035-1-titouan.christophe@mind.be>
User-Agent: Webmail Free/1.6.13
Message-ID: <72bba6a61a92064929c9023f81e3a9b9@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1771273162;
 bh=j3JBA0TQwwl/hoHpaHq+VttZIbJOekbngw9LSZaUGTo=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=igalUGNbOrSQz5Y9X8tbPDpod0jIHlCVz4NrvTCmW+pue7UGZC1tf1kUiIArB2/4Q
 FNpY1yqo8BywM8aS+o/RcTR3j+rTUTPfXOLqbA7J0iQaa7AcRlOcLqcSJd2EUvLjcO
 Uti0RcJ8T5qV7o9vQDPXKZzyZnqzZJOKS7OPyj0vKL3fiHu+/Qt18PnoGyAUdvy40h
 777ZYdhLqfaffoo/72pVyHf60ph0ZfF3mGJj7z5aOqOixOIJtahkF+aAI5078fkV/N
 4kENzH/HAOpew/oBttKgm84wOIHKwuyZ7zz0LlAjR/KPVoGHf/QsrhM5aOWjpX86GE
 NSeQYhOvT6Y7g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=igalUGNb
Subject: Re: [Buildroot] [PATCH v2] package/kf5/*: bump to v5.116
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

On 16/02/2026 17:30, Titouan Christophe via buildroot wrote:
> This is the last (known) release of KDE Frameworks 5, read the 
> announcement
> https://kde.org/announcements/frameworks/5/5.116.0/
> 
> Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
