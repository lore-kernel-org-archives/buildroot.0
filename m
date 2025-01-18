Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72587C02185
	for <buildroot@archiver.kernel.org>; Sat, 18 Jan 2025 19:22:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 373F441E14;
	Sat, 18 Jan 2025 19:22:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Qk8-INthCr8X; Sat, 18 Jan 2025 19:22:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 10965423A0
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 10965423A0;
	Sat, 18 Jan 2025 19:22:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 43A0F2F6D
 for <buildroot@buildroot.org>; Sat, 18 Jan 2025 19:22:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2DF2E84765
 for <buildroot@buildroot.org>; Sat, 18 Jan 2025 19:22:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JoUqW92cpiV7 for <buildroot@buildroot.org>;
 Sat, 18 Jan 2025 19:22:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D4F3E8407F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D4F3E8407F
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D4F3E8407F
 for <buildroot@buildroot.org>; Sat, 18 Jan 2025 19:22:09 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 43DDA13F88E;
 Sat, 18 Jan 2025 20:22:03 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:46068])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 18 Jan 2025 20:22:03 +0100
MIME-Version: 1.0
Date: Sat, 18 Jan 2025 20:22:03 +0100
From: Julien Olivain <ju.o@free.fr>
To: Akhilesh Nema <nemaakhilesh@gmail.com>
Cc: buildroot@buildroot.org, Martin Bark <martin@barkynet.com>, Richard
 Braun <rbraun@sceen.net>
In-Reply-To: <20250118093049.878701-1-nemaakhilesh@gmail.com>
References: <20250118093049.878701-1-nemaakhilesh@gmail.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <befcdf2f67070c28d57fb905d2cd17bc@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1737228126;
 bh=47QFS13BuTnPQSkylQb/Id6z1iVr4CVr/4Nrm7Ru4SI=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=SD+LalBk5HDrdvW4L99ssQmXKnpUoYWSAm+I/6CvfR5yTEmsYPZWQ8rjBbfSLMf22
 O4uPQIC60XiyuDmeQ1D6C0eWjKyJ1h55sKOIHZ4+OeUAvBzTFtHpLE6HKNKMeUTq7Y
 GTvZ5D2jnF2XeHIDtypsw82PaJZLHL1pizkgWDh7MH9g+NF7/Q9yLXNrpOcPbRRdi8
 H1ApbLX7X6Djxis3ZN69/gNe2ChetkBOe4l+RjRWdqZupy9gqRHpQ6pUdSSTwlytkr
 td/xtB0+zSZcFq3BuwjF2EzhbDG8vK5hpgkyLO04XnlLa0V6EbONwiwwoOXp0uOICi
 mVcWgSTmuoHUg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=SD+LalBk
Subject: Re: [Buildroot] [PATCH 1/2] package/zic: bump version to 2025a
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

On 18/01/2025 10:30, Akhilesh Nema wrote:
> Release notes:
> https://lists.iana.org/hyperkitty/list/tz-announce@iana.org/thread/MWII7R3HMCEDNUCIYQKSSTYYR7UWK4OQ/
> 
> Rebased the patch and updated the hash URL.
> 
> Signed-off-by: Akhilesh Nema <nemaakhilesh@gmail.com>

Series applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
