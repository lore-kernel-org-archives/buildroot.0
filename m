Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E82D1C83F22
	for <buildroot@archiver.kernel.org>; Sun, 20 Jul 2025 21:30:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BA57D83313;
	Sun, 20 Jul 2025 21:30:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id f4DQKlOLy4Y0; Sun, 20 Jul 2025 21:30:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E674383336
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E674383336;
	Sun, 20 Jul 2025 21:30:37 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 39E781F7
 for <buildroot@buildroot.org>; Sun, 20 Jul 2025 21:30:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1F8DB83336
 for <buildroot@buildroot.org>; Sun, 20 Jul 2025 21:30:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1AE328qEpYZR for <buildroot@buildroot.org>;
 Sun, 20 Jul 2025 21:30:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4484083313
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4484083313
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4484083313
 for <buildroot@buildroot.org>; Sun, 20 Jul 2025 21:30:35 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 0DB4A13F8AD;
 Sun, 20 Jul 2025 23:30:30 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 20 Jul 2025 23:30:30 +0200
MIME-Version: 1.0
Date: Sun, 20 Jul 2025 23:30:30 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20250720190127.3211017-1-james.hilliard1@gmail.com>
References: <20250720190127.3211017-1-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <8f6b6ccc6a92bae50921db847b70b869@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1753047032;
 bh=3UQ4f49NKemXnY0R5oE9gUUi1yQqcsBpc3Kmt25+214=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=GeFhiCIqFNYvBqeeZFDCyjyZYVF2+pRwbIOz9E+tslzEFk74UqwXlj4r3M61SiVXo
 eQCEqSiE7UhTQJ+1P+J1E2FtjSa2p/CyxS1/9+foWRugu2MqocB51j4HIq26Z7Os2F
 fT4WrMaNljwut4rciVnhab1g/QXYFpdON0qPA//nY/bpwoAwsKD/n6HLf/o1H7qK4u
 gRwe3/aeLXpSXjEEvhIl4WFtvnTziZk2iDGMB8iStyvoD8ysFcZhEMUwdjL9TgDRNs
 1jdIIuJxiTjBxuha6EOZ5AheafZyYOieFQMBxHyjCxM1puGl5PxAegfGLjqeaPRydf
 9WiM9I2jqlEpQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=GeFhiCIq
Subject: Re: [Buildroot] [PATCH 1/1] package/python-aiocoap: bump to version
 0.4.14
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

On 20/07/2025 21:01, James Hilliard wrote:
> License hash changed due to adding SPDX header:
> https://github.com/chrysn/aiocoap/commit/e666dd6515479f44fda6b5610064025ada56e199
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
