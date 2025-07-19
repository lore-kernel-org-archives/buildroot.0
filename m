Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F0DAC83F27
	for <buildroot@archiver.kernel.org>; Sat, 19 Jul 2025 11:24:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 62E4784604;
	Sat, 19 Jul 2025 11:24:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8erzTZ2VvYyk; Sat, 19 Jul 2025 11:24:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AFC80845D9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id AFC80845D9;
	Sat, 19 Jul 2025 11:24:20 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id C584B117
 for <buildroot@buildroot.org>; Sat, 19 Jul 2025 11:24:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B78EB41A49
 for <buildroot@buildroot.org>; Sat, 19 Jul 2025 11:24:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VFwI3jwIHyMY for <buildroot@buildroot.org>;
 Sat, 19 Jul 2025 11:24:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org D569441774
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D569441774
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D569441774
 for <buildroot@buildroot.org>; Sat, 19 Jul 2025 11:24:18 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id E03D613F8C0;
 Sat, 19 Jul 2025 13:24:13 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 19 Jul 2025 13:24:13 +0200
MIME-Version: 1.0
Date: Sat, 19 Jul 2025 13:24:13 +0200
To: Marcus Hoffmann <buildroot@bubu1.eu>
Cc: buildroot@buildroot.org, James Hilliard <james.hilliard1@gmail.com>,
 Marcus Hoffmann <bubu@bubu1.eu>
In-Reply-To: <20250715093737.22493-1-buildroot@bubu1.eu>
References: <20250715093737.22493-1-buildroot@bubu1.eu>
User-Agent: Webmail Free/1.6.11
Message-ID: <e43c476cc4039f5bdd6b26822f9cdce1@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1752924257;
 bh=YYSTooarmivzdFozHTyz5t1hH3sEbXCjYU7InhWVOWE=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Y1YNjktqLmQPHDuhcdSikg3wS7O5J2PxU7u//VOeC62KbFl0HXMa+pKkXYNXAZlS1
 y6st7aYTJWaiLwd+DPNlL2sc6Lypa9VgY9zaWDpqmc/w05ldPOF69cV5ESkoHVCMuE
 faYWBtrqrwrd40U39Eh/7H6AN0cV43Au3PzgvxFiV17VawFJw9vXCR3GDlWO2nR2In
 DBU7r/jSv0+KmASP7osDSfspS65HJwOdZZgWf1+ebWQkSBCCqjB+NYtxPMXeXbKeHz
 3P6m9NdQVb8w4tSnt9KBhXx6D5GAaHH9hFC+B4MOYNwZqmEa4zqb+Z+OWcd0LQHyDh
 P4MXmU9A9pAQQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Y1YNjktq
Subject: Re: [Buildroot] [PATCH] package/python-typing-inspection: bump to
 0.4.1
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

On 15/07/2025 11:37, Marcus Hoffmann via buildroot wrote:
> Release notes:
> https://github.com/pydantic/typing-inspection/releases/tag/v0.4.1
> 
> LICENSE hash changed due to copyright holder line change in:
> https://github.com/pydantic/typing-inspection/commit/f3a49c37707cb0b9ddcbc16c19caa75413247319
> 
> Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
