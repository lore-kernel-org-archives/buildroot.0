Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C58DAC352A1
	for <buildroot@archiver.kernel.org>; Tue,  6 Dec 2022 15:01:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5306181EE8;
	Tue,  6 Dec 2022 15:01:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5306181EE8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ljoLsvs_RZie; Tue,  6 Dec 2022 15:01:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6CFCB81EE6;
	Tue,  6 Dec 2022 15:01:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6CFCB81EE6
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9A3DC1BF35C
 for <buildroot@lists.busybox.net>; Tue,  6 Dec 2022 15:01:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6FD8381EE6
 for <buildroot@lists.busybox.net>; Tue,  6 Dec 2022 15:01:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6FD8381EE6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yAW-P7mKugzG for <buildroot@lists.busybox.net>;
 Tue,  6 Dec 2022 15:01:24 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 403E381EDF
Received: from 003.mia.mailroute.net (003.mia.mailroute.net [199.89.3.6])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 403E381EDF
 for <buildroot@buildroot.org>; Tue,  6 Dec 2022 15:01:24 +0000 (UTC)
Received: from localhost (003.mia.mailroute.net [127.0.0.1])
 by 003.mia.mailroute.net (Postfix) with ESMTP id 4NRNsZ6drsz24hxN;
 Tue,  6 Dec 2022 15:01:22 +0000 (UTC)
X-Virus-Scanned: by MailRoute
Received: from 003.mia.mailroute.net ([199.89.3.6])
 by localhost (003.mia [127.0.0.1]) (mroute_mailscanner, port 10026)
 with LMTP id govJTvD4iA_p; Tue,  6 Dec 2022 15:01:18 +0000 (UTC)
