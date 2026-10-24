Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FF7C606A31A
	for <buildroot@archiver.kernel.org>; Sat, 24 Oct 2026 14:06:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=d0UsgfY0
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 47EF160A4B;
	Sat, 24 Oct 2026 14:06:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CriJnYDqoOGD; Sat, 24 Oct 2026 14:06:31 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 63E8560688
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792850791;
	b=pAMOOdFdnBZjD+orpqq62KKiYvbhrK2/MABRLy/BPpjiAdoBi2bl+7Qjj259YkvibsIV
	 Nud6kKuA2NDWYOQkBBYD3k/wp965vLRTVNyFU+3Hw2OhPYJsab+cO1hf/OHCVqjB8PdJB
	 ikjRoODUKAm0Frwap3RuetjCN8WQwFatOxhLn89MOV01MqsWcYU+ahdFxnw97AdAOfENB
	 Q2iv/FG7QOTJjfIv0dxSOXGUfx7GrkT1mwwk77DibmNX3nL/gGFQMbOjTItXd9pvSeDga
	 eAEjFVsnOccowIttQPFSNlM7QDIIeSNwNId122b32wNjhq0nHWd3aDo7Tp+U9o9VNDQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792850791;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=kwi7u2YXEizYxNE0w4sM7id2HDal6YdmB2EeXuC7VA0=;
	b=spVMmbSYooT4XlGq1c8M88wQIyvpdpbmaGCpLL6eIvaJBo9HQfTYUOzd7zcIwzloHmH5
	 yHAepJoSX0BN9h6mvhmPftqHNoFxZzr4iHR/JegVw1sSVYjM3hilGVCNiMWeFJHeCoOOm
	 BEb1nLP3yYHmOmyOAmnZW8m7ezO1AVzeUV0uF053sre2Ru+/wCMxN0lIi2UJndOnGfY98
	 ReSHpxvl8lXUyjI5G9BzBUmgDtwxC46/P2LuE961OPFX9lWyO7nGXLgtsfH2t4/Dc++hG
	 3X1HewzsLep/ZXF24yXovXF4DxgcrcuvsqXzDL/FTgM40TDrea6ooTj14blxceRtgrg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792850791;
	bh=kwi7u2YXEizYxNE0w4sM7id2HDal6YdmB2EeXuC7VA0=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=d0UsgfY0ExGlvBmJbi8w3+J3ZlwQqD7tRP1WMPw/VNwHMXs44NdP7gskrrEIttYn+
	 eoQv6+f4uP0fZwjbMksLV37oEg16hntLj8Ouq8yAiEksJuIUe1PJllUqGVxKwUWmye
	 ihne5QWkeRd25fmC5+82+8rQnELVoJgU9cnh5EQ7TEV0Pbr8IJmxBN1MPCgsV5wkus
	 aDRPyfz6NnZk625Z87cwAxaSgKpprWKssrLx9pl1ImgIpUp7lGkLbH4IEARiWgMSqo
	 l92VJXgc6cvbivFbRKpsWS7pe+UynQvnWlPDHdxRgAfKe4E/4DSWUOL5nCbC7dmY/i
	 ZZSKHUIqV4ApQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 63E8560688;
	Sat, 24 Oct 2026 14:06:31 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 42AC13C4
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 14:06:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 275AE81585
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 14:06:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id k86FVeAhriZR for <buildroot@buildroot.org>;
 Sat, 24 Oct 2026 14:06:29 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 86CC480EF1
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792850789;
 b=bNbW9Svg6pQ7qXxQcnZxRFLSA5U5JKOMARZ0zjWWnNdVweCcMlYB+KwRqbmN1NjOGb86
 3rjhZuCkeU4IsQovJ2e5Hr/KyiT9+wCBlXLfa6J1NTeBhqOSrhOQwdWu4QLvHh2ggEIBm
 P2soG05iDN4C/OlqO5CyVigCWZWhwk3pccf+/g16adJxCf+59cVfCYI0HQ+0sNR/rtUHW
 1ecSakLZjNezohy/bPvckFcjsIfRUaKweA0Qe1FrtK9McWx/VJJ3E24DPweiClMvhu7zp
 CzzC23meIlw4sMkTdohcydWa1Ba+NazVwADwyCUKe6FkldRf5J75egJewEZXIgrqlrQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792850789;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=gFMoTVKLfpDNe2AJ2tTbbp7lYPFCRMOS3xXjmyyxcsw=;
 b=lPFEz+HJjpCWSq5lzBF1vP19J9NCRVxwuh12Ruc1JDBNreGks0RxSTIDZxc4iowFjnZx
 ZfsrhNqPLlZ6zkWoYPfn9xer+F3lhwv7EhC6SG7+hhSWVIFagm6cWROkh365pjTc0eiaC
 +cf0mOsDyrqBoVKADOa674ifuqIHqUdtYgzvsTMDkKt6/JvMHv4+HYZwfVd6x+1wXW726
 7I5eoDt5wRUMYLGPLOxXFUgpGST3wFX6vOm64lLymTOmAGwAwP7LfwffmphO3sWrtYmFP
 FDQ3UNombD2JrZ0ThhvMFUvCQ3lHTWtmUc7yRCQUpvO6eu2A8N7Kt/6ovtf0Xt/+jWQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=free.fr;
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=jGhbzvac; 
 arc=none smtp.remote-ip="2a01:e0c:1:1599::10"
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 86CC480EF1
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 14:06:28 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id DC2A6B00563;
 Sat, 24 Oct 2026 16:06:24 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 via
 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr with HTTP (HTTP/1.0
 POST); Sat, 24 Oct 2026 16:06:24 +0200
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Sat, 24 Oct 2026 16:06:24 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20261023190337.969832-1-james.hilliard1@gmail.com>
References: <20261023190337.969832-1-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.20
Message-ID: <4b4dd0ec505ae713e55e8753641387d2@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH 1/2] package/python-httpcore2: bump to
 version 2.16.0
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

On 23/10/2026 21:03, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Series applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
