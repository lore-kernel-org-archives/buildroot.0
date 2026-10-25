Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B0F1606A31A
	for <buildroot@archiver.kernel.org>; Sun, 25 Oct 2026 11:58:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=n2PwjS7O
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EEBC360F0E;
	Sun, 25 Oct 2026 11:58:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Vo9ooIrL5gk0; Sun, 25 Oct 2026 11:58:00 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 1F22260F08
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792929480;
	b=kdtbbvqrGFOHEIe75PADUymYqN43YHsoUvN8xxheKG96ThKdavBWmAknOnXaVXlVkb2H
	 OHE7x4JkUDGzRbtyF7y8uSl1vqMKLctsi7Me3QtERmDhKnQ93uSGTfgsC8BWvWRtqSi+U
	 uLdMXXBhq0W37y5wxgbRuOoBr0xAtvGRpuawUccMw8b0DELgRVtZvU3G04mnGDDam1+Ex
	 fky3EbvDDnh7GlVuW+3qvrRho9zLpPUl6MtG7jQ0F0kVhOsTq20JmQ6W4rytjMXF8o8g9
	 dd1ChL2K8+DFRWuCPdS7WsKil2SIOO70oP0AW/O9ITj0LhtB7gkbPB00HiELT1reZ0A==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792929480;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=vBphuTvSwFZSEBxvf84Ko2WQ7Z0sNQeGPW/t0j2wQGM=;
	b=pjfIkSq1VyrqNpf2CW2d9tPGE2xXcx3MQIv1w5DniWnpwH4g2Fb5xCiUEQK6DoJOZ7P5
	 LbUmfJVq1urHEEMT6wG3fnQ1sAUcqH9HpwDnGAT2Hcjp8MFmDtJdAyZ2Coe5ruYPzEVz/
	 BNbP96/d8tYBP2zA24x1PCEVaUdnvA6U0peJh0RBrE8Oiue573JfpWPqtzkP1idFkmBiD
	 0D4k6fK+te6OEu74TE5GIQmNhBFAnu5e9x47otx9sLhMEyPjWd+RUpGuCcQVL9ieuUP/E
	 VDqQbjm5m8TiqeThXb1rKYKMgvY6nS15/AWizbVrDjmpndPLj00fz7gXf0T5E6DYtZQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792929480;
	bh=vBphuTvSwFZSEBxvf84Ko2WQ7Z0sNQeGPW/t0j2wQGM=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=n2PwjS7OZcB70NgtgaeoQeAaxbhbrgQZtRcTqm9iNWoZ6xBQVxfnNo2rp7mnclofZ
	 FXj9USAoy/PRei6wUswwuzhx0g0Bd9mWkc76I+gdIVUgXEvr/8t4xRv8v3iXCk5HUB
	 EcHUfhbKh/PPSui94uCpBtgJC1egbI5DHcAc19ZtwAuDZiwrs3Zk32npYPc0zbavyv
	 zabhY3bgAmYhPVQ5uwo/YKX/w2iq5D0aqjb9lMr8RR6hCAejqLdYDD6E2lVHK9PgBU
	 XXzcttnA294ABLn1dY7C/WFYdQ+8L5Regssm+8+FIgJURv04UPBYoHr9pIO7xT/8bT
	 hCZlueusBo/6A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1F22260F08;
	Sun, 25 Oct 2026 11:58:00 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id CF8163AF
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 11:57:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C0B1E40A0C
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 11:57:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rTuXx2az-oNo for <buildroot@buildroot.org>;
 Sun, 25 Oct 2026 11:57:58 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 025A0401F1
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792929478;
 b=PPsl3FWJxMbFUgxji3KejFTRJwayIObxmYXGRphlXuKZtZhFbedFE0Dqs55Y7OjYRk9e
 X+pICKLtCasnBXn3Cqj4JdPNjxI4cjwTigDAaFKj094RMca2lGjpfPZksLWGY71+bhOr2
 wFkkhVoqsliBQAX8QZK5cA74e6e9wCqNKa2pGoPGII5btwhrNBqro/iDbv9n+6e0ufTsV
 074Lk98OVVDgcmqtQ5jwba1Os/pNQ43si78j5JmkonJ/N4d0Bf2vVD+K26t2a3vXowOKG
 PlfPwcoLmp7LMOLec+2UQcJm59wGWN2NH+oiHuGrp+8UVsMsXlEwhANO9svocy8Cd5g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792929478;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=/9FrawC+wtKBmDa5g0IPJ/VR5VXP1QSKDpF4h+W+sE0=;
 b=IbVEQziO+zKAwieYjJxWDtIuIzgxm2JjUkfW8fmaxyjWBh7kbLFqaAUfNczLuPV2XKeM
 z6lQPBZDmz94ijv2r7D3VcS6wPvsaCUHHHniHwGQmO1aykcPj8f6G46uHlQPMJTTGG6TF
 DP0xAr7hUdZvPuTSME/MHCOLu/dy3h1hL2zlnMYlMeA7Q2DJeZW8QCyzL6FE6KjmI+XXg
 qtHmfEVDdCjT6aIB/E0YsdZBeRy4P2kJZfYKD/kdb7/bgTum8JWyzrUnKdVEDNaksDnCU
 ywZDufTC/ljz/Zy8EQDuqO7pUN6i4BP9R/bYx55wX4GDxjxHJ3XiPOC3QMvIeYEifrA==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=free.fr;
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=fPDJHWDU; 
 arc=none smtp.remote-ip=212.27.42.5
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 025A0401F1
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 11:57:57 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 16A495FFBA;
 Sun, 25 Oct 2026 12:57:55 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 via
 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr with HTTP (HTTP/1.0
 POST); Sun, 25 Oct 2026 12:57:55 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Sun, 25 Oct 2026 12:57:55 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20261024182913.1957467-4-james.hilliard1@gmail.com>
References: <20261024182913.1957467-4-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.20
Message-ID: <fc934e016a05d692025670a535f86af5@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH] package/python-multidict: bump to version
 7.2.0
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

On 24/10/2026 20:28, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
