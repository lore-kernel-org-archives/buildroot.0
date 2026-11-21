Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C789606A320
	for <buildroot@archiver.kernel.org>; Sat, 21 Nov 2026 12:13:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=Gby0Sk9j
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 464AA40A83;
	Sat, 21 Nov 2026 12:13:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8Lpw8s0aFTfj; Sat, 21 Nov 2026 12:13:35 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org A5C124077F
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795263215;
	b=Ti+Zy9nK9y0vogQMCLqfgCE+9PTXDfuHkNNYDGELz5+RzIqmkvq+IWXqI2e/ZcsbXwBp
	 ucCtxoBEQeK1dy8Oihk2GnVRj8z2TuK0OSRFYIOWU86VIsCr1dP70+hkXn0Zd3YXjzACM
	 TDz24/MlU7k/vMNqeTwB7OECYBF8cHR/cePUogsg+yCYAz7fXOWRdj5j4pHvZlG9+tzpA
	 OZEyLah8drAXOevq9L93XRKq5lhX/eGQIBlP+APbCK1PKhbe+oJfUoainkOo5twYm9DXG
	 mbV3plCBgfMyd1ZtfA74fqlFqF2AkWdmjWo3WQ8ByektX3S4Sxs8UFtQJGwupk4uR9Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795263215;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=r6eXeRwrJeHvcORj/+juaeU+QD4wy5Yz2LCbAqvvf7s=;
	b=ri8BW6V8uewVMZOzRjM5+jZT7f2VyYgiqdYYjWJoGkLjcHe5fSWe1yaSCnTMtNosseE+
	 KatldG5GP9KjEnKzn15n2luuK0Zb9CVFx0opQMifcd3TOEZqu6ZcU1Mw2IfLUIOJihsqg
	 XfD0goGEvXK8zNTdRRIZHk0Co3UIs4CMaRONZ9FDUSvYJKT0zdnb4BLXZscdoCGkes1Zo
	 UHWy4bZc9pYVGnmeX2zVHx9D92apM/wWIBWlIY5+1oj9xkIs9XoUM4TH1qPRkuZK5eh4G
	 wzYJGzVTZISH+s2I3OSSl+jVbisa1/bJs19deee8ooDphl/soTZmhsYtLm+qZCEJ47A==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795263215;
	bh=r6eXeRwrJeHvcORj/+juaeU+QD4wy5Yz2LCbAqvvf7s=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Gby0Sk9jy3BO7lJDQBW0XGnsdIujCEIEATD8XAB1ochEE558offyP41F7sjDVe6du
	 25F5nRUq+/rISZN9E+Jyi5KvjlSChqxg1vntgVa1harNYIDtXVJKdd17+DquwIoEMz
	 iq5kPSVWqlJ4q8k1bMAaFEkiq4F2OpYk17Nb4H0dic7PJ7iwn2W8pZBGbBNVb79GYw
	 Ffqxn/jnuR3eIT1g0YlCxK2ZzexN/iSJhNWjou80W1Oc839upDrDakkRcTa4HeyH7D
	 6dIeK6Z7Sc4x83kEl43KkS/XCAVWqNlLJlI8xKzyhe93xB414ilR4Hp58V1KN+Ksn9
	 Q5GiQVuQUqdHQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A5C124077F;
	Sat, 21 Nov 2026 12:13:35 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 89D8B9C1
 for <buildroot@buildroot.org>; Sat, 21 Nov 2026 12:13:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6F78760642
 for <buildroot@buildroot.org>; Sat, 21 Nov 2026 12:13:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id r3Ad5r81upkl for <buildroot@buildroot.org>;
 Sat, 21 Nov 2026 12:13:33 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 510CC6063A
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::15;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 510CC6063A
 for <buildroot@buildroot.org>; Sat, 21 Nov 2026 12:13:32 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 7EBAB780516;
 Sat, 21 Nov 2026 13:13:28 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by localhost with HTTP
 (HTTP/1.0 POST); Sat, 21 Nov 2026 13:13:28 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Sat, 21 Nov 2026 13:13:28 +0100
To: Fiona Klute <fiona.klute@gmx.de>
Cc: buildroot@buildroot.org, Romain Naour <romain.naour@gmail.com>
In-Reply-To: <20261120221531.842658-1-fiona.klute@gmx.de>
References: <20261120221531.842658-1-fiona.klute@gmx.de>
User-Agent: Webmail Free/1.6.21
Message-ID: <b62b99ed7287de95f15778f0a3023cca@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH next 1/1] package/qemu: bump version to
 11.1.3
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

On 20/11/2026 23:15, Fiona Klute via buildroot wrote:
> Significant changes:
> * {QMP,HMP} monitors can now be created with "-object
>   monitor-{qmp,hmp}", "-mon" is deprecated
> * glusterfs (deprecated since v9.2) has been removed
> 
> Upstream changelog:
> https://wiki.qemu.org/ChangeLog/11.1
> 
> Signed-off-by: Fiona Klute <fiona.klute@gmx.de>

Applied to next, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
