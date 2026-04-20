Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 837EAF5A8A3
	for <buildroot@archiver.kernel.org>; Mon, 20 Apr 2026 17:24:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 50952807AB;
	Mon, 20 Apr 2026 17:24:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8t2e_a8i7QK8; Mon, 20 Apr 2026 17:24:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8045080769
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776705895;
	bh=s1jQLLbYOkGQHe35w/cqQB4HS0ihC78aCdmJL8LcFBA=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Gtoou2sbSdn8xd5PDuT98r1TVZXLinZIUINw32dRZTA8hpqEuiObHPAx1nQYZ5Gj7
	 OV3q3NNpTIcfhaxwDBabj3RrRIBOZPGsPZO7QvKlBlIV9yikoq+fO3FSkdcSld3RtL
	 BJuKXHunTxkyHRXVQirof2g6y1hRgLeeCqLv75l6mkujJDX8ok4/xFLvSbUjmk4ZiL
	 lIvubyl+gFSkqc0v0NKj/vzwbthtIESl85aHqNAX3p3r2v8wheK4BAJ/RunAY1rwjU
	 Bbznfb04bTIE6YDZkrD2cwGRgEsJyehIa3tLwHkOXpmZfTHGFusiing+lxMbbuDGWq
	 Pm0+soAa5tmww==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8045080769;
	Mon, 20 Apr 2026 17:24:55 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id EBC35257
 for <buildroot@buildroot.org>; Mon, 20 Apr 2026 17:24:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A83D04064C
 for <buildroot@buildroot.org>; Mon, 20 Apr 2026 17:24:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8AUZsGx0-KDS for <buildroot@buildroot.org>;
 Mon, 20 Apr 2026 17:24:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 9B6E34062E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9B6E34062E
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9B6E34062E
 for <buildroot@buildroot.org>; Mon, 20 Apr 2026 17:24:53 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id BFFB4B0055E;
 Mon, 20 Apr 2026 19:24:50 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 20 Apr 2026 19:24:50 +0200
MIME-Version: 1.0
Date: Mon, 20 Apr 2026 19:24:50 +0200
To: Adrian Perez de Castro <aperez@igalia.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20260420075753.1967051-2-aperez@igalia.com>
References: <20260420075753.1967051-1-aperez@igalia.com>
 <20260420075753.1967051-2-aperez@igalia.com>
User-Agent: Webmail Free/1.6.14
Message-ID: <334d8b71e5430d1bbdf8a38283a03c3c@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1776705891;
 bh=UT7EBDUyNNad5rWaQMAEXYGUlCihwOlvwaz9LuWE9K0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=OjxLFs22VgvSbaZULSPin7qsNNfwder/EPR9Lx7RQaAjhzlojTDr8uLp1+hNtgSE/
 YT3L4SmUdMaSP1CyWbd4wmJtg4E1qSpbZwAiaSL9W4xPwQ0Eu//RngPdp7fJ5o6kqo
 zKxHLErVhagJccu3i3qqzh6xKWC3fFcWS4tyW8TD6FYKgvk6FyCnpYhM9QJHXzqbWZ
 8HPI2Xv4HtFRsmTyrsFyz0W/ta2/rWwa7YicCJh4ibIYeMEa2KFd/w6NVN+AewrGsr
 kelK2zDqWdcjHgTMQ7jk1Z/xHrGt3zCe+LKzcR61KCgiBFl9i+Sejrcmds/CzVhuhr
 OPQHkWf1gRCSg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=OjxLFs22
Subject: Re: [Buildroot] [PATCH 1/2] package/wlroots: bump version to 0.20.0
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

On 20/04/2026 09:57, Adrian Perez de Castro wrote:
> While at it, drop the two patches, as they are part of this version.
> Release notes:
> 
>   https://gitlab.freedesktop.org/wlroots/wlroots/-/releases/0.20.0
> 
> Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
