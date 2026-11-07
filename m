Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55E97606A33C
	for <buildroot@archiver.kernel.org>; Sat,  7 Nov 2026 10:30:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=KPmkdOIN
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 35672407BA;
	Sat,  7 Nov 2026 10:30:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gc9j2l_EWwKC; Sat,  7 Nov 2026 10:30:41 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 71A1A40785
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794047441;
	b=W94ubhrCipU+j7Dc6r1SsseAolSonhyy9ojo6jXtq2m2jEePVeZgorFxRLmu5rcHmepz
	 xV9waA14Dh3yucNkonypmzEwbNbbtaJrsMQhso7PkXLoxyewAWjckjB15lacNIdp8TG7M
	 xtlWnITNaM9aUhaZ0KBB2H56NqKma+sY46X4VuOjplCPWLv3JAhSaDFrJyeIcjrWw9Kxd
	 lrfvkyB1gyyCrkCP3ykr/6GZNFRy+5hwCZzk/ZCd2sSG7oHTk3+YJUYX/+mAU6VyXj0sV
	 3P2TvQv7Olin3A5a/TU+8VfWeB6wszFWwlXGJm76kydQE6AXUBwiWOh2v29fdzYv6Mg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794047441;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=6BRyS7SRdpvvuBby1z9K9bNjXQYIp4Nx26bTxCCTe2U=;
	b=inMGR0SXUgk/MFvwt697Dna/q7TlA36xpvccV9PvxU0cveDVMmb321Wg1mY0YM6ELb4x
	 7aMERb006EYFgC797glOAfRHAwVNxJX327+8cubffU/oZ71/3dXSM+Dnmvn7/1BQzFoIM
	 8MMGhREIO3LHP+gQXBulTSvm7EbKJNlIsOcuhhaRdWuXrf8zVLmd3JUMFW+tWs6dbUhOj
	 7CnU/hAAkMMZy/ochlRB5ORn1D8vlmYuiqMBl8FbDmLAVtMiJkoOENXb9SYAvXoy0Ao26
	 nAYuhwCRBHwcuFNJLom2gs6eaWDpB0iLfqlogSJyIPRZDB3GUS1vzjcyWnKcRvzjDYg==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794047441;
	bh=6BRyS7SRdpvvuBby1z9K9bNjXQYIp4Nx26bTxCCTe2U=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=KPmkdOINEYw6hjAkSI7RIEWy7Z1El+dXdHlDQGThWKO6PkWebZK1ej9dfxDB0Glg2
	 No+q07ICjtOb5u8Yta62EsY12MuiMkpy8mminpYzku7FleeKQB2dImHo0sbrGog0dj
	 PqGvsxfaJnWDzF2ccFAbF7vP/YI/YOE5W3+0aJKhK2kxdTz3NX6k8KVk+0IZOoWF+p
	 UPxadVzOZNaFkjkhLjoeeaidpxl7hna4pOuENA4aVIOfWQBbgJt7uMd4y+Tcd4YtDY
	 ehYiDpRpAC67ARKO8TdoEfihAjwdBuNNtP93hXFBM8j5o7hIaUDk8oW1vG6wGZSTl9
	 Dmmc8u6LJlkMQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 71A1A40785;
	Sat,  7 Nov 2026 10:30:41 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id AC0F31C6
 for <buildroot@buildroot.org>; Sat,  7 Nov 2026 10:30:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9DC5D40785
 for <buildroot@buildroot.org>; Sat,  7 Nov 2026 10:30:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XXTB7Q8OJKDM for <buildroot@buildroot.org>;
 Sat,  7 Nov 2026 10:30:39 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org D05874077E
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D05874077E
 for <buildroot@buildroot.org>; Sat,  7 Nov 2026 10:30:38 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id C2331B00565;
 Sat,  7 Nov 2026 11:30:34 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 via
 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr with HTTP (HTTP/1.0
 POST); Sat, 07 Nov 2026 11:30:34 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Sat, 07 Nov 2026 11:30:34 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20261106211918.2606369-2-james.hilliard1@gmail.com>
References: <20261106211918.2606369-2-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.20
Message-ID: <cf50128ae87fd877e318c9f0f6a8d886@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH] package/python-maturin: bump to version
 1.16.0
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

On 06/11/2026 22:19, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
