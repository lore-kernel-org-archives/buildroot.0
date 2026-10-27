Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F129B606A31F
	for <buildroot@archiver.kernel.org>; Tue, 27 Oct 2026 22:38:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=MBVad4Xa
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CABD76066C;
	Tue, 27 Oct 2026 22:38:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NdcbGg5NDFj2; Tue, 27 Oct 2026 22:38:27 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org C4C0560613
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793140706;
	b=Lm/d+pbuRbOvFeSZwah2QiMMQUx2rFXeiYJ7nVPF/L4XqFQJqS/hu9NTvm4Y7LfUsUcJ
	 hRXVK8Wp1cJ26StOBsAm+qQR7oTdkUS+QTXeA9t5w9uOcYTlRchqeRdjpXyEMFwIZRlBf
	 pXJXWdTP/0v9eXbMaIsuDfiWkZQMHj4Zlco8MhTsiHPGkHUCvFdvxRrDG43ktDarZGOi4
	 KgVGKo3Q2pq5/oEpVZQEMXQdm849Eb8UQg2eZEnYvMjX0CoVrsCeMxjK1DDoKCjGsUma7
	 hdSAIQAiTKrZFSJedbm/LqaJcY6CV0Nv50RJzmLovmJ/kzLzd8vt6Xw5p7XOXqSRzrg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793140706;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=a0M7Rs+G67Xlxwag3KBHY+F6unjG83KOM3GdYut9BN8=;
	b=i6sdGu1GNqKU38qkgjwCt2sYsFdho9t63b8+5Bioxu6jhcucqJZLiOLWHcttQROuiLPT
	 tJKnCkx+uTwK4U5cZQtCwA0OnyxXOVQzj3mW2yOlCbZkuQMYiZS7eSKP1TUcW+xw5/fJy
	 rmHYDbxiY0zvJZUuETDU49rLuEweXL5+mRQnE8qhgqcEyBZQWPGcBcIcRs4F9JPBSWlG+
	 HGm4r8FWHP6IuImaRFgYITX3wBQO6IAt2jvkpDb9zpyjWO3+VmS8S37eOkFfLhJwFPQNZ
	 dVeTT279UV6eTa7ZxvuqolHga42A21Lnti6aoBxWzBygBjAAcT0ED7qD0q2JzQ4uhHg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793140706;
	bh=a0M7Rs+G67Xlxwag3KBHY+F6unjG83KOM3GdYut9BN8=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=MBVad4Xa6xVWaRtAo/78jFiNXzDKYSBhe1IG1UVqeq6lNv9AfKe+KNb4EJe45f3fo
	 GsioppgTxk9iYQB3wBZ5eC5Tbag6+MIHJZJWChu8ERSutjoEPOKVcsxj/qrdaFJBOZ
	 2EaBgDGvqejdqUaNHL+3Y4TumVXOVnE6cxEnY1UKIx9TCAXkDOvHSBABFxBWBsRdB7
	 MTqA+bT4xfwSOUMmyK4qkLvOk5TV/T4jtPS4i9YTdo6wH24DcnQSn8QIzJeQyy9ky0
	 FjtKGZGJvifH0MEkiiXOLW7NH8KwfGU6CzDMm8qd4BeSx627Ql5oq0X4eAP9j9Wu65
	 nLNvC6jmHdvzw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C4C0560613;
	Tue, 27 Oct 2026 22:38:26 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id BEE41729
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 22:38:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B0BC080AD3
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 22:38:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id O43EV8Pb6f2C for <buildroot@buildroot.org>;
 Tue, 27 Oct 2026 22:38:24 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 8D07F808C0
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793140704;
 b=R2HNCKMhCg2ESlYZCd2jmqq/JToLJwW1j71d1xkJjNcRSjl2hsXJnopjkI8JsYILwDgK
 Ggi+fMMM6XNVbxv43HrjhzMP8cBrnlEu70gNq91HHGON6eABlUcwKmIgbwvBHR0JVfwOg
 RlHThHQvypZg6HDnhy61lgKdU44kb2zMl6hKdSJu/2lFxWXD5QtmM96iIoLRUgsLlqahn
 Zdi37CMDSKiaQG7zk+nv/PTOm1BOjGd1j96dobEUB4sHBr9z+s06YogXyS15m7IIyswND
 rhJlCm3OY4jicIT7paQycOanP+/4ENMQYOlbYbzDPB8d/6WMuwwx5BBtBGDO2tEFm6Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793140704;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=+D5LWJXNROg3WuRPU8WbFBLJuSxBP6As6nWViEiEG1E=;
 b=O8PLBdqmcSZqFGJzx1j279jqCm21ey4yI8YckOKK2fLHp32xLAZ/MIt4T93cMTQ3VHtX
 YwyWzQqohvvtRdi3RbBRiwyvA9WCOuK2J1uFpauFwe7M+lwHO4Vw2jcF23kE+tvu6viAl
 kHJQzYe1npUMhIUPXeVgo09uh420LF43PmWzG2EfzqehHkrcGQKo7XL35AwDJyzQ7hEhN
 GaXY6TGrCHcgR5zI/w1n5i3LpWjJVF1I+G3v2bbZFlTqI1RgtOYOnWefF8RiKo6g+qah6
 AZ4gclcZ+CjBmFakuULjNz2mPfWbYvThXb2mh4RASNvSAhBApFp7zcErpVRs8v9JUyA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=free.fr;
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=QuMBghla; 
 arc=none smtp.remote-ip=212.27.42.4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8D07F808C0
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 22:38:24 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 1B34319F576;
 Tue, 27 Oct 2026 23:38:21 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 via
 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr with HTTP (HTTP/1.0
 POST); Tue, 27 Oct 2026 23:38:21 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Tue, 27 Oct 2026 23:38:21 +0100
