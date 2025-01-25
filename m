Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0543BC0218D
	for <buildroot@archiver.kernel.org>; Sat, 25 Jan 2025 14:36:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C0B7142956;
	Sat, 25 Jan 2025 14:35:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RedxBk76ofjq; Sat, 25 Jan 2025 14:35:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9E2C542944
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9E2C542944;
	Sat, 25 Jan 2025 14:35:58 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 465C91183
 for <buildroot@buildroot.org>; Sat, 25 Jan 2025 14:35:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 34938829BB
 for <buildroot@buildroot.org>; Sat, 25 Jan 2025 14:35:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6Pqcdum7oFIA for <buildroot@buildroot.org>;
 Sat, 25 Jan 2025 14:35:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 85FF7827C6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 85FF7827C6
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 85FF7827C6
 for <buildroot@buildroot.org>; Sat, 25 Jan 2025 14:35:56 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id ABBB813F8A9;
 Sat, 25 Jan 2025 15:35:53 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:47700])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 25 Jan 2025 15:35:53 +0100
MIME-Version: 1.0
Date: Sat, 25 Jan 2025 15:35:53 +0100
From: Julien Olivain <ju.o@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20250124191041.3805712-1-james.hilliard1@gmail.com>
References: <20250124191041.3805712-1-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <85e0495f04e989c6887cf73d873cfd01@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1737815754;
 bh=kdb6hZ1x0NVlW2G/F1jnk8LkiEQEqMl9eD6Om7GUFKw=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=OU6nXYQELzvspqpZFZZ4LjXneoZYpZGeHVQ0+JzxLA2cQFcAAykl7hmTXBou3P68R
 VAJb2qV4DN5ICXqQbKhdOGfsqJKtk5Ug+J+YfwypvF1cMckdhS3FyGJYrjfBloU72J
 aecGiXTBDCxglQmTA0EizN3DrvEW/E+VPsEnHSwBDRLLrL+WubUQO6aRheg3JPX0vB
 keFguLLdZMt/1903u8QReVwuDaOPXXgHv1nUnpEq0YRiiPDyzov2lWR3zxj0iHbBmG
 RRJA58+PMKLkqkl7At6JupcjmuomO1tGXebW9ztELpMdbDAA3bLfEcTJYOhFBX0E48
 Gt32rkJJ5P/YQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=OU6nXYQE
Subject: Re: [Buildroot] [PATCH 1/1] package/python-grpcio-reflection: bump
 to version 1.70.0
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

On 24/01/2025 20:10, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
