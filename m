Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05A33606A31A
	for <buildroot@archiver.kernel.org>; Sat, 24 Oct 2026 11:54:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=aOgIWJyn
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D369981751;
	Sat, 24 Oct 2026 11:54:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bGYScyvQ5Qnw; Sat, 24 Oct 2026 11:54:26 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 150D88174D
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792842866;
	b=TNMothvLyGGdhU/0JmfOu3CbX9Vre4a7nMGdIurt7zZo6rTc+IZzFjNc0xkFkbzBaiTX
	 fIvUJnX6s4rn3cUm+hNGDGjYCQEyPk/DzsVeqdpNiDkYd4skZ95vhYeEyrQoQy4OVBoCJ
	 NyW9wOPPfnOwBxS22M1tNzHCFpzz7MqBERdjnl/SLuwchDw6MQKsCU7/O0zHKgBFzUCVP
	 fwy4HDgJoLy0D+5M0imon++jJz1wqBPwPqdg6kC0yevqEb4E9+mj/WE785WGVRIG8/0sj
	 fWGvAhb7scxpQLqorJBBTy9cnshLLndx1fOGnfX2BHJKbtBJQ6GUbETLKEU6EJ2tXRw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792842866;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=ejdEfKrKUy5ciuLUXf28SzGIyJ/6ag1YlEE1Dlxj5KQ=;
	b=A1om9NaOFfgcxI+HOP93xvHO8XtjoOz7elCt7sY1K9m7VlkPMNjNdw/wc7ipVgGOyoUg
	 d/wtpW5RoO7jxXRIlnA77HeQGNGEfUDD+B5XoHHwRjiqXFltA7ycUZnq4CDO6nWz85w2d
	 Y9Y9f7WjyG03TfRGfeWpgBePN9bwjpq2pEKiosO5scE05FSFpgMpB+K3NLAape6N1jqVR
	 S+qhjEdaNpJg0D9CnKKYlcWywMPHEQy09h+h8nXjuHpKECnYbAjLwFz9L2z1aMrZbkv1+
	 SA2UIJZ/NiPSbzjDgRVqTK0eJvUEz9uUCpfqePnun9oHh3dsfYdn3DuGT/K9pTlumiQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792842866;
	bh=ejdEfKrKUy5ciuLUXf28SzGIyJ/6ag1YlEE1Dlxj5KQ=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=aOgIWJyne6fFjOqwtDglnAKgcNT9gj6Ez+17wDRQvOWf9wWNBhXLbEGi+EMZxmCCV
	 98zR73Fr+ygi7+hZWffO+YNTX4j8sgwXCxQi8igkAGL2CYUqNbYdTsdlbF4HrGVjh+
	 HlxHUw3FnN4pdEGTcN0D5cXndPnlaUMmbEt+C0dSwbQfDLJiqCbzN5xTPPXjqczG0N
	 /MGEBDKEcEuNxjcqDPG1K9kf0eBt58EMP3wXBQw8bHz+cWUuSX+WVuQrxggMg/BnNH
	 51U8vZHeInR5NMBJQ/O6TQWOJzB5irgBXmUyi8Nq186VlV7Okno9/wlxTBW/h0ehmX
	 Gq+8mJEYgaukA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 150D88174D;
	Sat, 24 Oct 2026 11:54:26 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id DBC06356
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 11:54:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BEC5860A9E
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 11:54:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xfxPM7FaAE5m for <buildroot@buildroot.org>;
 Sat, 24 Oct 2026 11:54:24 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org EE54C60A4B
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792842864;
 b=HF9G1uckGsr+1O6Eq4n+OB5+1h+vCnMeEN3wJ3U1uV0amVmvgOazExYsGwwEwx9Ehf10
 JtjSkcbf9hN5AsLYA9O9z3vmSO8hSPoVsVRbZTgwmwZRb5aQtQUSIxAzQ+j72NY1yoaJc
 XkjUGKyTeE62hXUKfnq8lJ5InyvIYMcU0ArvHNgbefwRX0e1T1g3NyHYFNbZseqRzh3ym
 GB0+lMgct7A1M1meQ9BV895gQQJyGy323rnwtxWrqjAzys3PoySVtFlpyW95rSupGtHNS
 6rkE6p/iTEjHZbK5JK2LhJwzrzsSm6ZO3wD2Cs23ob+iOxAPqrMzrGlIFQzK+iACWpw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792842864;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=lqmJULBsuA5sY6aLE7QBVEwzBn9VEoFffbFhDtJ3yQk=;
 b=VBBTY0DO12nxtOqiit+8HOa3hOZ9wEG002/Ez+SbCY1rHYNQYF8Bi3J39dTZuUtAT6Co
 p67BFffP/Nn4NoVLOkAC3vnbDsLTyukceRKL3fCLQ1Nvq5bI/TTfsZAd/xQ8iqKoR6OiV
 4qj5ewrGJIVGhQTKKG8KEpkEGuuHWPDu6fW5Qd+6bpXBp4bmjyzlCPGujA4LDwYByuqa3
 BCNxSqdgIUFghWNzy1pSIctEIsiehmuUwvE3jxk06Y8EHOArKt6KhlCJAFk+UOCvdVQUd
 6JwVFUlAYQuOAl8DANrWwbXBI9Gz/Fyd0j2HZdoZFqkDw9qK92zkFMohJGxjZ99ntSA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=free.fr;
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=tQBtPpU1; 
 arc=none smtp.remote-ip="2a01:e0c:1:1599::13"
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EE54C60A4B
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 11:54:23 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 8C01E19F57E;
 Sat, 24 Oct 2026 13:54:20 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 via
 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr with HTTP (HTTP/1.0
 POST); Sat, 24 Oct 2026 13:54:20 +0200
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Sat, 24 Oct 2026 13:54:20 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20261023181818.920329-22-james.hilliard1@gmail.com>
References: <20261023181818.920329-22-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.20
Message-ID: <e342aebc5889b7b4eb7c849c5a02e6c6@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH] package/python-serialx: bump to version
 1.15.0
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

On 23/10/2026 20:17, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
