Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FE47C87FCB
	for <buildroot@archiver.kernel.org>; Tue, 12 Aug 2025 15:43:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CC8B1428D5;
	Tue, 12 Aug 2025 15:43:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id h4rPwMx_z9CS; Tue, 12 Aug 2025 15:43:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 04E1C428E1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 04E1C428E1;
	Tue, 12 Aug 2025 15:43:10 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 8F38D183
 for <buildroot@buildroot.org>; Tue, 12 Aug 2025 15:43:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8C25341BD3
 for <buildroot@buildroot.org>; Tue, 12 Aug 2025 15:43:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EJ7E681rJJEq for <buildroot@buildroot.org>;
 Tue, 12 Aug 2025 15:43:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 6162C41C5E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6162C41C5E
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6162C41C5E
 for <buildroot@buildroot.org>; Tue, 12 Aug 2025 15:43:06 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 69AF16014B;
 Tue, 12 Aug 2025 17:43:00 +0200 (CEST)
Received: from 2001:18c0:a22:bf00:5c2b:f296:f108:6612
 via 2001:18c0:a22:bf00:5c2b:f296:f108:6612 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 12 Aug 2025 17:43:00 +0200
MIME-Version: 1.0
Date: Tue, 12 Aug 2025 17:43:00 +0200
To: Akhilesh Nema <nemaakhilesh@gmail.com>
Cc: buildroot@buildroot.org, Bernd Kuhls <bernd@kuhls.net>
In-Reply-To: <20250812060909.1185349-1-nemaakhilesh@gmail.com>
References: <20250812060909.1185349-1-nemaakhilesh@gmail.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <221dfd9eff37a02b719554b00c5bbd83@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1755013382;
 bh=h9xRNxndNMdWZVxeljZTGAbM5E6xP02jIHIbEcS5Yck=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=NVnuluCjtXiK7HKpIWuXfnnt2/IqJDZZXMAQxTLmfIKJQDx0Zz1dlNutYtXRB3tbl
 5yN7z6CwqzkiJpOATImvibQHlAHFgILAQEVN7N6sLc4t6DgD55WgPTsJm6SwT9p9ao
 49jQ3FE3/7an0Zh2zHxa4k33Ae+seS1ss52QhpbJABgGQBmhWbWc61wGybOki0AAAA
 31W+S08HUYfur0UoLcxemZr7zJh2PMhvzhiEgEKP2MUsLaIlSb9MwKFdTqzU9I2dyR
 F/Dt8g4JKJX0JEZkZOvLizOqP/Vp0HjnwGxSasK/yDr/t3Ii4X+BZLoC67gIu1lywf
 Ti66JnM9VE1Tg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=NVnuluCj
Subject: Re: [Buildroot] [PATCH 1/1] package/nut: bump to version 2.8.4
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

On 12/08/2025 08:09, Akhilesh Nema wrote:
> Release notes:
> https://github.com/networkupstools/nut/releases/tag/v2.8.4
> 
> Signed-off-by: Akhilesh Nema <nemaakhilesh@gmail.com>

Applied to next, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
