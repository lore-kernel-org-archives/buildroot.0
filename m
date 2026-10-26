Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3338606A31D
	for <buildroot@archiver.kernel.org>; Mon, 26 Oct 2026 19:59:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=QqHb5+gv
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6A08880BE9;
	Mon, 26 Oct 2026 19:59:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id g_FIsJaeVddC; Mon, 26 Oct 2026 19:59:42 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 91D4D80BE5
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793044782;
	b=k6cTW4KoOSQh18EQvoMnZP2Jof0SEEuTG0N94/xIjM41ScN9rpphDOgKm08PWhmnWjcp
	 hdiOKy2F+xvc3BgUBI+A24xtG3NQaJAjwYl5tvl0MSksdA5Zj6+MPwxer6vLlj5BM8K9P
	 VpkFyb+B6SoeFuUh7skNJOlzn1fQBJoJyqT7Qh3djWVM35zJ1bS7lPQ0TQB4oDi/em8Va
	 Xpn7OXQHQM6ur34YK3YikiMvFyv3S5FfbrhZu0nx96TF+7MySuEsCfkSZ8fHDqiw72RD3
	 NsJbiwJ+B4BvX3JtReSlUPOiKh8OXLM7zawldDAW5beOkm1ewCORyN/hjQZvA66vpuw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793044782;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=NQnrsYH5Zn2Gtn/greP3PDnM1L6xZoGmEW+PnWlGVEo=;
	b=fHjogal6A73BMy8OI/zC3fNC9UlIUdj+uJjia4+ewfV+adSAcyq6zwOs7B0OmDI5QB6W
	 b9PJe0L/oVsBNDkjcGCgFEVxJ8h+Ee4GSl9D4frXx7rKEtzsR/VWzbnxXctD0SlW8pLkJ
	 bKejp3esA93tG8CiNB8a7VLwxLH25uk1xk3+VPgyzc46n9EwCwKlSMuJycD05BgG5AerE
	 5vTEJVCK8hHU8/I3184JIzovjxfjE95EVwBPDxkrx91gXhD5CnkOxEPtLP7Eyl3aGRVRE
	 yFlUW3b4RKqh0bSAVVjgntQikwXtBTMyyyIAFNIPiQQ7B/99uBxkVmjet5y+BH6vGbw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793044782;
	bh=NQnrsYH5Zn2Gtn/greP3PDnM1L6xZoGmEW+PnWlGVEo=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=QqHb5+gveASZrvZEVZsn4YxLWgRyGBpLX5iaIfEXioolznAgzR/9Jjqtt3oVvxg4b
	 H5/duu1CJjgSf/O9TGeffJ+/+SHx4AUaHPPzo6B3AuR4cazGxnSw5u3XxIWumy6/aD
	 DEiHyiYRLPGib+JqN0hl0rMXFRN0rpVOJsJMROYIttmYUILkR3odk0+pYB+KKNTBUd
	 D4EM4b/0yNiHPtxrsPiSt4CrUCnR0oR3FJG0Er7dZzhXbc1yoQw9TU7ZGasdWcqI7U
	 VpXxWYrYojyptMfq9BG4RPjC7sItJ/mXf4/FI14Xu0dVQyAWiKzV4Fl4xY7AunK29+
	 C6txXuQaBSijg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 91D4D80BE5;
	Mon, 26 Oct 2026 19:59:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 6607835F
 for <buildroot@buildroot.org>; Mon, 26 Oct 2026 19:59:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 62D2980AF1
 for <buildroot@buildroot.org>; Mon, 26 Oct 2026 19:59:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cy4TsPUUa-Z7 for <buildroot@buildroot.org>;
 Mon, 26 Oct 2026 19:59:40 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 8FFED8098B
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793044780;
 b=muv49H2L4Dudpk9+UpLxVjomoPQvHqVyS4mBD55vXfY69d0GfRJe5/65H+2ItgWKlhaP
 Bn9ODK3gKEnloTb+0OuHh1A/MXxxCjijjNHzOb4y0RgBPXjtLutSBfi5xGYK5MsUnl+e5
 eB9dZKwk3rJ57jMFocqVFxcJdFjZs0n7zwe682pF7buUALGO2msv1XgxcQ52zSUhzbSix
 HdUoUKAFcrIbqoTLNgdnhIUxMPqJDiyv7OsDgX8Xxk6wjDN6T3U8fzps8gr0HaNAsKpII
 zgaWcLjsaGqLw7I8yIXTdTGCFpvGAHzLiG513EpodpKN+TXBrExSOuECx76TPX8t5qA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793044780;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=AjUv8CQjFJY9hQxCIAvQIp7akwU5gUr0njA1YQA4uzM=;
 b=BrBsxhNd7uho8MvqX2l0yeWYeaLMMTIXqhXMna+cmIQQYZ8aml7OmiXhz+Ac+Hw8VM/d
 dJ23VibDTvCqFEBl+Ck/s1Fdm8wiKm1jBzAbJ/1rvjFfyuAIz7Y2vUJBL9AkeV+st2NzI
 OcGEV7+F7NJOj3WbhHVd0c8Oo7CwFUFfqvGR9PZ1a57HBuJROICprxQBwIcwKbdBPJeIC
 OcI55xeSIou1pdFUgFWtuR9x4Ea+mx5e6Qeh3G5jEa3lXtXgkgGNln32CTeFWCDH7aXJ0
 h4cF1pIO9lW4TLgX0SEVOkU6jW18oKcycv1EPB9AzcLrjV8eLtc7ogoLyX+XzgkvjoA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=free.fr;
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=kiEQl3Ra; 
 arc=none smtp.remote-ip="2a01:e0c:1:1599::11"
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8FFED8098B
 for <buildroot@buildroot.org>; Mon, 26 Oct 2026 19:59:39 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 0461E2003B4;
 Mon, 26 Oct 2026 20:59:36 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 via
 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr with HTTP (HTTP/1.0
 POST); Mon, 26 Oct 2026 20:59:36 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Mon, 26 Oct 2026 20:59:36 +0100
To: Markus Mayer <markus.mayer@broadcom.com>
Cc: Buildroot Mailing List <buildroot@buildroot.org>
In-Reply-To: <20261026192351.224135-1-markus.mayer@broadcom.com>
References: <20261026192351.224135-1-markus.mayer@broadcom.com>
User-Agent: Webmail Free/1.6.20
Message-ID: <d3f5c0a3c5b70217010bc621732b048d@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH] .mailmap: create a mapping for my original
 BRCM email address
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

On 26/10/2026 20:23, Markus Mayer via buildroot wrote:
> Map my classic Broadcom email address from older commits to the new
> standard format. (The old address now bounces.)
> 
> With the mapping, Git will show the new email address in the "Author"
> field of old commits, unless --no-mailmap is given. Signed-off and 
> other
> footers do not change.
> 
> Using .mailmap is a first for Buildroot, however it was introduced into
> the Linux kernel in back 2007 and is a standard Git feature.
> 
> Signed-off-by: Markus Mayer <markus.mayer@broadcom.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
