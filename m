Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B9B4CA1013
	for <buildroot@archiver.kernel.org>; Fri,  5 Sep 2025 11:23:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 226C740BB3;
	Fri,  5 Sep 2025 11:23:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FP_bPE1qb_Jl; Fri,  5 Sep 2025 11:23:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3FC9C40BAB
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3FC9C40BAB;
	Fri,  5 Sep 2025 11:23:18 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 81AC2111
 for <buildroot@buildroot.org>; Fri,  5 Sep 2025 11:23:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 60A68405E4
 for <buildroot@buildroot.org>; Fri,  5 Sep 2025 11:23:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rhTHE84MthUx for <buildroot@buildroot.org>;
 Fri,  5 Sep 2025 11:23:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org B8CEA40263
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B8CEA40263
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B8CEA40263
 for <buildroot@buildroot.org>; Fri,  5 Sep 2025 11:23:14 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -61602557
 for <buildroot@buildroot.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Fri, 05 Sep 2025 11:23:11 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1uuUX8-004Aga-1q
 for buildroot@buildroot.org; Fri, 05 Sep 2025 13:23:10 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
References: <20250904201630.774094-1-peter@korsgaard.com>
Date: Fri, 05 Sep 2025 13:23:10 +0200
In-Reply-To: <20250904201630.774094-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Thu, 4 Sep 2025 22:16:29 +0200")
Message-ID: <87cy85i1nl.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=unmK4t9JBdRGC8gNqwtAHvSOO6UH01FZquYiwThpGFH8iWZkvcw9gdI2mfUlioSuZnMCNOaffdY9tdydQ/foHtHkxQUx4DSOKdsWDa51xgK5bu1X29jbpGPVlHlY6nurnT72Xeln+xvQgnAo5enjSK9Hs3q5RzqYl/pHRvsBIAudkcd9hayigYW8hucOpBNpNoY87E7ZyzSjOnYBeLb9fRsx3s/jI0eHfeteiusqVuWPEo6BI2fUgCIxu65t8GO9fLQirWtvzQYc99OokG7rqOG38J52MeKJo+np7u6ub11OYT82lajqSuTHm30QOSbn5bzXQ5e+3bI5hR51VDghmA==;
 s=purelymail2; d=purelymail.com; v=1;
 bh=yMsZ9BMMf3gQLLWYmpRsSVv67FPTDGDUCzqe4C0EhmM=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail2 header.b=unmK4t9J
Subject: Re: [Buildroot] [PATCH] package/sslh: add upstream patch to fix
 build w/ gcc-15
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

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Add an upstream patch to fix a build issue related to struct
 > sockaddr_storage:

 > udp-listener.c: In function 'cnx_cmp':
 > udp-listener.c:39:30: error: initialization of 'struct sockaddr *'
 > from incompatible pointer type 'struct sockaddr_storage *'
 > [-Wincompatible-pointer-types]
 >    39 |     struct sockaddr* addr1 = &cnx1->client_addr;
 >       |                              ^
 > udp-listener.c:42:30: error: initialization of 'struct sockaddr *'
 > from incompatible pointer type 'struct sockaddr_storage *'
 > [-Wincompatible-pointer-types]
 >    42 |     struct sockaddr* addr2 = &cnx2->client_addr;
 >       |                              ^
 > udp-listener.c: In function 'hash_make_key':
 > udp-listener.c:55:29: error: initialization of 'struct sockaddr *'
 > from incompatible pointer type 'struct sockaddr_storage *'
 > [-Wincompatible-pointer-types]
 >    55 |     struct sockaddr* addr = &new->client_addr;
 >       |                             ^
 > udp-listener.c: In function 'udp_s2c_forward':
 > udp-listener.c:330:18: error: passing argument 5 of 'sendto' from incompatible pointer type [-Wincompatible-pointer-types]
 >   330 |                  &cnx->client_addr, cnx->addrlen);
 >       |                  ^~~~~~~~~~~~~~~~~
 >       |                  |
 >       |                  struct sockaddr_storage *

 > Fixes:

 >   https://autobuild.buildroot.net/results/0cbbb75c4aab19b9d5f42695359ac6fe97e5989b/

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
