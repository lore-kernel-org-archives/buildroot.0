Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7854606A31C
	for <buildroot@archiver.kernel.org>; Thu, 26 Nov 2026 15:51:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=S9IbQVZj;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=purelymail.com header.i=@purelymail.com header.a=rsa-sha256 header.s=purelymail3 header.b=eEu9Mr0f
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A23B6408EA;
	Thu, 26 Nov 2026 15:51:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SXN_SFpToT7y; Thu, 26 Nov 2026 15:51:37 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 7B881408CD
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795708297;
	b=rHMMCnGEh74fpYCKc1oXCeeDeIwKxPTvJVlEXoQFfnY5YKOxMUb+YeFh/Z/pCSsAL0pC
	 KHqH6MlOZQZnjJ/Vl3KOcs+HIn37ASKSwGuVHsGX8bSqiAg6cM09UOJwhlTtr92MXYq0c
	 7PPZgof+SuPacd4pOqdhKuf6zfKv354wi8qje/UVMiH5PLMJG5centEDETpoiDODs+Tj7
	 Wo9WBhCFGIrC56qLd8a2LMD0ay3MLvDgiVJ0oRYc5Q7mXxooBf1P6D3ocMm+l92Uc6qx3
	 ijP7B9cNQ9S2yyEhIMsk9X5/wNw/RHaAd3G3EEPrxRJkROFKxpryK+Xs0WTz4S9L8+A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795708297;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Feedback-ID:X-Pm-Original-To:Received:Received:From:To:
	 Cc:In-Reply-To:References:Date:Message-ID:User-Agent:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=KZMttuDWxasn+8x7f6kAmSdiyTvnH2tRvHrIyDkQ6Og=;
	b=tVAzI85SXl0zPPjrdB4558Eqk7JpsYpZ+ab02suYyZYI9+fbchmCSFiK5VHQvLqTZDCN
	 AzS9PQVZ3pnejOz9WnRmCg1lKze8vmxN7vEWRZIgteYwpNWjv90ZJq0NuEDx2JK1Ew4l9
	 dkSozPncsQLdcnMxBuB8k9yO+b/16DNml3NW9grg3ye5aSR+qDerUmjMnDKW1zZxuyPkN
	 1q9XtVmwMiisC3UHdX4N0/Rx46+xKnkKh0La+FqE9Q0ftPynd3Vuwc3xGa5xadwZ6/fEy
	 TRsD4PRvwSaxWEe8QQnUZBh6URcipCc3d495fKYjvKO2E+Oah25SAVKGdgMqE2Fk2yw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795708297;
	bh=KZMttuDWxasn+8x7f6kAmSdiyTvnH2tRvHrIyDkQ6Og=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=S9IbQVZjQqMgttJREZOfkmlFN0o97lnTCnWeUBn6BtCA/7Kq1prbvXSqKYRd+TwJh
	 XUdnXovGXEiVw/szX5V2/vq2bVE8QOdSfOJkGAeXsuzB/papCeuYFB9r2qpAfqbfuN
	 vcflnVsAl04Nv/fSJlmVCdcH+R1ARwD9cQscPdxz9JU1PZDkrK0l405a1NrUtfdVjp
	 ibAXo/T35wRMfCxJlNQ/5ZpqMgfr/noL0drRzPe6j9pzPtRVuZQkmzLeMxKwmZQW8k
	 hSnWlumPUTCCblo3bvPoa+15RJ4Orv4rkFW3+0AV0LREDG9IeHE3198CF6H510IC2M
	 HL1paHThmR3ww==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7B881408CD;
	Thu, 26 Nov 2026 15:51:37 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id B347010B
 for <buildroot@buildroot.org>; Thu, 26 Nov 2026 15:51:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 994EA60A55
 for <buildroot@buildroot.org>; Thu, 26 Nov 2026 15:51:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HrTiRImgF0P9 for <buildroot@buildroot.org>;
 Thu, 26 Nov 2026 15:51:34 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 9D09E60A3C
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip=34.202.193.197
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: smtp3.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail3 header.b=eEu9Mr0f
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9D09E60A3C
 for <buildroot@buildroot.org>; Thu, 26 Nov 2026 15:51:33 +0000 (UTC)
