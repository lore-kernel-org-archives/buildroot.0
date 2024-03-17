Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C1EBC54E67
	for <buildroot@archiver.kernel.org>; Sun, 17 Mar 2024 12:30:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C439B405FD;
	Sun, 17 Mar 2024 12:30:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KNjuWQBiVqHz; Sun, 17 Mar 2024 12:30:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 951E140620
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 951E140620;
	Sun, 17 Mar 2024 12:30:24 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 197661BF301
 for <buildroot@lists.busybox.net>; Sun, 17 Mar 2024 12:30:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0499040620
 for <buildroot@lists.busybox.net>; Sun, 17 Mar 2024 12:30:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id p2sWMHdW0Q-P for <buildroot@lists.busybox.net>;
 Sun, 17 Mar 2024 12:30:22 +0000 (UTC)
X-Greylist: delayed 306 seconds by postgrey-1.37 at util1.osuosl.org;
 Sun, 17 Mar 2024 12:30:20 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org B9869405FD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B9869405FD
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.22;
 helo=mout.gmx.net; envelope-from=ps.report@gmx.net; receiver=<UNKNOWN> 
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B9869405FD
 for <buildroot@buildroot.org>; Sun, 17 Mar 2024 12:30:20 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost ([212.114.183.180]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N2mBQ-1qn6jr0pfo-0133i0; Sun, 17
 Mar 2024 13:25:11 +0100
Date: Sun, 17 Mar 2024 13:25:10 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20240317132510.2e4ea2ca@gmx.net>
In-Reply-To: <20240317110444.258643-1-fontaine.fabrice@gmail.com>
References: <20240317110444.258643-1-fontaine.fabrice@gmail.com>
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.39; x86_64-suse-linux-gnu)
MIME-Version: 1.0
X-Provags-ID: V03:K1:+v8kBN0cC0dzErn/hOqkAuop4sl6J+gnJjWk+3pwgN+WIe1Bo7j
 aLpXypQW4zkxRIBJp6kQTB7acSILC+LpjCOXuZWiZidiUkllizSGJ3irZxdikiXqV+80tr3
 xdL7FoFrUCP9H82C5bZ1Hh3aiJJ5LurSXQdYU7jVb2bcbhzGLuMEqycHFDNiN7kfjfisUJ+
 o5fVRg3kjftHcunB7Aecg==
