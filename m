Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8BA4C4332F
	for <buildroot@archiver.kernel.org>; Tue, 20 Dec 2022 07:16:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 617C540134;
	Tue, 20 Dec 2022 07:16:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 617C540134
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id R0-vXQylrghM; Tue, 20 Dec 2022 07:16:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9E41D400E2;
	Tue, 20 Dec 2022 07:16:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9E41D400E2
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A27D41BF300
 for <buildroot@lists.busybox.net>; Tue, 20 Dec 2022 07:16:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7E17D6072A
 for <buildroot@lists.busybox.net>; Tue, 20 Dec 2022 07:16:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7E17D6072A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TA2JHB_AoQlZ for <buildroot@lists.busybox.net>;
 Tue, 20 Dec 2022 07:16:43 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2CA0E605EA
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2CA0E605EA
 for <buildroot@buildroot.org>; Tue, 20 Dec 2022 07:16:42 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 158BCC0002;
 Tue, 20 Dec 2022 07:16:38 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1p7Wrd-008bmP-Qt; Tue, 20 Dec 2022 08:16:37 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Devoogdt <thomas@devoogdt.com>
References: <20221212153534.1782735-1-thomas.devoogdt@barco.com>
Date: Tue, 20 Dec 2022 08:16:37 +0100
In-Reply-To: <20221212153534.1782735-1-thomas.devoogdt@barco.com> (Thomas
 Devoogdt's message of "Mon, 12 Dec 2022 16:35:34 +0100")
Message-ID: <87edsuh7e2.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/unifdef: add new package
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
Cc: Adrian Perez de Castro <aperez@igalia.com>,
 Thomas Devoogdt <thomas.devoogdt@barco.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Thomas" == Thomas Devoogdt <thomas@devoogdt.com> writes:

 > A small package that does "Selectively remove C preprocessor conditionals".
 > The package will be needed for the upcoming webkitgtk 2.40.0 release.
 > I personally added it to get started with 2.39.2.

 > See: https://github.com/WebKit/WebKit/commit/f76a7e30e5749af897b83cc75b2534b1afa32552
 > Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>
 > ---
 >  .../0001-Makefile-fix-error-on-install.patch  | 31 +++++++++++++++++++
 >  package/unifdef/unifdef.hash                  |  3 ++
 >  package/unifdef/unifdef.mk                    | 20 ++++++++++++
 >  3 files changed, 54 insertions(+)
 >  create mode 100644 package/unifdef/0001-Makefile-fix-error-on-install.patch
 >  create mode 100644 package/unifdef/unifdef.hash
 >  create mode 100644 package/unifdef/unifdef.mk

 > +++ b/package/unifdef/unifdef.hash
 > @@ -0,0 +1,3 @@
 > +# Locally computed
 > +sha256  37ed46a39446b15b08af418fda23b75c27a769d5aad236d817ee7522cc9caeee  COPYING
 > +sha256  fba564a24db7b97ebe9329713ac970627b902e5e9e8b14e19e024eb6e278d10b  unifdef-2.12.tar.gz

NIT: We normally list the tarball before the license files.


> diff --git a/package/unifdef/unifdef.mk b/package/unifdef/unifdef.mk
 > new file mode 100644
 > index 0000000000..0107cd7096
 > --- /dev/null
 > +++ b/package/unifdef/unifdef.mk
 > @@ -0,0 +1,20 @@
 > +################################################################################
 > +#
 > +# unifdef
 > +#
 > +################################################################################
 > +
 > +UNIFDEF_VERSION = 2.12
 > +UNIFDEF_SITE = https://dotat.at/prog/unifdef
 > +UNIFDEF_LICENSE = BSD-2-Clause
 > +UNIFDEF_LICENSE_FILES = COPYING
 > +
 > +define HOST_UNIFDEF_BUILD_CMDS
 > +	$(HOST_CONFIGURE_OPTS) $(MAKE) -C $(@D)
 > +endef
 > +
 > +define HOST_UNIFDEF_INSTALL_CMDS
 > +	$(HOST_CONFIGURE_OPTS) $(MAKE) -C $(@D) HOME=$(HOST_DIR) install

HOME= sounds a bit odd. The Makefile just does prefix=${HOME} and the
INSTALL file only mentions setting prefix=, so I've changed it to use
that.

Committed with these minor changes, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
