Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0312E77188
	for <buildroot@archiver.kernel.org>; Tue, 31 Dec 2024 17:17:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 91A6C60782;
	Tue, 31 Dec 2024 17:17:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id X__jFJMREWZM; Tue, 31 Dec 2024 17:17:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8F93660785
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8F93660785;
	Tue, 31 Dec 2024 17:17:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 9676B968
 for <buildroot@buildroot.org>; Tue, 31 Dec 2024 17:17:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 77788812C0
 for <buildroot@buildroot.org>; Tue, 31 Dec 2024 17:17:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IZLFQutIOm62 for <buildroot@buildroot.org>;
 Tue, 31 Dec 2024 17:17:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 7708E811F1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7708E811F1
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7708E811F1
 for <buildroot@buildroot.org>; Tue, 31 Dec 2024 17:17:12 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 5ABC52003DE;
 Tue, 31 Dec 2024 18:17:09 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:55912])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 31 Dec 2024 18:17:09 +0100
MIME-Version: 1.0
Date: Tue, 31 Dec 2024 18:17:09 +0100
From: Julien Olivain <ju.o@free.fr>
To: Maxim Kochetkov <fido_max@inbox.ru>
Cc: buildroot@buildroot.org
In-Reply-To: <6cf7bbe8cdab290b3e8581d40357ecc3@free.fr>
References: <20241210154240.1380886-1-fido_max@inbox.ru>
 <6cf7bbe8cdab290b3e8581d40357ecc3@free.fr>
User-Agent: Webmail Free/1.6.9
Message-ID: <ef8da0bbb202d9c4e00285819016bbd9@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1735665430;
 bh=UQwmN3LtJfESAl09bGHHnGLvojmyWIsEVxZfFXdNHfw=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=QvGoprY2B7r+wy9s+f9tgaUMB9FOC9NXA83CKqWO9wtOu4Kk9mPGKgz3ZNGzWsvLp
 LIq+R7c395VuymxYjFlL70gdEF3KjIpvhl73DSYF6AlJ0jb1SYt9A5xk8nEbPIG+Lx
 hj4x8ak6mNUAs/Mw66RwFcASCXvwiXHVqKB5LLMJAtljmiQU+ZI2jIei96BrgRtm5u
 jxoXiizkQw03VuoNFmO+WChKZVjP6Tn/M11/zxTsCbAeGbuKSlYR+G8YBJwVWq4jz9
 SVniePnnRorXoJvpdnvyF4HtqX0v5ohkshJo9VV/ovUq/Vk1qjYrd25aUNMSNCnULs
 icocp5YgtTNBQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=QvGoprY2
Subject: Re: [Buildroot] [PATCH 1/1] package/postgresql: add patch to
 disable docs build
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

Hi Maxim,

On 11/12/2024 00:00, Julien Olivain wrote:
> Hi Maxim,
> 
> Thanks for the patch!
> 
> On 10/12/2024 16:42, Maxim Kochetkov via buildroot wrote:
>> docbook package is needed for building docs. Build fails without it
>> if xmllint is found on host:
>> 
>> I/O error : Attempt to load network entity: 
>> http://www.oasis-open.org/docbook/xml/4.5/docbookx.dtd
>> ../doc/src/sgml/postgres.sgml:22: warning: failed to load external 
>> entity "http://www.oasis-open.org/docbook/xml/4.5/docbookx.dtd"
>> ]>
>>   ^
>> ../doc/src/sgml/postgres.sgml:24: element book: validity error : No 
>> declaration for attribute id of element book
>> <book id="postgres">
>>                    ^
>> 
>> So disable docs build.
> 
> It seems postgresql is not always failing. In some situations,
> it can build. See for example:
> https://gitlab.com/buildroot.org/buildroot/-/jobs/8580182027
> 
> I also see that the PostgreSQL meson build system provides option
> to build the docs. See:
> https://git.postgresql.org/gitweb/?p=postgresql.git;a=blob;f=meson_options.txt;h=246cecf382712d94157856d6d5403f6d0fc13148;hb=6304632eaa2107bb1763d29e213ff166ff6104c0#l88
> 
> Did you try to always disable docs by setting those options to false
> in _CONF_OPTS?
> 
> For example, setting:
> 
>     POSTGRESQL_CONF_OPTS = \
>         -Ddocs=false \
>         -Ddocs_pdf=false \
>         -Drpath=false
> 
> See:
> https://gitlab.com/buildroot.org/buildroot/-/blob/master/package/postgresql/postgresql.mk#L17

For info, I applied the patch from Thomas, see:
https://gitlab.com/buildroot.org/buildroot/-/commit/f0422b41df9d5b638b59ffc9811f9bce135f3e35

There is indeed an upstream bug.

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
