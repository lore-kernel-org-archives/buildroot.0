Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE83AC369B2
	for <buildroot@archiver.kernel.org>; Thu, 17 Apr 2025 05:09:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 814FD83B9F;
	Thu, 17 Apr 2025 05:09:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AVVgYgPYze6H; Thu, 17 Apr 2025 05:09:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A7BBC84186
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A7BBC84186;
	Thu, 17 Apr 2025 05:09:02 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id ECEDD11B
 for <buildroot@buildroot.org>; Thu, 17 Apr 2025 05:09:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D26FA61AEE
 for <buildroot@buildroot.org>; Thu, 17 Apr 2025 05:09:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yF8VWtQwMdCj for <buildroot@buildroot.org>;
 Thu, 17 Apr 2025 05:09:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=84.110.109.230;
 helo=mail.tkos.co.il; envelope-from=baruch@tkos.co.il; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 70A3E60EAC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 70A3E60EAC
Received: from mail.tkos.co.il (wiki.tkos.co.il [84.110.109.230])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 70A3E60EAC
 for <buildroot@buildroot.org>; Thu, 17 Apr 2025 05:08:59 +0000 (UTC)
Received: from localhost (unknown [10.0.8.2])
 by mail.tkos.co.il (Postfix) with ESMTP id 9200A440FA0;
 Thu, 17 Apr 2025 08:08:04 +0300 (IDT)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20250309083216.824179-1-bernd@kuhls.net> (Bernd Kuhls's message
 of "Sun, 9 Mar 2025 09:32:16 +0100")
References: <20250309083216.824179-1-bernd@kuhls.net>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Thu, 17 Apr 2025 08:08:54 +0300
Message-ID: <87jz7j2x3t.fsf@tarshish>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=tkos.co.il; s=default; t=1744866484;
 bh=Ke5H4kdXgUwSsPP8WifRM8ecNuFKj1Hb33naC+IIFPQ=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=swR4MllcpFppX0VSx0yXbSeGJnTsuuBGscYvMVdFEMvLJLtrvl8pQhPxhXoh8ssIf
 BImcWvqGL7YvKSxX4Gg7rdhkbgX6n8JI3iV/2RiCFuO5QFcvx+9ybKnlzwddINZo6+
 MZYOJUR9mqJaC07dOYu8PCj4eMyBWLIp2tXQyEJzToGEJnb7BCGxBlZRZqz7apG3K1
 fLZCXu6u96sRKRIruTpeVGA0M0x47vOkr/xGaS0fxkTiFh0zS7zDq9oOJwSpg52pXm
 ac2/hL8oaOd83Eunng3AL2PhU/NIW1cxY5net/t58tuJ5X5hCBQdE6hQHvEXrZBs7e
 +7Jry6fyqcUIg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=tkos.co.il
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=tkos.co.il header.i=@tkos.co.il header.a=rsa-sha256
 header.s=default header.b=swR4Mllc
Subject: Re: [Buildroot] [PATCH/next v2 1/1] package/dropbear: bump version
 to 2025.87
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

Hi Bernd,

On Sun, Mar 09 2025, Bernd Kuhls wrote:
> Changelog: https://matt.ucc.asn.au/dropbear/CHANGES
>
> Upstream disabled sha1 by default:
> https://github.com/mkj/dropbear/commit/f3465a34eb4007ca3e45044ebdf863842e0346d5
>
> Add the options to DROPBEAR_ENABLE_LEGACY_CRYPTO hook.
>
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Reviewed-by: Baruch Siach <baruch@tkos.co.il>

Thanks,
baruch

-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch@tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
