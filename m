Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18B15C61DB9
	for <buildroot@archiver.kernel.org>; Thu, 27 Aug 2026 19:27:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D52BE80E7A;
	Thu, 27 Aug 2026 19:27:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QgMjltyEN8EU; Thu, 27 Aug 2026 19:27:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787858846;
	bh=/PN8LT6UuexJxF4NwIjOpn478ekrdXSJ54mMJvul4Lk=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=h2pEidvYBeO3H4KIb7jDtucNtCJTG9KxBZHjSvDFa+46tcD+2K3kkXBXy8EIuQqVt
	 +ZONbjZNF3rtNXFoLx92vZphMdEAqajexT2+FTUoYd+D/DEphHxICARPORMJPXFkZB
	 s6qmAAHTzJiAIHg2uKzam++QjEQ5lAqGVAjybaUQWjlcDbh66AeWZO8v2YO4JFh46L
	 8/I6dZDaz5uzJS1jb7Hz+2sKhjh+niwA2apNPapKmJsEjRQ4A+7Ekx1F9aHK0H52he
	 4grWhtDfDvHg6vJl0Tqj3o30OviQuJHQZltC9c5dv+1IUW96aXGWFiKfccYyptqVFs
	 wS/r/34TYI06w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2188680937;
	Thu, 27 Aug 2026 19:27:26 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 32B76466
 for <buildroot@buildroot.org>; Thu, 27 Aug 2026 19:27:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 188D8404FF
 for <buildroot@buildroot.org>; Thu, 27 Aug 2026 19:27:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mLRB1eznsckf for <buildroot@buildroot.org>;
 Thu, 27 Aug 2026 19:27:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 136A7404F4
 for <buildroot@buildroot.org>; Thu, 27 Aug 2026 19:27:22 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 89A3A6012D;
 Thu, 27 Aug 2026 21:27:17 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Thu, 27 Aug 2026 21:27:17 +0200
MIME-Version: 1.0
Date: Thu, 27 Aug 2026 21:27:17 +0200
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org, Jesse Van Gavere <jesseevg@gmail.com>, Roy
 Kollen Svendsen <roykollensvendsen@gmail.com>
In-Reply-To: <20260826142830.4040428-1-thomas.petazzoni@bootlin.com>
References: <20260826142830.4040428-1-thomas.petazzoni@bootlin.com>
User-Agent: Webmail Free/1.6.18
Message-ID: <710aec991013e6cb7c60d7b8dd13559a@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH 1/2] package/qt6/qt6declarative: move
 comment where it belongs
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

On 26/08/2026 16:28, Thomas Petazzoni via buildroot wrote:
> The commit "Enable host test module to ensure that qmltestrunner is
> built" in qt6declarative's Config.in feels lonely under
> BR2_PACKAGE_QT6DECLARATIVE. It's because it's actually related to a
> select done in the sub-option BR2_PACKAGE_QT6DECLARATIVE_QUICK, so
> move it there.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Series applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
