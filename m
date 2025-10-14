Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84C27CCD18E
	for <buildroot@archiver.kernel.org>; Tue, 14 Oct 2025 20:30:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5C7A6608C7;
	Tue, 14 Oct 2025 20:30:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jbALCUK0znHe; Tue, 14 Oct 2025 20:30:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9515D60F42
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9515D60F42;
	Tue, 14 Oct 2025 20:30:55 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 3AD8B1C9
 for <buildroot@buildroot.org>; Tue, 14 Oct 2025 20:30:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 20C4F41189
 for <buildroot@buildroot.org>; Tue, 14 Oct 2025 20:30:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tLoG4-bzZ8bm for <buildroot@buildroot.org>;
 Tue, 14 Oct 2025 20:30:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 204FD4115D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 204FD4115D
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 204FD4115D
 for <buildroot@buildroot.org>; Tue, 14 Oct 2025 20:30:52 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 77F765FF95;
 Tue, 14 Oct 2025 22:30:45 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 14 Oct 2025 22:30:45 +0200
MIME-Version: 1.0
Date: Tue, 14 Oct 2025 22:30:45 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Grzegorz Blach <grzegorz@blach.pl>, James
 Hilliard <james.hilliard1@gmail.com>, Romain Naour <romain.naour@gmail.com>,
 Mauro Condarelli <mc5686@mclink.it>
In-Reply-To: <20251012202002.178080-1-bernd@kuhls.net>
References: <20251012202002.178080-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.11
Message-ID: <8de150510b087166f9b63096f1baee53@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1760473850;
 bh=R2cNZd9+HV1dZojrdpPU2N4qild8SYhrJbI5+7UPV0M=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Zzqa+z7QumTwxSg3AacTv0S1Slt/dWEZ1REzg8zRPLhtYoL71P9qWUMdGtXJ/8bBp
 Z3g/knh5oypEQ12vrrSTo1poKPXlOV9BllgP6f1XwIX80dmbesOfhn+vC0yo0fp/d1
 6xT84/ykJVTuf3UgQWXB7WORO1TuZJSb5jXmOVdKkNADLS8XmTs2+a+fDO0EQpbNMI
 WM0U3S57si4iCBY3ocPOq48pifM6wvkK4Mcw/mxYdwLYkKmpYk+/UggU4rc9MOwQev
 Z58BAZJWALteO96Jx58qnWxjgKsFHs+VOeuqia73rTbxTGEgRj3qN+ap81YrnPKIRC
 mpLGmChZlyBTg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Zzqa+z7Q
Subject: Re: [Buildroot] [PATCH 01/23] package/python-evdev: bump version to
 1.9.2
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

On 12/10/2025 22:19, Bernd Kuhls wrote:
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Series (except python-lmdb bump) applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
