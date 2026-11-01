Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8283B606A324
	for <buildroot@archiver.kernel.org>; Sun,  1 Nov 2026 17:37:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=bhfvPPGu
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 611DB6065A;
	Sun,  1 Nov 2026 17:37:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ilQzHKnUwZ9X; Sun,  1 Nov 2026 17:37:10 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 6BAB360612
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793554630;
	b=iRPd+98x7MTA8dDhsGuQg59CCnYbXppjTxlmG2Ouewhv8ynNYhNyGaNu+JSIFoppAlQC
	 BuPdRzmBDykiS3XJTHmmcoZlVz9lN6GUUD9KH8/v+1WvwampQoyLzC9suYS0+NoQCRe4l
	 K/dFF+xlWTkRuZ3j8f1fmvJ6Ozj/Pi75IlaRcXx2vWPJiBMQ4q7NTrtR5InvqTXamC1nV
	 NpunWIn1jTEoe2/PL1E0Yq1rphVBxCtC9avMRVUjFDX+CXq0iKSW6A/ccPgYzXuDp9mFS
	 doDGnFAodpuWfn1RqpylZq6bih1dUI2POTmNtrJXoWhJTl7h9nCMl+3YnXUTb5kTOEA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793554630;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=64o6GBK/dHKSedGip2Cz2C+NCRMVBanTJRmgvxG8o3U=;
	b=Q/+Jp6x7yNixFgsCf1R2r3N7ElKlpKD09efYKOQp6qwfDYE5b1No2VRAy+ZlLFdhqfnU
	 CR451IvoXPQt3LDVOR0j0hAdBbxbf0p+n3z0Ro1BN/6XbK/HyilU6MRP2TTVOJK/lZsJ6
	 WKTJjEkCu1uWLy5PQ2/SlRbSuykrW4YP/woijtF1RZtfUTqqG1ybPz7pWPTtsUppSi8Ne
	 AOXMj1HKKQeHel/7XKgBwsmi/y4uIS5kCS9Zaj7gHXAFTT9g/wbz4XGIx7R/yRrD6/Odk
	 d72zLchjl+vwFp/7oJ3ET8NIk5KNs3mMYJjLJoSMohHptp1QiYDQDWcN1ymtL6o9szg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793554630;
	bh=64o6GBK/dHKSedGip2Cz2C+NCRMVBanTJRmgvxG8o3U=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=bhfvPPGuh1lzXGeQKyl2ULTY0rb9nkpZzju8ffgPEix7nFw16XqzUZD2JNwJOA6kP
	 stbk44fLHA6XEx/Sp2B3xmAZhK3qQGfT+xr9BHnmcNFgfnUthMyvyn1FkCnL7Hy/sB
	 31/ZCR8BpjBijcHon5gkuJD3GH+bnkQFnyBp2KwSbXLbwkO8zQ3Dkn7IRazXeOn9ue
	 nGePwquHvj5G/BbzNnLIkjH7msM3gOy7lapURoL5f75mU+YXjU8H+OeqXQxHakiPN5
	 bKZ2fx/A5oP4d0h6BUxUjgj5o5Z8dcB21SpHFupeWFfXduL51NA8uxIG+OOSx+v9fC
	 yWBXuxvH61Sew==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6BAB360612;
	Sun,  1 Nov 2026 17:37:10 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 4F1E6EF4
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 17:37:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 404BA40574
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 17:37:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mD3nn23CTUzh for <buildroot@buildroot.org>;
 Sun,  1 Nov 2026 17:37:08 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 946CE40556
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793554628;
 b=mO1eOxhGXkOnxTBSBDZu3/tbk3v7EyQ31cBSwyvnpOcSUeEzbtW8OkyLsLMSp2AcA2Fa
 QewKs1ZG9ud9lAr+HAFTUlkxsM6OAzeC27KnOF04u4LT7AgnHEau4VpJN4gK2S01DDe97
 xmXSARmll6Y+UCsZAd0lG1/B/MmnWPfbsfrPK1SBZZBRvSkDQUMcx4mGlnXulRqa+ytUc
 TcQDvpfOb8k/szxe6fCwLab5qTSadIWEiO8J372Uxu2AJFFk8kvxCwelc5QCmVdyusOwk
 MuImxYcip7H3YEpVHf2j+Q6giDPQrAPSXsD0f/iAwZ4Xpl+vcl5zIwhe9/30rfmHHlw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793554628;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=LxUmSLxMufx5tIHkYH2iJpgR0syFhu9N+VDNmm6sBTk=;
 b=cnQFGf1bAV9+I08fZAypnCJ9ANKD8P6s65HESrWbFyOF0wX0H1pc4wVwosotDjyf691P
 XSNjG99p9ewOGMQntP6+Sv5gChPMusGQXgB8qp50g6rQtl/KJXn78z9b7LUg+cgVFgvgr
 5YaU/g8JWo+5HmfdjwU4uFJb2gWw4QkdzdqN6GANuruBt9xlBx0lgBRsHNUp1KB41kgDq
 VyWQ/6z4ifVaIAohovCCb4cgWrJwK7on2P4C9WO5fZamDfBVvhOQVepk9HPQrAzg63ede
 DMpBm7WG1tPYpmNfI0lqaedPHSOy3P4r87m5xqnIqaOriO6HCoGB2dUR0sc99rqM3VQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=free.fr;
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=LDGV+luI; 
 arc=none smtp.remote-ip=212.27.42.6
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 946CE40556
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 17:37:07 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 88A77780383;
 Sun,  1 Nov 2026 18:37:04 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 via
 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr with HTTP (HTTP/1.0
 POST); Sun, 01 Nov 2026 18:37:04 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Sun, 01 Nov 2026 18:37:04 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20261031201918.2850153-4-james.hilliard1@gmail.com>
References: <20261031201918.2850153-4-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.20
Message-ID: <bbb99b3e327c091258172f06793ce9da@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH] package/python-httplib2: bump to version
 0.32.1
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

On 31/10/2026 21:19, James Hilliard wrote:
> Add the missing host-python-pyparsing runtime dependency for the
> host variant.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
