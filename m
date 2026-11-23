Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DC8F606A321
	for <buildroot@archiver.kernel.org>; Mon, 23 Nov 2026 20:58:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=KWxKW69m
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 363A4606A5;
	Mon, 23 Nov 2026 20:58:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SAj4OoTsPLL7; Mon, 23 Nov 2026 20:58:10 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 688C36067E
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795467490;
	b=CuQjwK7KIk8nKJcFoxD/VkK+vQbN/KSnhx9EsadtJOrxqnjGASE0p2QvPWPeTTU56VbZ
	 SjSbHUAcV3t94mrWn4EAQEIuH0sYCULUfZftJUTqVDC8/IBeJvnfTRrDfp7HAA2OpKYG6
	 VCYWgwy0ibMDurjjMjWHQ8/Lom6fNE1e16YKKPl846Vxmx2Ae986eW/8j+4WhsJeQocIe
	 nvT3A1nV7FL57pe2yotFoOapM0PH2rfWGTWpkO60qb3iIUB/QqHosao7alnQHb5Y9+eSM
	 zfmS6ztv7/b9ryA/dCfAOJ10Dbx8v9lb+xdCIdnmXPEkFHyDoyvFeJ5ntMyeN121aiw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795467490;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=u/WUgf2v/fGVYVqiunQ7QTB0oaoWUcVZRlv/0na/eHE=;
	b=Tx4S+c6P/TXg8Viu8ro0lNTlIbODsqZgeGNXNMo3E1Lbn5RRRDUUTyn9/axu5nuYLOmZ
	 oJE1IksW5cGuA6aUZX+5Cb1jqLzX026G+w+sOmKqoVffRqu2R3sLSTAne4kZ48YmbW+HP
	 dZ3+C0FTNBvpp/EabJDM/oQNUmCEq/NP11+/g7BQjRJU9L7I7QUlREYYfMfpN92nu2PZM
	 Go0UiBwriZwT9gTfKXcZgHY/wv6Z6nE0yBzX8B+0Ei3gk07ZTJv5hnvX1nTza0csLnXLn
	 HGBfPCQEE6qB/jUjhyDhdMNC1swbq1TNog2TUSKWwkIHLg9jEYXUvFqxBgBRoVj6t1Q==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795467490;
	bh=u/WUgf2v/fGVYVqiunQ7QTB0oaoWUcVZRlv/0na/eHE=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=KWxKW69mr4Ifur8Z4hEfPYGIFKP2/i4k5YkTMR465Qoacr1nxGF0SL4OIrGeWmQmY
	 sEMgygf+/ZBAPxR/2qyJ6aIsBXZbIc2lAXjRyBN7pcOvz6/PDM55DUxeLEtuAnScgO
	 uXi7LtD3o2PeXA6SJss2pFdl+nQghRn6Rx0G9cWn8roldQ+g/Vysk10SdleO0FfEYF
	 d6L7mnBZpli6vB1aV6KwGn4uI30QNqk3iEQ52GIF0JBWSH04zxI//+wKZ9FY+gsYHA
	 92R7QGtsJW+FsYdb4EWSDVLby7DsNHnokVOux5Ehgx5OVvBvh0dEr686H7V7Q4xL/8
	 XlqtB0+u/mYqQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 688C36067E;
	Mon, 23 Nov 2026 20:58:10 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 858B422B
 for <buildroot@buildroot.org>; Mon, 23 Nov 2026 20:58:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8300C4072E
 for <buildroot@buildroot.org>; Mon, 23 Nov 2026 20:58:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3p1k9zNE1RRW for <buildroot@buildroot.org>;
 Mon, 23 Nov 2026 20:58:09 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org B092A40729
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B092A40729
 for <buildroot@buildroot.org>; Mon, 23 Nov 2026 20:58:08 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 923A61A17A2
 for <buildroot@buildroot.org>; Mon, 23 Nov 2026 20:58:06 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 6709D601E1;
 Mon, 23 Nov 2026 20:58:06 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 0FF1E11E6A9EE; Mon, 23 Nov 2026 21:57:58 +0100 (CET)
Date: Mon, 23 Nov 2026 21:57:58 +0100
To: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Cc: buildroot@buildroot.org, Vincent Fazio <vfazio@xes-inc.com>, 
 Vincent Fazio <vfazio@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>, 
 Romain Naour <romain.naour@gmail.com>, Neal Frager <neal.frager@amd.com>, 
 Ibai Erkiaga <ibai.erkiaga-elorza@amd.com>
Message-ID: <awSozUmMOEBfWZWB@windsurf>
References: <20240228165300.4158751-1-vfazio@gmail.com>
 <20261123173006.2250595-1-angelo.compagnucci@gmail.com>
 <PH1P110MB16036AFF106E5B0FA361B9C89F45A@PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM>
 <20261123200951.3350546-1-angelo.compagnucci@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261123200951.3350546-1-angelo.compagnucci@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 1/1] package/gcc: add symver attribute
 support to MicroBlaze
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-6.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,MAILING_LIST_MULTI,
	SPF_HELO_PASS,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Nov 23, 2026 at 09:09:51PM +0100, Angelo Compagnucci wrote:

> Changes Requested: https://patchwork.buildroot.org/project/buildroot/patch/20240228165300.4158751-1-vfazio@gmail.com/

Patch status updated!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
