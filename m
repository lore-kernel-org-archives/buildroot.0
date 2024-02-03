Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CC7EC4828D
	for <buildroot@archiver.kernel.org>; Sat,  3 Feb 2024 18:43:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 10BA5405CC;
	Sat,  3 Feb 2024 18:43:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 10BA5405CC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yoGtht92bXPU; Sat,  3 Feb 2024 18:43:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A9882400A4;
	Sat,  3 Feb 2024 18:43:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A9882400A4
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4A7DE1BF86B
 for <buildroot@lists.busybox.net>; Sat,  3 Feb 2024 10:02:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 42BD560BE0
 for <buildroot@lists.busybox.net>; Sat,  3 Feb 2024 10:02:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2IePlgs7UC12 for <buildroot@lists.busybox.net>;
 Sat,  3 Feb 2024 10:02:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.198;
 helo=relay6-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 33DF760812
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 33DF760812
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 33DF760812
 for <buildroot@buildroot.org>; Sat,  3 Feb 2024 10:02:52 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D4F0DC0006;
 Sat,  3 Feb 2024 10:02:49 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1rWCrI-008iib-3C;
 Sat, 03 Feb 2024 11:02:48 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Waldemar Brodkorb <wbx@openadk.org>
References: <Zb0Qnnauhkwtp8Q0@waldemar-brodkorb.de>
Date: Sat, 03 Feb 2024 11:02:48 +0100
In-Reply-To: <Zb0Qnnauhkwtp8Q0@waldemar-brodkorb.de> (Waldemar Brodkorb's
 message of "Fri, 2 Feb 2024 16:56:14 +0100")
Message-ID: <87h6ipvp9z.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/2 v2] package/libjwt: new package
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

>>>>> "Waldemar" == Waldemar Brodkorb <wbx@openadk.org> writes:

 > JSON Web Tokens are an open, industry standard RFC 7519
 > method for representing claims securely between two parties.

 > This Library is used by Asterisk 20.6.0 and newer.
 > We need to use autotools to install pkgconfig file.

 > Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
 > ---
 >  package/Config.in          |  1 +
 >  package/libjwt/Config.in   |  9 +++++++++
 >  package/libjwt/libjwt.hash |  3 +++
 >  package/libjwt/libjwt.mk   | 16 ++++++++++++++++
 >  4 files changed, 29 insertions(+)
 >  create mode 100644 package/libjwt/Config.in
 >  create mode 100644 package/libjwt/libjwt.hash
 >  create mode 100644 package/libjwt/libjwt.mk

 > diff --git a/package/Config.in b/package/Config.in
 > index 426bd7d090..75a94177eb 100644
 > --- a/package/Config.in
 > +++ b/package/Config.in
 > @@ -1846,6 +1846,7 @@ menu "JSON/XML"
 >  	source "package/libbson/Config.in"
 >  	source "package/libfastjson/Config.in"
 >  	source "package/libjson/Config.in"
 > +	source "package/libjwt/Config.in"
 >  	source "package/libroxml/Config.in"
 >  	source "package/libucl/Config.in"
 >  	source "package/libxml2/Config.in"
 > diff --git a/package/libjwt/Config.in b/package/libjwt/Config.in
 > new file mode 100644
 > index 0000000000..d6bca54adc
 > --- /dev/null
 > +++ b/package/libjwt/Config.in
 > @@ -0,0 +1,9 @@
 > +config BR2_PACKAGE_LIBJWT
 > +	bool "libjwt"
 > +	select BR2_PACKAGE_OPENSSL
 > +	select BR2_PACKAGE_JANSSON
 > +	help
 > +	  JSON Web Tokens are an open, industry standard RFC 7519 

I've dropped the trailing spaces here.

> diff --git a/package/libjwt/libjwt.mk b/package/libjwt/libjwt.mk
 > new file mode 100644
 > index 0000000000..f7be28d206
 > --- /dev/null
 > +++ b/package/libjwt/libjwt.mk
 > @@ -0,0 +1,16 @@
 > +################################################################################
 > +#
 > +# libjwt
 > +#
 > +################################################################################
 > +
 > +LIBJWT_VERSION = 1.15.3
 > +LIBJWT_SITE = $(call github,benmcollins,libjwt,v$(LIBJWT_VERSION))
 > +LIBJWT_SOURCE = libjwt-$(LIBJWT_VERSION).tar.gz

THis is the default value for _SOURCE as pointed out by
./utils/check-package, so I've dropped that.

> +LIBJWT_DEPENDENCIES = jansson openssl

The configure script uses pkg-config, so I've added host-pkgconf here.

You also forgot to add an entry to DEVELOPERS, so I've added that.

Committed with those fixes, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
