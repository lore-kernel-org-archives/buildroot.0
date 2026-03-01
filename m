Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F523FD0061
	for <buildroot@archiver.kernel.org>; Sun,  1 Mar 2026 11:12:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 09BEA40C12;
	Sun,  1 Mar 2026 11:12:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OIj2iz52iJkS; Sun,  1 Mar 2026 11:12:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E975740BAE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772363533;
	bh=Ed42ccuToOl9ogQNvNQrYh0TFIaUCCNT27oP0MUhRQo=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=sKdFg25BDswg263PWFlHLiNHSdRDjXT8dEwyDY7VHoQA/8tvwpx2DVo1Q0Iadho/Z
	 0b5MYylM19tYsFMBRXMW5IF1B6WmYnKDBywC3ZTiTJP0skd9U4ecjTwwryrJ/koj4/
	 9wKmetpcGGrzYqhxqX2BH0V5pAVpdM5bfI1sEiloCHPVTCpYZL5XPsdDkZROaCgQeR
	 g1lOTfiwUxaQn+U3WkH+9jcbg/LKKv4aQeRg7y8r1ei5XegTr3SNezhNySHDOqIxwV
	 wmDFTuNEN90WtUXWx9K8Yt8/1M0raw87ZHU20S6y6S+I4a/YqXGgxYQVCzWHw9HGPv
	 S6fK0QoHbZHUQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E975740BAE;
	Sun,  1 Mar 2026 11:12:12 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id A6D77231
 for <buildroot@buildroot.org>; Sun,  1 Mar 2026 11:12:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A46C5404EF
 for <buildroot@buildroot.org>; Sun,  1 Mar 2026 11:12:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Xec_4yUcmjDB for <buildroot@buildroot.org>;
 Sun,  1 Mar 2026 11:12:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.2;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org D78CF40396
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D78CF40396
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D78CF40396
 for <buildroot@buildroot.org>; Sun,  1 Mar 2026 11:12:10 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 4F4BC2003B4;
 Sun,  1 Mar 2026 12:12:07 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 01 Mar 2026 12:12:07 +0100
MIME-Version: 1.0
Date: Sun, 01 Mar 2026 12:12:07 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260301103722.3526268-1-bernd@kuhls.net>
References: <20260301103722.3526268-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.13
Message-ID: <f561880dbaf2281906dfcdb6ed9dea76@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1772363528;
 bh=DI6RyYxX2favSFdLvVnCsrgEtq4Qy0Llc2l6Z2XDIGQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=n7X9vV5mITmVPhLfkvdZWxCp8/wh2W6UGwfpNtymToNayQhE4wsBKGSbGvth9RIeZ
 hEQ9lyHp7+B31yt52OGXhe7N7OO15vmOHoqRFsDsbTDq0UkBOg/VDX1nHpKTht6r0a
 /+r3oWGJ7xQsEFptiX3LX5XtQsdvaf0srS5PHiXLLfE59a+pZAS7ySZWt7wUQUEUYQ
 9Avp0Yyr9fV+ADk8nfxDKWAEr5OApLrzTkSsf7kuLSBQEQXYQXsjYvr7ql0xLRmUpo
 DofHZP7YZ/s56N35IbYjU4nngBUMjSrHoj1QFALiyLqBz2d7YMv5Pbf0sYCFREP7xY
 9lzf8qe2+QEmw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=n7X9vV5m
Subject: Re: [Buildroot] [PATCH 1/1] package/samba4: bump version to 4.23.6
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

On 01/03/2026 11:37, Bernd Kuhls wrote:
> Release notes of this bugfix release:
> https://www.samba.org/samba/history/samba-4.23.6.html
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
