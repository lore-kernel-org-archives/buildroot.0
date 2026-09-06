Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5652C79F8C
	for <buildroot@archiver.kernel.org>; Sun,  6 Sep 2026 19:28:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 89B666064E;
	Sun,  6 Sep 2026 19:28:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id T7ATgTRW38HS; Sun,  6 Sep 2026 19:28:28 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org B0B15605EA
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788722908;
	b=E7enAsifMHO8nPf/B2Ipk8N3YP0BI2qwWWdvnwFK2HSbH7OqWgH/ay87f69ta0GDF+5y
	 rYWe3gNF2MkLW6K3OG4CxMH9HYje+XVVhYL1Wr+8utRVMA5Iy4nCSmroJcCo4F4O0jQuw
	 f+LjnJXmK6Zox1O88PlSOrbDukP+aXJXMW4yZT+/syI27ypvVDUmkG+wCVFiQon7QwWCD
	 lbHIZ/dVi+24LUo6f4nIdm4eJ6DQc3MaSpOBFaUSqtKQru2MgmPAeEgxcT7pjeU8SKTDj
	 PMZdPD1vH3JskoT22S0rI2fKdl+bfzuDMHImZZ8U1v3RXega4fo48hzwX875JG3DXzQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788722908;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=HMvocG+lxTVTv+efOhdorYiwDHTArM6a7TQoywWRDj4=;
	b=VggiAxxTukdb9f+k+2vUlY0aFOTD2ZOJs1rd8TJzIPCZ9iinRhFudunoRzJp6HIVocni
	 aTDCnK0ByhcLsoFAm5rcMjJ//tdIv+r/DWbJCaBwDFOObeZHIuenjPO7ZIhTf+0L6Df6g
	 UPsG+GLKIjMdeVxYrhCcFhKZbMZaCuQTxo87zwhan6kgXlkgnwvxBNRRKklieTLpUtms9
	 8Tv0GhqxkSfPNcAWkfyzBRhLMNuJIrEaan0+5Tc/15NIZB7w2a7eehgn2Q1kcS/EkAYw4
	 l9suCHUD6z++YPHaompHfoN1y68LO7bDwGQ9Ytazsish0e2oVeciUgbfbfjjoqYvFXg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788722908;
	bh=HMvocG+lxTVTv+efOhdorYiwDHTArM6a7TQoywWRDj4=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Y0aKo+dFq5XI87xlCmvKJBFWaEfiLBShBYw2EZmVEaRocifVhjGollyGsZ/HSxHCz
	 pBfix7W60uiqiQtyHiFYL7GPQscBtp4EEtBU6e4/PuxXLNfNwW9F1GydhVxXV9qXoF
	 qbtvvupdP1fqCuuxEfHuMQSW6lBJgA8dz5bw1e9tTwjRg7qkosSxBQebUy0iiOx07p
	 O/V0HYC6zZwFitEn9x5L6b/GommHNOtW6RMhMT4tNXsk1sdAv8+oJjUHjJ06NUZu1Z
	 PUwV0iJIKtT8Q6plgkjPqbGmpdJIjgLCBEDA2v+uGW7jQUDlc/A90wY/5DFi6NzCln
	 CpxfKxWGCg/7A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B0B15605EA;
	Sun,  6 Sep 2026 19:28:28 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 97512970
 for <buildroot@buildroot.org>; Sun,  6 Sep 2026 19:28:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 897ED4058E
 for <buildroot@buildroot.org>; Sun,  6 Sep 2026 19:28:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tP8KbtCK0ILx for <buildroot@buildroot.org>;
 Sun,  6 Sep 2026 19:28:25 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org E74E14058C
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788722905;
 b=Ujt98Ou/mX9v2zCMTESLA49s8inMiBArw6tAuSCmH4biARl9PjMx/WejViIUjqk2uWYw
 TZbeBXLzA2bEeYUdfJYdS05e6Sga02VE5yG1caGo8+gH66QDN1FFV5hLmrpIfoYNf+CfF
 X89tJ44x7BS3+7YRAGobApJD0lk2Xmw0z+qXvP1/aEo5sdc6FQuacUNSK+QeYCM0EaC2v
 b1hb6go9rO2LX+Dx5Ax1/5diuk4uo/CZQgTKq7ZN6MT6CQKDyLDjgG5tALzVEf6Lny94B
 cMBVmnpQrwRWkHCSO4OSOFTuAbgX4QtgzXGBOBsVfTW1rTfNSCyg7BQtIy5kf7Jfn3A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788722905;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=47ZaxpG+Vle7NCw0FjP5xom63KohpkvUXUYx62oS+rU=;
 b=SnTtPziou6dQDoTaT448jgkrWqpIPIRPsCilBr42VHmndz91t+fztC+YPXSnxrGtA8oQ
 2y9NE3wJW0/BB8xWzMje0yqBuni5wVidU9u8p9CFd1Q9BZPseNf9IMK2bpwSOLsLAMD6Z
 oysX98Tz1WfcWOhfJM2aGJLQz9tIj3tSRyu4gTvQkc0fmuA9fwtu2VwATfisraSjoRy8j
 oUpzNGz14reAKLESJ8TGXmnlKCTWg8RzJhAVlDCpo2cz5ojbT5NCk0yNL3aco7jZbFhs2
 +4clIHgU5Etm1abduuqMDLHKxi38ANIbTgPfo1LR/pNsxyrPdVW50kDCc8ESBT91lAA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=free.fr; 
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=Ckj3RXle; 
 arc=none smtp.remote-ip=212.27.42.1
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E74E14058C
 for <buildroot@buildroot.org>; Sun,  6 Sep 2026 19:28:22 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 5C178B0054E;
 Sun,  6 Sep 2026 21:28:18 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 06 Sep 2026 21:28:18 +0200
MIME-Version: 1.0
Date: Sun, 06 Sep 2026 21:28:18 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
In-Reply-To: <20260904162524.118377-1-bernd@kuhls.net>
References: <20260904162524.118377-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.18
Message-ID: <7e2140eb1e3b53e971bd666949aeff12@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH 1/1] package/cmake: bump version to 4.4.3
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

On 04/09/2026 18:25, Bernd Kuhls wrote:
> https://cmake.org/cmake/help/latest/release/4.4.html#id2
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
