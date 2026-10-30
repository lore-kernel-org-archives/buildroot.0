Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 992EE606A323
	for <buildroot@archiver.kernel.org>; Fri, 30 Oct 2026 20:44:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=UmCaTkBe
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9C8F680E10;
	Fri, 30 Oct 2026 20:43:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MKzMqmiwek-O; Fri, 30 Oct 2026 20:43:57 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 90ECE80CFE
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793393037;
	b=UwMgmVS39ckRgYDdWcg6Kv3i5dhBJUTkIQSiTB+ziaRcP+hNY4xM0AIHI4Gh0fuIk/sB
	 Lp04lOfZuPsU5p2xcwtlHsxPDoXuM0xN3azr4OkAWjfGRRuzwN2wh4YDz/Uqna1awo9Sn
	 x4UxmIFbfhf6sNXzpdTWSy/w3rbrJgKNA589NOiPtmrNDnq7/D++BxfYN6kzv21jUKXPj
	 r6DbWXMtMrCTL+aUfo+KVcxC6JtQv3qjOjmMw0rFvtSHc4eeDW+N2zvxX86nDxIk07JkW
	 egDF+5ERdBqTpd1a6opzTEEYdwz6XqG85Q4EwJocwBcAj0vYh6QOz9lxwPJFZfjcrWA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793393037;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=cNhIERbGNIKq1UcLs1Hr10XI0+el5GsoecNBJcQI5Pc=;
	b=c4gJWxsmfUxILFNi9Y7riybdZyuzE614rt75UFh12XNNwof8DtwC6CAjK6zffYSmed3q
	 nqZ0TFUG6b4Vq11eW3xfo6WCPofwfJCnI5/0VTHspTt18KxLloWahX3aylif3+iW+YcAR
	 nfp6gjjKoH8jihGR6Qk4rIpRSFPzmB6nizhcphnv8L5L5qmfgLzw3cHlH2vRxzF1YJ4Qb
	 1tAdzgwqwFypY0t5obLS8DHtV4dt36qRq3N5scJauV0fJoqvycNYbw+XUH79PiJdD6uN/
	 wbZpg9ec03pJ6Pv9Wf4E+asjkDjTuZmb3hfE5fXJkTIK7SpL0gO63Qm2rSh2M+3C1Jg==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793393037;
	bh=cNhIERbGNIKq1UcLs1Hr10XI0+el5GsoecNBJcQI5Pc=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=UmCaTkBeleFvosoPXFmHMd9xzhUao6tusYPCJGF55DtCxe0I++vAnWLKNlo4FMhtJ
	 VsBG+YjaGwChxijE63w4ANZqUDwNvX4GKbTdFdDepLdk7V+vCmm6g8b9XtvVk9ISkF
	 YLq8ExKtjcoAOKP1osxk+i8QsKwTEOvkRBD4iCYj7btVLKGIcCjL/4ALu4H6yKNz65
	 MDBa+mFF5OQrYiWB47VPjtzGqHRrkiXZQh0Huy4f/ib9D+dCy3EcWLPOCg8WnvjX27
	 WwncTVbTu8B24JxEmEHHmTOWtYGfavmxh9kUFDTn7SvcEGDvbhKLdz0Z1TY4pg9LjM
	 NhRpz0yCsgaiQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 90ECE80CFE;
	Fri, 30 Oct 2026 20:43:57 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 2AE904BC
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 20:43:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1C11260AAC
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 20:43:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Wmpie7Ot5i2l for <buildroot@buildroot.org>;
 Fri, 30 Oct 2026 20:43:55 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 9058C60AA2
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793393035;
 b=Ml9GV+uAyLdftMU9kTKNFQH6Z2x+1sYdJDWxC26ltkk63fsowVhSH+w8aELDI7clY0qX
 goQOfPWiX4W+8wx1fyMDgbJrB8uZF+WvvaQT/R7cbvINAjbSjVOrPUISTSe08OyLObi59
 lueM/BgIh5WAIKD0AFoFk8RjDA5wwImd/+1DZrL2rgihPwl+V0uUOD5Aihn+SVcKjUz/h
 9ghSvlihdj7bMvjVN/yNN02vDvK/pikxKGlszxzupXtTgSRitBbYmbAtlvx+Jm6YNRf1x
 VG/yBbDN5KgSMjYaDzFPjacWFSC0zCzxEzrfXQIFh6PdwyPKfYRMit1nvb4InYN4+Hw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793393035;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=v6dJRNCbB8Rz8LkxVFyplDR7/0yEj+0B7glX8c8MUWo=;
 b=kUfx6TVyg9I5dmBHDiEV0p1Ql/4nE0U2wNX4g5lS/ogLu0oFIlfpN0FND+HOVRNSwCUF
 8ZwzOcKKH+SkQL2h0yS8jYs1IdQvwfpPpDZp5et8dx1EGXDz8rZVwAHnJeKlOXlyovlWd
 qNEJ6VkM0559dw856PzV1OcB79Ek7Ay6Gmd3onTcts4m2i/BKpSpXPGMJq5xj3GboPDNk
 ZmCoBageuy4BOn5YaDc3byC0gxz+fl0LhWoLhUuEokjnleLTLG/TR7rfHcbUtF4EahAQV
 uYIKf3cM69xl1UOlThhbRW62ywZCtSWJltQ4YD9TR2b3aR9PtW9142MT60oQZ6eHwYw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=free.fr;
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=pF6UuZCn; 
 arc=none smtp.remote-ip="2a01:e0c:1:1599::15"
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::15;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9058C60AA2
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 20:43:53 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id C8E94780331;
 Fri, 30 Oct 2026 21:43:50 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 via
 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr with HTTP (HTTP/1.0
 POST); Fri, 30 Oct 2026 21:43:50 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Fri, 30 Oct 2026 21:43:50 +0100
To: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20261030115741.3139047-1-angelo.compagnucci@gmail.com>
References: <20261030115741.3139047-1-angelo.compagnucci@gmail.com>
User-Agent: Webmail Free/1.6.20
Message-ID: <7db5c708e04ba382a26e8e5a6215f45c@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH] package/fail2ban: bump to version 1.1.1
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
X-Spam-Status: No, score=-16.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 30/10/2026 12:57, Angelo Compagnucci wrote:
> Drop patches 0002 and 0003, merged upstream.
> 
> Regenerate patch 0001, as one of its context lines changed in the new
> release and patches are applied with a fuzz factor of 0.
> 
> Release notes:
> https://github.com/fail2ban/fail2ban/releases/tag/1.1.1
> 
> Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
