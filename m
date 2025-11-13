Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A62CDCD98E2
	for <buildroot@archiver.kernel.org>; Thu, 13 Nov 2025 20:55:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7C7E340E04;
	Thu, 13 Nov 2025 20:55:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id O-RmnRtqg4Nv; Thu, 13 Nov 2025 20:55:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7CF6D40DD9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7CF6D40DD9;
	Thu, 13 Nov 2025 20:55:18 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 4D4DA230
 for <buildroot@buildroot.org>; Thu, 13 Nov 2025 20:55:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 33F9680D08
 for <buildroot@buildroot.org>; Thu, 13 Nov 2025 20:55:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RlcFeBjc6pnW for <buildroot@buildroot.org>;
 Thu, 13 Nov 2025 20:55:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D6D7780D36
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D6D7780D36
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D6D7780D36
 for <buildroot@buildroot.org>; Thu, 13 Nov 2025 20:55:15 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -599251556; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 13 Nov 2025 20:55:12 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1vJeLW-002kNO-2t;
 Thu, 13 Nov 2025 21:55:10 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: buildroot@buildroot.org
References: <20251112203227.27573-1-peter@korsgaard.com>
 <aRYKRrNl6nALDwmo@landeda>
Date: Thu, 13 Nov 2025 21:55:10 +0100
In-Reply-To: <aRYKRrNl6nALDwmo@landeda> (Yann E. MORIN's message of "Thu, 13
 Nov 2025 17:41:42 +0100")
Message-ID: <87a50podox.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=ItdV+d5fDLROKu/kgNyNV+3C19MlsCsqGq5/qgYFfhYjca/hfUvysMXba7XVcxh10w+/2/InnShXoY5hi6mqu2yre75cIjhxyyKiCvW27+Pu322Yp5z4A8sQAw/cYsRjGJ+3ZAi5KD+5CAfgCyyB2Hd5T6K+fMNmnDGywo3/+ekcxZA4OZ0223360qWtMv31DivN2a/B6ZUVsOPA/8rhYtJW87D7pSmt4o+nVhBCX5khK+AAiNWUA1gFmS0bRHg90XU+MIm+ubAB25aAUkwnk0Zm5C/Dbt/czYaxKD0aIfJwQ8FrvJj2RH+9ViQ0NDR7dAonC7tv/diQYQDHXggjyA==;
 s=purelymail3; d=purelymail.com; v=1;
 bh=zqiHmH2KQLnxwxeArA4/oiqjHNSMMpPTchkbzM+Rn8k=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail3 header.b=ItdV+d5f
Subject: Re: [Buildroot] [PATCH] docs/manual: fix typo in merged-bin details
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

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > Peter, All,
 > On 2025-11-12 21:32 +0100, Peter Korsgaard spake thusly:
 >> Commit 6b53649bfa ("docs/manual: add merged-bin details to customize
 >> rootfs") added a small typo, fix that.
 >> 
 >> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

 > Reviewed-by: Yann E. MORIN <yann.morin.1998@free.fr>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
