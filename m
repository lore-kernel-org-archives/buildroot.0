Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D69B1CAC5A0
	for <buildroot@archiver.kernel.org>; Wed, 17 Sep 2025 16:50:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AE09F61601;
	Wed, 17 Sep 2025 16:50:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YIUxqTOIuJcZ; Wed, 17 Sep 2025 16:50:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F41E561242
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id F41E561242;
	Wed, 17 Sep 2025 16:50:46 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id EAFF4199
 for <buildroot@buildroot.org>; Wed, 17 Sep 2025 16:50:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E7C02611D9
 for <buildroot@buildroot.org>; Wed, 17 Sep 2025 16:50:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id b0MYwCHjyeYy for <buildroot@buildroot.org>;
 Wed, 17 Sep 2025 16:50:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org F167861242
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F167861242
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp3.osuosl.org (Postfix) with ESMTPS id F167861242
 for <buildroot@buildroot.org>; Wed, 17 Sep 2025 16:50:43 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id BF23360128;
 Wed, 17 Sep 2025 18:50:39 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 17 Sep 2025 18:50:39 +0200
MIME-Version: 1.0
Date: Wed, 17 Sep 2025 18:50:39 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org, Falco Hyfing <hyfinglists@gmail.com>
In-Reply-To: <20250916003817.2517058-1-james.hilliard1@gmail.com>
References: <20250916003817.2517058-1-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <35f319799da21702425859c1639ab378@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1758127842;
 bh=h7ORss282SvpjnJtq9ml0cfn5UiFs7xzZqUJ78t0LSc=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=NERdwITb/aIwUFlWfewNT3j8k1jGrPZB0mg3TH5vZA0pwJF517Xag+SGQSlrsOZHn
 ry+ilikC6ykAMuNj3bxLZm1Lb7pSoO+hRTod7jHMtPmHHqwf7YooYAbZgmiMqwX+c/
 8XPDc+U0MDrkSjpSnLjkWMhXV4/IQCfrVFIuxEO0mnl/0/Tq6uzHAvdMUVRvdlC1nB
 9CCvCnrLhebusUHC7upfW6MwLFU9dIw1wajQVro8Kh9BhAc3yRHpm4GMMMp2LFmqRG
 t2cA0j+YHMqI1HqKvWgwrnb58lY8TeuEgU45w2isCsNC+DI/ETJbml1IggO7f99pOU
 M0VhVzwP38ulQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=NERdwITb
Subject: Re: [Buildroot] [PATCH 1/1] package/python-pymodbus: bump to
 version 3.11.2
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

On 16/09/2025 02:38, James Hilliard wrote:
> License hash changed due to year update:
> https://github.com/pymodbus-dev/pymodbus/commit/c1e7f3b70648585b865524f3a7468e3e3239c35f
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
