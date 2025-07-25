Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3B70C87FCA
	for <buildroot@archiver.kernel.org>; Fri, 25 Jul 2025 21:44:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BF10C605C5;
	Fri, 25 Jul 2025 21:44:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id S6RjkBj9UX2D; Fri, 25 Jul 2025 21:44:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1326660906
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1326660906;
	Fri, 25 Jul 2025 21:44:06 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 3E957B83
 for <buildroot@buildroot.org>; Fri, 25 Jul 2025 21:44:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DFE9A60906
 for <buildroot@buildroot.org>; Fri, 25 Jul 2025 21:44:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xZQSgWa0K-sk for <buildroot@buildroot.org>;
 Fri, 25 Jul 2025 21:44:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 1AF01605C5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1AF01605C5
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1AF01605C5
 for <buildroot@buildroot.org>; Fri, 25 Jul 2025 21:44:02 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 83FB35FFA3;
 Fri, 25 Jul 2025 23:43:57 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 25 Jul 2025 23:43:57 +0200
MIME-Version: 1.0
Date: Fri, 25 Jul 2025 23:43:57 +0200
To: Florian Larysch <fl@n621.de>
Cc: buildroot@buildroot.org, =?UTF-8?Q?Ignacy_Gaw=C4=99dzki?=
 <ignacy.gawedzki@green-communications.fr>
In-Reply-To: <20250725204540.11530-2-fl@n621.de>
References: <20250725204540.11530-2-fl@n621.de>
User-Agent: Webmail Free/1.6.11
Message-ID: <105eff2924cafbda8efd5eca34f18cb2@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1753479839;
 bh=fbjjJXlc8I8OejKtKLyuw9xVqbnfqeKKHBdmVcgE7ic=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=ZWFUgkagzJJQwUMIi+QbzPdth3QiWqIGoVg3KAdKsFgiUb+dJs895UzK6EdsvqV0j
 mpEhcuWJLIc93kvRLPBTdW8gnwg5qKhrG8Sz3hnnsPR5RtGAqfNITDIsUAMHXHCG6w
 Nom+8ePzcJxGgt/+YDjevgJrBDaGVui8/e3Rb9f/5nWgRPglEG45VWnWse6xwqRouJ
 FdIgnKTQ4BkmuVz1/kLFVh6t4ai9bEKd81KxS0+iZHC7jmIM9bLr3MwwdKRLAVZMu8
 XGz35NpBm1Lh09gH1rehotfEp7dtm2eIRuf+2y/fhQdnJk7x733uPOdFadvpbv+VJP
 ei4ozbbIWlWfw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=ZWFUgkag
Subject: Re: [Buildroot] [PATCH 1/1] package/chartjs: fix license path
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

On 25/07/2025 22:45, Florian Larysch wrote:
> Commit a954d39a58 ("package/chartjs: bump to version 3.9.1") updated 
> the
> package version and the license file hash, but also changed the path to
> the license file in the hash file. However, the path to the license 
> file
> hasn't changed, causing an error during "make legal-info". Revert the
> path change.
> 
> Signed-off-by: Florian Larysch <fl@n621.de>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