Received: from mail.carnegierobotics.com (unknown [72.22.26.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by 003.mia.mailroute.net (Postfix) with ESMTPS id 4NRNsV4Vvyz24hx3;
 Tue,  6 Dec 2022 15:01:18 +0000 (UTC)
Received: from CRL-PGH-EX19-1.crl.local (10.1.7.176) by
 CRL-PGH-EX19-1.crl.local (10.1.7.176) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.858.15; Tue, 6 Dec 2022 10:01:17 -0500
Received: from CRL-PGH-EX19-1.crl.local ([fe80::81d6:ea84:15d9:67d4]) by
 CRL-PGH-EX19-1.crl.local ([fe80::81d6:ea84:15d9:67d4%7]) with mapi id
 15.02.0858.015; Tue, 6 Dec 2022 10:01:17 -0500
To: "yegorslists@googlemail.com" <yegorslists@googlemail.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Thread-Topic: [Buildroot] [PATCH] package/python-dicttoxml: remove package
Thread-Index: AQHZCXU8vBALRyPxBES3aCINxAOzKK5hR7oA
Date: Tue, 6 Dec 2022 15:01:17 +0000
Message-ID: <638a0323f0ac36a57b299a965018f49c29ca4526.camel@carnegierobotics.com>
References: <20221206131801.20376-1-yegorslists@googlemail.com>
In-Reply-To: <20221206131801.20376-1-yegorslists@googlemail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.30.5-1.1 
x-originating-ip: [67.20.243.134]
Content-ID: <5D7C3301FC70C949AC555E16124F5A5C@crl.local>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 carnegierobotics.com; h=mime-version:content-transfer-encoding
 :content-id:content-type:content-type:user-agent
 :content-language:accept-language:in-reply-to:references
 :message-id:date:date:subject:subject:from:from:received
 :received:received:received; s=mr01; t=1670338878; x=1672930879;
 bh=RzdIMTEGTwwSVLV4tAY1HawHuWWfZJWbj1imxYkwqPM=; b=hSeGJP2jxd2R
 IP+AKfqVfly+rzoX1DwtWhiIbXTnP7BhYbYfqbSJQGbn5lGSMwNjE+RIQmf+TsUS
 D5dKc/l4zqyITJQMfSo4u3Cx20tOQJZT5tqYBfRfiq7D6GPEWvfgxZrV8+miSKR+
 h1LR8FktUTIIPQt+Ay+TPluLyItJfTKwEY9TFjoz/bUeoMtoxp2OGwAdBLbsYbwV
 2YGztISL6xDMGAVo9lVt9LbwnBSZR4osimkDwekJVTwL63E5bLa+y19wTBmcviOu
 Y1FODhPRLEAuL7mF5sqjqjtK7FWJ2IYWd7Bjsso+XRZUBlVyLCL16twfNQ2jd30A
 JP/YhrRP7w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=carnegierobotics.com header.i=@carnegierobotics.com
 header.a=rsa-sha256 header.s=mr01 header.b=hSeGJP2j
Subject: Re: [Buildroot] [PATCH] package/python-dicttoxml: remove package
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
From: Woody Douglass via buildroot <buildroot@buildroot.org>
Reply-To: Woody Douglass <wdouglass@carnegierobotics.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Tested-by: Woodrow Douglass <wdouglass@carnegierobotics.com>

On Tue, 2022-12-06 at 14:18 +0100, yegorslists--- via buildroot wrote:
> From: Yegor Yefremov <yegorslists@googlemail.com>
> 
> Package was removed because it was unmaintained. Use
> python-dicttoxml2 instead.
> 
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
> ---
>  Config.in.legacy                               |  8 ++++++++
>  package/Config.in                              |  1 -
>  package/python-dicttoxml/Config.in             |  8 --------
>  package/python-dicttoxml/python-dicttoxml.hash |  5 -----
>  package/python-dicttoxml/python-dicttoxml.mk   | 14 --------------
>  5 files changed, 8 insertions(+), 28 deletions(-)
>  delete mode 100644 package/python-dicttoxml/Config.in
>  delete mode 100644 package/python-dicttoxml/python-dicttoxml.hash
>  delete mode 100644 package/python-dicttoxml/python-dicttoxml.mk
> 
> diff --git a/Config.in.legacy b/Config.in.legacy
> index 522102a0c0..12839b24a0 100644
> --- a/Config.in.legacy
> +++ b/Config.in.legacy
> @@ -154,6 +154,14 @@ config BR2_PACKAGE_USBREDIR_SERVER
>  	  0.13.0. usbredir tools (which include usbredirect binary) can
>  	  be used as a replacement.
>  
> +config BR2_PACKAGE_PYTHON_DICTTOXML
> +	bool "python-dicttoxml removed"
> +	select BR2_LEGACY
> +	select BR2_PACKAGE_PYTHON_DICTTOXML2
> +	help
> +	  Package was removed because it was unmaintained. Use
> +          python-dicttoxml2 instead.
> +
>  comment "Legacy options removed in 2022.11"
>  
>  config BR2_PACKAGE_RABBITMQ_SERVER
> diff --git a/package/Config.in b/package/Config.in
> index f4a423c7a6..58edd43432 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -1022,7 +1022,6 @@ menu "External python modules"
>  	source "package/python-decorator/Config.in"
>  	source "package/python-defusedxml/Config.in"
>  	source "package/python-dialog3/Config.in"
> -	source "package/python-dicttoxml/Config.in"
>  	source "package/python-dicttoxml2/Config.in"
>  	source "package/python-distro/Config.in"
>  	source "package/python-django/Config.in"
> diff --git a/package/python-dicttoxml/Config.in b/package/python-dicttoxml/Config.in
> deleted file mode 100644
> index 145887eddc..0000000000
> --- a/package/python-dicttoxml/Config.in
> +++ /dev/null
> @@ -1,8 +0,0 @@
> -config BR2_PACKAGE_PYTHON_DICTTOXML
> -	bool "python-dicttoxml"
> -	select BR2_PACKAGE_PYTHON3_PYEXPAT
> -	help
> -	  Converts a Python dictionary or other native data type into
> -	  a valid XML string.
> -
> -	  https://github.com/quandyfactory/dicttoxml
> diff --git a/package/python-dicttoxml/python-dicttoxml.hash b/package/python-dicttoxml/python-dicttoxml.hash
> deleted file mode 100644
> index d8c43d0144..0000000000
> --- a/package/python-dicttoxml/python-dicttoxml.hash
> +++ /dev/null
> @@ -1,5 +0,0 @@
> -# md5 from https://pypi.python.org/pypi/dicttoxml/json
> -md5  ec5643a048cf32dad3c28db236b923e4  dicttoxml-1.7.4.tar.gz
> -# Locally computed
> -sha256  ea44cc4ec6c0f85098c57a431a1ee891b3549347b07b7414c8a24611ecf37e45  dicttoxml-1.7.4.tar.gz
> -sha256  4514114bd9da0b2fbf8c4fa264c0e6cc80fd41e6ac7f09d7a39a215662951c7c  LICENCE.txt
> diff --git a/package/python-dicttoxml/python-dicttoxml.mk b/package/python-dicttoxml/python-dicttoxml.mk
> deleted file mode 100644
> index 537afff601..0000000000
> --- a/package/python-dicttoxml/python-dicttoxml.mk
> +++ /dev/null
> @@ -1,14 +0,0 @@
> -################################################################################
> -#
> -# python-dicttoxml
> -#
> -################################################################################
> -
> -PYTHON_DICTTOXML_VERSION = 1.7.4
> -PYTHON_DICTTOXML_SOURCE = dicttoxml-$(PYTHON_DICTTOXML_VERSION).tar.gz
> -PYTHON_DICTTOXML_SITE = https://pypi.python.org/packages/74/36/534db111db9e7610a41641a1f6669a964aacaf51858f466de264cc8dcdd9
> -PYTHON_DICTTOXML_SETUP_TYPE = distutils
> -PYTHON_DICTTOXML_LICENSE = GPL-2.0
> -PYTHON_DICTTOXML_LICENSE_FILES = LICENCE.txt
> -
> -$(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
