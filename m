Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8148C0218D
	for <buildroot@archiver.kernel.org>; Sat, 25 Jan 2025 20:21:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8A42640757;
	Sat, 25 Jan 2025 20:21:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fBRPBEtOd5RM; Sat, 25 Jan 2025 20:21:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6DD6E4083A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6DD6E4083A;
	Sat, 25 Jan 2025 20:21:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 67BC91183
 for <buildroot@buildroot.org>; Sat, 25 Jan 2025 20:21:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4914381277
 for <buildroot@buildroot.org>; Sat, 25 Jan 2025 20:21:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id p-f_QwaW_RT6 for <buildroot@buildroot.org>;
 Sat, 25 Jan 2025 20:21:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::15;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 5B6688129E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5B6688129E
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5B6688129E
 for <buildroot@buildroot.org>; Sat, 25 Jan 2025 20:21:22 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 38191780316;
 Sat, 25 Jan 2025 21:21:18 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:58324])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 25 Jan 2025 21:21:18 +0100
MIME-Version: 1.0
Date: Sat, 25 Jan 2025 21:21:18 +0100
From: Julien Olivain <ju.o@free.fr>
To: Akhilesh Nema <nemaakhilesh@gmail.com>
Cc: buildroot@buildroot.org, Bernd Kuhls <bernd@kuhls.net>
In-Reply-To: <20250115075929.794762-1-nemaakhilesh@gmail.com>
References: <20250115075929.794762-1-nemaakhilesh@gmail.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <838cdf1fa08ca8b49d2231961a922ae9@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1737836480;
 bh=zMZQ1C4d3HGM47rlNu/5Z7Lqo+cblmWXKBZcqN7UKWk=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=T9qG9E/+YTrrs1nZ2+dEY8ec9H7pcWjNnwfcXuI1WD62XSJd1yRiJPl7zPc13xOI1
 8OwmyHmeluRRQCTvwFPBUDd5BYGBflxuzoaNnx9AVzXulebJORNYXm7ME2MrNO2Xgc
 nrPgP9uvQuD6k4iZALafSqJufdN2tHhWRw9NvU2ahGN3l0tIX+d/Yi8whYoEIsA2F0
 SZuemL/ArNVT0Y0S6RBCJFcotTv4Qj1Vu9q+BSWsniQuOZrbK37k2wB0lrc6Gl+Oqu
 rX3LM01hSsMSAVhLhb5D9EolHNfbOiFbIMQB23QXctnnxF2IzHexvx4h8JDlmBvzr3
 pjsHgkYoP9v2A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=T9qG9E/+
Subject: Re: [Buildroot] [PATCH 1/1] package/sqlite: bump version to 3.48.0
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

On 15/01/2025 08:59, Akhilesh Nema wrote:
> Updated SQLITE_SITE.
> 
> Release notes: https://www.sqlite.org/releaselog/3_48_0.html
> 
> Signed-off-by: Akhilesh Nema <nemaakhilesh@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
