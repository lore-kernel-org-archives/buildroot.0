Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7524C0218C
	for <buildroot@archiver.kernel.org>; Sat, 25 Jan 2025 15:11:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id ABADC60698;
	Sat, 25 Jan 2025 15:11:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QtJ76I0KNRRy; Sat, 25 Jan 2025 15:11:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AF36D60774
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id AF36D60774;
	Sat, 25 Jan 2025 15:11:11 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id BA2CF941
 for <buildroot@buildroot.org>; Sat, 25 Jan 2025 15:11:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B34AA40580
 for <buildroot@buildroot.org>; Sat, 25 Jan 2025 15:11:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AJ-sIiC7xDJK for <buildroot@buildroot.org>;
 Sat, 25 Jan 2025 15:11:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::15;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org E124A40347
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E124A40347
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E124A40347
 for <buildroot@buildroot.org>; Sat, 25 Jan 2025 15:11:09 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 940B078050E;
 Sat, 25 Jan 2025 16:11:04 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:35960])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 25 Jan 2025 16:11:04 +0100
MIME-Version: 1.0
Date: Sat, 25 Jan 2025 16:11:04 +0100
From: Julien Olivain <ju.o@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org, =?UTF-8?Q?Martin_Hundeb=C3=B8ll?=
 <martin@geanix.com>
In-Reply-To: <20250124194204.3819779-1-james.hilliard1@gmail.com>
References: <20250124194204.3819779-1-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <7fa96ab9333553bba2162585be2dd899@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1737817867;
 bh=Niv4UUpFmo9K5HS0CDT6myeBXzhP5n21L7y3DC5lnXM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=f1OmM7Nx5J0Owb93puFQ0wtarcSuKOEsys5rJPxlpD24s5TaFWaexplXsb9mcZUbA
 c4UEJlQxoAy4n2NYbmMbQPBmO7FIYYNsBv0YaZ9smfIkmZRudjF4G7wJcI5OMGA0PT
 8eAud9ec3/OgC5ShnMGFw9VhtK4+3s9oPQN4N+moJbf7lwvNgTg0VvsP3CkHPRd0kH
 vdy4VebrH9ae9ND9tC6XtwucV4lDvjDTH+hn/tuvN+bu/eV6uCuDffBvucUARtmwEq
 U+yogyTps2qjoIgH/cIvzHb0UCCXvQwjWZwEPQXVeOjcKSbtTMG48VZSnoayoJ6H/o
 reAQugOmDimWQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=f1OmM7Nx
Subject: Re: [Buildroot] [PATCH 1/1] package/python-marshmallow-sqlalchemy:
 bump to version 1.4.0
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

On 24/01/2025 20:42, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
