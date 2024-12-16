Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76482E7717F
	for <buildroot@archiver.kernel.org>; Mon, 16 Dec 2024 08:14:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 29FE1608F9;
	Mon, 16 Dec 2024 08:14:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lNyL-FuPdue6; Mon, 16 Dec 2024 08:14:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 213D7608A4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 213D7608A4;
	Mon, 16 Dec 2024 08:14:43 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id A338ECE
 for <buildroot@buildroot.org>; Mon, 16 Dec 2024 08:14:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 83F10608A7
 for <buildroot@buildroot.org>; Mon, 16 Dec 2024 08:14:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zcdvXFBOsZoQ for <buildroot@buildroot.org>;
 Mon, 16 Dec 2024 08:14:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=84.110.109.230;
 helo=mail.tkos.co.il; envelope-from=baruch@tkos.co.il; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 10C73608A2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 10C73608A2
Received: from mail.tkos.co.il (guitar.tkos.co.il [84.110.109.230])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 10C73608A2
 for <buildroot@buildroot.org>; Mon, 16 Dec 2024 08:14:39 +0000 (UTC)
Received: from localhost (unknown [10.0.8.3])
 by mail.tkos.co.il (Postfix) with ESMTP id D671F44047A;
 Mon, 16 Dec 2024 10:10:23 +0200 (IST)
To: yegorslists@googlemail.com
Cc: buildroot@buildroot.org
In-Reply-To: <20241216081158.250767-1-yegorslists@googlemail.com>
 (yegorslists@googlemail.com's message of "Mon, 16 Dec 2024 09:11:58
 +0100")
References: <20241216081158.250767-1-yegorslists@googlemail.com>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Mon, 16 Dec 2024 10:14:34 +0200
Message-ID: <87o71cvyc5.fsf@tarshish>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=tkos.co.il; s=default; t=1734336623;
 bh=RJySnDndJt8OR8MMOI6dTZ9/A2y+WQ6Cs4mcGtsclsI=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=oIEFotAhzGtdo0sZXY9/mYG405Ghr8qo2GCqDj1XWcht4JtvQ2wd0e+aduo2u0h8Q
 VR4GhEYqGuco5Kd/Rg2rQ0VOiq6s10qfG54YovIkkiTQ+wTTblFm9JJ4uoKNB9P90/
 5nYamlM0+9CXIz/FcSonQIJDXwR3ojfl08XZ/qZJIFxPc61ulXXyOaIRFPxJITBkr4
 Tu4HkvEp4yQ4xMvvQwtDyg+mLXaIqgIbO24Hb5YPllexxSelYutZfH0VjW5EkbeWc7
 93o+fHOgRCeWQsRA6LipKDkSmfvB2dFcfYG1RDjsITa/hC81V5pYvuEZcCBbgm9ZJo
 goq9sHPkI5BUg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=tkos.co.il
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=tkos.co.il header.i=@tkos.co.il header.a=rsa-sha256
 header.s=default header.b=oIEFotAh
Subject: Re: [Buildroot] [PATCH] package/python-m2crypto: remove package
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
From: Baruch Siach via buildroot <buildroot@buildroot.org>
Reply-To: Baruch Siach <baruch@tkos.co.il>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Yegor,

On Mon, Dec 16 2024, yegorslists@googlemail.com wrote:
> From: Yegor Yefremov <yegorslists@googlemail.com>
>
> The python-m2crypto package was removed as it is in maintained
> only mode and is not recommended for new projects.
>
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
> ---
>  Config.in.legacy                             |  7 +++++++
>  package/Config.in                            |  1 -
>  package/python-m2crypto/Config.in            |  9 ---------
>  package/python-m2crypto/python-m2crypto.hash |  5 -----
>  package/python-m2crypto/python-m2crypto.mk   | 18 ------------------
>  5 files changed, 7 insertions(+), 33 deletions(-)
>  delete mode 100644 package/python-m2crypto/Config.in
>  delete mode 100644 package/python-m2crypto/python-m2crypto.hash
>  delete mode 100644 package/python-m2crypto/python-m2crypto.mk

DEVELOPERS should also be updated.

baruch

-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch@tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
