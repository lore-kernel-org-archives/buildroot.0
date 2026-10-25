Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 666D4606A31A
	for <buildroot@archiver.kernel.org>; Sun, 25 Oct 2026 11:59:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=oxGvoddu
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 44E8E810F9;
	Sun, 25 Oct 2026 11:59:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ln3O7F10cnjk; Sun, 25 Oct 2026 11:59:24 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 607D180FB3
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792929564;
	b=CpZRs/3g3qMuLaJZnC4eahkshBU04k56nTMvEkUrF65FBaM8fuNKmWSg0+C8gmF53cdU
	 /Bgbhcc3pMTJ2AtXvJcVzd69ffuH2ZlxON+HS/49IqpbAxtH52Rtf1uRVbjrPPHecBUx/
	 zjjE8RRituh2PPcTEr+ofv1Wy1ad0aZ2zflpyDia+wWuRhi0lVtvXjhQnAsdiWxQrKG7P
	 RPDE+oaVByNcYlGztDWK7fwxPI8K2BCnzcztUBcbGNTefdg+QANZtpPYYeA24qGq8cJFX
	 mXCEVRZqDMlVrcxvXhQXH4hS8Z3FjHvR/h/wHVO0lWsWTWvK+a1nI65uIRjq4nsQnTg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792929564;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=tcb73frC+hYz6xGuxSaj1LCq7kHDhvWUOlKa31sCcGg=;
	b=DnDFSnAEmW1WtW1VOnp5prxTofZmXRLlI0rlO0Qou0GwtP4TIObXu+Wb+/LFouutigIB
	 gHmZghKvj3zK3DSkgpZ0pFZTwpayb/vAVgw+Ol4m4AbRnZTv8U0Hycy6glnrOIb9RaA7z
	 Wf3IefQqBe8o741M0JwXpxpXPW8zzyWgLAuIoB9wSgw/i5N0xDGSLfmvCjElpEqHT+ig5
	 rswYGQpjzOdv2zXJ/kBbZ8Wg1Pf1JrcupKj9LeehsRxeAjuxc3LwVEDh9fSYxzhe0fxRj
	 B1glx++KMUF7zBMicI0hjqFSxPEJuNQkP4v+ELQ0A5NhjYJ+5CMK0AoOtu+hL0a9s+Q==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792929564;
	bh=tcb73frC+hYz6xGuxSaj1LCq7kHDhvWUOlKa31sCcGg=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=oxGvodduU/mpq4h/pGfSeYJK9DO6XQzKV4s5/VFCpK3wJlvsQStmFqBwnC3aZj3l+
	 weCX5XdrBgobGgjZS42TjEBYYMPXiLLUr38U0mFFhrBAxwhvN1IiVnKWWh62Rep8hV
	 /CQCgVumJTX8ZWF0PmJagAErQp41vQ4zJhFCmRLP9W3n2ErBCHTgEE6Fwmr3TCLrzW
	 C8qVZHwOUhPWcbhwnbSuMolJy70Ui+pnTjNnCT2nPL1eQVFIddrVO+26MpbD82tFQJ
	 f20QDTpSvuYjgn8cDkpQqhIex2QPJHFnZFzxuJpK81vwdqtkRaE7REtIUngKPVooV6
	 8LT6+31OHYS5A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 607D180FB3;
	Sun, 25 Oct 2026 11:59:24 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 353623AF
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 11:59:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2750A4061E
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 11:59:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id z9rdCiiO0vKv for <buildroot@buildroot.org>;
 Sun, 25 Oct 2026 11:59:22 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 682274061B
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792929562;
 b=Ehkj2/tolbzby55oH8aj91l5Fr2a7OyI3SKBInUDwjPOuT3Qghk67FLzAf/P6OxlQJP8
 2cpx/nDkX4A1ukUezLxnPdP+5u7AYhevsWl0LCb07i0CIwLeIJqK6C7pcq8N2Jei6+Dub
 UaAf27rqVwbvBcHD4ecM22edvPkgvLxRQ1Qz3kaQacXv7uQ0VxmKz8WR3uu8Zjt9DBAZi
 pzsShsyUNcTCc1uTOIIfThyBiu8F4e+GM1DddbN1uUjQblJzQRuVKpzvq5wLc/SfwGdXS
 Q3sK/uy3fcn8qhWDlczKapN3ozk8/Cm7krLKqM3nuJVkIXE8n1Fkcxu7GZAzh6OcXaA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792929562;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=QmYn6d+L8cgMQVhMS55vMMzMU1676dDAG/CD+dL20Pg=;
 b=pAbZYxnXQobL5JL0ZYAykd2xQTbycMGtLSzz2FvCPLaXW5tZfesQL5vkSDrZdVumFwQv
 zqtLSTs+tMGwGWOZ1gyZrCOgh2Zn1j+PAj+ti7FUN1wfHwejb+p8PwwzVaDdAFgW2WUNN
 Gd4lccNKNj5Ld6WxfcuhP4hLE32EbUo321axFKzMRIOzHoCxDfk+lN1SAow1lj4Z0tRiX
 Jtq8aJ0epqMj9EhJUHp9MpNr/jiUiipoyeZuz40e9E0Tt+DHnp/cVwJWM+WqGWNEMBsq6
 DisllSTB+0Sc0EyCQMpAwgjctA05EYpg9K3Z9X/tWZsZxEizpcGtsOjrOpNdO+6njQA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=free.fr;
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=NQIGqHyt; 
 arc=none smtp.remote-ip="2a01:e0c:1:1599::14"
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 682274061B
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 11:59:21 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id EE4755FFBA;
 Sun, 25 Oct 2026 12:59:16 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 via
 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr with HTTP (HTTP/1.0
 POST); Sun, 25 Oct 2026 12:59:16 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Sun, 25 Oct 2026 12:59:16 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org, Grzegorz Blach <grzegorz@blach.pl>
In-Reply-To: <20261024182913.1957467-8-james.hilliard1@gmail.com>
References: <20261024182913.1957467-8-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.20
Message-ID: <c232a7640982e2918a1d77891f199ded@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH] package/python-wtforms: bump to version
 3.3.1
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

On 24/10/2026 20:29, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
