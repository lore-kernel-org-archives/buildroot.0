Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CFA7CD37B4
	for <buildroot@archiver.kernel.org>; Sun, 17 Sep 2023 12:48:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 351F661105;
	Sun, 17 Sep 2023 12:48:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 351F661105
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jiZQUNI4uUGQ; Sun, 17 Sep 2023 12:48:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6F73C61108;
	Sun, 17 Sep 2023 12:48:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6F73C61108
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5612D1BF473
 for <buildroot@lists.busybox.net>; Sun, 17 Sep 2023 12:48:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2FB8F40531
 for <buildroot@lists.busybox.net>; Sun, 17 Sep 2023 12:48:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2FB8F40531
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NAD5E2wlCTOj for <buildroot@lists.busybox.net>;
 Sun, 17 Sep 2023 12:48:34 +0000 (UTC)
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3CAE840111
 for <buildroot@buildroot.org>; Sun, 17 Sep 2023 12:48:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3CAE840111
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:6a7e:c3f3:1d37:8ba2])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 819F6B0056A;
 Sun, 17 Sep 2023 14:48:30 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 17 Sep 2023 14:48:30 +0200
Date: Sun, 17 Sep 2023 14:48:30 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20230917124830.GV415981@scaer>
References: <20230917115823.27662-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230917115823.27662-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1694954912;
 bh=zHyaYKtwLl1DU1+bfers78XBezERjyH0ly8IEms4U9I=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=mtel1BdHr5k1U53LPQ3OD1+XsHKbYe3YIaKMnmno3ZRVFKwIg9rwRoSgOpwckO3SV
 24E7w5plbHCUXBCTPq35KG130crw15rYXhCF+oaEzlZtS4BgQvfCrRZ8/bYxgzhRwO
 hMscN0Z5+q2XrSqeXZtIMiNXlbjeKg16Quc8pd+dhwdvIUqTB6hESAur/FmLbMNw0C
 nlndYljuFuri3o5UVpdyVu7nt+lZ/c4UR7uVPV4hAFU5c7SdiWOuW+78/DU+X6h3Ov
 MKnVBTnHXrFPzVy2iCnB8paZpHviHqlBO8qqpPO/Gzx+N1rBNsmxCeffOlcRvmmSgf
 ujQUWCHlhEXOQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=mtel1BdH
Subject: Re: [Buildroot] [PATCH 1/1] package/haproxy: security bump to
 version 2.6.15
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

Fabrice, All,

On 2023-09-17 13:58 +0200, Fabrice Fontaine spake thusly:
> Fix CVE-2023-40225: HAProxy through 2.0.32, 2.1.x and 2.2.x through
> 2.2.30, 2.3.x and 2.4.x through 2.4.23, 2.5.x and 2.6.x before 2.6.15,
> 2.7.x before 2.7.10, and 2.8.x before 2.8.2 forwards empty
> Content-Length headers, violating RFC 9110 section 8.6. In uncommon
> cases, an HTTP/1 server behind HAProxy may interpret the payload as an
> extra request.
> 
> https://www.mail-archive.com/haproxy@formilux.org/msg43864.html
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/haproxy/haproxy.hash | 4 ++--
>  package/haproxy/haproxy.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/haproxy/haproxy.hash b/package/haproxy/haproxy.hash
> index 20048da7ec..74390c2ff5 100644
> --- a/package/haproxy/haproxy.hash
> +++ b/package/haproxy/haproxy.hash
> @@ -1,5 +1,5 @@
> -# From: http://www.haproxy.org/download/2.6/src/haproxy-2.6.14.tar.gz.sha256
> -sha256  bd3dd9fa60391ca09e1225e1ac3163e45be83c3f54f2fd76a30af289cc6e4fd4  haproxy-2.6.14.tar.gz
> +# From: http://www.haproxy.org/download/2.6/src/haproxy-2.6.15.tar.gz.sha256
> +sha256  41f8e1695e92fafdffe39690a68993f1a0f5f7f06931a99e9a153f749ea39cfd  haproxy-2.6.15.tar.gz
>  # Locally computed:
>  sha256  0717ca51fceaa25ac9e5ccc62e0c727dcf27796057201fb5fded56a25ff6ca28  LICENSE
>  sha256  5df07007198989c622f5d41de8d703e7bef3d0e79d62e24332ee739a452af62a  doc/lgpl.txt
> diff --git a/package/haproxy/haproxy.mk b/package/haproxy/haproxy.mk
> index dc59047fb5..8143572021 100644
> --- a/package/haproxy/haproxy.mk
> +++ b/package/haproxy/haproxy.mk
> @@ -5,7 +5,7 @@
>  ################################################################################
>  
>  HAPROXY_VERSION_MAJOR = 2.6
> -HAPROXY_VERSION = $(HAPROXY_VERSION_MAJOR).14
> +HAPROXY_VERSION = $(HAPROXY_VERSION_MAJOR).15
>  HAPROXY_SITE = http://www.haproxy.org/download/$(HAPROXY_VERSION_MAJOR)/src
>  HAPROXY_LICENSE = GPL-2.0+ and LGPL-2.1+ with exceptions
>  HAPROXY_LICENSE_FILES = LICENSE doc/lgpl.txt doc/gpl.txt
> -- 
> 2.40.1
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
