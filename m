Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BDD9606A330
	for <buildroot@archiver.kernel.org>; Sat, 21 Nov 2026 15:10:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=WciPrmmf;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=purelymail.com header.i=@purelymail.com header.a=rsa-sha256 header.s=purelymail2 header.b=HD+wUHW+
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 388B96063F;
	Sat, 21 Nov 2026 15:10:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Vi615dXBq26O; Sat, 21 Nov 2026 15:10:54 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 4C2736062C
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795273854;
	b=L2Mc/iYZMSgtWoaQmVyflgrxI/ZUTfKU1qu8orOFjNsyb43OZ3d5tiHPIWXMm9x22sUb
	 Q245vTZ340/vK36+bakJbfC0yMqhftOCkUrilzGi4w6FjReq0QHEZCwv3/2yQ0/7Tnl63
	 0dm81AXHQuohNbds2XDrnPfAaY28LwECUIfZjynfmuVrW40B+CF1kRVSGGVBZ0EDUsYIB
	 mTiATsIaMUhTYj+gs82zdHYqa+ofVApcnx6E2oXhv4mbi/Fa5C81xWrVOr8Owi3cXKjXc
	 7PMbZFcgquiZj6KeCWYCPuvT8f+ink2vPnML1Zq9gJYEhi0AIMvssJAPE7deVLqxbDg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795273854;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Feedback-ID:X-Pm-Original-To:Received:Received:From:To:
	 Cc:In-Reply-To:References:Date:Message-ID:User-Agent:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=olNNKDkPLpX5xw8Dlg/ClWLypFuKcySkbxidynumGWE=;
	b=dH1+dA+euLdR8UGBxHHND1mYIaUc9lOIaIiNHkO7zvShrUxEoWj9r4VtdBjAROKa/js3
	 JZfF2opbxP+d9QbBaeBOeS7nR4jKyAPVd4c1NLWtLtJPuNnWzzo3punaVwHdzRcVD3/Fq
	 vpYGPbXTeNYCPt+tgRXELsud0RZBi1EudbodfZKuT2UMEO3LS9KidHr0sVpkTQ6N7/iR4
	 872qT74+Z1ejpe/NNC0w7MJaT4emYR1fjCz7Tj1ssmrHfdvgQK0RfEuua2FQs9/5iAOrh
	 Ih8eSqUcmf2BNkDpNlMM1Dpr9rL+CS+1fbThJ9PypayOPW4QJiVlw19S1I4/CB7Eb+A==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	dmarc=none header.from=korsgaard.com;
	dkim=pass header.d=purelymail.com header.i=@purelymail.com header.a=rsa-sha256 header.s=purelymail2 header.b=HD+wUHW+;
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795273854;
	bh=olNNKDkPLpX5xw8Dlg/ClWLypFuKcySkbxidynumGWE=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WciPrmmfltj68a2vtVm/oQWLcD4MYMmYHtqz9YGcF/Vl88Hs7C87MEBLHyz6ce9t1
	 Hlr7rndAA4LrCmWmfldWKDHjNmLwxvzRt0feqABgB5QcoDz9eiKi6HulF8724+eDkD
	 o8Q/xlqxjgHmN9AF6e1Q0cM3UqB5zxlfzlgZTF7vl1e8ZHT2MNH8yW8IkgWmGkJjlP
	 g1n83UK0V01pVMof8Brv52khA/9X7Uhuf15MTQ+SMojZXT45vsHu9AzFSAXJnxCeSa
	 AD46CMWjSFe5DS6QHWPpsh0frUcB/+kk42CQ619pv2nsWM1/SY+vei21HsteBAMwoR
	 pexMeGNCF7hQg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4C2736062C;
	Sat, 21 Nov 2026 15:10:54 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 9C4A53A8
 for <buildroot@buildroot.org>; Sat, 21 Nov 2026 15:10:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9967A6062C
 for <buildroot@buildroot.org>; Sat, 21 Nov 2026 15:10:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ihToWK3ZtjTb for <buildroot@buildroot.org>;
 Sat, 21 Nov 2026 15:10:51 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 2992D6061F
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip=34.202.193.197
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: smtp3.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail2 header.b=HD+wUHW+
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2992D6061F
 for <buildroot@buildroot.org>; Sat, 21 Nov 2026 15:10:49 +0000 (UTC)
DKIM-Signature: a=rsa-sha256;
 b=HD+wUHW+jZK4/ycBEyeTUkmizpMZASLhY4oSsWWFm/Bs/4txNMsAnOgSrd3gTUuAPmTsGEL9Rr9p5tPEwsVky/KILgZc+V7EXKMu24eyPBSYNM8Xux+Bju0Avnr7mIGYWV4uR3+JupCZZUCJ4G0KE2uAda9TzxXFHbpjGHN6SIOOD0YDepTsLn9h38uUK9skmR6HgCISkuGvcFLGZBIuSxG6dZ3kLEJHcYa5LysiRFy85e5k7iJ/kxToy+a7eFRz+3F+mIZmOBEYdGh6ffnbjDpxBZDAqy3CRinNB7vnrejJYs1TEnqA0XqlK3hAuyTgZw5kP3mzzU39PnTkLub5VA==;
 s=purelymail2; d=purelymail.com; v=1;
 bh=BJoXdR8hi3mbOpyjiQHAuCCvDhXK/OZvp3+5IavCIQ8=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date:Message-ID; 
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Authentication-Results: purelymail.com; auth=pass
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -333247815; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Sat, 21 Nov 2026 15:10:47 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1xUmjl-000000052aY-3sEN;
 Sat, 21 Nov 2026 16:10:45 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Fiona Klute via buildroot <buildroot@buildroot.org>
Cc: Fiona Klute <fiona.klute@gmx.de>
In-Reply-To: <20261121133437.915224-1-fiona.klute@gmx.de> (Fiona Klute via
 buildroot's message of "Sat, 21 Nov 2026 14:34:37 +0100")
References: <20261121133437.915224-1-fiona.klute@gmx.de>
Date: Sat, 21 Nov 2026 16:10:45 +0100
Message-ID: <871p8ete2y.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/uboot-tools: fix download URL
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
	SPF_HELO_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

>>>>> "Fiona" == Fiona Klute via buildroot <buildroot@buildroot.org> writes:

 > U-Boot downloads moved to git.u-boot-project.org a while ago (see
 > 747aa911f6a471558a5fb2a9e1b133d13104cae8 "boot/uboot: bump to version
 > 2026.10"), and since early November ftp.denx.de is no longer
 > responding. Update the site URL for package/uboot-tools to match
 > boot/uboot.

 > Fixes: https://autobuild.buildroot.org/results/813/81326375b92b75936e02b5dadea5729811ecda98/
 > Fixes: https://autobuild.buildroot.org/results/db1/db198283e319a4cb997c1567180290a79663e3ad/
 > (and many more)

 > Signed-off-by: Fiona Klute <fiona.klute@gmx.de>

Committed, thanks.

I took the liberty to also update the URL in the help text to match,
even though the old URL so far redirects to it.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
