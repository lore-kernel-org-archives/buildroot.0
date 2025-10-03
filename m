Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF8BFCCA471
	for <buildroot@archiver.kernel.org>; Fri,  3 Oct 2025 17:26:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A852B40572;
	Fri,  3 Oct 2025 17:26:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bGpyfrN_MDlC; Fri,  3 Oct 2025 17:26:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BC008404CB
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id BC008404CB;
	Fri,  3 Oct 2025 17:26:09 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 4195E91C
 for <buildroot@buildroot.org>; Fri,  3 Oct 2025 17:26:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2737E404B8
 for <buildroot@buildroot.org>; Fri,  3 Oct 2025 17:26:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sJmGiBQ-hptO for <buildroot@buildroot.org>;
 Fri,  3 Oct 2025 17:26:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 440AA404A6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 440AA404A6
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 440AA404A6
 for <buildroot@buildroot.org>; Fri,  3 Oct 2025 17:26:07 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 6DC872003D6;
 Fri,  3 Oct 2025 19:26:00 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 03 Oct 2025 19:26:00 +0200
MIME-Version: 1.0
Date: Fri, 03 Oct 2025 19:26:00 +0200
To: Titouan Christophe <titouan.christophe@mind.be>
Cc: buildroot@buildroot.org, James Hilliard <james.hilliard1@gmail.com>, Oli
 Vogt <oli.vogt.pub01@gmail.com>, Marcus Hoffmann <bubu@bubu1.eu>
In-Reply-To: <20251003104739.55723-1-titouan.christophe@mind.be>
References: <20251003104739.55723-1-titouan.christophe@mind.be>
User-Agent: Webmail Free/1.6.11
Message-ID: <de2a5b3b8fea2f2c975afda5237f5407@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1759512364;
 bh=3Tr/5ldFjm+6BC5Tvr8tDf/A5LeiTyL+n7gfTxNdjzc=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Od3foOocxQjk1DI3u0N+v+DSlj8tCEpw1mszs+uBg0UVDl22nDm18iU1cDTuJoJqR
 dwKG3qP3pE47xkmkRYUQbt+uILAGb0JMfzNlz5FqTjlCYG8NTiG1Ch38A55F/Sk0QT
 y4af2kJtsXmsJ93STdBO3iQodIgCGInGpeauzlbW9pSkfJm6BXUkG6lTwy9GQef7rk
 YKEOR5YNgM/521CEU/k6tvLqLTLZH6iQ1NPqNa/e2OlMa1pPSluaVrcdSfKg+pJ5XY
 7XW7FRIO5EEfLK9XU9Ptz8EiVmyrSCWNbZeNOPv8Dx0dSuZv8VEKF7UsKbSmhfD54s
 UsRSnGxZ7VcUw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Od3foOoc
Subject: Re: [Buildroot] [PATCH] package/python-django: security bump to
 v5.2.7
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

Hi Titouan,

On 03/10/2025 12:47, Titouan Christophe via buildroot wrote:
> See the release notes: 
> https://docs.djangoproject.com/en/5.2/releases/5.2.7/
[...]
> diff --git a/package/python-django/python-django.hash 
> b/package/python-django/python-django.hash
> index 3ff4eb4e36..f13f5e9d7a 100644
> --- a/package/python-django/python-django.hash
> +++ b/package/python-django/python-django.hash
> @@ -1,6 +1,6 @@
>  # md5, sha256 from https://pypi.org/pypi/django/json
> -md5  1f0327293cc3768903ce8cd390ec3f47  django-5.2.6.tar.gz
> -sha256  
> da5e00372763193d73cecbf71084a3848458cecf4cee36b9a1e8d318d114a87b  
> django-5.2.6.tar.gz
> +md5  699a77ac347ca3484939762483dc4b08  django-5.2.7.tar.gz
> +sha256  
> e0f6f12e2551b1716a95a63a1366ca91bbcd7be059862c1b18f989b1da356cdd  
> django-5.2.7.tar.gz
>  # Locally computed sha256 checksums

The legal info check is failing, when running the command:

     make python-django-legal-info

Could you send an updated patch fixing this, please?

>  sha256  
> b846415d1b514e9c1dff14a22deb906d794bc546ca6129f950a18cd091e2a669  
> LICENSE
>  sha256  
> dcac1c86cb7ab491702bdb4c41be680fafde51536748cc8aaee3840eec53ed17  
> django/contrib/gis/measure.py

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
