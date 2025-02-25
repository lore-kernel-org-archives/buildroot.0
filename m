Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7CEEC021B8
	for <buildroot@archiver.kernel.org>; Tue, 25 Feb 2025 20:09:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6928740DA1;
	Tue, 25 Feb 2025 20:09:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id m76iHarKAPSm; Tue, 25 Feb 2025 20:09:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 46B3B40DA3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 46B3B40DA3;
	Tue, 25 Feb 2025 20:09:11 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 4F8E82019
 for <buildroot@buildroot.org>; Tue, 25 Feb 2025 20:09:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3EF3380EE5
 for <buildroot@buildroot.org>; Tue, 25 Feb 2025 20:09:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OWMk1p_BWMUY for <buildroot@buildroot.org>;
 Tue, 25 Feb 2025 20:09:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 9E1D080F13
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9E1D080F13
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9E1D080F13
 for <buildroot@buildroot.org>; Tue, 25 Feb 2025 20:09:08 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 7924A19F57E;
 Tue, 25 Feb 2025 21:09:04 +0100 (CET)
Received: from 2a01:e0a:485:b220:8213:2270:4a8d:a1d5
 via 2a01:e0a:485:b220:8213:2270:4a8d:a1d5 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 25 Feb 2025 21:09:04 +0100
MIME-Version: 1.0
Date: Tue, 25 Feb 2025 21:09:04 +0100
From: Julien Olivain <ju.o@free.fr>
To: Fiona Klute <fiona.klute@gmx.de>
Cc: buildroot@buildroot.org, Fabrice Fontaine <fontaine.fabrice@gmail.com>
In-Reply-To: <20250224123618.2764327-1-fiona.klute@gmx.de>
References: <20250224123618.2764327-1-fiona.klute@gmx.de>
User-Agent: Webmail Free/1.6.10
Message-ID: <c1bd2011765496360a2916c7ba2441fb@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1740514146;
 bh=oa0OgWLjzojkO1+5PBWW3qGbF/mE6wO0nDAieNkdDRk=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=X4gFgT5pQTrZWEODA4P2pxgT/qlcGRE1r27M4Y9MBF9WxbZUKEjCGk2ntPKzXIbhE
 M6OzzKA+VjxXr9XRti2Or/5ivp0V3dz8wsVsOKqGCcsSBh0FK7WhWCw8/0EBdqzm7x
 vxmt5cJOzs3eH1/gl8kNDec8xHDjoS1XBKW4jtM2LU3h2ip20K2rjXCmuwHMpV7CcY
 H1QpkRAoP6q5oIYyFimvDLXKHNST4SOGES0IXAKpc5MDhNE+45mj71glcvkYg5q+Oi
 SYNZT+YidRNnSf9Dvk5XdDDMsnvrytt2U1ZwoTqaPUquH83oRaDrL1shvYIQrON5yQ
 b4NwTGAb841cw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=X4gFgT5p
Subject: Re: [Buildroot] [PATCH 1/1] package/libglib2: bump version to 2.82.5
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

On 24/02/2025 13:36, Fiona Klute via buildroot wrote:
> From: "Fiona Klute (WIWA)" <fiona.klute@gmx.de>
> 
> This is a small bugfix release, the fix relevant for Buildroot is a
> possible integer overflow when parsing ISO 8601 date/time strings:
> https://gitlab.gnome.org/GNOME/glib/-/merge_requests/4499/diffs
> 
> Full upstream changelog, two other fixes are for macos, one related to
> testing:
> https://gitlab.gnome.org/GNOME/glib/-/blob/2.82.5/NEWS?ref_type=tags
> 
> Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
