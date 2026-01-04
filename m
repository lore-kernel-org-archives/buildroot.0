Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47230C2A074
	for <buildroot@archiver.kernel.org>; Sun,  4 Jan 2026 10:32:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1EFCB60889;
	Sun,  4 Jan 2026 10:32:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7tYh0ceMoBmi; Sun,  4 Jan 2026 10:32:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 958CC6072F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767522737;
	bh=QygdBAdLzqXv7yV+YZZQKYO2FHz2RUOYMGj7IFpEHvA=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=GPRCHLcEOIcicxkI/5lpCjfCr+FfHfk2JT1OvChlQIvCY6Qc0t2+3CgDCDJBhkTSt
	 5RfoZMMV/Jnh6ioSst7ywstqhHC8XxDPV62XXUAhkuTOlgUCHBZKrg8wy6b7MN4ckS
	 /1WozWHMYfXBD7ALhKzs9j5Rw3JbrB37DOMaCSubkfOhrKTIitTt9D5whTC7FdJBVu
	 ZBMbyu0+sQWCAq32g9RLdIaKA89uoGOA1k9V7mprBVkdD5GrVgla78fpfK2JCKbUrX
	 +2D4SvXRHJkB2fvqtPWzGPs1fDv5tPoCQBUXiSibVpet2csCyiR08F6S23QnFq7FH4
	 JW9loXqs2TAbw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 958CC6072F;
	Sun,  4 Jan 2026 10:32:17 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 12EE92DF
 for <buildroot@buildroot.org>; Sun,  4 Jan 2026 10:32:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id ED4FB6072F
 for <buildroot@buildroot.org>; Sun,  4 Jan 2026 10:32:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fwInQ7-n3PF8 for <buildroot@buildroot.org>;
 Sun,  4 Jan 2026 10:32:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 3854860728
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3854860728
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3854860728
 for <buildroot@buildroot.org>; Sun,  4 Jan 2026 10:32:15 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 03B84B00573;
 Sun,  4 Jan 2026 11:32:10 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 04 Jan 2026 11:32:10 +0100
MIME-Version: 1.0
Date: Sun, 04 Jan 2026 11:32:10 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org, Fiona Klute <fiona.klute@gmx.de>
In-Reply-To: <20260103194705.2273905-1-james.hilliard1@gmail.com>
References: <20260103194705.2273905-1-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.12
Message-ID: <496bdb8537112df15a8742b1bad9d852@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1767522733;
 bh=tDvvctDomA+9Na0vRE7x+RnWF/Pm6Xem3bDW1CU+zvo=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=cNNcKp5OYGm6csfb4I49BoHruqA4fHz3JI2g0KQLQ6mvC1K1qxKiNbDMUuoeh18Oh
 7QPvqnMD9SscK+DJiLbZAQWpSNY72XopT/2MGQGd6A1e+kBG32FiVRs+BaIlYue6Tq
 QpxX45r+3Y0Wctqp/K15xDz/+3GQGGxuHBm4/bAf5mzu4b6uOzEVMdzjlinXFRD2mU
 TYUwla0oKMVphdMGYGYY0ypq9ZVgZsi6UjsnmzDuXoC6eKC1YNoxt5EwjRJeputX/U
 eViPP+KAjC/hcmsbQUovv2RgDrkL9iBB0WPnAY8+jdEKg4gfreGEHY0P4noNF5xEzE
 dG/aOSOv6jRaA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=cNNcKp5O
Subject: Re: [Buildroot] [PATCH 1/1] package/python-markdown-it-py: bump to
 version 4.0.0
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

On 03/01/2026 20:47, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
