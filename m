Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08720EB64D9
	for <buildroot@archiver.kernel.org>; Wed, 14 Jun 2023 11:41:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7DFDB83339;
	Wed, 14 Jun 2023 11:41:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7DFDB83339
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ajXCJQKvgrT6; Wed, 14 Jun 2023 11:41:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 839EC833CE;
	Wed, 14 Jun 2023 11:41:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 839EC833CE
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3D5361BF2CA
 for <buildroot@lists.busybox.net>; Wed, 14 Jun 2023 11:40:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1625F41584
 for <buildroot@lists.busybox.net>; Wed, 14 Jun 2023 11:40:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1625F41584
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Dn-TxwfR3DOH for <buildroot@lists.busybox.net>;
 Wed, 14 Jun 2023 11:40:40 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A3A00405B1
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A3A00405B1
 for <buildroot@buildroot.org>; Wed, 14 Jun 2023 11:40:39 +0000 (UTC)
X-GND-Sasl: peter@korsgaard.com
X-GND-Sasl: peter@korsgaard.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 86D591C000D;
 Wed, 14 Jun 2023 11:40:36 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1q9Orb-005p7O-KK; Wed, 14 Jun 2023 13:40:35 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Romain Naour <romain.naour@gmail.com>
References: <20230528190111.2430580-1-romain.naour@gmail.com>
 <20230528190111.2430580-4-romain.naour@gmail.com>
Date: Wed, 14 Jun 2023 13:40:35 +0200
In-Reply-To: <20230528190111.2430580-4-romain.naour@gmail.com> (Romain Naour's
 message of "Sun, 28 May 2023 21:01:10 +0200")
Message-ID: <87cz1ys24s.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 4/5] package/python-stack-data: new package
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
 >  package/Config.in                                |  1 +
 >  package/python-stack-data/Config.in              | 10 ++++++++++
 >  package/python-stack-data/python-stack-data.hash |  5 +++++
 >  package/python-stack-data/python-stack-data.mk   | 14 ++++++++++++++
 >  4 files changed, 30 insertions(+)
 >  create mode 100644 package/python-stack-data/Config.in
 >  create mode 100644 package/python-stack-data/python-stack-data.hash
 >  create mode 100644 package/python-stack-data/python-stack-data.mk

 > diff --git a/package/Config.in b/package/Config.in
 > index e018fe66ca..585072aa83 100644
 > --- a/package/Config.in
 > +++ b/package/Config.in
 > @@ -1310,6 +1310,7 @@ menu "External python modules"
 >  	source "package/python-sqlalchemy/Config.in"
 >  	source "package/python-sqliteschema/Config.in"
 >  	source "package/python-sqlparse/Config.in"
 > +	source "package/python-stack-data/Config.in"
 >  	source "package/python-systemd/Config.in"
 >  	source "package/python-tabledata/Config.in"
 >  	source "package/python-tempora/Config.in"
 > diff --git a/package/python-stack-data/Config.in b/package/python-stack-data/Config.in
 > new file mode 100644
 > index 0000000000..508eb9cf13
 > --- /dev/null
 > +++ b/package/python-stack-data/Config.in
 > @@ -0,0 +1,10 @@
 > +config BR2_PACKAGE_PYTHON_STACK_DATA
 > +	bool "python-stack-data"
 > +	select BR2_PACKAGE_PYTHON_ASTTOKENS # runtime
 > +	select BR2_PACKAGE_PYTHON_EXECUTING # runtime
 > +	select BR2_PACKAGE_PYTHON_PURE_EVAL # runtime
 > +	help
 > +	  Extract data from python stack frames and tracebacks
 > +	  for informative displays.
 > +
 > +	  http://github.com/alexmojaki/stack_data
 > diff --git a/package/python-stack-data/python-stack-data.hash b/package/python-stack-data/python-stack-data.hash
 > new file mode 100644
 > index 0000000000..6decd3ca8e
 > --- /dev/null
 > +++ b/package/python-stack-data/python-stack-data.hash
 > @@ -0,0 +1,5 @@
 > +# md5, sha256 from https://pypi.org/pypi/stack_data/json
 > +md5  bf86c3c81a0158e1e7f3979da5a0033b  stack_data-0.6.2.tar.gz
 > +sha256  32d2dd0376772d01b6cb9fc996f3c8b57a357089dec328ed4b6553d037eaf815  stack_data-0.6.2.tar.gz
 > +# Locally computed sha256 checksums
 > +sha256  a476a2cb0ef4c41450340a577a28b91ac4c7f669136b2ee148047fabd5fc4181  LICENSE.txt
 > diff --git a/package/python-stack-data/python-stack-data.mk b/package/python-stack-data/python-stack-data.mk
 > new file mode 100644
 > index 0000000000..494ce8f454
 > --- /dev/null
 > +++ b/package/python-stack-data/python-stack-data.mk
 > @@ -0,0 +1,14 @@
 > +################################################################################
 > +#
 > +# python-stack-data
 > +#
 > +################################################################################
 > +
 > +PYTHON_STACK_DATA_VERSION = 0.6.2
 > +PYTHON_STACK_DATA_SOURCE = stack_data-$(PYTHON_STACK_DATA_VERSION).tar.gz
 > +PYTHON_STACK_DATA_SITE = https://files.pythonhosted.org/packages/db/18/aa7f2b111aeba2cd83503254d9133a912d7f61f459a0c8561858f0d72a56
 > +PYTHON_STACK_DATA_SETUP_TYPE = setuptools
 > +PYTHON_STACK_DATA_LICENSE = MIT
 > +PYTHON_STACK_DATA_LICENSE_FILES = LICENSE.txt
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
