Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B29BC55174
	for <buildroot@archiver.kernel.org>; Sun,  2 Aug 2026 20:29:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F2305606BA;
	Sun,  2 Aug 2026 20:29:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SIl6RxtzL_Eg; Sun,  2 Aug 2026 20:29:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 433A56068D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785702549;
	bh=P+FyGsJquRv6MQiG5OvKfrFtvyRaZNRbG82/OC05FEc=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=j2lBXNphQLsqHmr80x9hinGDnHQxDysxLbTQMunlRrxairh8An7EEOwaE51N8PjQo
	 SY4DdyFEk48a/7e+CW5dHb46GJK+prNex6qHYhS8RrDpPCsSqI8V876ryEui+i82KV
	 iiMtIxH1WfGYkYZ8jHIcUb5EJJRTzD44qJ7ZdPJRdl1qKxMye+PKsvganRQ9uSSTZS
	 EwL5lkjZQcMdhIn/3PD/qZAo8K8mDc0N1SgZqOd6evR5Bm5YPXgiRP92zn9tlOM22T
	 KqoOlN5l38pPwZkCHbry1V/wbL4zUq8G1EUzq3O5php5PHQLBHc84EaM9V9tigvS7f
	 zk4ZofcQ8hqpQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 433A56068D;
	Sun,  2 Aug 2026 20:29:09 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id D98D926C
 for <buildroot@buildroot.org>; Sun,  2 Aug 2026 20:29:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CB04240087
 for <buildroot@buildroot.org>; Sun,  2 Aug 2026 20:29:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uCUDNUcQdotv for <buildroot@buildroot.org>;
 Sun,  2 Aug 2026 20:29:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org AC3AB40068
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AC3AB40068
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp2.osuosl.org (Postfix) with ESMTPS id AC3AB40068
 for <buildroot@buildroot.org>; Sun,  2 Aug 2026 20:29:06 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id D7D5519F54D;
 Sun,  2 Aug 2026 22:29:00 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 02 Aug 2026 22:29:00 +0200
MIME-Version: 1.0
Date: Sun, 02 Aug 2026 22:29:00 +0200
To: Julien Olivain <ju.o@free.fr>
Cc: buildroot@buildroot.org, Angelo Compagnucci
 <angelo.compagnucci@gmail.com>, James Hilliard <james.hilliard1@gmail.com>
In-Reply-To: <20260726092711.212660-1-ju.o@free.fr>
References: <20260726092711.212660-1-ju.o@free.fr>
User-Agent: Webmail Free/1.6.17
Message-ID: <92d2c578bb98d9ea6aa2a8a3a1e9f778@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1785702544;
 bh=7cZjMjquguz6iH6wXF1svwF2eIcZcyzt8Sifx81tbCo=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=lXaQVJfU+3ORAwDHQMExkELnUAgMnVEVpAzd9+N5oD+Ow6Wl9abMVDUfyLm9EpS/H
 36+Ah/byP4HRXW+eSvIDFqdqoTvgF+8dERzTMfQNUknBl9z+XdvZ51z9JjaO4PYJeA
 Jl7Zjbuw0hlc44ANkFUBXjG3bB61/kuymAMdVHYv0EzKkJM6Zjm35wz+g5LeJWu6ui
 WsXVIkdLbMUCQEngAOceE37QziDGQ+spjvU6WTfi+crznoOhjEuMq0H6RRYAG4owUW
 hv7r6Xy3mDeZHGnodaW2o+Fh2V9SL05RvmXsENd5d5QT3EgkmROhjKSbj9iIdqsUzd
 ufMrOZQdGP8Cw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=lXaQVJfU
Subject: Re: [Buildroot] [PATCH 1/2] package/python-pydal: needs python xml
 module at runtime
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

On 26/07/2026 11:27, Julien Olivain via buildroot wrote:
> pyDAL is using xmlrpc at runtime. See:
> https://github.com/web2py/pydal/blob/v20260313.1/pydal/_compat.py#L114
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>

Series applied to master.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
