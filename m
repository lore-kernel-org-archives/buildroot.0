Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EFD8CAC5B8
	for <buildroot@archiver.kernel.org>; Sun,  5 Oct 2025 17:33:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 377DA83B7B;
	Sun,  5 Oct 2025 17:33:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XtewGhrfgUgq; Sun,  5 Oct 2025 17:33:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1425783B55
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1425783B55;
	Sun,  5 Oct 2025 17:33:47 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 4F6F6909
 for <buildroot@buildroot.org>; Sun,  5 Oct 2025 17:33:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 40C8B411EE
 for <buildroot@buildroot.org>; Sun,  5 Oct 2025 17:33:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id L7VuI8IsJm2D for <buildroot@buildroot.org>;
 Sun,  5 Oct 2025 17:33:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 789854100D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 789854100D
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 789854100D
 for <buildroot@buildroot.org>; Sun,  5 Oct 2025 17:33:44 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id B7B245FFB4;
 Sun,  5 Oct 2025 19:33:39 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 05 Oct 2025 19:33:39 +0200
MIME-Version: 1.0
Date: Sun, 05 Oct 2025 19:33:39 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Giulio Benetti
 <giulio.benetti@benettiengineering.com>
In-Reply-To: <20251003201501.2430547-1-bernd@kuhls.net>
References: <20251003201501.2430547-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.11
Message-ID: <b8fecd1916e3f122f10940294b30f92b@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1759685622;
 bh=rNmIuKUdWruSRKg76AGyKBTjwWLeCJeB/jmBG3F+UHI=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=oUau1pUsyG+A4qywcMOwlAkMJTPLXtqAxn4UThCp4RbRt0mzdzjFxEx1IxfzOIf/T
 NYuvbjNBzzIhhfRUJlbaFVHy6108sp41x88qk2pKuZpLSslpJnVyVyKKuyJmyI3IJk
 V4idmHq1HZveoLfdPoki4qHvSdScDZdL3Vm68/H+ZDQVCiJSOUtuZwXUnNLncfPLm5
 slr3i3nh1/soydPfBaY9YkldlSUEIy/kw9kE4M+7qMxWEKuIgzNGMDuaP8mr/H/0QD
 1WbL5rBgGOnCoHlJdCBNs6KEmPWgz1iwftkoBjj4v83KfGcAS1dTAbRJCEdmw45/Ca
 8CBI/ErD7wECQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=oUau1pUs
Subject: Re: [Buildroot] [PATCH 1/1] package/harfbuzz: bump to version 12.1.0
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

On 03/10/2025 22:15, Bernd Kuhls wrote:
> Release notes:
> https://github.com/harfbuzz/harfbuzz/releases/tag/12.1.0
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
