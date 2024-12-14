Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 176FFE7716A
	for <buildroot@archiver.kernel.org>; Sat, 14 Dec 2024 18:55:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7064B6062B;
	Sat, 14 Dec 2024 18:55:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zS6yUeDpW5dH; Sat, 14 Dec 2024 18:55:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 597C060775
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 597C060775;
	Sat, 14 Dec 2024 18:55:37 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 7A5D7C5
 for <buildroot@buildroot.org>; Sat, 14 Dec 2024 18:55:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 74B17400F6
 for <buildroot@buildroot.org>; Sat, 14 Dec 2024 18:55:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NGypiIOENECF for <buildroot@buildroot.org>;
 Sat, 14 Dec 2024 18:55:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.2;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 2B55240042
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2B55240042
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2B55240042
 for <buildroot@buildroot.org>; Sat, 14 Dec 2024 18:55:34 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 8712120039E;
 Sat, 14 Dec 2024 19:55:29 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:41910])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 14 Dec 2024 19:55:29 +0100
MIME-Version: 1.0
Date: Sat, 14 Dec 2024 19:55:29 +0100
From: Julien Olivain <ju.o@free.fr>
To: Peter Korsgaard <peter@korsgaard.com>
Cc: buildroot@buildroot.org, James Hilliard <james.hilliard1@gmail.com>, Oli
 Vogt <oli.vogt.pub01@gmail.com>
In-Reply-To: <20241214141430.3314872-1-peter@korsgaard.com>
References: <20241214141430.3314872-1-peter@korsgaard.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <66e36025ed823b3c267c0f9f1a8a3b94@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1734202532;
 bh=rxKqCZCktVcZxgRjvRofnlKo4VtWb+cDvbNMsupPCxA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=OiosgwRn9tb/XFau1wpE0TAASJpFbwaNZ0Sui0Itp7UaxhUTFGZIuaeWlC+OF9hsY
 a0eOXjQyTSoPI1Rg1PQjBW/5PT7vPB9GuJU/2B1oHH0U+/O2bgiqAkivokFXuSDj5g
 ZqR0nxNQsP0Lf31Yxrp2++43p09xlPv6bwzEzuFJC5u7exWwsDpqRFjipSuA/yAH1E
 oFKpFJvUWVHfeh5mVDK6YDxJ9/z4Cpeuh1M/Fj5cTu2cfV46WS4feiL75laQjFR3eT
 UT3i+yALl+CsjA/DrH3DaHf25OGBS6hVj/vneOz0UX846EWpiaPisZ7hCY8e+VuZfY
 9llCH1K6P61Zg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=OiosgwRn
Subject: Re: [Buildroot] [PATCH] package/python-django: security bump to
 version 5.1.4
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

On 14/12/2024 15:14, Peter Korsgaard wrote:
> Fixes the following security issues:
> 
> CVE-2024-53907: Potential denial-of-service in
> django.utils.html.strip_tags()
> 
> The strip_tags() method and striptags template filter are subject to a
> potential denial-of-service attack via certain inputs containing large
> sequences of nested incomplete HTML entities.
> 
> CVE-2024-53908: Potential SQL injection in HasKey(lhs, rhs) on Oracle
> 
> Direct usage of the django.db.models.fields.json.HasKey lookup on 
> Oracle is
> subject to SQL injection if untrusted data is used as a lhs value.
> Applications that use the jsonfield.has_key lookup through the __ 
> syntax are
> unaffected.
> 
> https://www.djangoproject.com/weblog/2024/dec/04/security-releases/
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Applied to master, thanks.

> ---
>  package/python-django/python-django.hash | 4 ++--
>  package/python-django/python-django.mk   | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/python-django/python-django.hash 
> b/package/python-django/python-django.hash
> index 656d9eee9a..53c4ceead3 100644
> --- a/package/python-django/python-django.hash
> +++ b/package/python-django/python-django.hash
> @@ -1,5 +1,5 @@
>  # md5, sha256 from https://pypi.org/pypi/django/json
> -md5  3f556d14e7999a9700a27a325efc0833  Django-5.1.3.tar.gz
> -sha256  
> c0fa0e619c39325a169208caef234f90baa925227032ad3f44842ba14d75234a  
> Django-5.1.3.tar.gz
> +md5  03ec3e0f2d6cbcb9eb11c629ca1c538b  Django-5.1.4.tar.gz
> +sha256  
> de450c09e91879fa5a307f696e57c851955c910a438a35e6b4c895e86bedc82a  
> Django-5.1.4.tar.gz
>  # Locally computed sha256 checksums
>  sha256  
> b846415d1b514e9c1dff14a22deb906d794bc546ca6129f950a18cd091e2a669  
> LICENSE
> diff --git a/package/python-django/python-django.mk 
> b/package/python-django/python-django.mk
> index 6588acc31d..4facc6b6c4 100644
> --- a/package/python-django/python-django.mk
> +++ b/package/python-django/python-django.mk
> @@ -4,10 +4,10 @@
>  #
>  
> ################################################################################
> 
> -PYTHON_DJANGO_VERSION = 5.1.3
> +PYTHON_DJANGO_VERSION = 5.1.4
>  PYTHON_DJANGO_SOURCE = Django-$(PYTHON_DJANGO_VERSION).tar.gz
>  # The official Django site has an unpractical URL
> -PYTHON_DJANGO_SITE = 
> https://files.pythonhosted.org/packages/c6/85/ba2c2b83ba8b95354f99ed8344405d9571109ce0175028876209d6b93fba
> +PYTHON_DJANGO_SITE = 
> https://files.pythonhosted.org/packages/d3/e8/536555596dbb79f6e77418aeb40bdc1758c26725aba31919ba449e6d5e6a
>  PYTHON_DJANGO_LICENSE = BSD-3-Clause
>  PYTHON_DJANGO_LICENSE_FILES = LICENSE
>  PYTHON_DJANGO_CPE_ID_VENDOR = djangoproject
> --
> 2.39.5
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
