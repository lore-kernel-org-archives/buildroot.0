Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FE7FC021B5
	for <buildroot@archiver.kernel.org>; Sat, 22 Feb 2025 17:24:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2345840A02;
	Sat, 22 Feb 2025 17:24:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XdnuCu-mPqHO; Sat, 22 Feb 2025 17:24:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0A67D40B3A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0A67D40B3A;
	Sat, 22 Feb 2025 17:24:46 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 13FB96B
 for <buildroot@buildroot.org>; Sat, 22 Feb 2025 17:24:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0B2F540B5E
 for <buildroot@buildroot.org>; Sat, 22 Feb 2025 17:24:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VZto0ZB4LORc for <buildroot@buildroot.org>;
 Sat, 22 Feb 2025 17:24:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 285AB40B07
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 285AB40B07
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 285AB40B07
 for <buildroot@buildroot.org>; Sat, 22 Feb 2025 17:24:42 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 97B2660137;
 Sat, 22 Feb 2025 18:24:37 +0100 (CET)
Received: from 2a01:e0a:485:b220:8213:2270:4a8d:a1d5
 via 2a01:e0a:485:b220:8213:2270:4a8d:a1d5 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 22 Feb 2025 18:24:37 +0100
MIME-Version: 1.0
Date: Sat, 22 Feb 2025 18:24:37 +0100
From: Julien Olivain <ju.o@free.fr>
To: iliana etaoin <iliana@buttslol.net>
Cc: buildroot@buildroot.org, Bernd Kuhls <bernd@kuhls.net>
In-Reply-To: <20250222050637.107330-1-iliana@buttslol.net>
References: <20250222050637.107330-1-iliana@buttslol.net>
User-Agent: Webmail Free/1.6.10
Message-ID: <0811c4e1f9e729d711b548cb790cf923@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1740245079;
 bh=qPox+Y6WE4HR/9O1I/PpU13IqYUUbW9Z3LfycoXLgWU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=ZxGbneq6o+voPyvYJH2673spchoV5iKQakuw0wmUqgIo9lpbY/GYjrI27ppH4vDZz
 HcXx4lxHN1COcu+gbXN+JGfroJFJVN7QeuJPkyXkIdGmmZYnxw0YsQAORF/mb/bTYZ
 dfhdcVbwnVD3fR4rjTQrNWCZmK7G4SThgo75NPbD9qiWvGp+Nrz3FtyYRZptg9zPVb
 mQdYh8DXQaIy/COHkZb3FSKpI6yglzlYFtPlRol7B45aWK0uZ1YLrhcN9JYV3WSAvi
 pxq4BEwU58ZQtMH5sq9tUt1orUyJZyiL65cZ+ZgLiwvr0ZXGM8t6u0esanyzWnRZgE
 Gg6j7vmqwsPEQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=ZxGbneq6
Subject: Re: [Buildroot] [PATCH] package/linux-firmware: add option for
 Chelsio T6
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

On 22/02/2025 06:06, iliana etaoin wrote:
> Add an option to install the Chelsio T6 firmware files used by the 
> cxgb4
> driver.
> 
> Signed-off-by: iliana etaoin <iliana@buttslol.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
