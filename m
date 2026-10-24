Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04B4B606A321
	for <buildroot@archiver.kernel.org>; Sat, 24 Oct 2026 11:56:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=A1PZhwBB
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D0C1781767;
	Sat, 24 Oct 2026 11:56:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SjGuocMpfTQ5; Sat, 24 Oct 2026 11:56:24 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 16E0081760
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792842984;
	b=RLrvDnVQji1DYZAihry8sOSleT0sYJqPgc/Z6WUKiBliRA1emLJ28ZxJbBL1G7iBr+/1
	 /cHGr/0Bcl5M3ZeMs0Tjw1hMFBq11uVH/zobQIOaxtomvyuapw0PWt0jS14ts+dAaCSUQ
	 0M1s6otPqHC5EwmrsNjukWjzwsLXH3cyJw8KMZ7GXjkSQsAUWV7xcRBimxGvDEo3Xm0UG
	 OJLesSmltpP6nJ1BObf3AYwDd4ZhbCPZ2sh5WGehKSFQM82imVlHb3JOKML32a3NciuzS
	 fTSEnHX2GXwMW7wufc8a+ISHbparZr48bBA0uHyEjbQeGHtMX8U4JHYzVYP1RN+DBDw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792842984;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=ejdEfKrKUy5ciuLUXf28SzGIyJ/6ag1YlEE1Dlxj5KQ=;
	b=CUC1hMG56pzqhE/qA4HgL+hdKga9cQpLrw5gjb0CYybVuxiHkG6BlkGEz8Msl+PMB0gm
	 bJFhhQgLEFKUG5oF2wVJyfv98CO+My7tusdk+fD4Uv9mJvYSy0KoLR6pDPWFMZiIb0So6
	 i/0aHDmWFIT5gWYb555zQDhfi3RYs9ieUqrG84T34G4pVmOhmvFmWOzvu845kM2MJnxne
	 SCgErUGrbw87QTuKsEtf0Yy3gxpN3o2ERlRR5fBg4IgGbgUozIGOgwXz1B1HB4v83gPsS
	 DMFEQdBDI4+i7FNfbK2oYlpBptXmV49ncs5gK9/9gRGLX4DN6MmiIIWHVR74Dcq7uvw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792842984;
	bh=ejdEfKrKUy5ciuLUXf28SzGIyJ/6ag1YlEE1Dlxj5KQ=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=A1PZhwBBOJtBYTCdZhUkQepIpMK3Dt93ekW4gbVlJRJyUnEwCyxii0neIm9ZbzE2p
	 NTWezv0ARTHIr0uHKYiBFK+SdasuqjQFvAZJJtUNxBtZ+cnZlyoaZ8hTIago3bybDm
	 2+k2JD7mxRjglZWJoaSRtFIf1gMb/m2G0y7kVS1/roFVOAopQwadae8GujyepczH8U
	 gsSYyLw42gog8Hvfk5bmRGTA1Qf/rj8gdzgIjubRLcwRamAfVjIv6PRCN501B8f0gN
	 WEUD0GPAADWToNkbK/TtZDFX2n3dHWNaXJMmD/VJO9vl7uUr2jM5CJ6u2RtTMOWb66
	 wvGYymWoLpU2Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 16E0081760;
	Sat, 24 Oct 2026 11:56:24 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id C8C3143
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 11:56:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AF8784007B
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 11:56:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RlyeC-SRyK3p for <buildroot@buildroot.org>;
 Sat, 24 Oct 2026 11:56:22 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org EC98840068
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792842982;
 b=NP2bnqUyY7jo9yHBimWteVCPvwmrHaeFbutDOHGHDVDOAecHUJdspVrqEEG/CoKa8WIC
 Et0Wyxi2hVKBbl+TWrU99LHqtC58QPSXW921PDvck6i1EpWJfmOlpVsJ6RbDcgpiM2kN5
 kKBohVeHmG1574rWZt7Nq/aVC05JIyZM2i4qIj+sLBjeqm5YlCekP47oLgzg7Wi7z9hRN
 rtOzQ9jN7bix6r7tQZ9McPiO9CjOx/iX2uLXJktityvWx1OQesDsOup00jmYSfvfQtFNY
 LZYWgDJahAIda8T2qOA1ElR0dJt/c2GWkAVGc51WzErgFQcPvygz76tnJnmeiqjHrNw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792842982;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=lqmJULBsuA5sY6aLE7QBVEwzBn9VEoFffbFhDtJ3yQk=;
 b=Gx799W0cX8sWgxI/pXg3XGp5S3uf7x4n0Fh6DQs3KEq6D/iE0zRnnYTUzclJcb4E2KdL
 jUeVY44ZBz8tAnTyu5yNd7vn/j4gmAqYFC6b9agsSG2d5/aDYdptYL+wuYPZuUTixDbGi
 aVNFyAEG8+nnjtKMZpLWfpZR4fLq6/dTts+nFuSUwkHfCOH8YL2rnXsT0O9JoEnuQIUVD
 TyflyCwEucPJBMpl5v57a6JzqA0P4AYZ8M1hRFbmGEpkU0cAHn3gduBvW+v7efbQgpftf
 590B79vjDmocfvNNaLP7Tq8fO3czIqmYmwV0rxZm032sIPV1STQmNZ2EoY9GxmSQfbw==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=free.fr;
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=Y6s5l0Wh; 
 arc=none smtp.remote-ip="2a01:e0c:1:1599::15"
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::15;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EC98840068
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 11:56:21 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 5E0987804FD;
 Sat, 24 Oct 2026 13:56:17 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 via
 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr with HTTP (HTTP/1.0
 POST); Sat, 24 Oct 2026 13:56:17 +0200
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Sat, 24 Oct 2026 13:56:17 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org, Manuel Diener <manuel.diener@oss.othermo.de>
In-Reply-To: <20261023181818.920329-28-james.hilliard1@gmail.com>
References: <20261023181818.920329-28-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.20
Message-ID: <a72ed85b4d625eb7df23915484ffbbc4@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH] package/python-tzlocal: bump to version
 5.4.5
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
