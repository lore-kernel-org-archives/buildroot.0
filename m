Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCD3E606A31E
	for <buildroot@archiver.kernel.org>; Sun, 15 Nov 2026 10:29:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=FaS8pKuj
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9BDD74070F;
	Sun, 15 Nov 2026 10:29:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CMv4j_Nov9zY; Sun, 15 Nov 2026 10:29:03 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 9558340711
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794738543;
	b=Sh0bTUeNP286U5tCGpx1YRMetmNDAzYfbl3msF4J45D5g//LqJe6ck1x2e7O8VZobbic
	 mZOF0o5G/iXRGBDVjUb/L0SVNsPAMyvFjI5CU6lvZPSDb+XTCjnVgWWfmLIqPQ3Li0mwf
	 Uf7Pj4y3sLLM5qNUWfdL+SbxYSP86mgiAbhYYYXWTyMZqIr/zXkc6u3BAU4T67vxTbTs8
	 eG33rP4XvOlSFwayVwNcu+OxosTHg4c1mDpnGoM1k2506dWt8dEwpLG9oeguOaqK/Jl5r
	 ubM/2QsbTtTC8BgXUvsjTujc9HWG3xSRgJlxgQO5AeGvwxE2a/JRozkGrkLKdI/Qz1g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794738543;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=ELx4NBiRwjIklnTLDlDY6hF1bWqJr3VGUeJr2IxSeRc=;
	b=U/2yfKY1mHAZ0VjOHXkD6Z+qzLgruKxKiiJ0vsnrAqzfbyjkJ27ZxCURQLskj9zPGp1n
	 hwU9wrD7sxCbJaoztpOP5tbKD5a8uLa2axkJzvG8cKlmTKRPX5x0OAaEaMvFVPJJTWFVK
	 X8i9gIqf/1KBQZ4oibleEJ1XRvMTqbS3+hHMESITukS0wYEvZp1Sjwiew6x5ByEJrC1xO
	 5wnZqmeTjWD+Ce80xAqzc0RgCl2K67KXPGXyLyZU8Jw1rEPf8Qz8FA/d5ctAN7SjdWX5H
	 TxfngBcfvNePALOgi1yfADmVgF6IFZy4DP2645XcMjhk/R4P9XAA1GbQ4PXr3vuFdAg==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794738543;
	bh=ELx4NBiRwjIklnTLDlDY6hF1bWqJr3VGUeJr2IxSeRc=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=FaS8pKuj7vazFCTKAO8HU1PLp9oQXng8x3ks6OuGLomBgW4wQzg2PlARv9q0c+knn
	 2kn1bJcquI3eR50+2NC1edKdfN1BhRd+jBfdp6vXD/B3XPzPTK55tIuEHpGNPOExb0
	 eYqK4KEQlLQEwHpyLPxNqLHEYbODHbPydn6AU8Ojbcrb4uZ4QZSU9FlbaQflhDO4lh
	 kgZjSQCVYV4zxGVnO2ybIe2DINj73AWLR8qLVPESieGEigOPDlszJIwO23Fb4hewK5
	 TBmXOWNJgmV9J/vGXmDFi0FGk6cKxGLkAbZhCnDh8h13S/tw7j1mQe72kAWS5dgMHn
	 8ax9KSeAeOqcQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9558340711;
	Sun, 15 Nov 2026 10:29:03 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 0F1FF2FE
 for <buildroot@buildroot.org>; Sun, 15 Nov 2026 10:29:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E691E40079
 for <buildroot@buildroot.org>; Sun, 15 Nov 2026 10:29:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QjuL3x5oXr0K for <buildroot@buildroot.org>;
 Sun, 15 Nov 2026 10:29:01 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 95BA540061
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 95BA540061
 for <buildroot@buildroot.org>; Sun, 15 Nov 2026 10:28:59 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 5193EB0051B;
 Sun, 15 Nov 2026 11:28:55 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by localhost with HTTP
 (HTTP/1.0 POST); Sun, 15 Nov 2026 11:28:55 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Sun, 15 Nov 2026 11:28:55 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Romain Naour <romain.naour@gmail.com>
In-Reply-To: <20261115081722.31558-1-bernd@kuhls.net>
References: <20261115081722.31558-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.21
Message-ID: <67a4502cda0b53f6d29605367787ed79@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH 1/1] support/testing: test_glxinfo: add
 BR2_i386=y
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

On 15/11/2026 09:17, Bernd Kuhls wrote:
> Buildroot commit 86240fa45d11e3388968520b4a35f0a40954c132 switched the
> default target architecture to AArch64 causing errors with this test
> seen by the Gitlab autobuilders:
> 
> WARN: defconfig can't be used
>       Missing: BR2_x86_core2=y
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
