Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A986CC44515
	for <buildroot@archiver.kernel.org>; Mon, 20 Jul 2026 20:16:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 47FCA403A9;
	Mon, 20 Jul 2026 20:16:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZVqCLZ-9kdtQ; Mon, 20 Jul 2026 20:16:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7648740507
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784578612;
	bh=SWW2iZdxqy1vyIEQlE+/n8fI9bqidBof3Q9UFbOdQF8=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=ciU5C6yIP6iE00kejlhxso3juD2w2pThSpIYDqG+MbRVaQYcCuhkY6jOasyBh8tRw
	 Xo9SGqClBhUz5Y/u1kaXcEBG5Dk4NMTwxYGwqVPrFne9zgmYA/uu9eYmqrSs11Ll75
	 sns6nRAAOl025x7GbL+GHm55KUjBGEV8VGwXmL0yD4lQXv3LfR7Jnn1yru5eFxuIcg
	 QRA4BSzSUh4YOYd5M9IIPdyO6e8Ymh2GWGSPK8WNZmwTy5XGg2h0fPfaD1ieZZQBTw
	 ew8wRhMQf1xDodrfjgokuhIyS8WolIjR2cA/iYHrkvK2FJU+rTewZPkLapjZSIImL/
	 kj0ycrb/ANbrQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7648740507;
	Mon, 20 Jul 2026 20:16:52 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 161F8224
 for <buildroot@buildroot.org>; Mon, 20 Jul 2026 20:16:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0717180CAF
 for <buildroot@buildroot.org>; Mon, 20 Jul 2026 20:16:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pK8uYTmEHa8W for <buildroot@buildroot.org>;
 Mon, 20 Jul 2026 20:16:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org EA5B480CA2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EA5B480CA2
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EA5B480CA2
 for <buildroot@buildroot.org>; Mon, 20 Jul 2026 20:16:48 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id CDE8B19F54D;
 Mon, 20 Jul 2026 22:16:40 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 20 Jul 2026 22:16:40 +0200
MIME-Version: 1.0
Date: Mon, 20 Jul 2026 22:16:40 +0200
To: Fiona Klute <fiona.klute@gmx.de>
Cc: buildroot@buildroot.org, =?UTF-8?Q?Fl=C3=A1vio_Tapaj=C3=B3s?=
 <flavio.tapajos@newtesc.com.br>, Davide Viti <zinosat@gmail.com>, James
 Hilliard <james.hilliard1@gmail.com>, Norbert Lange <nolange79@gmail.com>
In-Reply-To: <20260720170437.133823-1-fiona.klute@gmx.de>
References: <20260720170437.133823-1-fiona.klute@gmx.de>
User-Agent: Webmail Free/1.6.17
Message-ID: <ef2329b95cabc39a3d4c25533113d6f6@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1784578606;
 bh=BCXmNvethVyhqUShGaM5f2/VXMsaFEGJcIISHX2usFM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=ErtysMwNCmm2wyDQeVspGy3MGNbU1eSfyvfOi7E35eVzY9qpQZMTSKo7Yf2OKi5Tl
 NIQJEvUrJUfFuKjOqIjPWnho6VUDj+EuFsZQIFQf3N1g4HSVdGfYbHHv3FejXnO1M3
 7jL82wus27Q4UFXkYDzYlCEuKcWfCnZYh8ZCbd94BAxJLIIefhPF+jzC7qqWWuDYaH
 n/7R+iiQge7xD0AqOKbREifb1O5uCVCpy6WV0sUFe2yNKYkeMUJvv4/bC9sPzWTzXt
 GEt9BObN+usrTKn7Sp3gArPU7hy9ACXh686LW7Ts618YjvbIchQizGRDixg5idjhpu
 T8JeoewwBgaSA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=ErtysMwN
Subject: Re: [Buildroot] [PATCH 1/4] package/python-paho-mqtt: clarify
 license information
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

On 20/07/2026 19:04, Fiona Klute via buildroot wrote:
> From: "Fiona Klute (Othermo GmbH)" <fiona.klute@gmx.de>
> 
> package/python-paho-mqtt is dual-licensed, so licenses should be
> connected by "or". EDL v1.0 is a BSD-3-Clause license, as confirmed by
> the ESF [1] (see listed SPDX License Identifier), also confirmed as
> intended in the pyproject.toml file [2].
> 
> [1] https://www.eclipse.org/org/documents/edl-v10/
> [2] 
> https://github.com/eclipse-paho/paho.mqtt.python/blob/af64a4365c6ac5a7a4d339e7b00f44df91353b35/pyproject.toml#L10-L12
> 
> Signed-off-by: Fiona Klute (Othermo GmbH) <fiona.klute@gmx.de>

Series applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
