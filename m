Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B293CC83F10
	for <buildroot@archiver.kernel.org>; Sat, 12 Jul 2025 10:10:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3879E40978;
	Sat, 12 Jul 2025 10:10:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YsEy49J8x71E; Sat, 12 Jul 2025 10:10:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4CDA140817
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4CDA140817;
	Sat, 12 Jul 2025 10:10:05 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 25AF81CC
 for <buildroot@buildroot.org>; Sat, 12 Jul 2025 10:10:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 17DE54031F
 for <buildroot@buildroot.org>; Sat, 12 Jul 2025 10:10:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Awsu-RNWL5nZ for <buildroot@buildroot.org>;
 Sat, 12 Jul 2025 10:10:02 +0000 (UTC)
Received-SPF: None (mailfrom) identity=mailfrom; client-ip=176.9.89.163;
 helo=serv15.avernis.de; envelope-from=br015@umbiko.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 9533F40053
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9533F40053
Received: from serv15.avernis.de (serv15.avernis.de [176.9.89.163])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9533F40053
 for <buildroot@buildroot.org>; Sat, 12 Jul 2025 10:10:01 +0000 (UTC)
Received: by serv15.avernis.de (Postfix) with ESMTPSA id 47712BDE5513;
 Sat, 12 Jul 2025 12:09:55 +0200 (CEST)
MIME-Version: 1.0
Date: Sat, 12 Jul 2025 10:09:54 +0000
From: Andreas Ziegler <br015@umbiko.net>
To: Tim Soubry <tim.soubry@mind.be>
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot
 <buildroot@buildroot.org>
In-Reply-To: <mailman.49207.1752301977.2108631.buildroot@buildroot.org>
References: <mailman.49207.1752301977.2108631.buildroot@buildroot.org>
Message-ID: <2eda34c58f6acd572ff99686856e2e1c@umbiko.net>
X-Sender: br015@umbiko.net
X-Virus-Scanned: clamav-milter 1.0.7 at serv15.avernis.de
X-Virus-Status: Clean
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=umbiko.net; s=mail; 
 t=1752314995; bh=dEOQOEDbJVZPBIS36g4Pbcdmtlt65iyP0uhpaFrh02Y=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References;
 b=vLR2yAVCIohwdE94N+P8cN94B8xR5T4Q4eLUiNt8uEhIf2dt3aaca9YNQmBPizzCm
 QitCvSoi6wdvHLaZzvloSo/Nksd1MA2zILeYZC4fvNCMABbFSimqeM60dozi22Lx33
 hZfA3vf+gloGdHOqi0Esn8XoRBexIK882vVoLq0Y=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=umbiko.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=umbiko.net header.i=@umbiko.net header.a=rsa-sha256
 header.s=mail header.b=vLR2yAVC
Subject: Re: [Buildroot] [PATCH 1/1 v3] package/ncmpc: bump version to 0.52
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

Hi Tim,

On 2025-07-11 16:32, Tim Soubry wrote:
> 
> Applying version bump of ncmpc to version 0.52 as proposed in [1].
> As from version 0.50 of ncmpc, fmt got added as a dependency [2]. This 
> was
> also added to package/ncmpc/Config.in and package/ncmpc/ncmpc.mk.
> 
> For release notes, see:
> https://github.com/MusicPlayerDaemon/ncmpc/blob/master/NEWS
> 
> Comparision between version 0.49 and 0.52:
> https://github.com/MusicPlayerDaemon/ncmpc/compare/v0.49..v0.52
> 
> [1] 
> https://lore.kernel.org/buildroot/20250707112536.1644236-1-tim.soubry@mind.be/T/#rb3b968fff23bac0298e33f473d63a1ad470d38e3
> [2] 
> https://github.com/MusicPlayerDaemon/ncmpc/commit/c3b0055d06f8e8efab7f388646beb7645b90d063
> 
> Signed-off-by: Tim Soubry <tim.soubry@mind.be>
Tested-by: Andreas Ziegler <br015@umbiko.net>
Signed-off-by: Andreas Ziegler <br015@umbiko.net>

<cut>

Kind regards,
Andreas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
