Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67BD2FEFB6E
	for <buildroot@archiver.kernel.org>; Fri, 27 Feb 2026 18:00:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EA30A60B75;
	Fri, 27 Feb 2026 18:00:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ss2dKzBOlTa2; Fri, 27 Feb 2026 18:00:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CB75E60B70
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772215212;
	bh=rsqufJr5aVaJSi1NORj6y/fpu2zJuPZjofXurFvdNlI=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=oJRdb2UiqHxxO7Fs9BdemIiapA6+1Hlv1jH8fr5RG+I/INc1iecRRohYrc04yWdLo
	 Vll2iGBg7W/6yJezbAjjIuW2riEnzVaJa4x/fUzgCC8rQ8GEuElXJnVCkqmg5GGjBJ
	 80o+WsagdhapKoOzP8TTNBE9hvf4UnEYPPMVHfdFksObEkeYQEzEseHA227EuHVP/L
	 iTj3CL1ep0GEP8r0gU3F7sF0ja1nckWH0Jb9RHZzjMptQs9rIpH5qKx2E2pOWvWyUx
	 4ElT1OrcJisajjUjsUmCpRm96Ss9cnS+OrUS+JWWzffeYBGSZU+x42zRMgSvqpTdLw
	 0eSLPU1KzR5/g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id CB75E60B70;
	Fri, 27 Feb 2026 18:00:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id C902B204
 for <buildroot@buildroot.org>; Fri, 27 Feb 2026 18:00:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C610382E14
 for <buildroot@buildroot.org>; Fri, 27 Feb 2026 18:00:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZW2Oiffkv8go for <buildroot@buildroot.org>;
 Fri, 27 Feb 2026 18:00:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E88DD82DD9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E88DD82DD9
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E88DD82DD9
 for <buildroot@buildroot.org>; Fri, 27 Feb 2026 18:00:10 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 96C8519F57E;
 Fri, 27 Feb 2026 19:00:04 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 27 Feb 2026 19:00:04 +0100
MIME-Version: 1.0
Date: Fri, 27 Feb 2026 19:00:04 +0100
To: Joseph Kogut <joseph@anodize.com>
Cc: buildroot@buildroot.org, Joseph Kogut <joseph.kogut@gmail.com>, Bernd
 Kuhls <bernd@kuhls.net>, Romain Naour <romain.naour@gmail.com>
In-Reply-To: <20260225-mesa3d-panfrost-v1-1-46dd7621ac79@anodize.com>
References: <20260225-mesa3d-panfrost-v1-1-46dd7621ac79@anodize.com>
User-Agent: Webmail Free/1.6.13
Message-ID: <a63301ecb65790d5aa276ba5912c418d@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1772215209;
 bh=7BYx+BL+TcSfKo92xigldh/qdfI0bsgJekFIh48ba74=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=TEp+KeV7mF8zKLO0cjJyPB9NRu4RBiV603qbe+vOluT0fj2NOxbiHheErW16FU4JI
 A+fADHnYWgFKoUUQA2q7bma64kArS8YUMVNP3cjaHlqkwCuyP7ABpnpbAmRTDviDXv
 ykC+vU/erJGeJUe/lxPP0ymd8UClbGGtH5MNhgAQYLYi4A95BbBxpHaAjmHl7Gpgpv
 u64e2ATkWlrscW6O3WSZpxy8wolU3LeymUYX54bOhCokj+y765qf6pseLHP5lhMQoX
 i551nLZ8/vf3A/6qjBkGOBgXhO6HkZyf4AiyEipdZDXvtnopDMQfi58V6rlcb16fTO
 Nj7ssLhWO2Qaw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=TEp+KeV7
Subject: Re: [Buildroot] [PATCH RESEND] package/mesa3d: add panfrost vulkan
 driver config
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

On 25/02/2026 21:16, Joseph Kogut wrote:
> Signed-off-by: Joseph Kogut <joseph@anodize.com>

Applied to next, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
