Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79141EA8535
	for <buildroot@archiver.kernel.org>; Sun,  8 Mar 2026 16:54:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2B568608E7;
	Sun,  8 Mar 2026 16:54:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HtH8ps-UAIpy; Sun,  8 Mar 2026 16:54:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4834160857
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772988841;
	bh=NPinrpJzGzp9WltHayrj2j+a7Dfm/5t0ms+WRVXOQPc=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=YRm3JQDkeDkwKGar8W7UaUObS6zrk6P5DWNwhoaFo/dYIAWFKYbsju15jVLItzpw1
	 +LHKY1Dx2MVRUGhToeOSX3xYHAjZyIVEwiFfd0u8GFvJjt1334zFagUjaL3JTkNhH9
	 thAqCIiASGbMGgjqLmczqllo0Bjidl3AUjQsZt9L1FbtK7GVIQ7NL6MQBxILTiOzL7
	 MA5ZC5L4aJm+QXsJ7uxUm8o0FW4OYjZ9oT0mAug7sMWw0mh7+B93DQLm0bdior/fSy
	 xF9HV027ZKaI5vNusLxZCEBpclW1BrCRzYAEwlANH7W+TsyoumbvDTZghvxRrXB2kq
	 UB2MwnQxc0ECg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4834160857;
	Sun,  8 Mar 2026 16:54:01 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 90B12223
 for <buildroot@buildroot.org>; Sun,  8 Mar 2026 16:54:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 76C774018D
 for <buildroot@buildroot.org>; Sun,  8 Mar 2026 16:54:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QGOqO0ST8fYz for <buildroot@buildroot.org>;
 Sun,  8 Mar 2026 16:53:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 741C34002A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 741C34002A
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 741C34002A
 for <buildroot@buildroot.org>; Sun,  8 Mar 2026 16:53:59 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 992CC60128;
 Sun,  8 Mar 2026 17:53:56 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 08 Mar 2026 17:53:56 +0100
MIME-Version: 1.0
Date: Sun, 08 Mar 2026 17:53:56 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260308104252.1729989-1-bernd@kuhls.net>
References: <20260308104252.1729989-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.13
Message-ID: <078c7f84d65194854e3237137b6b1727@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1772988837;
 bh=hFz6wj0F5fS0GL9psYbAiLxc/Y4EDRUGwgehh4A/NwY=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=CuFp9pHbGRHEDGRnA0P86t9YqvndlZ2OUUjEich2myi4ptYoJttB8NvizSSe/IERv
 4m28XdzHO5oDStb/CaRA+7JOeZYbk3fP7S/JFQOojj9crqHLjok5JvvmWe8+6rSlKT
 FUC6HzsAE4CEf6ORq0i8VGdTt4gYIj+O63mq1WICNmmWKCZathaPcjqMNMFP3VyKNj
 T9O6zDC66WlTHDE8zlCLp8IOiJJwDRKPAB0rLbtFZiZFjMK2EXIR5HC0DjmHJkkqsc
 QI2VwsNJHEZpEPc5oei0awhPaH2vDrEum9SZ380zR5FbEXvYoyMwXMN2+RidyW1bwN
 gADS2VGvsTfVg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=CuFp9pHb
Subject: Re: [Buildroot] [PATCH 1/1] package/libuv: bump to version 1.52.1
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

On 08/03/2026 11:42, Bernd Kuhls wrote:
> https://github.com/libuv/libuv/blob/v1.52.1/ChangeLog
> 
> There's no newer release of uvw, and the current version of uvw
> continues to build with libuv 1.52.1.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
