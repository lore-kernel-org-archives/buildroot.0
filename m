Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89ED7C3DA6D
	for <buildroot@archiver.kernel.org>; Tue, 20 May 2025 17:32:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5C72A40580;
	Tue, 20 May 2025 17:32:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UNE9nPSGpDZ6; Tue, 20 May 2025 17:32:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 79BB640524
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 79BB640524;
	Tue, 20 May 2025 17:32:53 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id AC148DE
 for <buildroot@buildroot.org>; Tue, 20 May 2025 17:32:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9E0FD404E1
 for <buildroot@buildroot.org>; Tue, 20 May 2025 17:32:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yCLjxzWLvu8D for <buildroot@buildroot.org>;
 Tue, 20 May 2025 17:32:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org C979C40577
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C979C40577
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C979C40577
 for <buildroot@buildroot.org>; Tue, 20 May 2025 17:32:50 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id CDB4519F742;
 Tue, 20 May 2025 19:32:47 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 20 May 2025 19:32:47 +0200
MIME-Version: 1.0
Date: Tue, 20 May 2025 19:32:47 +0200
From: Julien Olivain <ju.o@free.fr>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20250518174117.2148341-1-bernd@kuhls.net>
References: <20250518174117.2148341-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.10
Message-ID: <1017fa8926b85b706097c9098f4c2b09@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1747762368;
 bh=HcH6LSx+WhrXLmIaumpExnYugxPlp3JjPQXGAueTX/0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=PUndg56TWNh4WU36F0TUS0U+9Qakr07Sl/6pd0DpJ8Hz9UXqGOOSh9SE6XNvaLHSd
 MiJc/CzIzQ8UTztmZcOZ4zCYltGlc+5YEMpHr9VlHmRvxJGle1Fzb2rPs24gvuK0+7
 A6EfgDj1n9Q3+noZAT9vZ2St3hLrPdXvH6as6YG6p1+zpbngnXGZF9xX7Dbl8dXCTT
 qtLhR0YGa4Nen9KuphljdMSaeGdIDEWeo3ePxoa1kSc8yxYQ12HAN5LooK1KWGyCb/
 JJfjnVoTcOrM1AZdHl1SyhbRqh68NQKlGFjLlkGAgbaaRXWUq9Rqs6I7WJXBC0HFJ9
 Hz9Vxb0XHQlLw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=PUndg56T
Subject: Re: [Buildroot] [PATCH 1/1] package/libpng: bump version to 1.6.48
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

On 18/05/2025 19:41, Bernd Kuhls wrote:
> Release notes:
> https://raw.githubusercontent.com/pnggroup/libpng/v1.6.47/ANNOUNCE
> https://raw.githubusercontent.com/pnggroup/libpng/v1.6.48/ANNOUNCE
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to next, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
