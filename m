Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BC22CFD2F6
	for <buildroot@archiver.kernel.org>; Sat, 29 Nov 2025 17:55:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2020460794;
	Sat, 29 Nov 2025 17:55:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2d18sZQvb-UW; Sat, 29 Nov 2025 17:55:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9805A60766
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9805A60766;
	Sat, 29 Nov 2025 17:55:50 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 04634273
 for <buildroot@buildroot.org>; Sat, 29 Nov 2025 17:55:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DEE224046B
 for <buildroot@buildroot.org>; Sat, 29 Nov 2025 17:55:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gj1Aq03-jXgz for <buildroot@buildroot.org>;
 Sat, 29 Nov 2025 17:55:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.2;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org D6BF3403ED
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D6BF3403ED
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D6BF3403ED
 for <buildroot@buildroot.org>; Sat, 29 Nov 2025 17:55:47 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 3908420039C;
 Sat, 29 Nov 2025 18:55:33 +0100 (CET)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 29 Nov 2025 18:55:33 +0100
MIME-Version: 1.0
Date: Sat, 29 Nov 2025 18:55:33 +0100
To: Peter Korsgaard <peter@korsgaard.com>
Cc: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org, Alexey
 Lukyanchuk <skif@skif-web.ru>, Roy Kollen Svendsen
 <roykollensvendsen@gmail.com>, Maxim Kochetkov <fido_max@inbox.ru>, James
 Hilliard <james.hilliard1@gmail.com>, Julien Corjon <corjon.j@ecagroup.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Giulio Benetti
 <giulio.benetti@benettiengineering.com>, Jesse Van Gavere
 <jesseevg@gmail.com>, Nathaniel Roach <nroach44@gmail.com>
In-Reply-To: <878qg37r2n.fsf@dell.be.48ers.dk>
References: <20251117214234.1115937-1-bernd@kuhls.net>
 <87ikf77r5i.fsf@dell.be.48ers.dk> <878qg37r2n.fsf@dell.be.48ers.dk>
User-Agent: Webmail Free/1.6.11
Message-ID: <ed69c50bb5489caed26711c1bc3edb3e@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1764438945;
 bh=G+zUsW3zLIPuLF7l94meSZG4XesyoRD6SL9iL94/eEE=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=iT+PUbLvZ0tCzw9A5U7aJNNg5laLeAcgxH/teoTMhP3iC2lQ0h9O/NNkUw1GvzXCy
 NWT6Sis5uFM3mLDkCHDLAR8zHCxt5Uj1SM/28kTeaqznhuuV3xDpjk9Pl5gyxrf9Nr
 IsOSKcqrtOD9flxjva6/eM7wIehir4ELrbxJ7agJ6v5e5W6TGJIxT9w5Tf2BTE55i+
 ukjLE9GfNcZmZH1IaS2ctCqSTXXRd5RA2UFK3Tt0Vn28IMWuHCuFECbo7UXIxoMXfi
 oq62wsPDge94tjFq/DGUbkzqZ6RBuCU5MB5jyKPi1DxZWPpZPn64ssDqdpStE6EShG
 1KaRk1KRLMyow==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=iT+PUbLv
Subject: Re: [Buildroot] [PATCH 1/2] package/timescaledb: bump version to
 2.23.1
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

On 18/11/2025 08:11, Peter Korsgaard wrote:
>>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:
> 
>>>>>> "Bernd" == Bernd Kuhls <bernd@kuhls.net> writes:
>  >> Changelog:
>  >> https://github.com/timescale/timescaledb/blob/2.23.1/CHANGELOG.md
> 
>  >> This bump adds support for PostgreSQL 18.
> 
>  >> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> 
>  > Committed, thanks.
> 
> Sorry, I changed my mind. I think it makes more sense to get -rc1 
> tagged
> and then add this and the postgresql bump to the next branch.

I applied this series on next, now we have the -rc1 tag.

> I'll get -rc1 tagged very soon.
> 
> --
> Bye, Peter Korsgaard

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
