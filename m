Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D34AE77188
	for <buildroot@archiver.kernel.org>; Tue, 31 Dec 2024 17:14:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C641560744;
	Tue, 31 Dec 2024 17:14:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qqPFf0VL8wv0; Tue, 31 Dec 2024 17:14:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D16F560782
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D16F560782;
	Tue, 31 Dec 2024 17:14:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id EAB9C968
 for <buildroot@buildroot.org>; Tue, 31 Dec 2024 17:14:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E62C8811F5
 for <buildroot@buildroot.org>; Tue, 31 Dec 2024 17:14:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TpJoR3gh_BHi for <buildroot@buildroot.org>;
 Tue, 31 Dec 2024 17:14:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E7075811E2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E7075811E2
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E7075811E2
 for <buildroot@buildroot.org>; Tue, 31 Dec 2024 17:14:52 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id A52C72003AE;
 Tue, 31 Dec 2024 18:14:48 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:60754])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 31 Dec 2024 18:14:48 +0100
MIME-Version: 1.0
Date: Tue, 31 Dec 2024 18:14:48 +0100
From: Julien Olivain <ju.o@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org, Maxim Kochetkov <fido_max@inbox.ru>
In-Reply-To: <20241231091019.1578462-1-thomas.petazzoni@bootlin.com>
References: <20241231091019.1578462-1-thomas.petazzoni@bootlin.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <0f4ce04aadabd43e81d1a328b917a904@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1735665290;
 bh=giz6NJ8cv6Myu00K43b4vnt6pGQmcmT7Bi8kpX0w7+0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=sR2WcbOsDC6yVt/IUIUVMXswpfmfRS30aMHAc6rl6ED0Rr4o9mL6G+raKVdUu3WSw
 GkKDyKJiIkM/gYkEVLK/YhEj3x36r8XhJexV56U1UbLWfdus1g43v2QFv+Glk+oFuS
 8uktHusIjHfKnp16KjZQTenY3ElUolZkrvv+4zxA75h2Sx/8WB9H53mtcVI8fot1r6
 cOvbYynvRKttLASB9oSqPZk44uouKZaSqKv3NcTIz93CX0gnnUb/zoImeNhq9VlXVk
 XmhjH7fLuikqIdUxX9HPTMQVD7jy4bdU3ZOHvjNt7frd5ngGIZukipL3D47nUw76yZ
 1em301PMT5vug==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=sR2WcbOs
Subject: Re: [Buildroot] [PATCH] package/postgresql: workaround
 documentation build failure
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Thomas,

On 31/12/2024 10:10, Thomas Petazzoni via buildroot wrote:
> Since the bump of Postgresql to version 17.2 in commit
> cc77be28fc030f8583a4a7f9f724d0fc9543dba5, the build fails when
> host-libxml2 and host-libxslt have been built prior to Postgresql, or
> when xmllint and xsltproc are available on the host machine, with:
> 
> I/O error : Attempt to load network entity: 
> http://www.oasis-open.org/docbook/xml/4.5/docbookx.dtd
> ../doc/src/sgml/postgres.sgml:22: warning: failed to load external 
> entity "http://www.oasis-open.org/docbook/xml/4.5/docbookx.dtd"
> ]>
>   ^
> ../doc/src/sgml/postgres.sgml:24: element book: validity error : No 
> declaration for attribute id of element book
> <book id="postgres">
> 
> As this happens when building the documentation, this commit proposes
> to disable building the documentation. Unfortunately, passing
> -Ddocs=disabled -Ddocs_pdf=disabled is not sufficient, as the
> documentation building logic still does stuff when it detects xmllint
> and xsltproc, so we "poison" the detection of those tools so that they
> do not get used.
> 
> This issue has been reported upstream as of bug #18760.
> 
> Fixes:
> 
>   
> http://autobuild.buildroot.net/results/b061e6a68c885e47a254e66dbc073e2b548b8cd3/
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

I applied to master, thanks.

For info, I added the link of your bug report. This message was 
published
after your bug patch submission. See:
https://www.postgresql.org/message-id/18760-82d1b83da31b898d%40postgresql.org

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
