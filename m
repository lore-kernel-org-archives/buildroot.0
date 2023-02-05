Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9098AC636CD
	for <buildroot@archiver.kernel.org>; Sun,  5 Feb 2023 14:28:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 36E4160767;
	Sun,  5 Feb 2023 14:28:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 36E4160767
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id B6SA0EZ09ORi; Sun,  5 Feb 2023 14:28:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 51A6160760;
	Sun,  5 Feb 2023 14:28:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 51A6160760
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6741B1BF475
 for <buildroot@lists.busybox.net>; Sun,  5 Feb 2023 14:28:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2364860760
 for <buildroot@lists.busybox.net>; Sun,  5 Feb 2023 14:28:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2364860760
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uluiGx84MRwH for <buildroot@lists.busybox.net>;
 Sun,  5 Feb 2023 14:28:52 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1020E60681
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1020E60681
 for <buildroot@buildroot.org>; Sun,  5 Feb 2023 14:28:52 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown [92.184.112.201])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id CEA5113F838;
 Sun,  5 Feb 2023 15:28:46 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 05 Feb 2023 15:28:44 +0100
Date: Sun, 5 Feb 2023 15:28:44 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20230205142844.GL2960@scaer>
References: <20230205130600.18051-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230205130600.18051-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1675607330;
 bh=bUZGnHcbbPtlcUNlKepO6mazZm5untjg+uFFpb/mhN4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=s5GtqP8FPaW3rSA7GBaPvxUfM8DqhXVN/N1KgNpFBrC3cuXoQnkh3bcdaNjqX99hR
 v+KGIYrnJkMODOCz5NGq3puGaFpzUIvAa3DywEoXGy29qlSRrtjKhmem+GdRaOYQdk
 RRUdUjOYyOYrddjuEgrt8JNzmAbwFEvDPjhJX7FKzgOE3L9vEWEW1+oSiqTg+ANj2W
 ApFj5/7hUWE9xWFV63029p5QJ4Ddu7iBNQ3l+iVEvSGriOu91QHAnAdF9x1lHbxIz+
 sXoFoXialo6gBM5qCI9zHiyWtdcSqAYZhEcVnrk3rrdgBdhJQAiQkuFCIe9LEtykMs
 d2prKajiGpm9g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=s5GtqP8F
Subject: Re: [Buildroot] [PATCH 1/1] package/opusfile: fix CVE-2022-47021
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
Cc: Gilles Talis <gilles.talis@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fabrice, All,

On 2023-02-05 14:06 +0100, Fabrice Fontaine spake thusly:
> A null pointer dereference issue was discovered in functions op_get_data
> and op_open1 in opusfile.c in xiph opusfile 0.9 thru 0.12 allows
> attackers to cause denial of service or other unspecified impacts.
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  ...ocation-failure-from-ogg_sync_buffer.patch | 44 +++++++++++++++++++
>  package/opusfile/opusfile.mk                  |  3 ++
>  2 files changed, 47 insertions(+)
>  create mode 100644 package/opusfile/0001-Propagate-allocation-failure-from-ogg_sync_buffer.patch
> 
> diff --git a/package/opusfile/0001-Propagate-allocation-failure-from-ogg_sync_buffer.patch b/package/opusfile/0001-Propagate-allocation-failure-from-ogg_sync_buffer.patch
> new file mode 100644
> index 0000000000..2ef08502ab
> --- /dev/null
> +++ b/package/opusfile/0001-Propagate-allocation-failure-from-ogg_sync_buffer.patch
> @@ -0,0 +1,44 @@
> +From 0a4cd796df5b030cb866f3f4a5e41a4b92caddf5 Mon Sep 17 00:00:00 2001
> +From: Ralph Giles <giles@thaumas.net>
> +Date: Tue, 6 Sep 2022 19:04:31 -0700
> +Subject: [PATCH] Propagate allocation failure from ogg_sync_buffer.
> +
> +Instead of segfault, report OP_EFAULT if ogg_sync_buffer returns
> +a null pointer. This allows more graceful recovery by the caller
> +in the unlikely event of a fallible ogg_malloc call.
> +
> +We do check the return value elsewhere in the code, so the new
> +checks make the code more consistent.
> +
> +Thanks to https://github.com/xiph/opusfile/issues/36 for reporting.
> +
> +Signed-off-by: Timothy B. Terriberry <tterribe@xiph.org>
> +Signed-off-by: Mark Harris <mark.hsj@gmail.com>
> +
> +[Retrieved from:
> +https://github.com/xiph/opusfile/commit/0a4cd796df5b030cb866f3f4a5e41a4b92caddf5]
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +---
> + src/opusfile.c | 2 ++
> + 1 file changed, 2 insertions(+)
> +
> +diff --git a/src/opusfile.c b/src/opusfile.c
> +index ca219b2..3c3c81e 100644
> +--- a/src/opusfile.c
> ++++ b/src/opusfile.c
> +@@ -148,6 +148,7 @@ static int op_get_data(OggOpusFile *_of,int _nbytes){
> +   int            nbytes;
> +   OP_ASSERT(_nbytes>0);
> +   buffer=(unsigned char *)ogg_sync_buffer(&_of->oy,_nbytes);
> ++  if(OP_UNLIKELY(buffer==NULL))return OP_EFAULT;
> +   nbytes=(int)(*_of->callbacks.read)(_of->stream,buffer,_nbytes);
> +   OP_ASSERT(nbytes<=_nbytes);
> +   if(OP_LIKELY(nbytes>0))ogg_sync_wrote(&_of->oy,nbytes);
> +@@ -1527,6 +1528,7 @@ static int op_open1(OggOpusFile *_of,
> +   if(_initial_bytes>0){
> +     char *buffer;
> +     buffer=ogg_sync_buffer(&_of->oy,(long)_initial_bytes);
> ++    if(OP_UNLIKELY(buffer==NULL))return OP_EFAULT;
> +     memcpy(buffer,_initial_data,_initial_bytes*sizeof(*buffer));
> +     ogg_sync_wrote(&_of->oy,(long)_initial_bytes);
> +   }
> diff --git a/package/opusfile/opusfile.mk b/package/opusfile/opusfile.mk
> index 72ae82e801..63553a81e7 100644
> --- a/package/opusfile/opusfile.mk
> +++ b/package/opusfile/opusfile.mk
> @@ -11,6 +11,9 @@ OPUSFILE_LICENSE = BSD-3-Clause
>  OPUSFILE_LICENSE_FILES = COPYING
>  OPUSFILE_INSTALL_STAGING = YES
>  
> +# 0001-Propagate-allocation-failure-from-ogg_sync_buffer.patch
> +OPUSFILE_IGNORE_CVES += CVE-2022-47021
> +
>  ifeq ($(BR2_PACKAGE_OPENSSL),y)
>  OPUSFILE_DEPENDENCIES += openssl
>  else
> -- 
> 2.39.0
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
