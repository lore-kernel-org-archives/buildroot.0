Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A901E67482
	for <buildroot@archiver.kernel.org>; Sun, 21 Dec 2025 12:57:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6169E81DE8;
	Sun, 21 Dec 2025 12:57:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PJf3G9iqODE7; Sun, 21 Dec 2025 12:57:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 70C2B81B99
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766321854;
	bh=yPAMbkNVlNLtuz469KYQz0xJ5x9qNhxacEcTi6lTBxQ=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Oh8SmCI/Jo9wlZGtK1/hKpmjfVeunyKtG/0yfhYO+i8d6HcfmywquWUpXH/dtP6TG
	 f6HOwkuMs/GT37SgL5ZCQt8aBubJofxrA6W0nq12uitNg3PdVav2WRYx9/530PUgXG
	 v9QDvwicVj2pk2Uk8U3BVnKotufjgz7vabTvzZ2JlksXz8aei3RqfLJ7sHy+o4yng6
	 b49Gkv02AlwpR+pZNE7VAy2+mzS25qNpOWV7kCKO9Dg3r/PAmy4JFTYlA2khxqy4ra
	 5oVjVv3tbITYnChJisc52gyILUUIu1gNXjkbu68VuJEJZtqOMPr/1lKeJ40n6ARqun
	 xa1RjCaML79rg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 70C2B81B99;
	Sun, 21 Dec 2025 12:57:34 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id E3D30119
 for <buildroot@buildroot.org>; Sun, 21 Dec 2025 12:57:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D5E3C404D8
 for <buildroot@buildroot.org>; Sun, 21 Dec 2025 12:57:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JWS4XQjRPHT7 for <buildroot@buildroot.org>;
 Sun, 21 Dec 2025 12:57:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org A8C8240441
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A8C8240441
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A8C8240441
 for <buildroot@buildroot.org>; Sun, 21 Dec 2025 12:57:31 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 3A5B313F86A;
 Sun, 21 Dec 2025 13:57:28 +0100 (CET)
Received: from 37-167-60-49.coucou-networks.fr ([37.167.60.49:29660])
 via 37-167-60-49.coucou-networks.fr ([37.167.60.49])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 21 Dec 2025 13:57:28 +0100
MIME-Version: 1.0
Date: Sun, 21 Dec 2025 13:57:28 +0100
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20251204165910.893915-1-giulio.benetti@benettiengineering.com>
References: <20251204165910.893915-1-giulio.benetti@benettiengineering.com>
User-Agent: Webmail Free/1.6.12
Message-ID: <5ee95a8e2c908d5873bae8005c2c8929@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1766321849;
 bh=kDugc5RlKlpjpQhzFuJN3Xz/IjRF1D9ZjLgDzA3xlhk=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=JbO9zH1EXNbrO/y6I0iMF99ZRI6VdGrN/lHuLEYgvnlm3Hh/DGZSDWHjIEifBMO+8
 G6yZjoSBmT5Js64Xitk08Omy8W3cu4L+XkGqRnRMwz36iC94Adu9VUDxjegzJi3jNK
 QNYX4m8HcY2bOjTtXBElVXaBLR5j+H/wt1dnKT0CeqvZIPZ4xL/vhyfagD1MQxXg9X
 dF47fknDn5Hum3jAv3R7xvKIbTOsZgzZIaz+kpx96QhVNXL6qqI+HWiWJQZBAfTd2p
 2BKWDsb0zkjAhxZUxs/UeKrPexiolUl0DRBHfxUXI1cYncZ/3xcmJFCG0HRMzMpjik
 htCCxx2UjR9/g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=JbO9zH1E
Subject: Re: [Buildroot] [PATCH] package/esp-hosted: bump to version
 1.0.5.0.3
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

On 04/12/2025 17:59, Giulio Benetti wrote:
> Drop local patch that has been upstreamed.
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