UI-OutboundReport: notjunk:1;M01:P0:vhGbKrhZ8vo=;mRkeCmmLWHUJlxQf4cp4ooe1lp4
 c7OtC5lSc7B4WJax1IfFODOW/mvADIFmj3ji3rYuTyV7YlEyW7JZENqsFrf0IsEz/N1ho3iuu
 8os480FoYC/D1a/m71NaFQh3dalZIqSL7Gl29KY5+r5wsoqZCYTpVZd0GzC/hmrSIK0FmjnQc
 R7E8wNCKg1C9o+hxUWfhzuaFSKT+PrTyP9lYuwBt0Wv+P7UmLNfjJjStrlhSZ3n9SR9d/IEhl
 o4rASijn4yz04gPvuQCSHr3YC9whcZGZslmp5ikQ85iCQRi5tArU4/h+IVJ5YZOzGS22f5GFp
 qq+JNegzyRjXojnL4x0IZUXdAaps7kzHLs9vb0qzBhkE3DVN1N1fFRS2rYEBf9XwDn2OJ1kxD
 MuTIICU5a+PHFLuAIl5Whbp4INnBHdbaX0/NZfrNGG0UX2jL/9s3g4thx9tXCIaJbvW+xoGi1
 YNSf92XCWy7gc/DItq7esCAe/ai5vtTkVH2TnZmVly4dYaJuvnVgffNl2+xKZVu/sqITt1eLJ
 H4CObLWB0oWCHtX5cgxif3Nq5kG7vQj/DGWHD+91qpUIYYkIHGiNfGYTL3PqdT+WhvgMQVldu
 nVoVdOcL50zAtN7pnfxF41U/4A/Ky3WYvpPV8mhz7MuCKlqvDhchG8mq5EsNptSsn8wwM8jT7
 AC+CYssM0bE3JsA9MzGa9S+Rm7ZPfp/czI9NY4vHNwC2DH+CA6K91TkJWt2wNScbpktqAl9hU
 t46nm01bSPiP2GRtzrVE4sdv57veHqDyy66cPcsu8cY87TbpF6w/TecMZcc89IVyGIO6aEHa8
 XRa+aFIais4yTu/TOHxXjFef7WAG5ivjdtA37lTC0ZoXA=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.net; 
 s=s31663417; t=1710678618; x=1711283418; i=ps.report@gmx.net;
 bh=302eUUgUWuKuiaDhmll5HLz1lfnQUe1hsTc6IvIeLUk=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:
 References;
 b=m1pXKducUvJ7Ukof5BIWIEPQGFB6IOXv56UYvHun+Z3A72rc/RAF86lnzajYxAGo
 V6Kzec60M8X3zg/SPV98dtmCdxRkauDPLyzV0UEPZTyx+cWucl7TlsMQ2KsR+rWVz
 HAG2F2BHJbCgkD9aiWpwL+I/Myhdts7YzUju6iHNMcZNRJuTpnAWuEUqc08DZDw8b
 rKFleW+f4OLGBzVo9qUTIJKd/6qS1i2xIKdvU+VVxHPMq2NdgqaUwWb8x9pcBRR7L
 zfPD5yrxEPTtc1MBATbzUYQge4gMIxxbNT0/lFoSnPH7kLYsF9qqX3CJ8mJOd3vBU
 7hLrSBlHNXN0FcMJWw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.net header.i=ps.report@gmx.net header.a=rsa-sha256
 header.s=s31663417 header.b=m1pXKduc
Subject: Re: [Buildroot] [PATCH 1/1] package/squid: fix build with host gcc
 10
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
From: Peter Seiderer via buildroot <buildroot@buildroot.org>
Reply-To: Peter Seiderer <ps.report@gmx.net>
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Fabrice,

On Sun, 17 Mar 2024 12:04:44 +0100, Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Pass -std=c++17 to fix the following build failure with host gcc 10
> raised since bump to version 6.6 in commit
> c13199c9326fa2daa574f08ec8fc063a48d0eb06:
>
> /usr/bin/g++ -O2 -I/home/buildroot/instance-0/output-1/host/include -o cf_gen ./cf_gen.cc -I. -I../include/ -I../src
> ./cf_gen.cc: In function 'int main(int, char**)':
> ./cf_gen.cc:268:63: error: forming reference to void
>   268 |                     auto &newEntry = entries.emplace_back(name);
>       |                                                               ^
>
> Fixes:
>  - http://autobuild.buildroot.org/results/613fee008c77f8dbbe04df9a4ce4347e43de9ef9
>  - https://bugs.buildroot.org/show_bug.cgi?id=15997
>

Thanks for taking care, maybe add 'Reported-by:' and 'Suggested-by:'?

Regards,
Peter

> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/squid/squid.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/package/squid/squid.mk b/package/squid/squid.mk
> index 3a9edac71e..6a2b522336 100644
> --- a/package/squid/squid.mk
> +++ b/package/squid/squid.mk
> @@ -21,7 +21,7 @@ SQUID_CONF_ENV = \
>  	ac_cv_func_strnstr=no \
>  	ac_cv_have_squid=yes \
>  	BUILDCXX="$(HOSTCXX)" \
> -	BUILDCXXFLAGS="$(HOST_CXXFLAGS)"
> +	BUILDCXXFLAGS="$(HOST_CXXFLAGS) -std=c++17"
>  SQUID_CONF_OPTS = \
>  	--enable-async-io=8 \
>  	--enable-linux-netfilter \

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
