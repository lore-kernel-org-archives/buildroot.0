Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 318A9606A31A
	for <buildroot@archiver.kernel.org>; Sat, 24 Oct 2026 11:57:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=bsZC5Sht
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 09D1460AC8;
	Sat, 24 Oct 2026 11:57:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8V_96Sr4UY3r; Sat, 24 Oct 2026 11:57:38 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 3F67460A9E
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792843058;
	b=LG/Y+EbIADrx/tyUOZ9ex5NugDBRql4VTfeVp7dl2TQlsCJJ1hHH4jh8H7lcTsVoA3tK
	 8xMVz1HbAwCNOSDVYhYMqqXIHnQAt3m+JniKo0kKC2pezgeddxF85TzZru2PFp8ZImG4m
	 OKCMJ7lHPciVc7MX9mIjndM8genUP8g5YwrIUbL0g2jP20EKuqAcT7T0/JhXu5Eotg6iO
	 40CEukJCW1AP36NrikocBaEbQ1wGDutwP7gv0PpzShMByEUhWk7g2HWpOh9V+fSmi35rL
	 lNchcsxi6kKareBnU+xZXjwZSx5YHvDUDEYi/CxO6zlY8LQPu/9vSMZ5m+oddcD/jLQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792843058;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=ejdEfKrKUy5ciuLUXf28SzGIyJ/6ag1YlEE1Dlxj5KQ=;
	b=kUuh6GzD2qTxeyI9Fkjty8VUl7cn/uh3NMl0O16GUFLTNGVmlHLEen+yWLeRALwJsEMf
	 iDLSOJ79qyJSiuBEMJf713VOPJEaAFHrZf3ETrkJhF8t4HwAmSM98XDpivO8a2IcdoRdi
	 fwuHcHEUWEhNQT1E2fGoIESPG30gTeJtLgimhYZLvHkQ1Tid7mqUm1VjPYmLSXc823Giu
	 MAEr0ta9ed45ZBeWZBHmjrK7kguFYYzWorQTGOBe5NP8Hgbr0+twTfchKcVNSe0zTl5rA
	 KfDM9z9WfOjhtN98Lku2mFKos6slKePctKxcO8C4um3IG1e4Q1x+te3JjebHo0XimSA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792843058;
	bh=ejdEfKrKUy5ciuLUXf28SzGIyJ/6ag1YlEE1Dlxj5KQ=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=bsZC5ShtWt8FyBlNDx05SYBEEuCl0VM6Ms9dazUFEkKbaHWfXZBPth1wF89PvpkQw
	 inkYgGu/LznzKCPF0lg3mjAISI9aZ9FgAJ3oUmbYQt4eGOPhaYjSqcWmUVFUEq0oMS
	 jvQwkjYRHZvtpRYIzazUDjKr4x40N0d6akSUmEoFoM3Bdm6mi8I3eXdHhdRyubBGv1
	 mT7bDpSP+CcJ7AisU9CrcbWZZnMVQOK5ZXBT5KLm89xOYz2EBCGriwHj2MC6UEDg1i
	 wT/Piq+STogqRqw5wk39ZX7iBz2gg1dQDUaWvvDmngzftYWbr52Vdhn5HTqlsxasU3
	 neKTu/IZDIvRQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3F67460A9E;
	Sat, 24 Oct 2026 11:57:38 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id C32DF356
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 11:57:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A93E340A84
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 11:57:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id S5mcpt1WUnPr for <buildroot@buildroot.org>;
 Sat, 24 Oct 2026 11:57:36 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 1D6EC40A6F
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792843056;
 b=FGBmcCovB2ReNqPBOVMjMuem/f5vHWpT5IBswFjIZ6d78y1K8m6CP4HUZNpWsCQndf+i
 fJ/hcsm27IWr8tX6elEPtyux1hn7k+AH+554Gh/van83TqMHfL7yVchgrYCPHNmBESI52
 7tTyWQk25IHmgZUAIjWUGVWSiK2NvK9Hlhzx5C8tXViH3scNbnV2b+yzeeqQ4rxmmAohm
 O1cs/O/ZzfYrxEcevQAh3NpSQ65hEUr5c8wrfUSZTVPZz3AnrB2Z17VZs9stxepUK+z0V
 UpKmxaMNXZhbHQCQaW48TxvY1I33QZBCYLVLHmAb+nD1gKKzc7Ire92BgKXVOyJXk3g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792843056;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=lqmJULBsuA5sY6aLE7QBVEwzBn9VEoFffbFhDtJ3yQk=;
 b=jiadvL7luvU6ox6U8iPYX+y4TR0imFlEht58BBo/Sx22sOcLCRfvlaHvbyIgPKpiFNib
 2JiZPYyar4HP8mC8icAFJDnDqjZLMV40wZ5wzYDpDcYud5/ck+1draFUBYunHJqYR7mol
 iI+b1B/UZUHXH8oeUTg2gxOGurUQiig8Pwk2LNctehjbK9cxemRTGgiLNLY1FXNwB1dGR
 XBFLMx7VpTe2axNkgzE4F0hw75SbiUDvseUhqS0wlbrYm8bFFDEqBha8aN5vrG5MWj0lS
 jRweFFnSUOVu1dMWQsuHiILzGYny0kAJ+6ikE8eHY7nX0Kz4gbKhviijjFSURn9NKJQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=free.fr;
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b="CEPb7/8S"; 
 arc=none smtp.remote-ip=212.27.42.3
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1D6EC40A6F
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 11:57:35 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 02DDE13F88E;
 Sat, 24 Oct 2026 13:57:31 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 via
 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr with HTTP (HTTP/1.0
 POST); Sat, 24 Oct 2026 13:57:31 +0200
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Sat, 24 Oct 2026 13:57:31 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org, Grzegorz Blach <grzegorz@blach.pl>
In-Reply-To: <20261023181818.920329-32-james.hilliard1@gmail.com>
References: <20261023181818.920329-32-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.20
Message-ID: <c2d78e52681193c7039136429dfee983@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH] package/python-wtforms: bump to version
 3.3.0
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

On 23/10/2026 20:17, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
