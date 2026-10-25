Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39EE6606A31A
	for <buildroot@archiver.kernel.org>; Sun, 25 Oct 2026 11:57:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=RkYP+CFB
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1A10E60737;
	Sun, 25 Oct 2026 11:57:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HEB45ZWvAx8e; Sun, 25 Oct 2026 11:57:05 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 20A2A60F08
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792929425;
	b=DbscUtEMIjEF1tAY7tbJz+JamxGX+CzuDEqGXdYSi5dK0uYN5VJn0rFN7e4lTVOi+iH/
	 qGQiRpWDXYndrBOmH9O7KNAjGdl1ZLR4ZpAGx9fkHRkfXLi+0w/gaaCZxjhFuOiNB2hMD
	 A6d8KOc8bgmZiIxJNFQeFwrOKSYyg8VJwtJx5Um8c4uVDqywi5UMxo1KRxa0pgHT+B6Um
	 ekjbBSm5Ud2u352653Usb7goMyqh500pQMwYY6LEE6voisEpI5HF8QhQ3v31nBoGVvCEs
	 M0kkWTxILg/WfX9UJampUze/tf7BZ8NDs7qNqEVSIi+aXt61xhpMf/4Ha/zb7AeAiew==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792929425;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=Ev+ruk4beRP+oyne5vu/y64P453WuBX8fcN+Oknv4pk=;
	b=K5dz7zYJ2VdkL+WqKYbzUPxtIcU6SQynyHRdX6DsSxeQTQHHRz1DfP55nVzeELRBNpW8
	 XV+eONxon7sOpyCww4b0z8DuEnzLjHWC7MbWnUPjAC3zO/xhu6Y1kVWHhbr3NKBas0yTt
	 gNDufQSq2pFsD9/ZRcvZWKjiupi28RGeAhu4TnbUEmazpQoM1KnZWCTTowP8MLtm7lXlw
	 a1rnZGir1ZQedV8iOgson42qAAE47v0uAfjSy3SqCUnU17ACGrHF8PltSnqIaQjoCICIa
	 79wWd304T+5xYTy55Qll1OwAL2XgcQMlk1FJ7M8VPHLd9E9xR/zuH7AAlvey47ob7gw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792929425;
	bh=Ev+ruk4beRP+oyne5vu/y64P453WuBX8fcN+Oknv4pk=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=RkYP+CFBmPu5yImWNQleZC9HbUiDr3uirs1eQSRFFDoUfe4NBrBiQnw70ffQmuu9Z
	 gDXwzHIF0lZXcg0zX8f+TTywtk1o8vC1duviegz5DBgVl8b5BGRi1DaUse9kMAOjA+
	 zhbqeBeTBzb/gU6DOiFPR2jf/mcG80DCBnxEOF/rdIe/dff1Lzk5hC6yEh0A4oyk+c
	 wRBoqT0LsdSURtLHVxhR0Wl2pG2zTyt05ozVKFdtaJLJye70/zAprj4qgUIPLpB20X
	 mDSPU14syZGnFB23HZVUxsIf/H6e3oV2C2u8/gZCTAjc+zCKBHoyL+HmYq0fN6ayfX
	 Hqzv61qPtBi5Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 20A2A60F08;
	Sun, 25 Oct 2026 11:57:05 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 2788C43
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 11:57:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2566A40A0C
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 11:57:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Fynp0RNmr-hF for <buildroot@buildroot.org>;
 Sun, 25 Oct 2026 11:57:03 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 0270C4009C
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792929423;
 b=IwHw7dgrdjh9WfwEQF4y4IVPzd5KZzS96+cp7V2eW5Lor8OeIFQGETCAO0hbbya0Jyoq
 rhW+e8Tnllcn3TfNvrPoJZdL7S00KUHO526P7L0k1SbDFKmFMgQqQPHnQrAfQ2eSSyQkj
 H4L5awJWgjTh8MVCcj1PRh/jZ7IISEpzuo1QD/G0I8wZ4VqeFCMg4l+qjR6hoBIcmG+hI
 1a+qGwRQ+83c9ptXPbCy5GmZS3THD8NVFNPqCa0+8MEMeMJ3zhQkq76MRrXPzIFC4FFxN
 USPMq8kfWLJEpQ2QtCqZ3PpKZsBcEVLs1baK0EQb5yMHEGBg7SEnsiFMlpm5KkKQsPg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792929423;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=h5huviI9zbVYiiR2vHWkrn0b2hRwk/XqTP0VPjguiIE=;
 b=Ap0IVTg4vrkbzGEJ0PvuW+8AUP8/fh39RG4z1ithTQk7Mei9/u1Ff4MsVrly+gyUGkrS
 w/INbTQZdO8ap2yfdJM1qh2VT/vdHKMzlaG8Dv/aVX9nI9f6QegAaiT4kNGXywdNIOOXx
 H/BisgL1VcpADtoBezXyPwQTd1BKQHYa/qBNbE6V9zLb3/DoVf4/glGa4l7KRvHJtA1rV
 Tez2tMHJnWrp2tCr8eJQ7wpFEb9WSnuG8UAHSmFDwXp2THGsag7tsZ05ufjYow9quNl34
 Ma2tavI3bOvD1YV2Bazc3mrForCodTF29pTqRjhApp/9ufsYJKHIHNynNoSDjEE4KKw==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=free.fr;
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=H6Ocmo1O; 
 arc=none smtp.remote-ip="2a01:e0c:1:1599::12"
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0270C4009C
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 11:57:02 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id BC49813F899;
 Sun, 25 Oct 2026 12:56:58 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 via
 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr with HTTP (HTTP/1.0
 POST); Sun, 25 Oct 2026 12:56:58 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Sun, 25 Oct 2026 12:56:58 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20261024182913.1957467-1-james.hilliard1@gmail.com>
References: <20261024182913.1957467-1-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.20
Message-ID: <3359fcbabeee6bb2e54cc4cc5473948a@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH] package/python-aiohttp-sse: bump to version
 3.0
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

On 24/10/2026 20:28, James Hilliard wrote:
> Drop the Python 3.14 compatibility patch, which is included upstream 
> [1].
> 
> Update the license hash for the replacement of the abbreviated notice
> with the full Apache-2.0 license text [2].
> 
> [1] 
> https://github.com/aio-libs/aiohttp-sse/commit/9eec5f5b0355bb3853d0e4f2af6486c9a5887e38
> [2] 
> https://github.com/aio-libs/aiohttp-sse/commit/390f93d64bcb01db32b02195c8c90d2fafe5d8a1
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
