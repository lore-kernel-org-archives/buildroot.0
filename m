Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DB8FC43458
	for <buildroot@archiver.kernel.org>; Wed,  1 Jul 2026 19:59:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C3D7482D0C;
	Wed,  1 Jul 2026 19:58:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id o6uOOO5TQBga; Wed,  1 Jul 2026 19:58:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4DBEA82B24
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782935938;
	bh=j15EzVTr5PCXtNRMeKmIzC2OR3o12oGGRHCRiWiXZH0=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rVnKWj9rOr//mqUJTXJCKzkZ/DzopPiC/yQnRbl8x3ur9BGH6zt2BRSIXYt8rpxch
	 qkMlLkktJFNbueahr0O9yYuQF3ywgrwhKM975McBi5CqvfZpnwSJB4cOO8Tn+ynU37
	 LparABXhB01xeBXXjp+GYfy3I3uj0sESdraTE3KDmrEpGYlITonlyHxtQoG7rO6juC
	 cxxDzYQxERvsWW719cmGiFTmme+fsJV1CwhH/sZpueN5NE5BuC4uFPlFrmRDrx7uGO
	 t9Jp1BOMtIcfsf/9Tb8BeIjk5el6DAvRNUAQ6F6Ni4hw7OuGglkwg8Lhatl03WXYFp
	 W0jjYpRMvUMwQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4DBEA82B24;
	Wed,  1 Jul 2026 19:58:58 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 9BE69127
 for <buildroot@buildroot.org>; Wed,  1 Jul 2026 19:58:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8D57A40F94
 for <buildroot@buildroot.org>; Wed,  1 Jul 2026 19:58:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LZXOf1apUz_a for <buildroot@buildroot.org>;
 Wed,  1 Jul 2026 19:58:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 0545840F07
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0545840F07
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0545840F07
 for <buildroot@buildroot.org>; Wed,  1 Jul 2026 19:58:54 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -1448330637; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 01 Jul 2026 19:58:48 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1wf155-000000031xi-2mzn;
 Wed, 01 Jul 2026 21:58:47 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260626210949.741890-1-bernd@kuhls.net> (Bernd Kuhls's message
 of "Fri, 26 Jun 2026 23:09:49 +0200")
References: <20260626210949.741890-1-bernd@kuhls.net>
Date: Wed, 01 Jul 2026 21:58:47 +0200
Message-ID: <87zf0aqy6g.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=VY95fRAWaNBZ00RMoa4GkQGMY+Jeb3yUOKArz8SL7FpfmZWk0wtSeAyCZrzD/gkOIIf9SOO1axTnlSZbm/d3HGVYRI7C1+V2Hx9P3aRjAHK4iyz2sklLYw9KmE+h7ye1RSsNtXQpbcb75O77kHyesIZxy8nQgYZ6gBZKJSyHG4rtWqAnbL2ohs2gQSJj6V0z2gadf+TqrUSlsqFrLXursA37vNsm3K4IpCGXfLUynzEFvCYybU85mzwcKscUopbe5JsxbzMSYhWiIZyV8cvW/pJdG740hIwpKZb80cULZH+f+5O4N7RRQju8Kac93R5w1l4ff38Hi807GpTpYxZmcw==;
 s=purelymail3; d=purelymail.com; v=1;
 bh=Yreo4Mv5MLZJ986lU51mIuzvk66BGQKdP6fiF7+rtpo=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail3 header.b=VY95fRAW
Subject: Re: [Buildroot] [PATCH 1/1] package/tor: security bump version to
 0.4.9.11
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

>>>>> "Bernd" == Bernd Kuhls <bernd@kuhls.net> writes:

 > https://gitlab.torproject.org/tpo/core/tor/-/blob/tor-0.4.9.11/ReleaseNotes
 > Fixes TROVE-2026-025 & TROVE-2026-026.

 > Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
 > ---
 > Gitlab pipelines passed:
 > https://gitlab.com/bkuhls/buildroot/-/commits/6a475e9b6283e763f8af481dbe43a9f86d389ed2

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