DKIM-Signature: a=rsa-sha256;
 b=eEu9Mr0fbVJQnGlrMuI/Lfctqy9dgJhY4bpEssP+M8Wp4k58PQtsgnjJWuAxc/RrV4+p34dzqUhCeL9ADqzHWf/ZpMOEkLdWpVfxueJqvLZnlAUoXKgyovA/WJOoVP2z/V77mn1zOpTcpL3bwRq+hRrCUhXPq9oPd/ZoNoRfqiON2vBMs0XNAeOyrUzmdNfPsAl2RC2IVnHHZj0hlTshmE4fDUjxUgVrManf1+yLHyINxdk1yfrhpq8SKXBh0sohIwSGLn3c7EXTZIhcoWgXBpOcg1mZbJojZ+nDcpyk0dcPdTuWUDcL63i4XNAXNsqnULhElhowGivqVnXXzhCZ8g==;
 s=purelymail3; d=purelymail.com; v=1;
 bh=MkHP875GUmW5dTrxTmsGn4ufX6yXG++U+yEDr5AjKBQ=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date:Message-ID; 
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Authentication-Results: purelymail.com; auth=pass
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 1479653331; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 26 Nov 2026 15:51:27 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1xWbks-0000000Bpzm-02tT;
 Thu, 26 Nov 2026 16:51:26 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Cc: Marcus Hoffmann <buildroot@bubu1.eu>
In-Reply-To: <20261126104311.1514091-1-buildroot@bubu1.eu> (Marcus Hoffmann
 via buildroot's message of "Thu, 26 Nov 2026 11:43:10 +0100")
References: <20261126104311.1514091-1-buildroot@bubu1.eu>
Date: Thu, 26 Nov 2026 16:51:25 +0100
Message-ID: <87ld6fpp4y.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/gnutls: security bump to version
 3.8.14
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-15.4 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_PASS,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

>>>>> "Marcus" == Marcus Hoffmann via buildroot <buildroot@buildroot.org> writes:

 > Fixes the following CVEs:
 > ** libgnutls: Fix crash on certificate list memory allocation failure
 >    On allocation failure, the certificate list pointer and count could
 >    get out of sync, causing a NULL deref or double-free during session cleanup.
 >    Both fields are now zeroized before the allocation.
 >    Reported by Joshua Rogers of AISLE Research Team.
 >    [GNUTLS-SA-2026-11-18-1, severity: low] [CVE-2026-127039]

 > ** libgnutls: Fix crash in RSA-PSK username copy memory allocation failure
 >    A missing return on a failed username copy could crash the handshake
 >    when memory allocation fails.
 >    The error is now propagated, aborting the handshake.
 >    Reported by Joshua Rogers of AISLE Research Team.
 >    [GNUTLS-SA-2026-11-18-2, severity: low] [CVE-2026-127040]

 > ** libgnutls: Make name constraints deinitialization idempotent
 >    If reinitializing the name constraints were to fail due to memory pressure,
 >    the verification context cleanup
 >    could have freed the same internal lists a second time,
 >    crashing the application.
 >    The deinitialization functions now clear the pointers after freeing.
 >    Reported by Xuqing Yang.
 >    [GNUTLS-SA-2026-11-18-3, severity: low] [CVE-2026-127231]

 > Full release Notes:
 > https://gitlab.com/gnutls/gnutls/-/blob/3.8.14/NEWS#L8

 > Backport an upstream submitted patch[1] to fix the build with nothreads
 > toolchains which was introduced in 3.8.14.

 > [1] https://gitlab.com/gnutls/gnutls/-/merge_requests/2192

 > Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
