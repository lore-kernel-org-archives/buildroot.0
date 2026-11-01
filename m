Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86B0D606A324
	for <buildroot@archiver.kernel.org>; Sun,  1 Nov 2026 15:04:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=PQPdNUNy
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5E4446060D;
	Sun,  1 Nov 2026 15:04:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FEJqjFONTnwP; Sun,  1 Nov 2026 15:04:46 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 3FA7C60612
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793545486;
	b=bXR1LIw5m4MimnDYzuRy41MRnfp0TKHk+BcyW/c6y1KGTxOb/x5GZVvwIqrrZfecnY03
	 Hmp5P9vapVyxDMgE6NP9XcgEYna2BYyEX/lr8Q0sQ/ExzQpbQnOMFGv27P1QD+iZIS0l2
	 rh6bloWUnYl1Tli1d7rSyFWB1RP0bTs0/MyL8pN6oas1VziPra1e2WIODhwnH9oUJgyc2
	 X0S93SOiEwdowwXPHxRropKhMiQn2+EACf98fH9X9aReAi17BOcWJTMScchj/4YLvBf0v
	 WHZo5oIL6HX79/xwc8qEZqL1Aij0MoS3KjfFlvHrCItjAvJSIVOUKW8omzL9lDZEQNQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793545486;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=FljsSeoc2MdstK6FZ29iR2+QfTyuQsCTGB1n/fnpUhE=;
	b=SOPEGQncjoWsgp4VvQWtC2uW6oMQ2zLiHVH4IX5taxuT3svEecPIf9jaGj6wrKvqamk6
	 WeaqdHMYgg0uJf1L8oGXcrQLHU9x4TxYW0HxkE8vsMBu6Y/qdf3GzB8m/zaKlC4h25yKL
	 rf2lK8BafcFOO8f4gLfuAXdnpiFeNEa+CHr0OI7pwsWxeiaMYg2UZPHPtSC87djRzvder
	 E35MFtunPvOLwqNKdPFAU5u2YOyxm3E5CEWtOT3Vh1snxwPPZgCKzPzfBNSOoccbMf+xx
	 ClVn5MsehH9aP7y2x6TEUc13uXscvL5WrK+pZCsL2O+LP36B0hXwxYDnUVEZH9eEScg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793545486;
	bh=FljsSeoc2MdstK6FZ29iR2+QfTyuQsCTGB1n/fnpUhE=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=PQPdNUNy7fbx4Y0dB8rKpn7xMiYYTikHP4O2pQX7H2xrBdIEFAVpValKfVivsgc5H
	 npA3MmjMLiD4l1yI50L7vfIeo4vUTBUanV2YhQRP2Qo4CSiuFMYT3XcCvLxbF8i5Ft
	 4/0f7tzgoTFonjF9YIBLQ5fIypkjhmRTyHBnNa5RdOLXKVyhONzlHAiTPPtVeyE/jS
	 LfNO4//Ynv+/m4yQh/eWAWlKfjQQMQgJCQTXDJLGUhs/1fQAWvU5OyaD2nZyty6qTc
	 MxtJq2TS6wD/I40aCu7TeiMsGHEPi7BydNjOvG/rtDU463G++cwrxiru1YS0e8RkGo
	 vxfsdOHqtT37A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3FA7C60612;
	Sun,  1 Nov 2026 15:04:46 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 19990380
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 15:04:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F38B84009B
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 15:04:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rvTVKoLryhZQ for <buildroot@buildroot.org>;
 Sun,  1 Nov 2026 15:04:44 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org B24A44004D
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793545484;
 b=eioISjy26q9oOyBsKhWi6MNJpVgKAXN7Nn1QwI0qiHo5+hMRNBY6qcE59Ie3OAxv3CBJ
 tCfiDnaschaOpygk7GR2nrM3KxGbSq/I7ESZQZJNfI1htMNXYrr5dbAPk/iOeB10e1+Pd
 gjpW+kZdeX0Nd82YNZHssCyeNJGcI6wbTPgu3uUgbK8wXuNyP9x5xas99oy2igIi4ed9K
 VssdwqZ0qApKcxWqPZtu5wL1vY7xhj0uBGH3C5YispRyqLmEUeU69VyeOMWvD1gF1Vf5B
 Qv2sV7vO3oB5dkwcdRKyP/Bma+c94tigGrEs187DLDfKI7aI8fE57LYZETPZz7qj3Ww==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793545484;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=m25dGjcjM+rniMAzhZpbYS+R9fWivhI4didyyn4tPFQ=;
 b=kmvQ5w0Di990oHYox9aH+wE9tdaqkr0W1wRoHqNDbzDn+1r8ueOTpkeEMF2owYeSaf1s
 ucyQ96rcxQosNSOthTGEBuK36VGfXJ4oEyVSi506PPtVLQ8g3AEMclNx8qLe3c/n/+bUA
 yAglzusTktQVHCOt5qP4nwKyV+Aj9sgNcKjuu7JXlmi6nEeOeWwBV/4ZkDo/Zs3cxYyvw
 kyNUG5LFuUOzrau+K+P+wA0eYCLQJoXc9tnR6DwqXzmDLsG28NvBjKhk+3vNr+OlSqJOi
 /RlM63TAUks3j3ygeDhcjujeYbbODlvFa5kTo2bKblix4dJG0p80pOBGpuupbKRoi6g==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=free.fr;
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=Ua5uqSYh; 
 arc=none smtp.remote-ip=212.27.42.1
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B24A44004D
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 15:04:42 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id AE7A0B0056A;
 Sun,  1 Nov 2026 16:04:35 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 via
 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr with HTTP (HTTP/1.0
 POST); Sun, 01 Nov 2026 16:04:35 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Sun, 01 Nov 2026 16:04:35 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org, Manuel Diener <manuel.diener@oss.othermo.de>,
 Thomas Perale <thomas.perale@mind.be>, Oli Vogt <oli.vogt.pub01@gmail.com>,
 Marcus Hoffmann <bubu@bubu1.eu>
In-Reply-To: <20261031172019.2683287-2-james.hilliard1@gmail.com>
References: <20261031172019.2683287-2-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.20
Message-ID: <79cc960506a27e0e8b76ee05b25ff604@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH] package/python-django: security bump to
 version 6.1.2
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

On 31/10/2026 18:19, James Hilliard wrote:
> Fixes CVE-2026-77050, CVE-2026-84429, CVE-2026-87890 and
> CVE-2026-87975, and an incomplete mitigation for CVE-2026-15830.
> 
> https://docs.djangoproject.com/en/6.1/releases/6.1.2/
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
