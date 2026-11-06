Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9521E606A326
	for <buildroot@archiver.kernel.org>; Fri,  6 Nov 2026 21:22:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=Z0DcRIvr
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6EFBF816A3;
	Fri,  6 Nov 2026 21:22:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wDruR5J067lr; Fri,  6 Nov 2026 21:22:54 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org B9479816D5
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794000174;
	b=J75tCBlfCiO6/YXxAreeAIdA7OdWoVA4k9d2AmZpFJ43wgBgiiUq2CoaHeGNv0ZUAMs+
	 d+HFZPqx0As+b6qVawIW3OBMFLcsSedycvBu4+RTeBtT2uL1Oc0luAeOthgSlu9pC4BfH
	 tnME0aZ3YhVw19pEjRRv7WPOVUR9itzHbfSLC7FAZL30tzVPqdN3RO9cB9yiwIRuGP9Hw
	 7ZqP1/aCyC/I2Ww8Er32ttarokkXC1uU84/4c+VsvOhLFvtF3BblSJY1WWMwDN2emVlOD
	 nrFUQd0lUDKe+tESDYNmV3By8xKstENLTawzGQxrF++SK7nk8i44U3i6KBBS504+hAA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794000174;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=u+S2SpFsblCQRyjhcbz1tasU8kVLtQftqcpCPlGPfHM=;
	b=obYF7IgunPKtjnioOVcj6T7FCjs3wSq+gU14oWJrvpiBq3y/fn0+NsyXHVRz3IuZ8oe7
	 Oe6gQxtudyonNs/zFONOmFseVFisxCO+F/Pmq5nQQzs1P91jGJ2bKuKElQc0yXDNUoF8N
	 kCGhijmJl/vv5ZQsDrSLPCFLQjfaTcIn6A0yGykrN+IH9mR9to7kR/VmIPCeU0w0CWYoG
	 VyWpuOC6cw31slzJxVREfqrgdO5yohnKiGPKUMo7EwFXzt80EduoVbuXNw69tVOtolZMG
	 FTGESPkLxh0GLz61LEThFS2Qwm2AeE9QAehAlGhRQxCbxXsKFE64PUYpgMr7KX4FadQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794000174;
	bh=u+S2SpFsblCQRyjhcbz1tasU8kVLtQftqcpCPlGPfHM=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Z0DcRIvr5rOhGEEM2qpKBnDr+KMzltafCGNlfG1XhFjWSihrNmvfM9VAIfKMlQvhP
	 0NFuUOThgSc9/q4N5iS34/VjbWOkU+gljdvG7cJH0usn/5uDHbO31tKyzXkLKeZqBI
	 p568/Idfzx2vIfCqlLkVqaMEYliIX4pcCiNRXku+Qsfm4KGm8waG/HEgDNBASoyVCZ
	 Kt/p/Qm2JGkvnheWZwcGsL5SvAm9Vp/oAGNTNyrI+qkqU6kL3aDuBQCJbmenYB1Za1
	 NXncde2PfxTtScL4JNPcU20MhPog/ksrkHDyq+E1rSXN1m7uopXnzoCbqS0o17iPyD
	 j7UDNiedNu+zQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B9479816D5;
	Fri,  6 Nov 2026 21:22:54 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 22A66235
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 21:22:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 14743403FE
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 21:22:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id a2_Gd9Eiqu93 for <buildroot@buildroot.org>;
 Fri,  6 Nov 2026 21:22:52 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 6D45D400A2
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6D45D400A2
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 21:22:52 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 1A55C19F593;
 Fri,  6 Nov 2026 22:22:49 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 via
 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr with HTTP (HTTP/1.0
 POST); Fri, 06 Nov 2026 22:22:49 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Fri, 06 Nov 2026 22:22:49 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20261106191536.2120153-31-james.hilliard1@gmail.com>
References: <20261106191536.2120153-31-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.20
Message-ID: <99e0e8556e203b71d09d0c9940bda101@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH] package/python-types-setuptools: bump to
 version 84.2.0.20261104
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
