Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B7ABC3ABDD
	for <buildroot@archiver.kernel.org>; Tue, 20 May 2025 17:16:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1E72961097;
	Tue, 20 May 2025 17:16:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 95mlPklTBP73; Tue, 20 May 2025 17:16:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 48F4161094
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 48F4161094;
	Tue, 20 May 2025 17:16:12 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0DEF7DE
 for <buildroot@buildroot.org>; Tue, 20 May 2025 17:16:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BBE1661096
 for <buildroot@buildroot.org>; Tue, 20 May 2025 17:16:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5mhy5YevBY57 for <buildroot@buildroot.org>;
 Tue, 20 May 2025 17:16:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org B503A6100F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B503A6100F
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B503A6100F
 for <buildroot@buildroot.org>; Tue, 20 May 2025 17:16:07 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 5B244200407;
 Tue, 20 May 2025 19:16:04 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 20 May 2025 19:16:04 +0200
MIME-Version: 1.0
Date: Tue, 20 May 2025 19:16:04 +0200
From: Julien Olivain <ju.o@free.fr>
To: Kadambini Nema <kadambini.nema@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20250518200421.146362-1-kadambini.nema@gmail.com>
References: <20250518200421.146362-1-kadambini.nema@gmail.com>
User-Agent: Webmail Free/1.6.10
Message-ID: <9be5ad7f1b3da6fcad993b8516c8b362@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1747761365;
 bh=7h6bebpUUi6goubC6aBy4o0SHKDdCC8LkSaPXwy852k=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=E8/eQJt7MCKm2AiVk4pEH8txmFdNxW1lVC5N1TpRtPYeDvhUUEthBDPdAokVHPL5O
 +shgzeICnnbk4d1aex+ue0Wfkm7YXG31YtuzCltxl2Tspm/KqBZnTmprDhkf0w4ojA
 RgeadV+D2ZKwGLcAD9YZPp14k0T/noDAuKsP5+M5TURov9EK43pe7Z9jPfpD6oFXtU
 9EXI1D9NWhf87S6GLEfnBMwsufPtw65NhRUjFasznmgz2TYKJVCiKo8No9U1X59qBg
 07WGaezopfWgsyvNQ1SLp6xFsdloXPQ/E6D4LMkUFnB9ZQgIbO4BkNcluZVxERwFXV
 D/BPFi4biruYA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=E8/eQJt7
Subject: Re: [Buildroot] [PATCH 1/1] package/htop: bump to version 3.4.1
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

On 18/05/2025 22:04, Kadambini Nema wrote:
> Release notes:
> https://github.com/htop-dev/htop/blob/3.4.1/ChangeLog
> https://github.com/htop-dev/htop/blob/3.4.0/ChangeLog
> 
> Signed-off-by: Kadambini Nema <kadambini.nema@gmail.com>

Applied to next, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
