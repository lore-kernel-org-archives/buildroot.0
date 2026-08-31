Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E82F5C61DD3
	for <buildroot@archiver.kernel.org>; Mon, 31 Aug 2026 21:48:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9DE8680AE6;
	Mon, 31 Aug 2026 21:48:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GHb3wesnvuR3; Mon, 31 Aug 2026 21:48:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788212907;
	bh=T20VxjScEZoIJtqgeMxqwMOH2ftbjSEAaZXe1WcXWAU=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=IAHANV1qFtdLe5z0GWepIZr9+wYJCZ9089Js4IiFbrGrdwIEHdSg5eaqC7MLDObpu
	 6wpkBOeIGElDAUfEt/WmjbJFrSldpXIODwIDUltwsQlWqmmSKPvLsAP121g00ucwcp
	 Gl5SDmkiwqsIjbsmzEJhIQwfPWfuPCit6iB3aHTjGxblOA3FvnuixyJ1TvhSpFuV+0
	 gzh43isrrsRkbLxjkB+loMmdlT4EzahT40giFs4E/Co+ibzDzDN8hvMT6uck+9D/o4
	 IUXX7PuLbdOgOlPli+B8UkhJSesCTWQzdRd5DetDSZo38gIV0HdSB82l/CM3MkzNLy
	 QmiPBQstCbvKA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 34F5180AC8;
	Mon, 31 Aug 2026 21:48:27 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id B07DF23E
 for <buildroot@buildroot.org>; Mon, 31 Aug 2026 21:48:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A25AB80AC8
 for <buildroot@buildroot.org>; Mon, 31 Aug 2026 21:48:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4c6xILbaktCH for <buildroot@buildroot.org>;
 Mon, 31 Aug 2026 21:48:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 984A980A65
 for <buildroot@buildroot.org>; Mon, 31 Aug 2026 21:48:22 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 067B313F86E;
 Mon, 31 Aug 2026 23:48:15 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 31 Aug 2026 23:48:15 +0200
MIME-Version: 1.0
Date: Mon, 31 Aug 2026 23:48:15 +0200
To: Christian Stewart <christian@aperture.us>
Cc: buildroot@buildroot.org, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, James Hilliard <james.hilliard1@gmail.com>,
 Thomas Perale <thomas.perale@mind.be>
In-Reply-To: <CA+h8R2pgiSspGVG7w0mSFETY+-HnjSB6B+h+xsu-EdRgLVqMog@mail.gmail.com>
References: <CA+h8R2pgiSspGVG7w0mSFETY+-HnjSB6B+h+xsu-EdRgLVqMog@mail.gmail.com>
User-Agent: Webmail Free/1.6.18
Message-ID: <a9f23801296518260a25f1429b9985de@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH v1 1/1] package/go: new major version 1.27
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

On 31/08/2026 02:10, Christian Stewart via buildroot wrote:
> Bump to go1.27.0. The go-bootstrap-stage5 package (go1.25.x) still
> satisfies the bootstrap requirement, so no bootstrap stage changes are
> needed.
> 
> Remove the workaround for https://github.com/golang/go/issues/77436,
> which the go.mk comment scheduled for removal at this bump: restore the
> plain CGO_CFLAGS and CGO_CXXFLAGS settings in HOST_GO_TARGET_ENV.
> 
> https://go.dev/doc/go1.27#bootstrap
> 
> Signed-off-by: Christian Stewart <christian@aperture.us>

Applied to next, thanks.

Somehow, the lines of this patch were wrapped. So I fixed those to
apply the patch.

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
