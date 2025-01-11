Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC459E7719A
	for <buildroot@archiver.kernel.org>; Sat, 11 Jan 2025 17:33:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9919C82EA5;
	Sat, 11 Jan 2025 17:33:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Hy9aoq5QrJ7Z; Sat, 11 Jan 2025 17:33:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A1A3A839BF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A1A3A839BF;
	Sat, 11 Jan 2025 17:33:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 663B2950
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 17:33:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4715B83A46
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 17:33:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ge1e11WETA_P for <buildroot@buildroot.org>;
 Sat, 11 Jan 2025 17:33:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.2;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A7AB382EA5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A7AB382EA5
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A7AB382EA5
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 17:33:47 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id BEA362003DD;
 Sat, 11 Jan 2025 18:33:44 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:51352])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 11 Jan 2025 18:33:44 +0100
MIME-Version: 1.0
Date: Sat, 11 Jan 2025 18:33:44 +0100
From: Julien Olivain <ju.o@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20250111152422.2837827-1-james.hilliard1@gmail.com>
References: <20250111152422.2837827-1-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <389ca565cc74667ca052d4ab191cf917@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1736616825;
 bh=HoWo/w4d+v/RWhNY5nSfGGyJzjskhAEhFY1cQeXE0cE=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=SQQh4uZ2VwrJzmIfrCcnt3F5N42yodSVqWwx/pm0dGhLpvn9FcLtaF/yr3TgPPrFm
 JE4Gl5HI9TsXUmmWUZm5YUpO3qlY5U2Cp8mrlBYZ0T34G5xS44zmvcY6k3IqvoV1W/
 VkUl9pB/UKCHHA+Jc7IkUCZXkY51AVUjy5GvO7B9HYrYQlBjZdNU0inu0k19zxm3Ck
 4WBwLrVbl8D7pUl2tb2F04/bLVxy+5gBKS/EmthYqih4i+AaShvzf8z0ej4lcilw9l
 282xRShqQTsXLuCw8NyFH14MmrzSMgvjwToENXMpw1Nfjql/3Tcm6tSlIdwYnF2uT2
 jCinrgYsSJCiA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=SQQh4uZ2
Subject: Re: [Buildroot] [PATCH 1/1] package/python-pyaml: bump to version
 25.1.0
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

On 11/01/2025 16:24, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
