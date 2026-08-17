Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB324C5DF70
	for <buildroot@archiver.kernel.org>; Mon, 17 Aug 2026 17:17:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 622AA607C7;
	Mon, 17 Aug 2026 17:17:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id r2taXkbayXMs; Mon, 17 Aug 2026 17:17:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5B380607C3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786987031;
	bh=SIuvS3jSUBnXs65jRzpITYQpP+gFVLczF0RDIq949fU=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=m7xmmetD+O485SsZmHZK1H5ZTcsGzMPnV6+MByiAvHuC+wByLJ1mrwe+3C8xWtOdd
	 d89dwXj01j2TzjZHgkZziALKspSGrfBjewruIQMBQ11Dt1L9xpcQ9Kd/plb2eT6o8d
	 sXTdBnXXNqT7DFcVDuAGcH+bsxBdrjJeuRY8ZeuKCzS2+qrrNok/sDMgJ8wUjAPmOL
	 b69Vv6jayjc6tYA7XfAtxEy8g35MTTiQ4Qk6kZApiwtbU/5DxPQQll6XUzq84jp32z
	 ZQtfG+w0/bq19s/9LtU1DL4NKLRuMVDi+B38iBZ/Jjfgf4U5VtGLNSR44urbeExr6l
	 VA9i0P6ihSxBw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5B380607C3;
	Mon, 17 Aug 2026 17:17:11 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id A6EF1282
 for <buildroot@buildroot.org>; Mon, 17 Aug 2026 17:17:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 989D9405CB
 for <buildroot@buildroot.org>; Mon, 17 Aug 2026 17:17:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gTLZMZ5AzjAF for <buildroot@buildroot.org>;
 Mon, 17 Aug 2026 17:17:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org A025840575
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A025840575
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A025840575
 for <buildroot@buildroot.org>; Mon, 17 Aug 2026 17:17:09 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id B45942003B4;
 Mon, 17 Aug 2026 19:17:04 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 17 Aug 2026 19:17:04 +0200
MIME-Version: 1.0
Date: Mon, 17 Aug 2026 19:17:04 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260816202952.3978163-1-bernd@kuhls.net>
References: <20260816202952.3978163-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.17
Message-ID: <b78e979b4a57908e2d84b83a4cfb6256@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH 1/1] package/linux-firmware: bump version to
 20260810
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

On 16/08/2026 22:29, Bernd Kuhls wrote:
> Mass-update of license file paths due to upstream commit
> https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/commit/?id=1221848f23764faab10ff63bc5d9ea5d5b39a506
> "Move firmware licenses to a LICENSES/ directory"
> 
> Updated the hash of the WHENCE file, due to firmware additions and
> firmware changes, but no changes to the redistribution/licensing
> conditions.
> 
> Removed mts_mt9234mu.fw & mts_mt9234zba.fw from the
> BR2_PACKAGE_LINUX_FIRMWARE_USB_SERIAL_TI option due to their upstream
> removal:
> https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/commit/?id=1e6faaf837aea079582214c9c1382e5476175576
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
