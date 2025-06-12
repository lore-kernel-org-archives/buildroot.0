Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAB57C61CE8
	for <buildroot@archiver.kernel.org>; Thu, 12 Jun 2025 19:55:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9224440816;
	Thu, 12 Jun 2025 19:55:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LeZDTHhcWP7e; Thu, 12 Jun 2025 19:55:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BD43F40914
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id BD43F40914;
	Thu, 12 Jun 2025 19:55:26 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 6321A183
 for <buildroot@buildroot.org>; Thu, 12 Jun 2025 19:55:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 49598408D3
 for <buildroot@buildroot.org>; Thu, 12 Jun 2025 19:55:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 60dCSCW1jRGx for <buildroot@buildroot.org>;
 Thu, 12 Jun 2025 19:55:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 588A4407AD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 588A4407AD
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 588A4407AD
 for <buildroot@buildroot.org>; Thu, 12 Jun 2025 19:55:24 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 4C6F21C00EF; Thu, 12 Jun 2025 21:55:22 +0200 (CEST)
Message-ID: <f4d77d62-2e6f-4010-9927-4a0a16d87104@rnout.be>
Date: Thu, 12 Jun 2025 21:55:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Titouan Christophe <titouan.christophe@mind.be>, buildroot@buildroot.org
Cc: James Hilliard <james.hilliard1@gmail.com>, thomas.perale@mind.be,
 Oli Vogt <oli.vogt.pub01@gmail.com>, Marcus Hoffmann <bubu@bubu1.eu>
References: <20250606080051.976890-1-titouan.christophe@mind.be>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250606080051.976890-1-titouan.christophe@mind.be>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1749758122; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=PVB4MIsDe5aWxhaWsNn/VvHjRZ3/MGQE8TucYRVc3oI=;
 b=DlENmn/IaZvBEODR9SUC/5xt0ESpLFCqTJK3S6a0qNpoEpOvDf+LwPnEvSCSoPO96hFTnO
 Zchd/dlq6FyJyZsCoH9q6I+0w/upkRyUT2XGrNkWhMJucvIbZdr41kNTZP7lymvMFyosZS
 LQ5a0w7E7SaMLbx88aBt+G8MFHl/CW4+y43qw8FY3Uv5vu8+j7kh+lMsWWyn2luyk7cezW
 L5TTe770YZsH5y/sqWcoxB2GP1y7PdOvB42dK0nDAREcKg4VWeTh1vYB2LQcvLcq5VcEqC
 LYbQN5tydXHokD/pMOVtF8ZAehnSN3DQmsZTxETypJ1HyJxrDLLmcbK1M838gQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=DlENmn/I
Subject: Re: [Buildroot] [PATCH for 2025.02.x] package/python-django:
 security bump to v5.1.10
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 06/06/2025 10:00, Titouan Christophe via buildroot wrote:
> This fixes the following CVE:
> 
> - CVE-2025-48432: An issue was discovered in Django 5.2 before 5.2.2,
>                    5.1 before 5.1.10, and 4.2 before 4.2.22.
>                    Internal HTTP response logging does not escape request.path,
>                    which allows remote attackers to potentially manipulate log
>                    output via crafted URLs.
>                    This may lead to log injection or forgery when logs are
>                    viewed in terminals or processed by external systems.
> 
> See https://www.cve.org/CVERecord?id=CVE-2025-48432
> 
> Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>

  Applied to 2025.02.x, thanks.

  Regards,
  Arnout

> ---
>   package/python-django/python-django.hash | 4 ++--
>   package/python-django/python-django.mk   | 4 ++--
>   2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/python-django/python-django.hash b/package/python-django/python-django.hash
> index 57b9e9fb0e..330fdf8238 100644
> --- a/package/python-django/python-django.hash
> +++ b/package/python-django/python-django.hash
> @@ -1,5 +1,5 @@
>   # md5, sha256 from https://pypi.org/pypi/django/json
> -md5  da93c81fcaf2e0b4dab3cf44e7564c7c  django-5.1.9.tar.gz
> -sha256  565881bdd0eb67da36442e9ac788bda90275386b549070d70aee86327781a4fc  django-5.1.9.tar.gz
> +md5  d3b7a04b581dec5d74769df44e0ddbd1  django-5.1.10.tar.gz
> +sha256  73e5d191421d177803dbd5495d94bc7d06d156df9561f4eea9e11b4994c07137  django-5.1.10.tar.gz
>   # Locally computed sha256 checksums
>   sha256  b846415d1b514e9c1dff14a22deb906d794bc546ca6129f950a18cd091e2a669  LICENSE
> diff --git a/package/python-django/python-django.mk b/package/python-django/python-django.mk
> index fd8a4eb9e8..1b769af62a 100644
> --- a/package/python-django/python-django.mk
> +++ b/package/python-django/python-django.mk
> @@ -4,10 +4,10 @@
>   #
>   ################################################################################
>   
> -PYTHON_DJANGO_VERSION = 5.1.9
> +PYTHON_DJANGO_VERSION = 5.1.10
>   PYTHON_DJANGO_SOURCE = django-$(PYTHON_DJANGO_VERSION).tar.gz
>   # The official Django site has an unpractical URL
> -PYTHON_DJANGO_SITE = https://files.pythonhosted.org/packages/10/08/2e6f05494b3fc0a3c53736846034f882b82ee6351791a7815bbb45715d79
> +PYTHON_DJANGO_SITE = https://files.pythonhosted.org/packages/73/ca/1c724be89e603eb8b5587ea24c63a8c30094c8ff4d990780b5033ee15c40
>   PYTHON_DJANGO_LICENSE = BSD-3-Clause
>   PYTHON_DJANGO_LICENSE_FILES = LICENSE
>   PYTHON_DJANGO_CPE_ID_VENDOR = djangoproject

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
