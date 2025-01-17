Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4ED1AC02183
	for <buildroot@archiver.kernel.org>; Fri, 17 Jan 2025 21:15:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D34A24252F;
	Fri, 17 Jan 2025 21:15:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fUMT2T8Wpgas; Fri, 17 Jan 2025 21:15:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9775542531
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9775542531;
	Fri, 17 Jan 2025 21:15:01 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id EC24A94B
 for <buildroot@buildroot.org>; Fri, 17 Jan 2025 21:14:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D98567048F
 for <buildroot@buildroot.org>; Fri, 17 Jan 2025 21:14:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bfpcxzm59k9p for <buildroot@buildroot.org>;
 Fri, 17 Jan 2025 21:14:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org EAEA16FBC0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EAEA16FBC0
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EAEA16FBC0
 for <buildroot@buildroot.org>; Fri, 17 Jan 2025 21:14:58 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id A2D3913F88E;
 Fri, 17 Jan 2025 22:14:55 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:34372])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 17 Jan 2025 22:14:54 +0100
MIME-Version: 1.0
Date: Fri, 17 Jan 2025 22:14:54 +0100
From: Julien Olivain <ju.o@free.fr>
To: Waldemar Brodkorb <wbx@openadk.org>
Cc: buildroot@buildroot.org
In-Reply-To: <Z4k7Buqxh0PqMEa2@waldemar-brodkorb.de>
References: <Z4k7Buqxh0PqMEa2@waldemar-brodkorb.de>
User-Agent: Webmail Free/1.6.9
Message-ID: <e8ee470c338efa53aa4c0f172825c759@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1737148496;
 bh=nyoL4u9KN3BMNlAJGhpOg5gRKCtweeglGgUbTa5cHXk=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=XhYntMswYvqrCRYWC9Cb5omEOkviG0RmHstPmhyK79YbmWeMUsLcrM5K+ylan2vk/
 AIBiGAj9brnVeIuLrfmEbMGSga7g6vqjdD4CQJXzhyW7dsVDnzhanc2yUYVSGKp5Ij
 nk6QjZwL8iLaO4L53cVjmjv4JSJnzrfsK83sEfPQXK+u3lFzlb6tD4ayZR+XTUz4Rf
 OQ7KzcwhmTfSM/fCmNLeHu5BG6KBFSNeq+d+szALehXOUUUs/I/wJfAz8Pv5GWP+th
 QKvTTLCAKqzJonWA4sFjgCj/6Wudgb4LnWks6W87F+JR1aFUr29J3eJE52iTmNKQ1c
 wLceKCFabMh6A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=XhYntMsw
Subject: Re: [Buildroot] [PATCH] package/uclibc: update to 1.0.51
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

On 16/01/2025 17:59, Waldemar Brodkorb wrote:
> See here for a changes made to this release:
> https://mailman.openadk.org/mailman3/hyperkitty/list/devel@uclibc-ng.org/thread/4AHYRGXTYIYVUACYB3Q4JK5Y44ALZRAU/
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
