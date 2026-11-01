Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE642606A324
	for <buildroot@archiver.kernel.org>; Sun,  1 Nov 2026 17:14:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=sb5bi2N+
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 85B0080C26;
	Sun,  1 Nov 2026 17:14:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bm5NyvdiNIq5; Sun,  1 Nov 2026 17:14:03 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org A7B2F80BCF
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793553243;
	b=EfzaL9pj75Bdyv1BlAD4d+kO4SsXbb1vlHfF6BLM3A3omWNbz09zAhsBtoS7Lpxn6wv/
	 PMcJle+gVn4Yqdy7ZJ40aKpokG6W4WlNkbrXAlOvVIZYL+O43yrJ2v1h0GJzE+ioeyopn
	 UL1EqUsjOT+0HR78ArsXxR/+QP6quBGg4P3EDWt3WcYzcTHtm0tc+M9zvhgJmYvq4i9JF
	 MsrEUfpQXq/qc4oEJLjyR3r2vtSUS8sCjpCt2AvX49aIhuFoyNHo5VDF2Wj3OqorrLAtO
	 Yz7BliUCdcPdf2LmEmtMiqizn1DWFAP4XyiNB6Q9akqQNBtEGAMKX3y6nuoIahbOwTA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793553243;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=SXCdqy/E5QhB+uVoEOYFdPbmR6gUIiUsekuOVbTTQNw=;
	b=ZSsm9/usPsxKLNFx3Wwy10GyC2V917JffkBH8eKTBKmgkmtzz9LYTCGx5DpE8uJJ6VRi
	 ZqqUCdIrVYMxb6SbH9O99Urd0slDjsiDvtwHGdtHLYkhDs0Dv/nPEpbOEP0B+4CCvSaCd
	 KxpZHj/eaPxWNXb+8I+BOj6jiZmP1vJ8JyRLRADww3FnTLBU60ieS0arolX6ugk9Jz/03
	 c4N9i51vegK6zB6fcbR4N3CNSibAfP60D5iXwMEkxYvhGNUJ6lEmeT6xO4faFPlcbBtxF
	 oqSrMZONYQ7H/YjxPr12as2B2Rc5elwRPJ6BDMIpPUg4FUajXICi2DhTTwPaUq75qsA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793553243;
	bh=SXCdqy/E5QhB+uVoEOYFdPbmR6gUIiUsekuOVbTTQNw=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=sb5bi2N+wKSDWs2DC3keNMPt8dbuPP+aLkD8q/e2qNNvNjFqU3bIzC4hj9mBzIVhs
	 15oEYTiFjkVmbYWmh/TJ6zRai1oPYGg7RcNuWnjNegZacJBjjnQtk64dVeA3WyJfXI
	 nrZaoRAsbKyVzx5k+k7Boli3i0c0PeSzpvI637r3SeQecdJn08eedyV3LIxnieATVH
	 zeOGF4RHpanrylVgpoZYW4utek8EzNH+wQnJxlqs6w3pK/HPiJvHv5/B9miSKcpkB0
	 FUDES7THP4PU/cCSeMNbdhbjWIWM6nP5ZGGzS+3eZUF7WW3C/cFbJxucKP1iUFDxji
	 kpYCG6SjKbvHw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A7B2F80BCF;
	Sun,  1 Nov 2026 17:14:03 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id F02413A7
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 17:14:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D623640076
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 17:14:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ki72cPZPEO5o for <buildroot@buildroot.org>;
 Sun,  1 Nov 2026 17:14:02 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 3BD3D4004D
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793553242;
 b=IvlgsqxWaeJYj3+7Ap32WeqxUo4mS3Ney8YjFQLkiywlVpbZq4DEFqHr57CXFJD+HMmt
 APv1dYGV2cjP94ryqpYkFvF4JEW6wjBZ0KV0AKJjyzUbEvO3l47KhSFNiE1+Ef+Ki5AbL
 RkVq3CNa0X9Mw65xrIoqROoaSjERGBa8hBotz8JULRyLvQDIRePSJNKv1ckDtq6cRKdk5
 +3lY9fkUEOBdpUPNPGLoow5tkPXbfa6nqLMz+oU/CL/Fok214OtnFrANTVIwxkTvwKH/0
 lVeZFzi5KE9A0a4oHvV658hi+EzboB5yjiHg2xywJ2/TodMgc+7XbDwrd4XFPJJGasA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793553242;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=wFB8ldEjsX0K9rqWZQr37tBRKhJIB1pZGGCrU11F5P0=;
 b=XQSglBVI/NyvtQSrHkm4xWwrYnFGwcuMBbeDcFs8nscahXlNSJ47nxGzuqSNkr+hnHUj
 UnF3JSdcIHIJXYAdyQ4cG1CD8gCo2XgkMdsf2VOsmXTxlJYHA3EGRuNQs5YCarXf+z6VW
 6uvRVapeKzZi/4qEmt8BQzYrkShSpPCnh97Cp7Mi3G3HpZUDzjx5F9T3ftXOH0hzUisrw
 A3NT7sDUEtp/iPWle1VLRQGUQeBRoGaSdl4UnTWCL2op3g62NX+G4UCI6OLJUXaJdLmPw
 TBRKxHdtRSUDvgDO6Fgl4aPDBp6yC/YKx1EOUlBvYjiwxYFlxPuNHAsEvB3E/98UFLQ==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=free.fr;
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=YkWZZbKZ; 
 arc=none smtp.remote-ip=212.27.42.2
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.2;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3BD3D4004D
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 17:14:01 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 0AC262003E8;
 Sun,  1 Nov 2026 18:13:57 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 via
 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr with HTTP (HTTP/1.0
 POST); Sun, 01 Nov 2026 18:13:57 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Sun, 01 Nov 2026 18:13:57 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org, Joseph Kogut <joseph.kogut@gmail.com>
In-Reply-To: <20261031172019.2683287-24-james.hilliard1@gmail.com>
References: <20261031172019.2683287-24-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.20
Message-ID: <eb89eadf0a5fd4e219444a61a5b332d1@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH] package/python-websockets: bump to version
 17.4
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
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
