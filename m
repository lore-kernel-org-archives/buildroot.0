Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3154F606A321
	for <buildroot@archiver.kernel.org>; Mon,  9 Nov 2026 21:13:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=NLAV6wn/
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0A87240660;
	Mon,  9 Nov 2026 21:13:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id u91X7Z9n2Qpg; Mon,  9 Nov 2026 21:13:21 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org F2815406FE
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794258801;
	b=HJ576XmO2Fosu0ucpVNTVs5+Oc8DUAQCLmfjrQIxhoL5/uujLbvSFdzybkWBwtS0VnBZ
	 hgXGx6jePb3YSyOXVIARQ65oOWbbnhAc0jteDRXxOMQp4hrAXr/8Vlc8COSyVqSx2uF02
	 sGRKPb79WM66dWd4Zwtj193JGnhGFbQqOvoLrxgooifqYFjl1obzz1GkRVuBaGRnZKTId
	 SrUQiZ+j9Nz9p2U4V/l++Ryzv0yreBG26C9moWYaxhO1DNJ6RUKzeDwd6CSEVBj1S0xfE
	 FDZNlFV4U+MMTqsanLuhFLtemz3N5OtMPCnkystlyNpLrvBWh1AAOgfizHaiCUQ2FzQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794258801;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=dGl7HGNLgZRR0Z2rhI0xgjwawRvjUtd5cJJWx0+VFFQ=;
	b=J1FVSbprFrsmo/I8+/v93dsS9BMC81vRA/E+oMPm9p4xa3rn/EnDw68cygiJXpiHgO2q
	 NbyBLld8a+gcOnm4K6n5J8tSbazWEG5JFTELZ0EjT7/befJu4aejPFG4DGh7wDypBKREJ
	 Q/jStBZDc+osxVVodObaO+EMSRAHOF/X9qJZ3htFRPjDkYKay/0gUwkSCQp1Oqm3ckVHv
	 pojm/ilIY/nNwwV+8aozo1vl5Qgx+RIhzfoO5aHv768uuHpJlfQEdK3lGXJrknEXtOr2k
	 Yrqlg5q0CPunLsWkpoXpcD/K1RTGn977LbjbI/FBqdXIgMu3mtrjQVd9Px/cH6YJ9fA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794258801;
	bh=dGl7HGNLgZRR0Z2rhI0xgjwawRvjUtd5cJJWx0+VFFQ=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=NLAV6wn/7HjLZqwb0S9bcvhZe4qydDU2QiaQEQsvO+ynS3Z/5ttcMpW0mW4xD7B5W
	 V/VFg0TZTOhh/kr7d9fINilcMvJBGZ5EztajWKVtCIYmQXFGsXgxZwhatJIQlp2jI7
	 dIVO0qsXcFsG6Lu5mzMy0KYBvre7xZFci3pi8BPmd26yudhrbTpQ1YUK3nUY4JgTQi
	 a0W/JxyOs90Sl6HAlxbWApBQjw933hSfxGjQj2Gkpem+WmFzKzu6m84dxLxn/A1w89
	 hao7WCErPy68e0VDdBRU8xcBz09ppjtFpZainuK3b0hw55ZMRS3CHQHUF2a/LRn0YM
	 wlci2VAvbcnxA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id F2815406FE;
	Mon,  9 Nov 2026 21:13:20 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 23ABB3AD
 for <buildroot@buildroot.org>; Mon,  9 Nov 2026 21:13:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0993D402F4
 for <buildroot@buildroot.org>; Mon,  9 Nov 2026 21:13:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Db2u5lIquJUV for <buildroot@buildroot.org>;
 Mon,  9 Nov 2026 21:13:18 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 6C108402EE
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6C108402EE
 for <buildroot@buildroot.org>; Mon,  9 Nov 2026 21:13:16 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.4])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 262E313F879;
 Mon,  9 Nov 2026 22:13:08 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 via
 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr with HTTP (HTTP/1.0
 POST); Mon, 09 Nov 2026 22:13:08 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Mon, 09 Nov 2026 22:13:08 +0100
To: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Cc: buildroot@buildroot.org, Quentin Schulz <quentin.schulz@cherry.de>,
 Joshua Henderson <joshua.henderson@microchip.com>, Bartosz Bilas
 <b.bilas@grinn-global.com>, Peter Seiderer <ps.report@gmx.net>, Giulio
 Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <20261109130533.4171508-2-angelo.compagnucci@gmail.com>
References: <20261109130533.4171508-1-angelo.compagnucci@gmail.com>
 <20261109130533.4171508-2-angelo.compagnucci@gmail.com>
User-Agent: Webmail Free/1.6.20
Message-ID: <1569f14ce3d683522a4cd924dc707511@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH 1/2] package/qt5: security bump to version
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-11.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_PASS autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 09/11/2026 14:05, Angelo Compagnucci wrote:
> Fixes the following security issues:
> 
> - CVE-2025-5455: remotely triggerable assertion in data: URL handling
>   (qtbase)
> - CVE-2025-4211: improper link resolution before file access in
>   QFileSystemEngine on Windows (qtbase)
> - CVE-2025-30348: denial of service in the Qt XML module (qtbase)
> - CVE-2025-23050: read past the end of the buffer and division by zero
>   in QLowEnergyController on Linux (qtconnectivity)
> - CVE-2025-12385: improper validation of <img> tag size in the Text
>   component parser (qtdeclarative)
> 
> The fixes of CVE-2025-5455, CVE-2025-4211 and CVE-2025-30348 were
> already in the previous qtbase version from KDE, but they are fixed by
> Qt 5.15.19 and still reported for 5.15.18, the version used for the
> CVE tracking.
> 
> Bump the qt5 packages to the latest submodule versions of the kde/5.15
> branch of KDE's Qt5 Patch Collection, now rebased on Qt 5.15.19:
> https://invent.kde.org/qt/qt/qt5/-/tree/kde/5.15
> 
> qtbase carries the v5.15.19-lts-lgpl tag, so QT5_VERSION is now
> 5.15.19. qt5webengine, which follows QT5_VERSION, stays at 5.15.18 and
> is bumped by the next commit, together with qt5webengine-chromium.
> 
> License hash changes:
> - qt5base: the hash of src/3rdparty/harfbuzz-ng/COPYING was already
>   outdated, the file did not change in this bump (it is only checked
>   when the bundled harfbuzz is used);
> - qt5virtualkeyboard: the Apache-2.0 appendix was added to
>   src/plugins/pinyin/3rdparty/pinyin/NOTICE.
> 
> Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>

Since this series is fixing CVEs and is following the kde branch
I applied on master.

I agree we could eventually remove this package before the next
lts release (2027.02).

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
