Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13FF76070E59
	for <buildroot@archiver.kernel.org>; Wed,  4 Nov 2026 20:09:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=stC57BEJ
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 874064040E;
	Wed,  4 Nov 2026 20:08:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hj51IvkqvOPf; Wed,  4 Nov 2026 20:08:57 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 682E140965
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793822936;
	b=GB31xOOqDCVnWKsI2ypJddw7hwl5Xz6++36OTnbmqAezwHgNPR5xI0M3wDfQHDegPbqj
	 gtYx+943z/tQKowCPxgfh9XGjADkHaHy9LjHDLhmUww1F5StjbfepHgfuCcDgirgRebQ7
	 pRY0Ol/SzQu1BKv0bDej/ow9AjNavb+TtBoYcHPgXd4zyD+G8y9fHZj3Hg3HczLaNv1Vg
	 hf+KK2wF9SnAbizr97dLlEUqyyAbUXxXn/KulXENWsB5bDsFUfVPEZIFJ1oHqSiiRdzRK
	 4x/a028zxHOyNmBSGagDJ34RhvrVsKSwA+6HvLVPRyP4QVMsXWTurwwy4cl1p638d+A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793822936;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=/cnBsNco6unbD4yMpXZoWaTyM+84CpJvtgIe6bAngeU=;
	b=UAKDES0jgD62veZigbB1U92A1h2c42AhtYG7mF20aXTzrYCFsU6O77eCMGrUBZegCjTb
	 qeLcncTs2smjWmGBWGHek7RQvDAXrhGyNX3e0KQQbSYwhhBQYygd7IzN9dGoVNF510xf9
	 7kuY+tf2TbUSnUAAFCtJhH88OIBeOGM8On3JNNxT+oHDm8cXmD84Hd1v5ghxoiwTOYxD4
	 X4L5XeOPQSL+i/KSOarlsx+eco3nKr1cpie59w3PVY1UHCkVbfAXtS2a6mh+C2CFacNQ2
	 AcGW2wpNJ/R9y8LmP+hhmVFE5/rrqljDWjN3fwr4t68YM49tFOb0GMQo/mGtZDMmO5Q==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793822936;
	bh=/cnBsNco6unbD4yMpXZoWaTyM+84CpJvtgIe6bAngeU=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=stC57BEJXlzHOIsmgV1hGCogNc5EO1qFowAM2dmAaC6izgbgwiTlqsj4I8Ij3kX35
	 jZ901MF62ZDhRqmAMadqBC2T34BevDrIK8PY9qKWbzUsHX+9yYvZ6/HF+8ZkzHdXIW
	 3tfhrDtnMBOjWR7E7MpeoIot9D72SlGR7uaRvDpT2kSjcFpEBKMiO69F6hphUUmbTP
	 VS2enYMvuTEveBpKK1WE/i52MTZyFydtnMkkcpncC0I3d0FdsNv0spv0SiCZQTancv
	 x+yTQmgRZtJfAtNuNybGQcaS0sv1DLRY+X+sG7OG+ZybR/cG8wBC9vXPs/euC2k4U/
	 vvAvClMVZIPWQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 682E140965;
	Wed,  4 Nov 2026 20:08:56 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0DBB5D3A
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 20:08:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F3EC981061
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 20:08:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eyEc5kcksPm8 for <buildroot@buildroot.org>;
 Wed,  4 Nov 2026 20:08:53 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 18E98810A1
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 18E98810A1
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 20:08:52 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 20AF878035E;
 Wed,  4 Nov 2026 21:08:49 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 via
 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr with HTTP (HTTP/1.0
 POST); Wed, 04 Nov 2026 21:08:49 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Wed, 04 Nov 2026 21:08:49 +0100
To: Peter Seiderer <ps.report@gmx.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20261102133259.214060-1-ps.report@gmx.net>
References: <20261102133259.214060-1-ps.report@gmx.net>
User-Agent: Webmail Free/1.6.20
Message-ID: <19ef903cba5dc4a7b205beea2fc2b4fb@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH v1] package/kmod: bump version to 34.3
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

On 02/11/2026 14:32, Peter Seiderer via buildroot wrote:
> - bump version to 34.3 (for details see [1])
> 
> [1] https://lore.kernel.org/lkml/auSsJsiiuE97DA_M@rpl
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
