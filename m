Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CA70C3ABC9
	for <buildroot@archiver.kernel.org>; Sun, 18 May 2025 12:18:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 39C2880D21;
	Sun, 18 May 2025 12:18:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0pFeXQ7y1GnE; Sun, 18 May 2025 12:17:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6F07480EDA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6F07480EDA;
	Sun, 18 May 2025 12:17:59 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 3B0EEDF
 for <buildroot@buildroot.org>; Sun, 18 May 2025 12:17:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 20EFA6066A
 for <buildroot@buildroot.org>; Sun, 18 May 2025 12:17:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id E6FZT4bBT1qn for <buildroot@buildroot.org>;
 Sun, 18 May 2025 12:17:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.2;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 45B6F6064D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 45B6F6064D
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 45B6F6064D
 for <buildroot@buildroot.org>; Sun, 18 May 2025 12:17:56 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id F34A22003C8;
 Sun, 18 May 2025 14:17:51 +0200 (CEST)
Received: from 2a02-842a-45ac-9401-0517-4590-b867-5f74.rev.sfr.net
 (2a02:842a:45ac:9401:517:4590:b867:5f74)
 via 2a02-842a-45ac-9401-0517-4590-b867-5f74.rev.sfr.net
 (2a02:842a:45ac:9401:517:4590:b867:5f74) by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 18 May 2025 14:17:51 +0200
MIME-Version: 1.0
Date: Sun, 18 May 2025 14:17:51 +0200
From: Julien Olivain <ju.o@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Buildroot List <buildroot@buildroot.org>, =?UTF-8?Q?Rapha=C3=ABl_M?=
 =?UTF-8?Q?=C3=A9lotte?= <raphael.melotte@mind.be>
In-Reply-To: <20250518085723.23020-2-thomas.petazzoni@bootlin.com>
References: <20250518085723.23020-1-thomas.petazzoni@bootlin.com>
 <20250518085723.23020-2-thomas.petazzoni@bootlin.com>
User-Agent: Webmail Free/1.6.10
Message-ID: <1dfd12b6311d1d3670a623bf5a9e2a9f@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1747570674;
 bh=g11IYu82qQQypZkOtRQdWVWFf1V7YmuCp7ck0tSKJJ4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=NMuyywDu4bHJGtFguEf5KZQvQQZI3bfwnZ57KMykttvxWyKisTMIbJZf2yHoCcCXg
 etJnj/40jTwZGSKXLUngIP/TkSvALhm9b3oP5BWIAM2ICbPRQesluv2BxXsT6omT6r
 u4XoUB64hweiURMT0OiSDalQX+HCbNf+xTfGkP81C4uACko+LBxvDBzex4cqtl1Vus
 C/HI+bw+0tBmuhzS7hB/P8DfdtNQDTGdhi1DQgwgPsHNtVIz9ObBBTOLNmZEirriTY
 yYBU66vZQcOt6s8TbVgxirt7VkAZAhFJBDwvhiixiZgIc/GgyvHGspNOAbWnDEPkQB
 kdHqW7gs8AmDA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=NMuyywDu
Subject: Re: [Buildroot] [PATCH 01/22] boot/grub2: drop stale IGNORE_CVES
 entries
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

On 18/05/2025 10:56, Thomas Petazzoni via buildroot wrote:
> CVE-2020-15705 is only applicable to grub versions up to 2.04, and
> we're using a more recent version, so it is no longer needed to ignore
> it.
> 
> CVE-2021-46705 is only applicable to grub versions up to 2.06, and
> we're using a more recent version, so it is no longer needed to ignore
> it.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Series applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
