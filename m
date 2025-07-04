Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C12B4C83F03
	for <buildroot@archiver.kernel.org>; Fri,  4 Jul 2025 20:44:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8F9E883D64;
	Fri,  4 Jul 2025 20:44:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IzJUtF8PUWwO; Fri,  4 Jul 2025 20:44:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D821983D72
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D821983D72;
	Fri,  4 Jul 2025 20:44:01 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 172DE15F
 for <buildroot@buildroot.org>; Fri,  4 Jul 2025 20:44:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 082DB60D5C
 for <buildroot@buildroot.org>; Fri,  4 Jul 2025 20:44:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Y57PNjx7G_zz for <buildroot@buildroot.org>;
 Fri,  4 Jul 2025 20:43:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 4C31F60D4F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4C31F60D4F
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4C31F60D4F
 for <buildroot@buildroot.org>; Fri,  4 Jul 2025 20:43:59 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 3FECB2003BE;
 Fri,  4 Jul 2025 22:43:56 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 04 Jul 2025 22:43:56 +0200
MIME-Version: 1.0
Date: Fri, 04 Jul 2025 22:43:56 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20250704165514.3700245-1-bernd@kuhls.net>
References: <20250704165514.3700245-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.11
Message-ID: <d020b8579fd7bbf72008b030010a76e2@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1751661837;
 bh=AsqCPNyS8Ol8wnysa9Dj+BIRbx/no+rc0UdWFr7JTjg=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=umF0GYJCLJIwADq2UtQvF8jejcOWnA/OLzr9g0FtyfSFi4Gwq/O+17H7qhGl4eezW
 4XQPqwB+gjkJCG3wyL7It2dLF3910WEw5ddp1zkfu5MTCOUXR6I6+HRCsq0Gfjjt+x
 R7spnILofEmwocS0J1TJ5EyGl3GNZNOZzfZU96JicA91+5OoXAi4wBwAKxcxHmmi9x
 FoLiH3O2CZZx2j+Yys2wl50GhxOKAGQAS7GsVqaoDqPImbSX1j7Eidbj2vShLDzzmv
 pmdxiFXa3UGXVzjy6YvJgborM4ap8BfR+EZMRf4LIext+/ha4c93k2cfdqmgzvXQ8d
 dXBZrm7DBRB/A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=umF0GYJC
Subject: Re: [Buildroot] [PATCH 1/1] package/nettle: bump version to 3.10.2
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

On 04/07/2025 18:55, Bernd Kuhls wrote:
> Release notes:
> https://lists.gnu.org/archive/html/info-gnu/2025-06/msg00006.html
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
