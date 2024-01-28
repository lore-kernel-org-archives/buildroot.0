Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CEBFC47258
	for <buildroot@archiver.kernel.org>; Sun, 28 Jan 2024 17:27:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 24F9E408B4;
	Sun, 28 Jan 2024 17:27:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 24F9E408B4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Aazat6FrLXCc; Sun, 28 Jan 2024 17:27:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 43B78408E5;
	Sun, 28 Jan 2024 17:27:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 43B78408E5
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5CABD1BF59F
 for <buildroot@lists.busybox.net>; Sun, 28 Jan 2024 17:27:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 35DD6408E5
 for <buildroot@lists.busybox.net>; Sun, 28 Jan 2024 17:27:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 35DD6408E5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AQIkljCA38mW for <buildroot@lists.busybox.net>;
 Sun, 28 Jan 2024 17:27:38 +0000 (UTC)
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 08733408B4
 for <buildroot@buildroot.org>; Sun, 28 Jan 2024 17:27:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 08733408B4
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 8AF3E13F899;
 Sun, 28 Jan 2024 18:27:30 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 28 Jan 2024 18:27:30 +0100
Date: Sun, 28 Jan 2024 18:27:30 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <ZbaOgl5f8WJnvJCS@landeda>
References: <20240127225657.2427657-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240127225657.2427657-1-fontaine.fabrice@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1706462855;
 bh=2v/3dsUJzCHzLAufL/zRs0j4x0Z4zZngK+D/xkJk1Yg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=IWONIAb2W/iL541eV8uVs3indyfDQscqpkYsxYxgelll0kG0K5nEeWp+LfwHPZg3k
 f4FRDoM82Sss/px+wmTAD/cxdu9Lw0Hj7GTu6TMu2NmsxlNpVf+r+bzdW98WZ7nZJA
 fE7k4180tgvpytG4Zs+wh5IItEEmEWaAvf4H5FngQXnmI9Wxz6/rH+xe9jbwOzZIyv
 cBBpx/Iw/RpZc0QisjQt9AxrKtxoEGiHRkRs+mldFdvQKVnBi7JSdXrHxD8nHka54E
 mrtu9oZNp65QZChIfs60m4IJFNRvr4Tv0aU36MM1JO1FJRkL+zcZWfZilvDNMCNXqd
 6AnspO7yoKknQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=IWONIAb2
Subject: Re: [Buildroot] [PATCH 1/1] package/frr: security bump to version
 8.5.4
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
Cc: Graham Rhodes <graham.rhodes@rockwellcollins.com>,
 Vadim Kochan <vadim4j@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fabrice, All,

+Graham, see below for input.

On 2024-01-27 23:56 +0100, Fabrice Fontaine spake thusly:
> Fix CVE-2023-38802, CVE-2023-41360, CVE-2023-46752, CVE-2023-46753,
> CVE-2023-47234 and CVE-2023-47235
> 
> https://frrouting.org/security/
> https://frrouting.org/release/8.5.4/
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Since frr is a fork from quagga [0], it would not be too surprising that
some of the CVEs against frr were valid back in the quagga era. Also,
Quagga is no longer maintained (as their website is no longer
available). At least, there are three open CVEs:
    CVE-2016-4049
    CVE-2017-3224
    CVE-2021-44038

CVE-2021-44038 was reported after the last quagga release, and that the
two others were not fixed then, but are fixed in frr.

The sole package we have that uses quagga is olsr. Support for quagga
was added in 2013 with commit 9b48690efb59 (olsr: bump to version 0.6.4)
stating "Doesn't really need quagga but not very useful without it", yet
it is still really only optional.

The upstream olsr repository has not had a quagga-related commit since
2019 (commit 385321522335), and the actual last code commit was even
earlier, in 2016, to fix a warning (ac80336d56e5).

Finally, the olsr documentation still mentions old quagga versions that
need to be patched with patches bundled in olsr. Since the upstream
quagga has disapeared, it is not trivial to find whether those patches
were ever upstreamed.

And now that I wrote all the above, it turns out that quagga is not even
a build dependency of olsr at all, so propbably just an optional runtime
dependency.

Which leaves us with just our commit 1e3cd85e7a6d (package/quagga:
install quagga to staging) from Graham, but we have no such in-tree
user, so we can't really assess whether our quagga package is even
installing its dev files properly...

Would it make sense that we now drop Quagga altogether?

If quagga support in olsr is till required, or if third-party code needs
quagga dev files, can that be provided by frr instead?

[0] https://www.linux.com/news/welcoming-frrouting-linux-foundation/

Regards,
Yann E. MORIN.

> ---
>  package/frr/frr.hash | 2 +-
>  package/frr/frr.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/frr/frr.hash b/package/frr/frr.hash
> index 836f130b93..4a61084bae 100644
> --- a/package/frr/frr.hash
> +++ b/package/frr/frr.hash
> @@ -1,3 +1,3 @@
>  # Locally calculated
> -sha256  8a6b0e0fa1e89493ba84cf176674e55c7a814821fd02a7188095b76c37c3935f  frr-8.4.2.tar.gz
> +sha256  7ae9d8bafc65bb5d0f21061ac61dbc6cf93b2b05a5dae9e5eec72ed42388551e  frr-8.5.4.tar.gz
>  sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
> diff --git a/package/frr/frr.mk b/package/frr/frr.mk
> index abae784c40..19f346fd7b 100644
> --- a/package/frr/frr.mk
> +++ b/package/frr/frr.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -FRR_VERSION = 8.4.2
> +FRR_VERSION = 8.5.4
>  FRR_SITE = $(call github,FRRouting,frr,frr-$(FRR_VERSION))
>  FRR_LICENSE = GPL-2.0
>  FRR_LICENSE_FILES = COPYING
> -- 
> 2.43.0
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
