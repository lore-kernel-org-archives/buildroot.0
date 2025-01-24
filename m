Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98A73C02181
	for <buildroot@archiver.kernel.org>; Fri, 24 Jan 2025 19:39:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 46E2F60751;
	Fri, 24 Jan 2025 19:39:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PFc_rA_9D5z8; Fri, 24 Jan 2025 19:39:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4F4AD6079D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4F4AD6079D;
	Fri, 24 Jan 2025 19:39:17 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 6145A941
 for <buildroot@buildroot.org>; Fri, 24 Jan 2025 19:39:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B147D4042D
 for <buildroot@buildroot.org>; Fri, 24 Jan 2025 19:39:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id f7RX7YNZHnwP for <buildroot@buildroot.org>;
 Fri, 24 Jan 2025 19:39:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 3572540096
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3572540096
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3572540096
 for <buildroot@buildroot.org>; Fri, 24 Jan 2025 19:39:11 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 5B9925FF88;
 Fri, 24 Jan 2025 20:39:07 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:56534])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 24 Jan 2025 20:39:07 +0100
MIME-Version: 1.0
Date: Fri, 24 Jan 2025 20:39:07 +0100
From: Julien Olivain <ju.o@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20250124163124.3669026-1-james.hilliard1@gmail.com>
References: <20250124163124.3669026-1-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <7bcc09380291cc4f69935f9a7d5801f6@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1737747548;
 bh=A+SFdG4oF0NkMZFku6VZz9k7GBN+X4NdtxhzJM4LxNo=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=IpWLQCChiAaLudcCPQBJfG9Uovo68ZP0F33LuP48myTF9G2PX4e653Q2d400W2FEl
 8FW06Aw7IC3/V9DV6hAIS4Gd89Z3aDxgFNeRtWUvsBGlcNvAmYut4TGnxs5OFUdH6r
 rPKOqkz4lbwQcwGgAZVTWG+i+FZ4t0X5i12RflYYEFKhqn/QbZk1ngeKgXqYfIIezi
 6XuYsWR9+SKfzNzKrCf1F/vNTKPCF1fXvsIQd1PlFUlDLKc3U6wmEMVM2ElrRW5UWC
 zMgq34jWIMTnOEYwzT5000z7z4cSCz7ZpSJ0wBqtejrpGxmqY7NoiYUHy1kkuAkz2q
 yf555eWTNymkQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=IpWLQCCh
Subject: Re: [Buildroot] [PATCH v4 1/1] package/fwupd: bump to version 2.0.4
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

On 24/01/2025 17:31, James Hilliard wrote:
> Drop no longer required libgudev dependency.
> 
> Add new mandatory libusb dependency.
> 
> Add new optional libdrm config option.
> 
> Add new optional libblkid dependency and config option.
> 
> Add new optional valgrind dependency and config option.
> 
> Add new udev config option.
> 
> Add new vendor_metadata config option.
> 
> Add new umockdev_tests config option.
> 
> Add new systemd_syscall_filter config option.
> 
> Add new vendor_ids_dir config option.
> 
> Remove gusb config option.
> 
> Remove plugin_intel_spi config option.
> 
> Remove compat_cli config option.
> 
> Remove thinklmi_compat config option.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
