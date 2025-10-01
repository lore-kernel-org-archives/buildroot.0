Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D73A1CCA470
	for <buildroot@archiver.kernel.org>; Wed,  1 Oct 2025 19:19:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A34DC83FB0;
	Wed,  1 Oct 2025 19:19:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Q-jpXYddPsKF; Wed,  1 Oct 2025 19:19:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9BE0383FB3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9BE0383FB3;
	Wed,  1 Oct 2025 19:19:07 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id CE48D72
 for <buildroot@buildroot.org>; Wed,  1 Oct 2025 19:19:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BADD741160
 for <buildroot@buildroot.org>; Wed,  1 Oct 2025 19:19:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id F7Kpy9Oij4VY for <buildroot@buildroot.org>;
 Wed,  1 Oct 2025 19:19:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org BE13141142
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BE13141142
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BE13141142
 for <buildroot@buildroot.org>; Wed,  1 Oct 2025 19:19:05 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id F3EBC19F57B;
 Wed,  1 Oct 2025 21:19:00 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 01 Oct 2025 21:19:00 +0200
MIME-Version: 1.0
Date: Wed, 01 Oct 2025 21:19:00 +0200
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: buildroot@buildroot.org, Gilles Talis <gilles.talis@gmail.com>
In-Reply-To: <20251001165216.3841723-1-dario.binacchi@amarulasolutions.com>
References: <20251001165216.3841723-1-dario.binacchi@amarulasolutions.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <9681066a5eb251260521c89a5b80a31a@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1759346343;
 bh=X9My87HdbbvlZbIwxXkDz2lv6nhr3/MK8wjKsq9b9Jw=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=i0QokMhS5/7OTQL4X6oFWN0RkT/sAJnB3NDXnNV9O+lpxTH3q+LEPL+mVr+4mFUcR
 tP5VGHy5Z+gc/Pm8W9cXxAXttBUBdwBblkruzdpgafZvw4FkQuSXop6+m+MK9e7Eqz
 5Klm6FwDvtsGaezMqjcFUuMeVGgVkLFx4pCQqXCCtZx6cQIcWTmjiq9JsxDrY9wGbp
 zdHaVcJXncmfwtEBKTW8NK/m+0u834Uh4ja3G0YPDSDWAkDBcVmzEnpXiCA+ylv4Sq
 mjwYx9Iu+RnLXgc+tewNoAb06krnabr/hxDL8qvWaxaH6YLHlth98lQgzN52O9I7wh
 ZDE+PWnREWJZQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=i0QokMhS
Subject: Re: [Buildroot] [PATCH 1/1] package/faad2: bump to version 2.11.2
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

On 01/10/2025 18:52, Dario Binacchi wrote:
> Release notes:
> https://github.com/knik0/faad2/blob/2.11.2/ChangeLog
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
