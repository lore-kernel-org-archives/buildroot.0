Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 765FFCD5BD0
	for <buildroot@archiver.kernel.org>; Sat, 30 May 2026 20:59:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2767884C96;
	Sat, 30 May 2026 20:59:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2KHJmEIHzb55; Sat, 30 May 2026 20:59:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4298E8529D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780174754;
	bh=lx9fuVqvk4HX4EXUP0OLHo3S6cDRuKrkv3CPVRXlCVM=;
	h=To:From:Date:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=cZTrnVzAJd/U8wmAz8Gh84mcL3DEQ/1CmZO17bWK1PbJxu7NKc+xTNHJ3rEpuT3sn
	 Yj3dM6QOD5TtxewZr9ZhwcTpZQ0uRErChsy9Dey0fo+Srl6qiv6Okw2h1BJqbxbVTZ
	 oPlG7+4Pcxb3usMVzsBqLaOye+Oz5o9Y2UYJvcvao7z8EvNT4yB/8EddtsZe1+UpJP
	 4zM6UXMoAzPEsGQMZtzTQ1MsrBinGrriaHLFQbGER/R53B1XRETMNazMrcU4G0DHhC
	 W0AkLJXZ+XXbFgIWJsH/jMz7ZT/E259th4XJHQ+TZK3qSOBn1YvUNPFC8E6XMWV4Wo
	 hQYHKTCD+O8fg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4298E8529D;
	Sat, 30 May 2026 20:59:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id C7C9212F
 for <buildroot@buildroot.org>; Sat, 30 May 2026 20:59:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B8CC48529D
 for <buildroot@buildroot.org>; Sat, 30 May 2026 20:59:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2qRNAs7wF0wj for <buildroot@buildroot.org>;
 Sat, 30 May 2026 20:59:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=116.202.254.214;
 helo=ciao.gmane.io; envelope-from=gclub-buildroot@m.gmane-mx.org;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B6D2184C96
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B6D2184C96
Received: from ciao.gmane.io (ciao.gmane.io [116.202.254.214])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B6D2184C96
 for <buildroot@uclibc.org>; Sat, 30 May 2026 20:59:10 +0000 (UTC)
Received: from list by ciao.gmane.io with local (Exim 4.92)
 (envelope-from <gclub-buildroot@m.gmane-mx.org>) id 1wTQlv-0003gs-1e
 for buildroot@uclibc.org; Sat, 30 May 2026 22:59:07 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: buildroot@uclibc.org
From: Bernd Kuhls <bernd@kuhls.net>
Date: Sat, 30 May 2026 22:58:13 +0200
Message-ID: <pan$b370e$2092f81$879e2c5e$4444ebba@ID-313208.user.individual.net>
References: <20260530190023.2108688-1-bernd@kuhls.net>
 <9c1fb04c-d11e-4d24-8985-2cd962098179__44922.5743462861$1780171356$gmane$org@rnout.be>
Mime-Version: 1.0
User-Agent: Pan/0.162 (Pokrosvk)
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=kuhls.net
Subject: Re: [Buildroot] [PATCH v2 1/1] package/lrzsz: fix build with gcc >=
 14.x
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Am Sat, 30 May 2026 22:02:12 +0200 schrieb Arnout Vandecappelle via
buildroot:

>> +Upstream: N/A, patching generated file
> 
>   That's not a good reason actually. You can still send a patch upstream 
that 
> fixes configure.in.

Hi Arnout,

as you can see I decided against dropping this package although the last 
release dates back to 1998 (no joke!): https://www.ohse.de/uwe/software/
lrzsz.html

There is no active upstream but various distros provide the package:
https://tracker.debian.org/pkg/lrzsz
https://packages.fedoraproject.org/pkgs/lrzsz/lrzsz/
https://openwrt.org/packages/pkgdata/lrzsz
https://layers.openembedded.org/layerindex/recipe/326216/

so I opted for a fix.

Regards, Bernd

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
