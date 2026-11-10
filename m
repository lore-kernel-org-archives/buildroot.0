Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9ED4606A336
	for <buildroot@archiver.kernel.org>; Tue, 10 Nov 2026 05:28:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=qFErM83w;
	dkim=temperror header.d=openadk.org header.i=@openadk.org header.a=rsa-sha256 header.s=2022 header.b=hsVbcUSI
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8FBB380D8D;
	Tue, 10 Nov 2026 05:28:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8PxhRdqZQuSq; Tue, 10 Nov 2026 05:28:09 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org B3A8380DA4
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794288489;
	b=T98yk337hCP9dJjwj/SvABUBqeyFm/abFDWGuEhnOf+YE6pinyIdqvAk/MycVKWs00BY
	 u0DjbrF90TzJc87Jn4qaVz69w/ZVNGKCCG77JpU+sH7GbzXWksOzrr+3Yx8SOMs/x2g1a
	 AGN+fvBaLthHlT0j+nePS/dIs5Q11dAc61lG7nvmC693PHf9JJJWJ1/KBw0WIpqIfuO4j
	 1EgRFLsBSPgPU6herXQl43zovtlUZXJCcuC3q/wLcpMsQnzK1InM8lqIFJ8JMpNuU+Iz2
	 difxXBeu6DEEjC5IU+VG8CFVr1M238vuxzURWz/hQ3oeeNfAd4yH39wm5B4e5RfDafw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794288489;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Received:Date:From:To:Cc:Message-ID:References:
	 MIME-Version:Content-Disposition:In-Reply-To:X-Operating-System:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=sUsnyMpE+9NX/WZZ5yXlBq+tiwk50/x54bKdzcW8Zls=;
	b=ZeaB0B67w2ltCVFFaBXpjXPnbgFo3jTW3C6wDGp9jM3bxqoW5etTeSjPgI1/LuvWhoFu
	 /Nz2Tljn457HLPfcy2qmnjHrokw47fFitF37MSBIKhsgP8P9MKdncry9qd8G6A+8B+1t7
	 HYaOsHxvbvMx50a03zi39C5xvQ8GR+jU1qs26d+M7oChHea2+VGwbLsdEwEovQTdGzFh4
	 Zo7Mh7WiW/Sbs8y7X2znTwnKXMF1MODptKD4hdt6QeRgRVH33m73tckb5okXJpcV6V5hf
	 PQafyq+3gjEtMyVYKzN4LSWSOFEc4htJf0Alq2mgO9EXHYQAmOyGikVb51j+9gXnO4g==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794288489;
	bh=sUsnyMpE+9NX/WZZ5yXlBq+tiwk50/x54bKdzcW8Zls=;
	h=Date:From:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qFErM83wTK2I/gscYbgEjXvJsX1qhRU9ROVpxygr5HnIyZX4upSHmrcrNSCyVY9Mk
	 n8q8SACLhJGGJgof6SSTfQwVjeVfHm1MkMHkVBrp4W5xX+CDPmwJS76JJrVcm97woM
	 JPWHOEIjl4vq5kaS4OA6rCAuCf5dV/5HdhUDSV+hFnRzLsVhGshtMrCxiF5UJBz4XI
	 7q1CGXbYyVT1QQrB6kXj/ayJKeu0zOnq7pCfjr6Ar9PPrTiYE+DxW/ulkv54Je9JfA
	 qlIVTcQAnQ8TIAxtulCXJot6s5aXuUc7ZudI9YsE3ZT3WQW0wvX4PXEMbRNbGQf63b
	 hLxv5uTB4aPug==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B3A8380DA4;
	Tue, 10 Nov 2026 05:28:09 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 1244431F
 for <buildroot@buildroot.org>; Tue, 10 Nov 2026 05:28:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0FBAC4031E
 for <buildroot@buildroot.org>; Tue, 10 Nov 2026 05:28:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2AF9TP4tAdUQ for <buildroot@buildroot.org>;
 Tue, 10 Nov 2026 05:28:07 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 4D48D40098
Authentication-Results: smtp2.osuosl.org; arc=none smtp.remote-ip=89.238.66.15
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=89.238.66.15;
 helo=helium.openadk.org; envelope-from=wbx@openadk.org; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none) header.from=openadk.org
Received: from helium.openadk.org (helium.openadk.org [89.238.66.15])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4D48D40098
 for <buildroot@buildroot.org>; Tue, 10 Nov 2026 05:28:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=openadk.org; s=2022;
 t=1794288484; bh=eoTVyW9kAJFFheE1DMzzJbsKrKC4h64NY9aOjDjryx4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=hsVbcUSIXxs4IKQMHUKN3idtC9jOS8xEq1+eVGCl/xbKHiBfAytAd20JK/yemhyS8
 3tXWhYqxLsMjStXE42Of1OuA/RevDyRiqqGpyqRHx0qdxCoEOKbDjj2myLI2qrljzf
 Il9B6qfZGRrHE56RHyaJQnqymoPEOEwDlHGX11wUfUdSlilYXrOHiIkNszAsHk5aaq
 9c5eIKO1qBDMRvj30y8eVh+KL+whKujksMaFhIqhKHZ+AMNEbvYj0tLmzGqcYG2hHQ
 f/1wPCO9LY+g69xYl2a5o82rPPLgLDJhb4rC2jDcAFNSK40ciEw7zwcidu9RbkjBB/
 ulhKCc5QHrmVg==
Received: by helium.openadk.org (Postfix, from userid 1000)
 id 1552331E09D4; Tue, 10 Nov 2026 06:28:03 +0100 (CET)
Date: Tue, 10 Nov 2026 06:28:03 +0100
From: Waldemar Brodkorb <wbx@openadk.org>
To: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Cc: buildroot@buildroot.org, Quentin Schulz <quentin.schulz@cherry.de>,
 Joshua Henderson <joshua.henderson@microchip.com>,
 Bartosz Bilas <b.bilas@grinn-global.com>,
 Peter Seiderer <ps.report@gmx.net>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <avKrY-io3kEIaRen@waldemar-brodkorb.de>
References: <20261109130533.4171508-1-angelo.compagnucci@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261109130533.4171508-1-angelo.compagnucci@gmail.com>
X-Operating-System: Linux 6.12.113+deb13-amd64 x86_64
Subject: Re: [Buildroot] [PATCH 0/2] package/qt5: security bump to version
 5.15.19
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Angelo, all,
Angelo Compagnucci wrote,

> This bumps the qt5 packages to Qt 5.15.19, from the kde/5.15 branch of
> KDE's Qt5 Patch Collection, which is now rebased on it. qt5webengine
> is bumped in its own patch, as it drops and refreshes some patches of
> qt5webengine-chromium.
> 
> This should be the last Qt5 bump: Qt 5.15.19 is the very last Qt 5.15
> release, and the Qt Company ended its support of Qt 5.15 after 26 May
> 2025 [1]. KDE keeps its Qt5 Patch Collection only for the open source
> projects still on Qt 5.15 until they move to Qt 6, and only for very
> critical fixes [2]. Qt5 users should plan their move to Qt6.
> 
> FYI: I am working on a series moving the Qt5 users to Qt6 and removing
> Qt5 from Buildroot. Before sending it, I would like to get feedback on
> this: would the removal be welcome, and when (for example after the
> next LTS)?

We are still using QT5, so it would be nice to keep it for the next
LTS and remove it afterwards.

best regards
 Waldemar
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
