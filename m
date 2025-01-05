Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7906BE77197
	for <buildroot@archiver.kernel.org>; Sun,  5 Jan 2025 18:50:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1F6A9605AE;
	Sun,  5 Jan 2025 18:50:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FHA3XACltDjZ; Sun,  5 Jan 2025 18:50:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0D4D260608
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0D4D260608;
	Sun,  5 Jan 2025 18:50:12 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 17366D92
 for <buildroot@buildroot.org>; Sun,  5 Jan 2025 18:50:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 03CB44023A
 for <buildroot@buildroot.org>; Sun,  5 Jan 2025 18:50:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8Z_bu5X-hclh for <buildroot@buildroot.org>;
 Sun,  5 Jan 2025 18:50:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 80E8F400BF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 80E8F400BF
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 80E8F400BF
 for <buildroot@buildroot.org>; Sun,  5 Jan 2025 18:50:08 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id B51C919F5C2;
 Sun,  5 Jan 2025 19:50:01 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:40316])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 05 Jan 2025 19:50:01 +0100
MIME-Version: 1.0
Date: Sun, 05 Jan 2025 19:50:01 +0100
From: Julien Olivain <ju.o@free.fr>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: buildroot@buildroot.org, Alessandro <alex@0x65c.net>, Jared Bents
 <jared.bents@rockwellcollins.com>
In-Reply-To: <20240123190902.1285941-1-yann.morin.1998@free.fr>
References: <20240123190902.1285941-1-yann.morin.1998@free.fr>
User-Agent: Webmail Free/1.6.9
Message-ID: <975e23aacdd9430c3a56689f4213ac18@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1736103005;
 bh=w5fa+We/Wp4i5GUH9YHf/ohay2ulwUkDJVXjfdvaMFE=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=I8YbnfSYEbb5Xr+ne22pq48OGk2ZYM2KCyfuiRNOANKg21YEkQEBl8ue+FlFCBnnl
 WVovqWKcBiS48NocMNuF6JOk5RhK2BXuF8XFap6jUOarG/2hKfiSO/OYNrgL6UDqKU
 O7CIoPg6FtJlUYe6Ft4R0detJKre1KiaZj4k+BiyWkF0wcdWJ0m/DAFs5HM9t41ky4
 9LEr42ECQ7pApunnEpWQQVeZgOqiJIms/QJui+NDlMtSq8viofV1A9bdng7hky7tp3
 EnKwC8T3q4jo8pkWAaqqYD+c+cw3TgrN0lLLHoTS4+2+DsUovMdJ3UeIk7AG94LCNn
 28C0AKi8qaOIg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=I8YbnfSY
Subject: Re: [Buildroot] [PATCH] package/libvirt: do not use 'qemu' user if
 not defined
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

On 23/01/2024 20:09, Yann E. MORIN wrote:
> Commit ed12e2fbed3d (package/libvirt: add lxc and qemu options)
> introduced the definition of the 'qemu' user when the libvirt daemon
> is enabled, but unconditionally uses that user in its permissions
> table.
> 
> Move the permissions needing the 'qemu' user under the same condition
> the 'qemu' user is defined under. It means that a few permissions
> needing root must also be moved, as they belong under a directory
> needing the 'qemu' user. It also moves a few qemu-related permissions
> introduced in that same commit. The list of qemu permissions is
> reordered alphabetically (the others are left unchanged).
> 
> Of course, it also requires that the qemu-related directory and symlink
> be moved under the same condition as well.
> 
> Reported-by: Alessandro <alex@0x65c.net>
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> Cc: Jared Bents <jared.bents@rockwellcollins.com>

Applied to master (at last!), thanks.

I also added in the commit log the commands to reproduce the issue. See:
https://gitlab.com/buildroot.org/buildroot/-/commit/da9adec1491eefc618aab610615fe293899845fd

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
