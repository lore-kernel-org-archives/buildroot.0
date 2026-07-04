Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3919EC43458
	for <buildroot@archiver.kernel.org>; Sat,  4 Jul 2026 16:13:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0BA08408F7;
	Sat,  4 Jul 2026 16:13:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oEZ3YCLlqDML; Sat,  4 Jul 2026 16:13:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 403F040985
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783181589;
	bh=Lg2GsJeQQZ9i3+GPHmATPohTXw0RHl+9N7VWNYVcXTA=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=gvsWSAPGJSufG4kJDG88C2CYRqPB5zuyJQxpagynp96/ifiFkfYK8TmlHJe8Mlqdo
	 MeF6JjLbQEkQM0cQeSMMnBhkyb91gGKVtXZc9wCT8oJYg5EfUhCI6L8Sdz0SWZqLwb
	 luvh4ZppDm7vkPcw3PF9tVe3F9F/2NIQlwuGeYjhO8BMKWuODpoMtLiwAQhzWgIB3p
	 rDKLqjPTQbYLPOQio0pIzJN7yFZ2eUotaSefStu6F4T1mU3JkWXEN/uU0lv2MRWZCP
	 HrlzZ1n4oXWXhS2ABXmNP5a4S7Jn8l227OVZIE0S3KEwLetAUY/Uu0AjvnrvlambZc
	 EaQdfHsvTpW6Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 403F040985;
	Sat,  4 Jul 2026 16:13:09 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id A08E5316
 for <buildroot@buildroot.org>; Sat,  4 Jul 2026 16:13:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 86BD440102
 for <buildroot@buildroot.org>; Sat,  4 Jul 2026 16:13:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uXBy0FHTMcai for <buildroot@buildroot.org>;
 Sat,  4 Jul 2026 16:13:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 835EC400FD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 835EC400FD
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 835EC400FD
 for <buildroot@buildroot.org>; Sat,  4 Jul 2026 16:13:06 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 5B7B1B00583;
 Sat,  4 Jul 2026 18:13:02 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 04 Jul 2026 18:13:02 +0200
MIME-Version: 1.0
Date: Sat, 04 Jul 2026 18:13:02 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Pierre-Jean Texier <texier.pj2@gmail.com>
In-Reply-To: <20260703191951.3692295-1-bernd@kuhls.net>
References: <20260703191951.3692295-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.16
Message-ID: <cf62740c87d57df3bc6f28623239a9a4@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1783181584;
 bh=CTIY26apc2t0BRngqrlvLh82EtvSpq8ef0G4xEutTAg=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=FfPQ6BX6wZADFjLv4Rp+tXcsDVG/OHlg6YNKAB1cHp9RTyy2JJrJxExlfmpJTn8sg
 7/UqYaDY0u0jzyYBOPMjo/BgClGOwDx7RUWUUPfxms0DqFMX8MjV3bSYVuHcBsn2jK
 ExuYVtVGEnpDsB3bkQKQwYPAF2vHF2Xjz6iaJbU5JbzqlYmAHV8qchruBerPPWuwfv
 akHwRvPsX/zQqY3m/1WxygACFYd23MU4RmyYN+KCjg7oRMilF16pozkdy6YkqDVGps
 Pj6rgr35cMWMKj615uqPThr3Ng2onCF1XPvCgrm4Os97Z5PPY78q/p5ZOEHlWaudcI
 rtXhdvaHoOSlw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=FfPQ6BX6
Subject: Re: [Buildroot] [PATCH 1/1] package/libevent: security bump version
 to 2.1.13
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

On 03/07/2026 21:19, Bernd Kuhls wrote:
> https://github.com/libevent/libevent/releases/tag/release-2.1.13-stable
> 
> https://seclists.org/oss-sec/2026/q3/7
> "[None of the GHSA's list CVE id's at this time.  -alan-]"
> 
> Switched to sha256 tarball hash provided by Github, drop sha1 hash.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
