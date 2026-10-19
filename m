Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 060AF606A31D
	for <buildroot@archiver.kernel.org>; Mon, 19 Oct 2026 17:33:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=bLIcvV7P
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D4C324069B;
	Mon, 19 Oct 2026 17:33:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Qmaf7p6A0pR9; Mon, 19 Oct 2026 17:33:30 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 4052440699
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792431210;
	b=b2R8xCyoVrN6eJfJ6LvuAJuDVbrsp3HqJrZ6Id3UeO0fsOdsKzr7cZ0/2rrHSPlCFp/T
	 ZYmyR8mmwJ4yjl3IZiUJ1hscZbBut6jzpTnkir4ZUJ/ZGMUDeSwB/liXPqgYt1bXesg6N
	 SAd0Vexr1Ktjn6bPmmRcVMK98GjdbP48d+l02XhNVdO6mvzjG7If3PtPWtLqg1u3YR4r8
	 6F6N3HGBjHcotRsTpRHfJhmYUIbaXP6CmhvV1BaG+BpnGCC2k0DWlS7+U84XLy7HbeXwO
	 0l2Op5pbLyCLJ/CTcwNK6FjtFzpr4NA4OIlm8Zw2UCx9JytXLA3BpUkObML5k/8g3kQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792431210;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=ZhgKuX1vs4upBiBix+b7QEUDs0kYWMnrDK3kqSw484k=;
	b=UVTjCKfGG3XpB0/5KvddoAMll3mik1j43ft1GldXQcbUxdQv4t+2WjeEoawe6fiLDaQy
	 /gwLEFaIagGGSjcGBdDacnOBviEINfxStcp9gvYPa3Z50eh/gcR9PUuCL0ZWmnJSfeXMY
	 HD51amWceNk1J8vXi0He2KY89zn3FwOSCIwo4RRgE/VMJPaPFcsz36RQEIjlDb231SbKc
	 yT+BvWcBZekcexKtxf95i8cgo9TexxEtKwHyIiJirVnV8VvcjZzPYxUZegKarE9Th9h6F
	 ZYt74SFWNu8IgXXvL1pxpMO7mns9dByxDuW4Ga66CUfaTDUwomezp9hG6y+LyBCXM+g==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792431210;
	bh=ZhgKuX1vs4upBiBix+b7QEUDs0kYWMnrDK3kqSw484k=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=bLIcvV7POYo+sQYNBBek16BSkoY4VeDrFB+ibH1y3pbPTyfER1S98wy9EzwvleHB2
	 BS3wiu5PLmSBJP7LvMp505KAx4oyIamhlRJg07gXkc/iBoYFuZXzNdavouQvLwQvhl
	 HnbvwxoMdnhECB5orGuuYt8pHrvJWY3vvVW340bEv9VpqHmg2jbnm5QBSTU8ec16UP
	 PHZdD0kVvkvL7HppaJq4dAS3ZtAIAsSwYojHDd/b3Hg4cM67x2vJO/fBivz2dY3NTf
	 l/bIQeHNdv3/emMiknSER3kIwrfcYwlPk20rsZH9OC4dpjyG47Wt0/g1mJtd1fjAA/
	 It7S0oxNEld6w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4052440699;
	Mon, 19 Oct 2026 17:33:30 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 4840C1DE
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 17:33:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2E3986071B
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 17:33:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id thxWmcD1AQvh for <buildroot@buildroot.org>;
 Mon, 19 Oct 2026 17:33:27 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org AE730605D9
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792431206;
 b=kQsaatXXv+/HtuczzCCoIhC8h/rk0jrXv0HvWZrS0rgsnV16lxhGUThjJogKaHEPbkdq
 CgbXQiE2cJrwqBJd24PRyhxXoloV4hpvyxlkNxW5gPlBa52K702v4DBNzZoq5VMiEiMhC
 zzwuu1XdCX30YwHSdigzRnanMXkEsQj9bS7AYhT7we8qExHRjhAhJ3KE15mmhPmn8VurV
 RsFkKe5SwR6unztlVPr6EThBlL80FcTiJKkwumhyme17EauT6JOSRrgnbboUv3eYO5jZJ
 ZlcYytSZKlSOa3ge9sBbC01nkYJKhFOaxCwDDHwhLTrx6UpCOeOQow5lrFiRWubcwFg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792431206;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=+Ubwh0akI94kmjgYOO3gtyRfvRr44MZzmEw34V/0u28=;
 b=ggRu1nxqeRARutFZqqOpWayfHA60FfC5TiG/wI1znfB0rsQOHNpnjeaq5nRojXwovfUg
 IkoUOZ+/0rJLlGrVA+GToA4EafyJ0Vbg0V5or0c53GWDj4KYXdokTe3koG1h2lMTf2z1J
 DCKQl0CYihycoXciQXH6y+4GRBFkbLqgv/tHLWEsoapG6AE8aDpadnunhro/LrFC7HMVG
 pmXYMuijwUlpytdHGavHtc8bRe6nNe6a4rrbEtat/8PRYr/XzgjnYXroXI0A0u2fHEJNK
 uY1fBDEc6VfKHEAOWp6kgTH4z+1TSoumf7t+S1lzsDVfh0QnyAT56W9PPRMV2gJUuZA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=GrE61z4k; 
 arc=none smtp.remote-ip=185.246.85.4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AE730605D9
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 17:33:25 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 2D3B44E41279
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 17:33:23 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id E7CE960582;
 Mon, 19 Oct 2026 17:33:22 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 2750010328C5E; 
 Mon, 19 Oct 2026 19:33:18 +0200 (CEST)
Date: Mon, 19 Oct 2026 19:33:17 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
Message-ID: <atZUS-akE6bfknJS@windsurf>
References: <20261019171854.734871-1-james.hilliard1@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261019171854.734871-1-james.hilliard1@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH] package/python-autobahn: bump to version
 26.10.1
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
X-Spam-Status: No, score=-11.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Oct 19, 2026 at 11:18:41AM -0600, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Recent set of version bumps applied:

807096866b2c8902afea3e497dd99bdb43e0cb4f package/python-autobahn: bump to version 26.10.1
368c7c278497cd633f9b9232a204ee3f3677c8c1 package/python-fastapi: bump to version 0.148.0
8e259a1b8117e01fce23b271a98210a5048a81dc package/python-filelock: bump to version 4.2.4
b368f0d979ca288ab88c70de36fa73cb7da60bd8 package/python-jc: bump to version 1.26.1
83e29e2d24067fd67331650c25106defea108ea3 package/python-platformdirs: bump to version 4.13.5
b0db8c26518d7489d1e09749a8dba8474da589e6 package/python-bitarray: bump to version 3.12.3
bde0ece5c21deb6e9f50c274025a98de4e8f40c8 package/python-mistune: bump to version 3.4.0

Best regards,

Thomas Petazzoni
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
