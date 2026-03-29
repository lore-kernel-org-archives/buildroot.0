Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC944F3D5FF
	for <buildroot@archiver.kernel.org>; Sun, 29 Mar 2026 11:08:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C023160A38;
	Sun, 29 Mar 2026 11:08:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Jglrgw1styRh; Sun, 29 Mar 2026 11:08:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 001216090A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774782513;
	bh=QI29kw8xFqy8B9xNF6p7tfLbp70Oofi3Molvq3hk0H8=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=H08Vm2ZR4hYCp26NVexomqjRG/HPnT+psNgefTAk5Y4/Dv6UqGG9AQ4yq507vi/U8
	 Cl+a6KdKPGymFNuMEn7puzE5x9LOTXGhKwtF8GV3pOpqbyq2UOF8RBdpcOv4CdbCEN
	 W4e+kzY62a8yJMCl47VpAynIEkiJ1tAGy6BfRfTSVL0a/XhjQESlYst1qfjAL16oH4
	 Zs4X7qj6FVJXEK1M40fXgdk1i/9jIwsVOiQptrRm6xGT6GmW9huTrC4Mvkfd7PU3Nr
	 8mXVFr9/DME9qBKoriSfnI7XguJ3A0gy6K+zhtHUd7aMzVukwF/BgOBfyDYpfChf5L
	 4W9f6TXEF6cmA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 001216090A;
	Sun, 29 Mar 2026 11:08:32 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id D578910F
 for <buildroot@buildroot.org>; Sun, 29 Mar 2026 11:08:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BB4B36090A
 for <buildroot@buildroot.org>; Sun, 29 Mar 2026 11:08:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id z2dE7rWGFlBU for <buildroot@buildroot.org>;
 Sun, 29 Mar 2026 11:08:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org DCEE060770
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DCEE060770
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DCEE060770
 for <buildroot@buildroot.org>; Sun, 29 Mar 2026 11:08:30 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 458A0780502;
 Sun, 29 Mar 2026 13:08:25 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 29 Mar 2026 13:08:25 +0200
MIME-Version: 1.0
Date: Sun, 29 Mar 2026 13:08:25 +0200
To: Xukai Wang <kingxukai@zohomail.com>
Cc: buildroot@buildroot.org, James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
In-Reply-To: <20260212190349.537465-2-kingxukai@zohomail.com>
References: <20260212190349.537465-1-kingxukai@zohomail.com>
 <20260212190349.537465-2-kingxukai@zohomail.com>
User-Agent: Webmail Free/1.6.14
Message-ID: <f8955a26ad11369180218f17a335a6ce@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1774782508;
 bh=nB0xmIEWmEw+ngYCjRXMFKneD68l3wFg9yd3gVcqoVQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Qj6WEeUt/SDM4skgd+XI5PwzRvZNGtwl37CXnUHDEdY2nOam91+4wFJlRyCBc+irG
 p+RGPsO3zuzoO+O4dYlDnG6Y+Wvr0N2Ag1ZlC63oLKMJqEBOJ95LWj3vDjH9AYrbUa
 wTiOiQGWtiQXBys/1ICPgmzni6sFjQG5J1gXOv00D1epqidQi+QjHou3cojSTvgHB5
 GakMCzWjFYyZZ5Vb1uvh8FrhfuQ89T/ZPZbzaw4oq7rHWqNAHNiEloIsODoOptheX1
 CyIaCg868znXS5C7FKVXT1HkdQKhIpUywauvaM1L8w8o3EiTUEH8kgomS1YTy5mKqB
 D2kmsPFDvhMog==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Qj6WEeUt
Subject: Re: [Buildroot] [RESEND: v1 1/6] package/python-cloudpickle: new
 package
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 12/02/2026 20:03, Xukai Wang via buildroot wrote:
> Add support for the python-cloudpickle package, which provides
> a Pickler class that extends the standard pickle.Pickler functionality.
> 
> This package is required as a dependency for gymnasium and other
> machine learning or scientific computing libraries that require
> advanced object serialization.
> 
> Signed-off-by: Xukai Wang <kingxukai@zohomail.com>

Series applied to master, thanks.

For info, I made few corrections in tests. See:
https://gitlab.com/buildroot.org/buildroot/-/commit/d25f18a3c3bc984df529cf2b264be2fe30b51257
https://gitlab.com/buildroot.org/buildroot/-/commit/6e6597de2173cab3e40a115cf1282c9cf9ebd913
https://gitlab.com/buildroot.org/buildroot/-/commit/b647b0c95d823a294ac5da6c15d5daad41874e1c

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
