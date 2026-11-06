Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B215D606A326
	for <buildroot@archiver.kernel.org>; Fri,  6 Nov 2026 21:18:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=K1mP0wXR
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8D374812A9;
	Fri,  6 Nov 2026 21:18:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9EXQOmPtGXkv; Fri,  6 Nov 2026 21:18:54 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org CC12D8162E
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793999933;
	b=U7VDzOmqI4zsOSGvyY/+0HQaofNvO0wufWmBi0hIcw1nBwVrfmw2s4/3cRXM3WpbtQ+o
	 YE6jmiO6Bi7Pr2KqGTQawsb1Rq6eshipO+gTzpt1C0BbM4w/AdVpwuWzJfvZk9qw7rTVJ
	 6VAkrR4bppRdCZayz7Qm2GCd9QOtlp/rhDWiYGubHR/cw7zLLSTZIe0blm4LiEDqiJ0Os
	 boqS1dEgrKrZromqYW0QXY5x8gIbAJUB3U5R4etghmDspgT6o+E5XkAXEfJ1Xm2IsoN50
	 CWM64PGB1kkUlhmJ0+ZBBpfJnD48xH9/mstJH0QC85e5r1Htb3NY29iOZ9FZAEv148w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793999933;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=u+S2SpFsblCQRyjhcbz1tasU8kVLtQftqcpCPlGPfHM=;
	b=CwL2qaJHB3pizXIe8ylBUPQ/FzpHu3Cq7dqdX+ZWWYFqJXYSiZ5Navy6lnc7JCiPYkla
	 kEYmalXOSdT0WsTy0DmkC2iIG6KukKgNiVsyd7i7n+9AL6XLM7G/hrnktytfxAxKAS3Jk
	 5J7o0DHy6wfJtQsr/whti21AteLnuU7A2IzU3SjlQeK8uURrzLhsb+6eipBWNwFX14YYW
	 lK1TuVBH8S/lqU1jp7wJEvYzRCY8zVLLpUkSn/K5lP/MNq0VupqRKjDXJG2rV6YTbtxb2
	 ZLVnrW1mTT/2uElgOkNS09wUb+ae3u16Q1QOTAMrDbpRCvnv8ANECb/hWaEwRgvDEtA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793999933;
	bh=u+S2SpFsblCQRyjhcbz1tasU8kVLtQftqcpCPlGPfHM=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=K1mP0wXRmwQRKZ6MWrvuuOPyplmBCOhjgNnIy5epBs/czO2mLxxaWXWOVkc2viDsS
	 4oReGViPU3IsK8WeJm4XHIpK0eQaoC70h8mHqr4DzBLoyVLBCqoTcRhtAvNr29wLSt
	 3Gl8/xN9/t9DCvLRzSA0ha6syE0pqWrkU+yACAaORDEk4Uy7O01Wws8d7oFEXzJhsT
	 IjzMBkL+PcH0NAqjhFWLLS0CMTeAIBMbxaupoZEuZ9avVB9YX20WQ1gP0B4K2y41dC
	 oTLzwgcTD+jUydNDavReUcAKZugizMVyUzWkDx1v74p1GCsH+PYVuT9FQzZw9PaAk3
	 H0yAb9tMJ2mdA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id CC12D8162E;
	Fri,  6 Nov 2026 21:18:53 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 5F341235
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 21:18:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 450404094D
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 21:18:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3tcMOowwJDsB for <buildroot@buildroot.org>;
 Fri,  6 Nov 2026 21:18:51 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 70E9140907
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::15;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 70E9140907
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 21:18:51 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 2DE4C780316;
 Fri,  6 Nov 2026 22:18:47 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 via
 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr with HTTP (HTTP/1.0
 POST); Fri, 06 Nov 2026 22:18:47 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Fri, 06 Nov 2026 22:18:47 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org, Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>
In-Reply-To: <20261106191536.2120153-14-james.hilliard1@gmail.com>
References: <20261106191536.2120153-14-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.20
Message-ID: <65c4d6e24ea45f10a4b8bbc4aa32c53e@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH] package/python-iniparse: bump to version
 0.5.3
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
	MAILING_LIST_MULTI,SPF_HELO_PASS autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 06/11/2026 20:14, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
