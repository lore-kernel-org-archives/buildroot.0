Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC765606A32C
	for <buildroot@archiver.kernel.org>; Wed, 18 Nov 2026 20:59:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=gAGVqdr1
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 78A3E60708;
	Wed, 18 Nov 2026 20:59:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id F4GEDtq-ROAg; Wed, 18 Nov 2026 20:59:57 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org B86A3606CF
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795035597;
	b=aphpIBUizkKhG5PuKWWo8dBjRmazSMa/QE5b9lYi9S94CuY/xkLmwYHgqNUIWok3MbP5
	 CC9XJmBAfuAJWfMUF6RMggQZAtqop5GAbt5RPKeWUiKXA3/jS+uJr7EXqoBP12PVzq1/B
	 29XWmz7lY1yaZ74P0qpM2ZxfikjuEvUy/TI/NKXf9Y/G8WK1iNy+h/aHFZvdyH/iMvE/A
	 b9s2Ua1vthHNZ0X5805ldR78JA++6nB1dEfGKw7gS/y0J+B3EJsYqcPu5B6KfG319bJ2O
	 RJ/gS58ReDSmQoxno4xnl1oF0pEBtsE5HE/Vr3uuRZlUk3GatOt6ZFZ+XvbS3McBpxg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795035597;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=ZZATcv/Yffg/E6e3gBPdS00dYxjCPs+DVOiflt6yloo=;
	b=nkLjL9uKvoNtaHJx38ietEFdSnMjebmhP/vjua30rY7K/q/ccsIgAqVZQLxEPhbYbYk8
	 ubW5o3Ys6lj9p2eBO1fb6p11CAdGGpsg/5V0k6VPgQWT9OPVHZfGSTxLY20Ho+De8Z+f8
	 6ZT9hqbTQvO9Kd0V6MopR1LNKo7wVcTUUtrP8o8ejBaC7Bx+8RI0imSg6xLtTI+lI5GBt
	 MYgqoJ0fKJm1SW8/mTXac449zGfqGrM6sXJceGZddh6Pqva+gFyelem2yPSaaSGA+HNZ/
	 eZGEi1FrzpFEBfN8x3kYbgRtycvvFRNPtpHTWXrpw6/y/a0/U3kgJ3RVcP9DZrPocwQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795035597;
	bh=ZZATcv/Yffg/E6e3gBPdS00dYxjCPs+DVOiflt6yloo=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=gAGVqdr1YWboyXYEKoVywcfI3txtNbhJ55zzKjLzu7iBrsefmY6924j1uMEs2lZF5
	 izcDM/oFYnFkPZ3zWJc5Gk9LW11jix2h4tFBJyMQS2rv0Z2InHywrr/9kqtqLgMnLp
	 FgyR/Bq2tyIja42JeFa0L+0KYqLlZv/ML7UUwntl30QqJAhTw75ZEKpRUIC3NOLY3M
	 GXqdd5AnJugbLhPOaMGLHRdRWvEz1uGDi7PJiNt/rEJgAwmkRe6Egn6nQWA65+GV44
	 MeSoGcPvpK0x2LdLAA073+TJpIZz1UJrtLmwv/sFR+GwwvP7TNflO8RisHhIpfgUed
	 D72V+CLiRkUAg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B86A3606CF;
	Wed, 18 Nov 2026 20:59:57 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 9151A2F1
 for <buildroot@buildroot.org>; Wed, 18 Nov 2026 20:59:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 82DD0606F6
 for <buildroot@buildroot.org>; Wed, 18 Nov 2026 20:59:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0xSR7uaT5Hct for <buildroot@buildroot.org>;
 Wed, 18 Nov 2026 20:59:55 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 4A734606A3
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::15;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4A734606A3
 for <buildroot@buildroot.org>; Wed, 18 Nov 2026 20:59:54 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.4])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id C246A780331;
 Wed, 18 Nov 2026 21:59:47 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by localhost with HTTP
 (HTTP/1.0 POST); Wed, 18 Nov 2026 21:59:47 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Wed, 18 Nov 2026 21:59:47 +0100
To: Bryan Brattlof <bb@ti.com>
Cc: buildroot@buildroot.org, Romain Naour <romain.naour@gmail.com>
In-Reply-To: <20261116-beagle-uboot-fixes-v1-1-834206d9b47a@ti.com>
References: <20261116-beagle-uboot-fixes-v1-0-834206d9b47a@ti.com>
 <20261116-beagle-uboot-fixes-v1-1-834206d9b47a@ti.com>
User-Agent: Webmail Free/1.6.21
Message-ID: <2567f7b37ec53343ebc71c773adb22fe@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH 1/2] board/beagleboard/beagley-ai: backport
 swig python2 compatibility fix
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

On 16/11/2026 18:40, Bryan Brattlof via buildroot wrote:
> Because swig 4.5.0 removes support for Python 2 compatibility we need 
> to
> backport a patch for U-Boot to remove the Python 2 macros it uses to
> generate the final fimrware images.
> 
> Signed-off-by: Bryan Brattlof <bb@ti.com>

Series applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
