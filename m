Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40DFEC4332F
	for <buildroot@archiver.kernel.org>; Sun, 29 Oct 2023 08:48:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E22E743108;
	Sun, 29 Oct 2023 08:48:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E22E743108
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id usjRvnN9NLzV; Sun, 29 Oct 2023 08:48:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8967943127;
	Sun, 29 Oct 2023 08:48:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8967943127
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4AA1D1BF20B
 for <buildroot@lists.busybox.net>; Sun, 29 Oct 2023 08:47:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2F3E043127
 for <buildroot@lists.busybox.net>; Sun, 29 Oct 2023 08:47:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2F3E043127
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zf02wu6tpSYC for <buildroot@lists.busybox.net>;
 Sun, 29 Oct 2023 08:47:53 +0000 (UTC)
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B079143125
 for <buildroot@buildroot.org>; Sun, 29 Oct 2023 08:47:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B079143125
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:de1f:355b:eff2:ec6])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id 09395200412;
 Sun, 29 Oct 2023 09:47:49 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 29 Oct 2023 09:47:49 +0100
Date: Sun, 29 Oct 2023 09:47:49 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20231029084749.GT687180@scaer>
References: <20231026180751.3150845-1-bernd@kuhls.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231026180751.3150845-1-bernd@kuhls.net>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1698569272;
 bh=l8AY5IsyXVG45JftJ/W7KEnNvVCkq/qZmtEqI6h5foo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Ht61crzz7d1NB40jMItK47Xtrr7ISOOezsju42s8DIj8Vk1D65l5Gh3NTv7+n0T+p
 J/R20OEZ+RPxZyAVczMAulSbJeDHx45X6MqUn/o1Ch7ub8RwjdA1eXpdsvZBckgYVl
 dZ+IW/t0vKRDUVKWx7Yr1ONBNWNCn441cmN2CwxI0vCv0WPQd/Zmd8mXaI2V1Xb9L1
 ihwCi6rurGtISa26j2EvHJRHU1iSpQeWrYhaOnRV5wGc9387wUEnE2st3LDiKO1n3c
 q4Gi+k7eX87HmaYhkHRZ6DADvFZdHM7lNv+PrcAYhsStLOHWW9Ls4oOQBT0IbBneSt
 5Hpzv3eu4Eh1g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Ht61crzz
Subject: Re: [Buildroot] [PATCH 1/1] package/kodi: fix build with python 3.12
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Bernd, All,

On 2023-10-26 20:07 +0200, Bernd Kuhls spake thusly:
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  ...ypeInfo-add-initialization-of-tp_wat.patch | 59 +++++++++++++++++++
>  1 file changed, 59 insertions(+)
>  create mode 100644 package/kodi/0006-PythonBindings-TypeInfo-add-initialization-of-tp_wat.patch
> 
> diff --git a/package/kodi/0006-PythonBindings-TypeInfo-add-initialization-of-tp_wat.patch b/package/kodi/0006-PythonBindings-TypeInfo-add-initialization-of-tp_wat.patch
> new file mode 100644
> index 0000000000..ed0c340f52
> --- /dev/null
> +++ b/package/kodi/0006-PythonBindings-TypeInfo-add-initialization-of-tp_wat.patch
> @@ -0,0 +1,59 @@
> +From cbfee0e6add2b57c6a2a8641a60b4322543f4675 Mon Sep 17 00:00:00 2001
> +From: Lukas Rusak <lorusak@gmail.com>
> +Date: Wed, 12 Jul 2023 19:58:08 -0700
> +Subject: [PATCH] PythonBindings: TypeInfo: add initialization of
> + tp_watched for PyTypeObject
> +
> +This member was added in upstream commit https://github.com/python/cpython/commit/82ccbf69a842db25d8117f1c41b47aa5b4ed96ab
> +
> +This change first appeared in Python v3.12.0a1
> +
> +Signed-off-by: Lukas Rusak <lorusak@gmail.com>
> +
> +Upstream: https://github.com/xbmc/xbmc/commit/2c84ee54a75770e291f38d4ebb2c31c8f2c3b8c5
> +
> +Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> +---
> + xbmc/interfaces/python/swig.cpp | 3 +++
> + 1 file changed, 3 insertions(+)
> +
> +diff --git a/xbmc/interfaces/python/swig.cpp b/xbmc/interfaces/python/swig.cpp
> +index 5a2599a84ea0f..74baa72ee5c4c 100644
> +--- a/xbmc/interfaces/python/swig.cpp
> ++++ b/xbmc/interfaces/python/swig.cpp
> +@@ -71,6 +71,9 @@ namespace PythonBindings
> + #endif
> + #if PY_VERSION_HEX < 0x03090000
> +       0,
> ++#endif
> ++#if PY_VERSION_HEX >= 0x030C00A1
> ++      0,
> + #endif
> +     };
> + 
> +
> +From e3ba40936cc10de05c46d507851568ee3e351f43 Mon Sep 17 00:00:00 2001
> +From: Lukas Rusak <lorusak@gmail.com>
> +Date: Thu, 13 Jul 2023 08:57:38 -0700
> +Subject: [PATCH] swig.cpp: add clang-format formatting
> +
> +Signed-off-by: Lukas Rusak <lorusak@gmail.com>
> +---
> + xbmc/interfaces/python/swig.cpp | 4 ++--
> + 1 file changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/xbmc/interfaces/python/swig.cpp b/xbmc/interfaces/python/swig.cpp
> +index 74baa72ee5c4c..0c49f87ca84e1 100644
> +--- a/xbmc/interfaces/python/swig.cpp
> ++++ b/xbmc/interfaces/python/swig.cpp
> +@@ -18,8 +18,8 @@ namespace PythonBindings
> + {
> +   TypeInfo::TypeInfo(const std::type_info& ti) : swigType(NULL), parentType(NULL), typeIndex(ti)
> +   {
> +-    static PyTypeObject py_type_object_header =
> +-    { PyVarObject_HEAD_INIT(nullptr, 0) 0,
> ++    static PyTypeObject py_type_object_header = {
> ++      PyVarObject_HEAD_INIT(nullptr, 0) 0,
> +       0,
> +       0,
> +       0,
> -- 
> 2.39.2
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
