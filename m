Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3744FF886F
	for <buildroot@archiver.kernel.org>; Sun,  3 May 2026 16:17:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9AC2283C3E;
	Sun,  3 May 2026 16:17:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BYT-8ff3Jf2H; Sun,  3 May 2026 16:17:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CB09B83C27
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777825064;
	bh=kvP1GMF0U2mqCzo3l9n22bgfuH5h9h2/tS6ARpmVEyw=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=TPVn8bk/wvtVYg/RmfR649IDNWuhoEgAX2+Rx5S7fyml7xbW25XG079922n17HuSQ
	 BLHn3tVPh7ZqxsTSr/nZMzolTIgsDSml5p65R+JQkk+heGsJdrqAf5iZeP1kJ0FIve
	 YBZlhbIGu6H5C0R5iQHll1RW53ImWWf6NrEHi+5bdqzbSL9WEQ3Wvak35xWs9WFMof
	 wntR4eKrvSbu5cBSqBnLPjaUKyuJMJutPIzQhDBS9YrAOHeAVr/qj7uJgvmDvXQuKS
	 gAeFm6aTPIElbSw+FL/tle2WqAn42lyyNW7lmyIHBQaxgNoG9s/jJx5XHq5Rgb7XwJ
	 lj3e4LnVoxVbg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id CB09B83C27;
	Sun,  3 May 2026 16:17:44 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 8A4F2204
 for <buildroot@buildroot.org>; Sun,  3 May 2026 16:17:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6F58783C1A
 for <buildroot@buildroot.org>; Sun,  3 May 2026 16:17:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ShEns35oFzrH for <buildroot@buildroot.org>;
 Sun,  3 May 2026 16:17:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 5788D83C13
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5788D83C13
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5788D83C13
 for <buildroot@busybox.net>; Sun,  3 May 2026 16:17:41 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 1EADD19F73D;
 Sun,  3 May 2026 18:17:38 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 03 May 2026 18:17:38 +0200
MIME-Version: 1.0
Date: Sun, 03 May 2026 18:17:38 +0200
To: Francois Perrad <francois.perrad@gadz.org>
Cc: buildroot@busybox.net
In-Reply-To: <20260429100357.148986-1-francois.perrad@gadz.org>
References: <20260429100357.148986-1-francois.perrad@gadz.org>
User-Agent: Webmail Free/1.6.14
Message-ID: <dd76339d1135d2e1b6eda391c8a993ca@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1777825059;
 bh=vN+cc5gYO0AnQOkIyzhjZBxmOyedjbktS3F1b20Fyhg=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=s6IfaWaJLNtPOoGQhDZzXOahladnj6iV46lP5CJMSYZ1bmFMhQ1lJhjElmaRvuFZ4
 ojXn1FvbZkD6mhilucGhxIB7Os7YL+INQKRnjeTd0dC1/7GiiDwEf21qBjLG6+lGgY
 8WY5cyR7eS8rxNAYIj3BsMCqzepFHbg4idv93fIVfDWzUy9hlbLDkWySVjLy7eVMOo
 PHYPuMJMdPoxQiRfwxvCgLjcwK9nBGZ6oBQByhXRjiWdkaWuhDoculqfCR6IZ5fFad
 ngIRRoDYNiVuRohcI648PgKItI6AIIx/OSIkUV5Bm/qP9YmVZkgvVE1H3V/0M22zNn
 8Sb0FF+TOpsWw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=s6IfaWaJ
Subject: Re: [Buildroot] [PATCH] package/lmdb: bump to version 0.9.35
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

On 29/04/2026 12:03, Francois Perrad via buildroot wrote:
> for changes, see:
> https://git.openldap.org/openldap/openldap/-/blob/LMDB_0.9.35/libraries/liblmdb/CHANGES?ref_type=tags
> 
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
