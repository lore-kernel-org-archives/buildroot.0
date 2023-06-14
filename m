Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8927EB64DA
	for <buildroot@archiver.kernel.org>; Wed, 14 Jun 2023 11:40:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4F940833B7;
	Wed, 14 Jun 2023 11:40:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4F940833B7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HOj9-S4aTWk5; Wed, 14 Jun 2023 11:40:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6288C833A7;
	Wed, 14 Jun 2023 11:40:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6288C833A7
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1A02E1BF2CA
 for <buildroot@lists.busybox.net>; Wed, 14 Jun 2023 11:40:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E6F4C832E6
 for <buildroot@lists.busybox.net>; Wed, 14 Jun 2023 11:40:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E6F4C832E6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Em8BvDXhwwSS for <buildroot@lists.busybox.net>;
 Wed, 14 Jun 2023 11:40:32 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AAE7C81DE8
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AAE7C81DE8
 for <buildroot@buildroot.org>; Wed, 14 Jun 2023 11:40:31 +0000 (UTC)
X-GND-Sasl: peter@korsgaard.com
X-GND-Sasl: peter@korsgaard.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 160B260009;
 Wed, 14 Jun 2023 11:40:29 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1q9OrV-005p7C-E8; Wed, 14 Jun 2023 13:40:29 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Romain Naour <romain.naour@gmail.com>
References: <20230528190111.2430580-1-romain.naour@gmail.com>
 <20230528190111.2430580-2-romain.naour@gmail.com>
Date: Wed, 14 Jun 2023 13:40:29 +0200
In-Reply-To: <20230528190111.2430580-2-romain.naour@gmail.com> (Romain Naour's
 message of "Sun, 28 May 2023 21:01:08 +0200")
Message-ID: <87h6ras24y.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 2/5] package/python-pure-eval: new package
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

Committed to 2023.02.x, thanks.

> ---
 >  package/Config.in                              |  1 +
 >  package/python-pure-eval/Config.in             |  6 ++++++
 >  package/python-pure-eval/python-pure-eval.hash |  5 +++++
 >  package/python-pure-eval/python-pure-eval.mk   | 16 ++++++++++++++++
 >  4 files changed, 28 insertions(+)
 >  create mode 100644 package/python-pure-eval/Config.in
 >  create mode 100644 package/python-pure-eval/python-pure-eval.hash
 >  create mode 100644 package/python-pure-eval/python-pure-eval.mk

 > diff --git a/package/Config.in b/package/Config.in
 > index 82aa348455..3da005b5e5 100644
 > --- a/package/Config.in
 > +++ b/package/Config.in
 > @@ -1190,6 +1190,7 @@ menu "External python modules"
 >  	source "package/python-psycopg2/Config.in"
 >  	source "package/python-ptyprocess/Config.in"
 >  	source "package/python-pudb/Config.in"
 > +	source "package/python-pure-eval/Config.in"
 >  	source "package/python-py/Config.in"
 >  	source "package/python-pyaes/Config.in"
 >  	source "package/python-pyalsa/Config.in"
 > diff --git a/package/python-pure-eval/Config.in b/package/python-pure-eval/Config.in
 > new file mode 100644
 > index 0000000000..f6ccd6056d
 > --- /dev/null
 > +++ b/package/python-pure-eval/Config.in
 > @@ -0,0 +1,6 @@
 > +config BR2_PACKAGE_PYTHON_PURE_EVAL
 > +	bool "python-pure-eval"
 > +	help
 > +	  Safely evaluate AST nodes without side effects.
 > +
 > +	  http://github.com/alexmojaki/pure_eval
 > diff --git a/package/python-pure-eval/python-pure-eval.hash b/package/python-pure-eval/python-pure-eval.hash
 > new file mode 100644
 > index 0000000000..5bf5dcb749
 > --- /dev/null
 > +++ b/package/python-pure-eval/python-pure-eval.hash
 > @@ -0,0 +1,5 @@
 > +# md5, sha256 from https://pypi.org/pypi/pure_eval/json
 > +md5  212fd27ca2c58d9effddec69748d738a  pure_eval-0.2.2.tar.gz
 > +sha256  2b45320af6dfaa1750f543d714b6d1c520a1688dec6fd24d339063ce0aaa9ac3  pure_eval-0.2.2.tar.gz
 > +# Locally computed sha256 checksums
 > +sha256  a476a2cb0ef4c41450340a577a28b91ac4c7f669136b2ee148047fabd5fc4181  LICENSE.txt
 > diff --git a/package/python-pure-eval/python-pure-eval.mk b/package/python-pure-eval/python-pure-eval.mk
 > new file mode 100644
 > index 0000000000..f139ea270f
 > --- /dev/null
 > +++ b/package/python-pure-eval/python-pure-eval.mk
 > @@ -0,0 +1,16 @@
 > +################################################################################
 > +#
 > +# python-pure-eval
 > +#
 > +################################################################################
 > +
 > +PYTHON_PURE_EVAL_VERSION = 0.2.2
 > +PYTHON_PURE_EVAL_SOURCE = pure_eval-$(PYTHON_PURE_EVAL_VERSION).tar.gz
 > +PYTHON_PURE_EVAL_SITE = https://files.pythonhosted.org/packages/97/5a/0bc937c25d3ce4e0a74335222aee05455d6afa2888032185f8ab50cdf6fd
 > +PYTHON_PURE_EVAL_SETUP_TYPE = setuptools
 > +PYTHON_PURE_EVAL_LICENSE = MIT
 > +PYTHON_PURE_EVAL_LICENSE_FILES = LICENSE.txt
 > +
 > +PYTHON_PURE_EVAL_DEPENDENCIES = host-python-setuptools-scm
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
