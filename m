Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42959606A31C
	for <buildroot@archiver.kernel.org>; Tue, 10 Nov 2026 20:10:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=QR4avSFx
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 06483812BD;
	Tue, 10 Nov 2026 20:10:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mxeiLfxV7dCm; Tue, 10 Nov 2026 20:10:20 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 3299381320
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794341420;
	b=G4f4ZzES/PWPpZXcDGe0r/ubsa7z15kjZsWei3TM6JHdBSnmpK2gOGTUFLWTmrxj/Yt9
	 g/hr2Qb89NRy+O7tzPrahtQfEYPHpg1VGlZry/B2ZuAwtZVgckluvSDwNiE7WjTvymHKE
	 fXXMVrDGgXIWvdin5g2R4GZPzeFOICt99Wg/FEdPCoaCWAKMgyW1r5//t5rNPYVaweVfz
	 9RlNYWA7qUhJ36K4Be16Y26a58zu/sFCumy+J9iA8pe5QHhj6stYaOV8czUCZPxkxoLHd
	 qdFGc02uiMUOgifnfMgBSL6R8wYgQdcB6H47iaDaxLFgIaLyd0O/e79ufTdglN2Wmkg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794341420;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=vFE0YRta2tyDMg2s4tT73cT5212M2be44WLiTL02js8=;
	b=iFp2Mm/12CKYfdEJqzwWsicQGteRGwNPxu+RxtcOwkhaPHnZmIbHDrYKpqX0V5vY1C06
	 FyyANUg/fsbq2HeqQKZXFVFLC6EDMkWjXxUE0ebeH85ovYPE5Oa8nSoA2B3kbeNM4fUpl
	 QDjy+BGCYHbVIZAiB0FqPxC0Ka8Q+IfZSTuXJhS/3m5BiiJr405qVihFWlLIGFUSpaBlX
	 yyny/LJrUQTBdxRZEOy2P/jUH8mDm9gixZTQqArMuFeJZ6oy1mj+jNrojagYpEFtQCPTZ
	 PdrFTdtCk/u89NFP7FKAaBuZREJc7c688WfYr65YnnuhPRViA706Pr5pZmI8bahgcTg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794341420;
	bh=vFE0YRta2tyDMg2s4tT73cT5212M2be44WLiTL02js8=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=QR4avSFxEWLSjBvm7z6QI0mh0B6CwLe6kTVoNsfLWyph7wcKVuMtn89SDk4n6m8Eb
	 cGsbDW5vkAplxNdUpTvfnZWZxsDSNnAabTnWmO+gUvweXvqcxhm25vB1fv8jrGKdI1
	 Ua7qn0WW4sIploKVYud+XmcAc0Tm5XDZ2qraUbFvMtKMw+IUQFSIHP2ETl0a1b3deY
	 UnyvGBWSykqASmhUQIyWUEMfzwpCTP+q2H6NEVcHurZYuxE2M3TA2PNbykVsopa/ss
	 4ljmP5aSLJoVCNTvsZaJ+eE4q5BxhZbaXCWqOZkd7xKdiED5hkyMLWeTCCZPVa8JXl
	 AJTO0d2Gd7eaw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3299381320;
	Tue, 10 Nov 2026 20:10:20 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 6B22F28C
 for <buildroot@buildroot.org>; Tue, 10 Nov 2026 20:10:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 539ED60881
 for <buildroot@buildroot.org>; Tue, 10 Nov 2026 20:10:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IrYCC6vVTH-P for <buildroot@buildroot.org>;
 Tue, 10 Nov 2026 20:10:18 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 1B0C2605ED
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1B0C2605ED
 for <buildroot@buildroot.org>; Tue, 10 Nov 2026 20:10:17 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 3F0E113F88E;
 Tue, 10 Nov 2026 21:10:10 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by localhost with HTTP
 (HTTP/1.0 POST); Tue, 10 Nov 2026 21:10:09 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Tue, 10 Nov 2026 21:10:09 +0100
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: Romain Naour <romain.naour@smile.fr>, buildroot@buildroot.org, James
 Hilliard <james.hilliard1@gmail.com>
In-Reply-To: <20261109135635.2181005-1-giulio.benetti@benettiengineering.com>
References: <20261109135635.2181005-1-giulio.benetti@benettiengineering.com>
User-Agent: Webmail Free/1.6.21
Message-ID: <b138283d74abef3cc62a0e283b959eb6@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH] support/testing: add swupdate runtime test
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

On 09/11/2026 14:56, Giulio Benetti wrote:
> Add a runtime test for swupdate using the default swupdate
> configuration.
> 
> An SWU image containing a single file, installed by the "rawfile"
> handler, is generated at build time with host-swugenerator. Since the
> default configuration has no crypto backend, the image is generated
> without hashes.
> 
> At runtime, the test checks that:
> - the swupdate daemon is started by the init script,
> - the embedded webserver serves the default website,
> - a dry run through swupdate-client does not install anything,
> - the SWU image is correctly installed through swupdate-client,
> - an invalid SWU image is rejected and the daemon keeps running.
> 
> Co-Authored-By: Claude Opus 5.5 <noreply@anthropic.com>
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
