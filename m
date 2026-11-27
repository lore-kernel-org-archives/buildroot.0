Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2FC9606A321
	for <buildroot@archiver.kernel.org>; Fri, 27 Nov 2026 01:05:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=axDBfIO4
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4959760A68;
	Fri, 27 Nov 2026 01:05:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id I2Rkx8Y41vZu; Fri, 27 Nov 2026 01:05:00 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 3A94A608F5
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795741500;
	b=ffELXbqhFdjJfArnuLEKJ9SyrZvoC9ct6GCLothRh/m7W4QUB/lPE8h0wPb8rSf3snNF
	 sgcMceoC/+4LvDuXMUzz5Jr0y4mNLbFGdtDlGEMwDO0upCz2wfek1ABFdKeV6+jMUg0R1
	 M2+UYSofLgb6hnw48T9aMybr1e/QoGLBE8FuwG3KESTBr0iI3kLnS11zEvQzn99GJQhLw
	 BUurPzHiFb9fsgcoErxWFTci5y5F0UFQsmo3E3kKUNmrCGb1WaW9ICrFUmXnPTRn9EE5k
	 sQXgzgndLMFOpHcPef94P8w4KLat+Q+3xxoA+4ELAPSFpx8668SgZDFHyfngalCoUFw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795741500;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:To:References:
	 Content-Language:In-Reply-To:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=kBIB4SzhKiouibNgKeNqQXHQfZKNVUG5VsTbpHZHzCk=;
	b=NuhFtIBb8dK96ovfxQ62lkWz9OAc4Ald9xWwL2oyYm74Z6Nlsz30fYVKiP3NilF2hFLd
	 0Y011+QbO2yrZ7uWyCsKxY6EfLBYL7oVUcYCmvmPFbPPdYUOyNfh2tozmJ8p30eg+Rpcl
	 6ntxC4t/sO0Eba+6mkSZ4/xWveRoehmoeW3RZSeHCfKBt9NLYws2Lk5XMLVcrV/dLZM1V
	 AXSTygSx0iJODXmA75tQILPbiFNZDFgHvMuBJ0f0cWuniOX8Yf1ADfptOg1Z8ZWDmQT45
	 RBHc/xKgYEd6IARvWvyt8NrKFP6MQn5MrGyut3M1X6TB5lrVman/dPFx69dW4GeWlRw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795741500;
	bh=kBIB4SzhKiouibNgKeNqQXHQfZKNVUG5VsTbpHZHzCk=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=axDBfIO4v5f7/Vdjdy8C+VxZ1MVDgXOnI5qoJ1G4ElzzpyP/1+uDNTUHjfUZKyMS7
	 vdk3yZ5vLRw26T2ApQ+Klil7sN/8xlpdAr6fBevbTalUSF03KTwBwN+TA0YaNXiHZp
	 gkNAf6gHhSNPjlIo6cFP5B4RuFg4WIWj94F6HiL9q3WpOpPPf8fH6pi2uyPPspEC7k
	 pQALbXY4TtTMmPNbN2p1i1uunBA9wlQcl4NqoD+7/RlFXkjjsHdyOpFzN04pRI081Y
	 PsDcsxSNpYIVjLNJVKMtHdldKLHKBgc2XQTMNQ/55v4UtqEnUD22Y279E3izT+0U8M
	 ePIWR2powTV0w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3A94A608F5;
	Fri, 27 Nov 2026 01:05:00 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id DC249260
 for <buildroot@buildroot.org>; Fri, 27 Nov 2026 01:04:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CDC37608F5
 for <buildroot@buildroot.org>; Fri, 27 Nov 2026 01:04:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 51c-Q15wQpUv for <buildroot@buildroot.org>;
 Fri, 27 Nov 2026 01:04:57 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 67C1F60642
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 67C1F60642
 for <buildroot@buildroot.org>; Fri, 27 Nov 2026 01:04:56 +0000 (UTC)
Received: from [192.168.178.20] (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id 5ECDC2C8340C;
 Fri, 27 Nov 2026 02:04:54 +0100 (CET)
Message-ID: <c426ce46-fa70-4a73-a2c7-893621241258@bubu1.eu>
Date: Fri, 27 Nov 2026 02:04:53 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Fiona Klute <fiona.klute@gmx.de>, buildroot@buildroot.org
References: <20261105132521.3787872-1-fiona.klute@gmx.de>
Content-Language: en-US
In-Reply-To: <20261105132521.3787872-1-fiona.klute@gmx.de>
Subject: Re: [Buildroot] [PATCH v2 1/1] package/fakeroot: add patch to fix
 segfault with glibc 2.44
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Reply-To: Marcus Hoffmann <buildroot@bubu1.eu>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-12.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 11/5/26 14:25, Fiona Klute via buildroot wrote:
> From: "Fiona Klute (othermo GmbH)" <fiona.klute@gmx.de>
> 
> Glibc 2.44 changed handling of FTS.fts_statp in a way that causes
> segfaults when using fts_read() with certain flags, please see patch
> description for details. This showed in a Buildroot build on Arch with
> BR2_TARGET_ROOTFS_CPIO_DRACUT=y: dracut-install uses fts_read() when
> searching kernel modules to install, and segfaulted.
> 
> Signed-off-by: Fiona Klute (othermo GmbH) <fiona.klute@gmx.de>
> ---
Applied to master, thanks!
Marcus
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
