Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83C6BC021B2
	for <buildroot@archiver.kernel.org>; Sat, 22 Feb 2025 11:36:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3D5C960730;
	Sat, 22 Feb 2025 11:36:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RCMMZkMnXP2u; Sat, 22 Feb 2025 11:36:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 489E8606D4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 489E8606D4;
	Sat, 22 Feb 2025 11:36:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 2B5ADF11
 for <buildroot@buildroot.org>; Sat, 22 Feb 2025 11:36:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0E1A081011
 for <buildroot@buildroot.org>; Sat, 22 Feb 2025 11:36:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lt1b_fmsOwHW for <buildroot@buildroot.org>;
 Sat, 22 Feb 2025 11:36:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 171DC8100B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 171DC8100B
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 171DC8100B
 for <buildroot@buildroot.org>; Sat, 22 Feb 2025 11:36:11 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id CEAE3780333;
 Sat, 22 Feb 2025 12:36:06 +0100 (CET)
Received: from 2a01:e0a:485:b220:8213:2270:4a8d:a1d5
 via 2a01:e0a:485:b220:8213:2270:4a8d:a1d5 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 22 Feb 2025 12:36:06 +0100
MIME-Version: 1.0
Date: Sat, 22 Feb 2025 12:36:06 +0100
From: Julien Olivain <ju.o@free.fr>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: buildroot@buildroot.org, Joseph Kogut <joseph.kogut@gmail.com>
In-Reply-To: <20250219204935.25502-1-giulio.benetti@benettiengineering.com>
References: <20250219204935.25502-1-giulio.benetti@benettiengineering.com>
User-Agent: Webmail Free/1.6.10
Message-ID: <b0fc0a5e6ca940de242d516fadd6f159@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1740224169;
 bh=DYnL5MWuHiQhdul04MM2L/LjirZ3kN4d63dStiB2E+w=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=ZCMJ2C2mGG4w8Ijx6yfD+au9rWRP1yQcJlRH66etKK6sXwz27mG+bHmNR8DQB49aR
 GhC0FstF9r9aglgNooVAXDGXRNyX3naiLTUc+MlLHZkOMjXdEeQ2rWiG5fnfgZb641
 aX0E+Z6j7LNUVNk5mnoxH9wP5JeHMZVIp7SDwi62oMS00N5Qofd0m3A9Ij9OtqY6sg
 WlnuuhOK0OGNNzmQ4Qz9lIA8l6Zp3Ka4ldCA+8OXZzo8Be+V82wAGBVvHdC3xkN4hH
 ErQP42HjRnKafs7nsvLy5Mn/Vn+nbWCk5rBuWjMYjlynp+AQ91MtZqYNnBsoh+uaPF
 36YE/0zuqIpWw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=ZCMJ2C2m
Subject: Re: [Buildroot] [PATCH] package/libnss: bump version to 3.108
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

On 19/02/2025 21:49, Giulio Benetti wrote:
> For release note, see:
> https://firefox-source-docs.mozilla.org/security/nss/releases/nss_3_108.html
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Applied to master, thanks.

For some reason, the release note link is broken. I replaced it
with a link to the rst source file in the repository.

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
