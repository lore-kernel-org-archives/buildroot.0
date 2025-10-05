Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45DA7CAC5BB
	for <buildroot@archiver.kernel.org>; Sun,  5 Oct 2025 17:19:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E81B441390;
	Sun,  5 Oct 2025 17:19:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QdAXVnCRgn-V; Sun,  5 Oct 2025 17:19:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EEFE941286
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id EEFE941286;
	Sun,  5 Oct 2025 17:19:41 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 85AA7272
 for <buildroot@buildroot.org>; Sun,  5 Oct 2025 17:19:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6B66141286
 for <buildroot@buildroot.org>; Sun,  5 Oct 2025 17:19:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fjJ5ZVaxlS5U for <buildroot@buildroot.org>;
 Sun,  5 Oct 2025 17:19:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::15;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 9193C40E28
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9193C40E28
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9193C40E28
 for <buildroot@buildroot.org>; Sun,  5 Oct 2025 17:19:40 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 7B17978034D;
 Sun,  5 Oct 2025 19:19:36 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 05 Oct 2025 19:19:36 +0200
MIME-Version: 1.0
Date: Sun, 05 Oct 2025 19:19:36 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20251003201349.2430422-1-bernd@kuhls.net>
References: <20251003201349.2430422-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.11
Message-ID: <412034cf1f28b26388b9a0ae3127fc53@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1759684777;
 bh=WbZq30OiR7MFpJKQ4aXd0VTeR8056v9W0J82NAwycOM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=tKuBLyhzuJyD0d2P1Q/uJ2GppgYBgx+n7N4fw4llPsEK9UXYj0FOCWghceCUkJMI3
 +FezO/NtSzOjfnT7cXOUWqZ2Uw6lA8iB6I4s9S0GJmd0nY0HcSu2dGcS6nwljB8ifI
 LQRmUI2KxBMPN3qc65Q+Nl9HqBVKRzomMKqa+UOkAERcDkI36yNqKrU3skDIjzdKLM
 UdHpPOmqIcpKJrCsioQVpvNAOsBjA40DOdwdzI9k1J5ceCZBqMOiDg3wjw2jfsjPfz
 Zn6EK01EVTeXwD6J3cUP178llKlk9bQqp5oKKgl9pbEc0jd81h0hdsMGJcPyGHv8dM
 aNLp6jTCraS8w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=tKuBLyhz
Subject: Re: [Buildroot] [PATCH 1/1] package/ccache: bump version to 4.12.1
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

On 03/10/2025 22:13, Bernd Kuhls wrote:
> Release notes:
> https://ccache.dev/releasenotes.html#_ccache_4_12_1
> 
> Updated license hash due to upstream commits:
> https://github.com/ccache/ccache/commit/df37867663000135eb0e80a7baad1fcf5b96b571
> https://github.com/ccache/ccache/commit/bd2147f30307ab62dbdb8252e9c6f2ef2b1ec44f
> https://github.com/ccache/ccache/commit/9ee66d6f93e2aaba974eb1871b71411fee92990a
> https://github.com/ccache/ccache/commit/fbdcabc521aa2fba8ea600e8e45ab26d161b79f3
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
