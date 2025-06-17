Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41EB8C71136
	for <buildroot@archiver.kernel.org>; Tue, 17 Jun 2025 20:08:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 145F180257;
	Tue, 17 Jun 2025 20:08:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id o2kxgyXpoQRP; Tue, 17 Jun 2025 20:08:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0A75980F0E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0A75980F0E;
	Tue, 17 Jun 2025 20:08:11 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 3D9D0D94
 for <buildroot@buildroot.org>; Tue, 17 Jun 2025 20:08:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 224FF61026
 for <buildroot@buildroot.org>; Tue, 17 Jun 2025 20:08:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JKcwDfjc7oca for <buildroot@buildroot.org>;
 Tue, 17 Jun 2025 20:08:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 5AD9E61024
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5AD9E61024
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5AD9E61024
 for <buildroot@buildroot.org>; Tue, 17 Jun 2025 20:08:08 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 53A2519F5A5;
 Tue, 17 Jun 2025 22:08:04 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 17 Jun 2025 22:08:04 +0200
MIME-Version: 1.0
Date: Tue, 17 Jun 2025 22:08:04 +0200
From: Julien Olivain <ju.o@free.fr>
To: Marcin Niestroj <m.niestroj@grinn-global.com>
Cc: buildroot@buildroot.org, James Hilliard <james.hilliard1@gmail.com>
In-Reply-To: <20250609105555.1253825-1-m.niestroj@grinn-global.com>
References: <20250609105555.1253825-1-m.niestroj@grinn-global.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <17ed236f43f61c8f3c3bed5836165256@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1750190886;
 bh=kD2ZQo0S3RP5gcZFmb0uYZ12TjC822dve7Q0T4wTed8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=A193+md0Exq+s2HbgC2barYW2A4kUs57PTOl36ZiuD1opU1KgFWRC1g9oQVgJRsyx
 /466IzGNOEsYadrt5ofl8sCbTMov5Iko/hM9swVbonr6wCghtMLDLv8lZNEQ+x+arM
 6gMsN+KlZaLIXw/VugXsTZJa00yx2HB/orR9g+3Cnpit4bkySKpEDfYcCd3bOGORNt
 5Ac5HXMAUncxBDIOZAtupafJqa7Eyt3KBfu1LR82SSCS7jB7O5VBN38kmOzYu++E1H
 1n6RgX63KQpZ736RyGs3UdRuUYCUWxaoe/T+kf8f2+BokZTWg869gojFGoGD7jONV1
 iYU0VHwd1K8nQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=A193+md0
Subject: Re: [Buildroot] [PATCH] package/python-iniconfig: bump to 2.1.0
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

On 09/06/2025 12:55, Marcin Niestroj wrote:
> See [1] for changelog.
> 
> [1] https://github.com/pytest-dev/iniconfig/blob/main/CHANGELOG
> 
> Signed-off-by: Marcin Niestroj <m.niestroj@grinn-global.com>

Applied to master, thanks.
For info, I fixed the LICENSE hash. See:
https://gitlab.com/buildroot.org/buildroot/-/commit/31fb707f3301965fc9c7fd45af18f700325486a8

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