To: Peter Seiderer <ps.report@gmx.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20261027194501.2164846-1-ps.report@gmx.net>
References: <20261027194501.2164846-1-ps.report@gmx.net>
User-Agent: Webmail Free/1.6.20
Message-ID: <7b6b15bfdbd69416dcdc1fb7c55168eb@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH v1] package/patch: security bump version to
 2.8.1
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

On 27/10/2026 20:45, Peter Seiderer via buildroot wrote:
> - bump version to 2.8.1 (see [1] and [2] for details)
> - fixes CVE-2026-115207
> - remove 0001-Fix-segfault-with-mangled-rename-patch.patch
>   (from upstream, see [3])
> - remove 
> 0002-Allow-input-files-to-be-missing-for-ed-style-patches.patch
>   (from upstream, see [4])
> - remove 
> 0003-Fix-arbitrary-command-execution-in-ed-style-patches-.patch
>   (from upstream, see [5])
> - remove 0004-Invoke-ed-directly-instead-of-using-the-shell.patch
>   (from upstream, see [6])
> - remove 
> 0005-Don-t-follow-symlinks-unless--follow-symlinks-is-given.patch
>   (from upstream, see [7])
> - remove 0006-Fix-swapping-fake-lines-in-pch-swap.patch
>   (from upstream, see [8])
> - removed 
> 0007-Avoid-invalid-memory-access-in-context-format-diffs.patch
>   (from upstream, see [9])
> 
> [1] https://lists.gnu.org/archive/html/bug-patch/2025-03/msg00003.html
> [2] https://lists.gnu.org/archive/html/bug-patch/2026-10/msg00014.html
> [3] 
> https://cgit.git.savannah.gnu.org/cgit/patch.git/commit/?id=f290f48a621867084884bfff87f8093c15195e6a
> [4] 
> https://cgit.git.savannah.gnu.org/cgit/patch.git/commit/?id=b5a91a01e5d0 
> b5a91a01e5d0897facdd0f49d64b76b0f02b43e1
> [5] 
> https://cgit.git.savannah.gnu.org/cgit/patch.git/commit/?id=123eaff0d5d1aebe128295959435b9ca5909c26d
> [6] 
> https://cgit.git.savannah.gnu.org/cgit/patch.git/commit/?id=3fcd042d26d70856e826a42b5f93dc4854d80bf0
> [7] 
> https://cgit.git.savannah.gnu.org/cgit/patch.git/commit/?id=dce4683cbbe107a95f1f0d45fabc304acfb5d71a
> [8] 
> https://cgit.git.savannah.gnu.org/cgit/patch.git/commit/?id=9c986353e420ead6e706262bf204d6e03322c300
> [9] 
> https://cgit.git.savannah.gnu.org/cgit/patch.git/commit/?id=15b158db3ae11cb835f2eb8d2eb48e09d1a4af48
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
