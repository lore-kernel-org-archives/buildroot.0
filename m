Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 684EBC3ABBF
	for <buildroot@archiver.kernel.org>; Wed,  7 May 2025 18:59:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 167A983CDC;
	Wed,  7 May 2025 18:59:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Q-157d2YsqiQ; Wed,  7 May 2025 18:59:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 475ED83CD0
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 475ED83CD0;
	Wed,  7 May 2025 18:59:35 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id D167F15A
 for <buildroot@buildroot.org>; Wed,  7 May 2025 18:59:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CDC70419B4
 for <buildroot@buildroot.org>; Wed,  7 May 2025 18:59:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pBVO6JDMgd_i for <buildroot@buildroot.org>;
 Wed,  7 May 2025 18:59:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=136.243.2.102;
 helo=nyx.n621.de; envelope-from=fl@n621.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 2C7F940C2F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2C7F940C2F
Received: from nyx.n621.de (v4gw.hekate.n621.de [136.243.2.102])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2C7F940C2F
 for <buildroot@buildroot.org>; Wed,  7 May 2025 18:59:32 +0000 (UTC)
Received: by nyx.n621.de (Postfix, from userid 1000)
 id B9160E002ED; Wed,  7 May 2025 20:59:30 +0200 (CEST)
Date: Wed, 7 May 2025 20:59:30 +0200
From: Florian Larysch <fl@n621.de>
To: buildroot@buildroot.org
Message-ID: <20250507185930.6cosxy42ale5wqw2@n621.de>
References: <20250507185311.7581-1-fl@n621.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250507185311.7581-1-fl@n621.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=n621.de; s=dkim; t=1746644370;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=XuuY+BmG1vBLu+UixSp8d/o4Q0DyzaOTm5G2h1b1qeI=;
 b=owgYOcUwGXE0rFQnBPNzbBRXEGxHbnKRcs8o6/X9/JUY0C2sTlzkz8/Tvygz7Mz4bbH5ju
 L7AS8JxR/NMe0b9ar4AfSvUpwS4baPF8dgNfaLijcOvaPqfzxR741iordfRnfMmE7qoCin
 6kuOi3aHXiwF3p5LMncujD1yPshjXRc=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=n621.de
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=n621.de header.i=@n621.de header.a=rsa-sha256
 header.s=dkim header.b=owgYOcUw
Subject: Re: [Buildroot] [PATCH 1/1] package/bash: fix build with host GCC 15
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Note that this is also going to cause issues for the target build once
toolchains start picking up GCC 15, but since this also requires
touching the toolchain infrastructure to make Buildroot aware of GCC 15
and I'm not too familiar with that I wanted to keep the patch for the
acute issue separate.

Florian
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
