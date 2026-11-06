Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30620606A326
	for <buildroot@archiver.kernel.org>; Fri,  6 Nov 2026 21:19:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=E8HH9dUY
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 114C160D57;
	Fri,  6 Nov 2026 21:19:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id k6jNCpV6QqKo; Fri,  6 Nov 2026 21:19:09 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 5EECB60D58
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793999949;
	b=pvDeaBfFVxM7ftr5+6ihlaqjsFtO4VNSd7YpRCbckPRwVbuUUVkU8UEJAyPum1SIkpE1
	 FcUCVx9xpl6GuQco74GCACz6OAIOFg5/9LuMzUfiYFzphxjidUmyq6yA4hsOE9jEx3Hk9
	 nZ6zkBQ6DgdTZ5IgYmMMF0cy3X9ijtLmQL9BY3lIBIic8pIXiywaj42xYNqqucYmCzefm
	 O9YjHFAhkHaGtclukmdz6veOppRjd/4fdfuoo9jLfrEVt8J0sDiIsMm0ACqFbc1Kz9S80
	 EGMAact/CrOoN3Ok8X34LfDOfdwFmtk2pWwP2VIyq6ZHrZDs8aEb3zumgyOYZ7/8U9A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793999949;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=u+S2SpFsblCQRyjhcbz1tasU8kVLtQftqcpCPlGPfHM=;
	b=oL/INHpWeLjXMuNZozlBL+tXti7mQuZRIXUQvuuj/558zA2HtLa0IXmHZzhEqObMbxht
	 lKn77738SfTET7IxPlMgLulIogdEnmPADmr5M+NOtATeuHYD/sEYm2o3j36orCo3ykZyl
	 o0pI66FarFa8iW78Kko1BCR2mUpQ/SCeimYHyQm38612g1FaiMMrx0VaQrWK6cf5BV9qe
	 FE70T4WSNkYd6AzFYG1SZ9mYmGI4OsLzFyckauLHuh+DmDsjIuYCHExxrGsAUDoM/DDMf
	 83nbiTjecjsPYkelN/p34HhnkoM2x2EpVx1fdfnaa2CFCscNTh4HeQYPIQ9c5UR8p2Q==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793999949;
	bh=u+S2SpFsblCQRyjhcbz1tasU8kVLtQftqcpCPlGPfHM=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=E8HH9dUYwfoCjk9Lof5B1tEVLkEyGzQYW7mcxdlo/c3ylCDg6/IjCcemckEe/1M/v
	 3e5J7kt0k2MZexCx6vLctZoYeALEBR5UG5fCYNku+i1ZI61uNbJDp4Ub9hrLlQuC4M
	 lW5saXgPMR1zKLXq/FA2bt4u4UZqrZNVMAdzJnG/bL4wIcNbeYSFruVDPiCPHUbye0
	 I06Qte7zd+10CZXxWlB9xMuq4a0e/XCUYTJ1ptPFcAX+AlIkPJEHVeBZXodMm64oqK
	 t+9aCCeLDA6QH0lrzTx6Gc3Pjueb2ZUbL5e/cY6bkLrRZtPd+3yS9BEaSMDbPx7AHL
	 O3DirvYbRbZew==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5EECB60D58;
	Fri,  6 Nov 2026 21:19:09 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id D476C31F
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 21:19:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BA4D3403FE
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 21:19:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QQxQcipx-zdO for <buildroot@buildroot.org>;
 Fri,  6 Nov 2026 21:19:07 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org EEE1D400A2
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EEE1D400A2
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 21:19:06 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.4])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id BECC8B0054E;
 Fri,  6 Nov 2026 22:19:02 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 via
 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr with HTTP (HTTP/1.0
 POST); Fri, 06 Nov 2026 22:19:02 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Fri, 06 Nov 2026 22:19:02 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org, Philippe Proulx <eeppeliteloop@gmail.com>
In-Reply-To: <20261106191536.2120153-15-james.hilliard1@gmail.com>
References: <20261106191536.2120153-15-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.20
Message-ID: <446164c6d25d084109560c11823106f2@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH] package/python-ipython: bump to version
 9.18.1
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-11.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 06/11/2026 20:14, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
