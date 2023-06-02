Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C985AC7EE24
	for <buildroot@archiver.kernel.org>; Fri,  2 Jun 2023 19:45:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7027A426EE;
	Fri,  2 Jun 2023 19:45:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7027A426EE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cUffZY0mn7uE; Fri,  2 Jun 2023 19:45:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1A0EB426F2;
	Fri,  2 Jun 2023 19:45:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1A0EB426F2
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6F7CA1BF255
 for <buildroot@lists.busybox.net>; Fri,  2 Jun 2023 19:45:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 56B7E8446D
 for <buildroot@lists.busybox.net>; Fri,  2 Jun 2023 19:45:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 56B7E8446D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id X2NOcpxR2Yzh for <buildroot@lists.busybox.net>;
 Fri,  2 Jun 2023 19:45:04 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1588984465
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1588984465
 for <buildroot@buildroot.org>; Fri,  2 Jun 2023 19:45:03 +0000 (UTC)
X-GND-Sasl: peter@korsgaard.com
X-GND-Sasl: peter@korsgaard.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 231B1FF804;
 Fri,  2 Jun 2023 19:45:01 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1q5Ahp-00Bsqx-8l; Fri, 02 Jun 2023 21:45:01 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Romain Naour <romain.naour@gmail.com>
References: <20230528190111.2430580-1-romain.naour@gmail.com>
 <20230528190111.2430580-3-romain.naour@gmail.com>
Date: Fri, 02 Jun 2023 21:45:01 +0200
In-Reply-To: <20230528190111.2430580-3-romain.naour@gmail.com> (Romain Naour's
 message of "Sun, 28 May 2023 21:01:09 +0200")
Message-ID: <87zg5hd4xu.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 3/5] package/python-asttokens: new package
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

>>>>> "Romain" == Romain Naour <romain.naour@gmail.com> writes:

 > Signed-off-by: Romain Naour <romain.naour@gmail.com>
 > ---
 >  package/Config.in                              |  1 +
 >  package/python-asttokens/Config.in             |  7 +++++++
 >  package/python-asttokens/python-asttokens.hash |  5 +++++
 >  package/python-asttokens/python-asttokens.mk   | 16 ++++++++++++++++
 >  4 files changed, 29 insertions(+)
 >  create mode 100644 package/python-asttokens/Config.in
 >  create mode 100644 package/python-asttokens/python-asttokens.hash
 >  create mode 100644 package/python-asttokens/python-asttokens.mk

 > diff --git a/package/Config.in b/package/Config.in
 > index 3da005b5e5..e018fe66ca 100644
 > --- a/package/Config.in
 > +++ b/package/Config.in
 > @@ -966,6 +966,7 @@ menu "External python modules"
 >  	source "package/python-argon2-cffi-bindings/Config.in"
 >  	source "package/python-arrow/Config.in"
 >  	source "package/python-asgiref/Config.in"
 > +	source "package/python-asttokens/Config.in"
 >  	source "package/python-asn1crypto/Config.in"

check-package (rightly) complains that n comes before t:

package/Config.in:970: Packages in: menu "External python modules",
                       are not alphabetically ordered;
                       correct order: '-', '_', digits, capitals, lowercase;
                       first incorrect package: python-asn1crypto

Committed with that fixed, thanks.

>  	source "package/python-async-generator/Config.in"
 >  	source "package/python-async-lru/Config.in"
 > diff --git a/package/python-asttokens/Config.in b/package/python-asttokens/Config.in
 > new file mode 100644
 > index 0000000000..2732b8124b
 > --- /dev/null
 > +++ b/package/python-asttokens/Config.in
 > @@ -0,0 +1,7 @@
 > +config BR2_PACKAGE_PYTHON_ASTTOKENS
 > +	bool "python-asttokens"
 > +	select BR2_PACKAGE_PYTHON_SIX # runtime
 > +	help
 > +	  Annotate AST trees with source code positions.
 > +
 > +	  https://github.com/gristlabs/asttokens
 > diff --git a/package/python-asttokens/python-asttokens.hash b/package/python-asttokens/python-asttokens.hash
 > new file mode 100644
 > index 0000000000..6529e4db41
 > --- /dev/null
 > +++ b/package/python-asttokens/python-asttokens.hash
 > @@ -0,0 +1,5 @@
 > +# md5, sha256 from https://pypi.org/pypi/asttokens/json
 > +md5  a9ae6ae0f85398e511bcb9ec87695eed  asttokens-2.2.1.tar.gz
 > +sha256  4622110b2a6f30b77e1473affaa97e711bc2f07d3f10848420ff1898edbe94f3  asttokens-2.2.1.tar.gz
 > +# Locally computed sha256 checksums
 > +sha256  b40930bbcf80744c86c46a12bc9da056641d722716c378f5659b9e555ef833e1  LICENSE
 > diff --git a/package/python-asttokens/python-asttokens.mk b/package/python-asttokens/python-asttokens.mk
 > new file mode 100644
 > index 0000000000..8a8ce1ddd9
 > --- /dev/null
 > +++ b/package/python-asttokens/python-asttokens.mk
 > @@ -0,0 +1,16 @@
 > +################################################################################
 > +#
 > +# python-asttokens
 > +#
 > +################################################################################
 > +
 > +PYTHON_ASTTOKENS_VERSION = 2.2.1
 > +PYTHON_ASTTOKENS_SOURCE = asttokens-$(PYTHON_ASTTOKENS_VERSION).tar.gz
 > +PYTHON_ASTTOKENS_SITE = https://files.pythonhosted.org/packages/c8/e3/b0b4f32162621126fbdaba636c152c6b6baec486c99f48686e66343d638f
 > +PYTHON_ASTTOKENS_SETUP_TYPE = setuptools
 > +PYTHON_ASTTOKENS_LICENSE = Apache-2.0
 > +PYTHON_ASTTOKENS_LICENSE_FILES = LICENSE
 > +
 > +PYTHON_ASTTOKENS_DEPENDENCIES = host-python-setuptools-scm
 > +
 > +$(eval $(python-package))
 > -- 

 > 2.34.3

 > _______________________________________________
 > buildroot mailing list
 > buildroot@buildroot.org
 > https://lists.buildroot.org/mailman/listinfo/buildroot


-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
