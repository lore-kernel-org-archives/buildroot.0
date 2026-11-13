Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5960D606A327
	for <buildroot@archiver.kernel.org>; Fri, 13 Nov 2026 15:26:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=AIk4Zqjh
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 34769409C3;
	Fri, 13 Nov 2026 15:26:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CGchyt1Wqs-n; Fri, 13 Nov 2026 15:26:25 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org DDDBC409EB
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794583585;
	b=QRRw9eRCp70YjXlb9DX78ZNvAOzSdnYQxoDMD0rquktoHEdIxR9niCQD1z/JXI4T5dSf
	 KbOYmO496vVlHNTA9cgciR5/mNWK7jra5bd/09OsV9L2rH+wsYgm2Ld+it8ph+o8ZGWnC
	 8WQAg+0uaylzIwY7jWWVimbK/9vonTXFOToSy4Z/T/lNB4oUlHf1Sm4AiJ0PMuR6zAdw/
	 piMue+q7VghYGxQnxqORbErUT3fjSsMkqZTqQeWx51QRoAF5hN0qTuDnDIQV3iWP72T8Y
	 6iDuztULpd+ax2P3oolS4uIb1Bg1sld3yt0zKAB2kpQ6oTnZrYjevArbO0T65pwSUCw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794583585;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=Dks8CaB4Fs0o0nHLBjr03qe1nS/b7ucHK++2Na4PtVQ=;
	b=kNClLGolfhGCtQSszFmR3kp16ghj9KLCD0oAuh6GkGHAEblXlYjgr16P1/doIpkCODpa
	 FmtRSJFr7tXkZbdXPJd0KkHMIUASy81VpicPi7rT7CavgBt0oqJHxsIDLfWRVPAKZ2Nts
	 1GRGs/tt/5zxAkPA2rR/SBOPr0/NCbnlVOSSqbfKsYb0a8SIIQfUhoOpMotNUf/8rFJ2T
	 KCoP17TFnKHNsGQZmUBzIzrvx1hl3msFK0zUa/q+i8AndOwpL3NK2X0DbAVXpMJotElP3
	 zoIUbwLB0g8QdvneAHqdt5pldH4mTSexEoEewJ+9Bx0T+LFpCZm6bT63/mT5OwiOweA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794583585;
	bh=Dks8CaB4Fs0o0nHLBjr03qe1nS/b7ucHK++2Na4PtVQ=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=AIk4ZqjhhBfF8CaBMmie8yUmMwRJYCaFjHhf+j4kX3dh4Cp3xLOHbdPHGHlkXKgTx
	 FWHY+0vdNyCcTFniwPtTy0VYrmtBnEsSIGreZ/faa7QeAOExVQ5/O77dDKyWW6w2Ck
	 JcO0TkhJWB/NxZUFOGt9MRrjiu24dl9VXgdoLNwAvxPEgHaJo7g1JWL6esi0pPjFed
	 WNAve1KXVG+wRQoYYCVMq+dlF0JvLxu9DRIuyNsNNFn5OHIG2J63cuI8BQUY3niaCc
	 HWD7cgUxtRYNqrtCzq482/1AlI00T7DuMQ6DDodlYQMY0lXNGTGVhpKau10077njdQ
	 9/VXn2ogpXs3g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id DDDBC409EB;
	Fri, 13 Nov 2026 15:26:24 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 23B2BAF8
 for <buildroot@buildroot.org>; Fri, 13 Nov 2026 15:26:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 157E18115C
 for <buildroot@buildroot.org>; Fri, 13 Nov 2026 15:26:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WPnbSFJ15anu for <buildroot@buildroot.org>;
 Fri, 13 Nov 2026 15:26:23 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 985E98112A
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 985E98112A
 for <buildroot@buildroot.org>; Fri, 13 Nov 2026 15:26:21 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 05BB819F57E;
 Fri, 13 Nov 2026 16:26:15 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by localhost with HTTP
 (HTTP/1.0 POST); Fri, 13 Nov 2026 16:26:15 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Fri, 13 Nov 2026 16:26:15 +0100
To: Maxime Leroy <maxime@leroys.fr>
Cc: buildroot@buildroot.org, Thomas Perale <thomas.perale@mind.be>, Vincent
 Jardin <vjardin@free.fr>
In-Reply-To: <20261113141742.209508-1-maxime@leroys.fr>
References: <20261113141742.209508-1-maxime@leroys.fr>
User-Agent: Webmail Free/1.6.21
Message-ID: <3289097492a87d6d4be4e6507c2f2650@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH 1/1] package/dpdk: security bump to version
 25.11.4
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

On 13/11/2026 15:17, Maxime Leroy wrote:
> See the release note of the new versions:
> - https://doc.dpdk.org/guides-25.11/rel_notes/release_25_11.html#id4
> - https://doc.dpdk.org/guides-25.11/rel_notes/release_25_11.html#id7
> 
> Fixes the following CVEs:
> - CVE-2026-86561
> - CVE-2026-86562
> - CVE-2026-86563
> - CVE-2026-86565
> - CVE-2026-86566
> - CVE-2026-86567
> - CVE-2026-86845
> - CVE-2026-86846
> - CVE-2026-86847
> - CVE-2026-86848
> - CVE-2026-86849
> - CVE-2026-86856
> - CVE-2026-93683
> - CVE-2026-100236
> 
> Signed-off-by: Maxime Leroy <maxime@leroys.fr>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
