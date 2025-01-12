Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3821DE77188
	for <buildroot@archiver.kernel.org>; Sun, 12 Jan 2025 17:34:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EDEC140072;
	Sun, 12 Jan 2025 17:34:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZEsdChwkqyv2; Sun, 12 Jan 2025 17:34:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DDDA34007F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id DDDA34007F;
	Sun, 12 Jan 2025 17:34:52 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id A9ACA940
 for <buildroot@buildroot.org>; Sun, 12 Jan 2025 17:34:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9549C80B98
 for <buildroot@buildroot.org>; Sun, 12 Jan 2025 17:34:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CuYkUAM-ZUSm for <buildroot@buildroot.org>;
 Sun, 12 Jan 2025 17:34:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::15;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org F168A8050E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F168A8050E
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp1.osuosl.org (Postfix) with ESMTPS id F168A8050E
 for <buildroot@buildroot.org>; Sun, 12 Jan 2025 17:34:49 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 1DB4178032A;
 Sun, 12 Jan 2025 18:34:45 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:47924])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 12 Jan 2025 18:34:45 +0100
MIME-Version: 1.0
Date: Sun, 12 Jan 2025 18:34:45 +0100
From: Julien Olivain <ju.o@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20250111171050.2905238-1-james.hilliard1@gmail.com>
References: <20250111171050.2905238-1-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <f8d4c15e30b53ce448f41b0f2509d0b5@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1736703286;
 bh=qfecSNt4uS21CZL5nKbffzh6T1s6uCaLPjY1hRDeFCU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=aWpcX1eKoXlLb0SkcA6lozcYDlW5kjaBEsiWhvmHf+yXx+qfNLHlsLh8AxR6iBEoO
 lIXqV8fgvrkjm1heU/kksjUnfU3P0KiKWnQPW208X1uWaAsBiuCILLzpFxEoSeKPkc
 seSCs+Wo6ZHkyiwDPy4NxQWLTx9gChxVScgKCkYkfcadbjb+Q6qBSY/Wt7Iqg+vjpt
 VeiBFxovmSOsqq+K9eWSJ8bkbrgjcuQ+ueaRwZmjPGl1cqieA9gaVjm2sTVcjgi4oS
 liRSQbeqbk4gMfAQ0l45EMLb8zuif8VryQ5UFSOLO07efjHrTVLyRbl5KH0yM9QpCw
 cAiSwXdloJaug==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=aWpcX1eK
Subject: Re: [Buildroot] [PATCH 1/1] package/python-setuptools: bump to
 version 75.8.0
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 11/01/2025 18:10, James Hilliard wrote:
> Rebase add executable patch.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
