Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A83E1D2CE17
	for <buildroot@archiver.kernel.org>; Sun,  7 Dec 2025 17:03:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7F03740271;
	Sun,  7 Dec 2025 17:03:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3whv4xnWnDt0; Sun,  7 Dec 2025 17:03:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AF694402C0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765127034;
	bh=fsaPCC6FTwzP/153iulzjk8zzAk+Q3djKJXaIUPidI8=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=m4uos2sVs+cwhkPDfErMOM5Ki6jhMvyaiSAw2/lxmj2Icvdde8dZx7OoHInNgCFIo
	 Sjmha34Yn/zIekwTW9CcJAa3Iqznfp9EyTmt452Jm8UixRY/9oDDccVJiysNXyGsDQ
	 Gml/y5Rks8hpHqZ7qKA2q378ldcM2cxdQ6hYfnSYW6Zz2ixLi/dDBLwtr32QE8rTHz
	 RkG0a2h2em4KrNQNVmFEZS5+64u2b7zvgnEe+voU2RbeesGcCotFd4MxTU4ORRN4D3
	 4Bm0tm28zdc8R8loKF2aY10EaE6QRATFvRvPKObUG3VU+heqZmeqbGF7hKcJGucwji
	 PmrSgeNsmk0cQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id AF694402C0;
	Sun,  7 Dec 2025 17:03:54 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id AE324E7
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 17:03:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A02F440423
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 17:03:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VD6vRiwRl2Co for <buildroot@buildroot.org>;
 Sun,  7 Dec 2025 17:03:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 89A6E40416
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 89A6E40416
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 89A6E40416
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 17:03:52 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 1374912790; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Sun, 07 Dec 2025 17:03:44 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1vSIAg-00000004ZOu-2htJ;
 Sun, 07 Dec 2025 18:03:42 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org,  Christian Stewart <christian@aperture.us>
In-Reply-To: <20251206214229.2306995-1-bernd@kuhls.net> (Bernd Kuhls's message
 of "Sat, 6 Dec 2025 22:42:29 +0100")
References: <20251206214229.2306995-1-bernd@kuhls.net>
Date: Sun, 07 Dec 2025 18:03:42 +0100
Message-ID: <87fr9m9qc1.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=rVmX94zZkcwX2ZHaA97vo7qESrVv+bCOittapVqk13UF5ayuHPVVUYrjpnZLcDyuUenJR2OE5dXgcn5PfxcD5w7P7pAg3b2ejvRdy/3gLnfcUjCcZKdt9Uysv+sFtoy1vP1Diz2iAVCkn4Z+lmhgKysubEGztiwbpOkVU1WnKHlWhkSk+VM/86/Ys2IqxZ+ZxzmRHw5wDPfC2V1zXirIK/3nKtvCHJumI0FDUhPK3+ni1qllS4LRVqaV7ZmLMdXmk47lpPlQQsZ7zQCuLy821pDXPF7WE+Pd65zPJXfc0zx+wmcBcUEO3FKHZztDfYnIAuEnjpCZwcxDSyFAPzAeXw==;
 s=purelymail3; d=purelymail.com; v=1;
 bh=W5d70kPoHhaSoJLQ4sxG1qm0TFiNyAELYahtTDLKWKA=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail3 header.b=rVmX94zZ
Subject: Re: [Buildroot] [PATCH 1/1] package/mosh: update SITE
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

 > Old URL returns 404, update SITE according to https://mosh.org/
 > Fixes:
 > https://autobuild.buildroot.net/results/c1c/c1cf4568c82deb118aad0171bda356c7f59f17dd/

 > Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
