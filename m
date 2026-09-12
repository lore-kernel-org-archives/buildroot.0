Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9512AC79FB6
	for <buildroot@archiver.kernel.org>; Sat, 12 Sep 2026 10:50:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 177E160617;
	Sat, 12 Sep 2026 10:50:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hfcIVM0SM0FC; Sat, 12 Sep 2026 10:50:32 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org E30D860606
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789210232;
	b=AWEhpZH3EXeEuTJhNR3IuY91uyAZ4pvGRthVt1yhptpHkjz0Nm6RRlJHR8WYE2k1X4Up
	 bOQEme7aCYRAoUr84Z+VtqCZ4CLzWJR6iy6lFLsCtybaWzAPxU5VL4lsYwZgoGfphghZ8
	 IRFT882Ljl/Kf6X5qIwkfiyRDna6rLzSs6rs9enexAD+cG/yx5gqGw9KUMtar3PClbYrh
	 7ADwiAjb2GnSiaOmhrejiAuxOxwvzySt3BSAPJXpcfwkdkxFNarLCrMt2OsL+WEkgriqs
	 lUDhR/PBjWbEI6/iHVvlTYn/W0/WW+TSRcBtu/eVnDp28C0RRc5vsKWM49I6xT64o+g==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789210232;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=6/qJpVyRIqQEkOwadc9Ju+Id2VQePgDlgqD6hOz8R+Q=;
	b=baaqkB1xypHhhhqhN3qNZLxfOLdVaiTe7IOkEeoKNSHXALdwde3MQ0QbjGyCMGCe2WiT
	 vHoNPDCGn5lfG9WDdRic9u0G6KgEKc2Nquh+sZ3MHI8dJr1y4/xLjirrabH3cZjXqqp21
	 PUPzTXW5ITz2MNoez5sSQqDe22MsQYpNn4L1rQO1X7eq7eW3Gw2SWvH4U2vVA7o4RzE4+
	 8ERTEwMPRP6HdoFhXuMx02LKfotyQvZA8zMgA7SiX3FCixYO7WH60H7O68277Wbctth3+
	 v7XY2QfTf4XjsDWycGzz/lcv+Z++Q2NozfkVhrknZtYJrO/Uj9++97HWYHkP7/OUr+w==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789210232;
	bh=6/qJpVyRIqQEkOwadc9Ju+Id2VQePgDlgqD6hOz8R+Q=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=BMLbZckWY2qoqeKv8VJhLLwFhCM5EObHs1003L9ciX7QS+OjscZ0xJq2HTFcio+zW
	 L52qZcITbsolw0VihJ30JLMnRXPiIBBYpvtZOk6aUs5RXOyo5i5v42Qoh1nGbDw75T
	 vYG0GWXYKJLeyTUeGSEcj/nx2piaGJ9xZVHKVRGZ+fGsvY/mbT1jeNlH/qrgl/eCqi
	 rhI6K/g+fHNwjuaI2db9/Yeb4RrXiydifYoanUNAJOAaQLT+W4/bgXIBeBhTIaIBcy
	 HQHNhP7FaBZldYr1Yga23ZFO2zjrBT4K0RxK4AyHTQAUbJPeF4P4US83O3/L205tV1
	 VknWKtxkwTLJw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E30D860606;
	Sat, 12 Sep 2026 10:50:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 9FA832D0
 for <buildroot@buildroot.org>; Sat, 12 Sep 2026 10:50:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 85D93405CC
 for <buildroot@buildroot.org>; Sat, 12 Sep 2026 10:50:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id shID2r2EGslZ for <buildroot@buildroot.org>;
 Sat, 12 Sep 2026 10:50:29 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 95828405C9
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789210229;
 b=nBw3u/UKFOOaxmM9Zld6LuirDAR1PODpeOXlForp7egsxTSngPAsQpJxlWInkRQlTBAe
 ESSe+wjhsRcvs66BEKdJibdTfCNOzCH1a/qlVBQ5fY6RJ64Wu02DBV6mgQ0f2SxrmMqZJ
 7VGsXKFWLGMahTeeFhCDeMoesferit+CtsFoVlfXZ+0aDF15GvJY4uCVR0+v48Cz/d/fm
 Sb1ignpTcqP2wOPyahoV1BAXwT9gEgfwyiIW0rjja1LY3Ja1AAEs0slwPVJw6cK8EQQl4
 sDH+Wff+7XvqOto6hbpkK6Fan44vWUlPT0PlApQ1IHjhrYWMCRRX7pOahfLQJ1GbB2A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789210229;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=RbHUldyKP5NuATEG6lCkMMxybxI9T96SynY1yLkK/uw=;
 b=Ao9rist7iNpQDNzwziKHkRobzSCWoVVZHSMywXQ/qYcptP4kYrVQB6sFMnunWS5YTLlB
 LoK/QEmyuPDOzKHIqOwfo6xv9YT9jLXRrryLPlwzt/FgSsA4sGr1zp/tg+TLnVmIn8PWp
 4msbiRSmyazM/5JsBGoIipFj0JExlKjIa/wJEh+qsaG2Yp9z+fnv/NVsusU4q+JclHYU/
 2A78+nIXszXDZKylAus0Xvylm4PkI1VU0UMxkGbBs+yL5IjNQXEn9FsNu4GJ7f7yAcQtM
 XW9WqZSye4I/EgyBHAPFDMwJdvL+jqdMRBMd7Ra8JZlO4FkO3wZNr6FBiYhXhGDJ8Dw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=free.fr; 
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=ENtLwzVl; 
 arc=none smtp.remote-ip=212.27.42.6
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 95828405C9
 for <buildroot@buildroot.org>; Sat, 12 Sep 2026 10:50:29 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id EEA54780333;
 Sat, 12 Sep 2026 12:50:24 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 12 Sep 2026 12:50:24 +0200
MIME-Version: 1.0
Date: Sat, 12 Sep 2026 12:50:24 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Robert Rose <robertroyrose@gmail.com>
In-Reply-To: <20260906091418.3584407-1-bernd@kuhls.net>
References: <20260906091418.3584407-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.19
Message-ID: <8b6d698c28d7e6dcc194cbdfb1d0f060@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH 1/1] package/grpc: bump version to 1.83.1
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

On 06/09/2026 11:14, Bernd Kuhls wrote:
> https://github.com/grpc/grpc/releases/tag/v1.83.1
> https://github.com/grpc/grpc/releases/tag/v1.83.0
> https://github.com/grpc/grpc/releases/tag/v1.82.2
> https://github.com/grpc/grpc/releases/tag/v1.82.1
> https://github.com/grpc/grpc/releases/tag/v1.82.0
> https://github.com/grpc/grpc/releases/tag/v1.81.1
> https://github.com/grpc/grpc/releases/tag/v1.81.0
> 
> Rebased patch 0001.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
