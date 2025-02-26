Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F93AC021B8
	for <buildroot@archiver.kernel.org>; Wed, 26 Feb 2025 21:58:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3B984834BA;
	Wed, 26 Feb 2025 21:58:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hvZU2mt3bxSJ; Wed, 26 Feb 2025 21:58:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4B37E834B6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4B37E834B6;
	Wed, 26 Feb 2025 21:58:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 651D769
 for <buildroot@buildroot.org>; Wed, 26 Feb 2025 21:58:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5F6CA4094B
 for <buildroot@buildroot.org>; Wed, 26 Feb 2025 21:58:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id crD0ofj2gbof for <buildroot@buildroot.org>;
 Wed, 26 Feb 2025 21:58:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.2;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 6D64E40919
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6D64E40919
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6D64E40919
 for <buildroot@buildroot.org>; Wed, 26 Feb 2025 21:58:51 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 0017A2003C8;
 Wed, 26 Feb 2025 22:58:44 +0100 (CET)
Received: from 2a01:e0a:485:b220:8213:2270:4a8d:a1d5
 via 2a01:e0a:485:b220:8213:2270:4a8d:a1d5 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 26 Feb 2025 22:58:44 +0100
MIME-Version: 1.0
Date: Wed, 26 Feb 2025 22:58:44 +0100
From: Julien Olivain <ju.o@free.fr>
To: Fiona Klute <fiona.klute@gmx.de>
Cc: buildroot@buildroot.org, James Hilliard <james.hilliard1@gmail.com>,
 Marcin Niestroj <m.niestroj@grinn-global.com>
In-Reply-To: <20250225220100.3076207-1-fiona.klute@gmx.de>
References: <20250225220100.3076207-1-fiona.klute@gmx.de>
User-Agent: Webmail Free/1.6.10
Message-ID: <9644da8a1ec5586cc0a9a8812352ecdc@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1740607128;
 bh=LugVRyKddZJ6Y0OEedlV7wW48GN1dqd14ie3YKYh69U=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=nrN3V0iRxUOtO6+bJHTu8bEnStz3K48Svzujgks68SPFmbOpBGNwtv6aGdfWqk7ds
 2gB/AEM+VF9FZHuiJXTbmL5sAnWDv/skkLbbLXUws2haED5cq1OOBlru5sLHjbt72t
 pPZ+k3QYKVvok3AltYGxftb6nD3f4HhDx66X19rQoWLlRf5TvG8Yo7UueTGT+hYuiU
 1rYJ9fiWCgn/kRCTCII+GFurxDpUt6rg6Ut1384Gw/sMlWThUj1/0kaog6//cyGwob
 OzsYDEF6rgaWB5qkmEMpwKucMxNwKZIazbVhIZpsQmbtP9ZIUMbJGxDbKoCHDMoxEn
 a86trkPu1V1FQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=nrN3V0iR
Subject: Re: [Buildroot] [PATCH 1/2] package/python-referencing: select
 package/python-typing-extensions
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

On 25/02/2025 23:00, Fiona Klute via buildroot wrote:
> From: "Fiona Klute (WIWA)" <fiona.klute@gmx.de>
> 
> The referencing module requires either Python >= 3.13 or
> typing-extensions, otherwise import fails. The dependency was added
> with 0.36.0, and to Buildroot with commit 94cf596d76
> "package/python-referencing: bump to version 0.36.1".
> 
> Initial change requiring Python >= 3.13:
> https://github.com/python-jsonschema/referencing/commit/5ea5a1539378f80caa9d6969849ee61667cb7252
> Fix to support earlier Python versions with typing-extensions:
> https://github.com/python-jsonschema/referencing/commit/71cbd0008d02c5a320176dab2da046aa0d20a6e9
> 
> Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>

Series applied to master, thanks.

> This patch should naturally be dropped if Python is updated to 3.13, 
> the
> second one is relevant either way.

We will revert it after Python will be bumped to 3.13.

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
