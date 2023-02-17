Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 025A5C6379F
	for <buildroot@archiver.kernel.org>; Fri, 17 Feb 2023 14:36:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 740044051F;
	Fri, 17 Feb 2023 14:36:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 740044051F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GpfEVHz6rdfr; Fri, 17 Feb 2023 14:36:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8569440453;
	Fri, 17 Feb 2023 14:36:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8569440453
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 564E41BF34A
 for <buildroot@lists.busybox.net>; Fri, 17 Feb 2023 14:36:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2CF1E41B2E
 for <buildroot@lists.busybox.net>; Fri, 17 Feb 2023 14:36:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2CF1E41B2E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id N-f6G77zPHtQ for <buildroot@lists.busybox.net>;
 Fri, 17 Feb 2023 14:36:29 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4D85D41A6E
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4D85D41A6E
 for <buildroot@buildroot.org>; Fri, 17 Feb 2023 14:36:29 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id A7002240004;
 Fri, 17 Feb 2023 14:36:25 +0000 (UTC)
Date: Fri, 17 Feb 2023 15:36:24 +0100
To: Nasser Afshin <afshin.nasser@gmail.com>
Message-ID: <20230217153624.58898d55@windsurf>
In-Reply-To: <20221108084551.GA22961@smart-All-Series>
References: <20221025065539.4646-1-afshin.nasser@gmail.com>
 <CAGm1_ku8QUbDtT+Bt=5jmD46Vws_go6r2dK9oD95i_bgJynLbg@mail.gmail.com>
 <20221026102255.GA602@smart-All-Series>
 <CAGm1_ktx6UuANUZ=Eqbh_wr7JrJNaHz=ou9zg9mSvGP+ivnzmA@mail.gmail.com>
 <20221029080229.GA24217@smart-All-Series>
 <CAGm1_kuquC8Z9DOZWazKO2jrS4pYVwgYnGWtj8s5WMTBva9wSA@mail.gmail.com>
 <20221108084551.GA22961@smart-All-Series>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1676644586;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=O+cRnRDKLyYOEpJzvw8ni00gku+98f0fCxXR2yxsT1c=;
 b=foraDYiVk44+boXDpW3uGlgTykaNTuB7In6cSXrdZbs0YltwHRBeAWjuoy7jy7K7nWcPDJ
 fMvYOGNskiBAYFIzyqdlrXuMjO/GTr2Ljn/RYpOGV6G18y/FWypuhoOTjun0NdD03MmptZ
 az9NGToBep0dhoBhmgIVyj8Q+ujyVAlPR4ByBUQA/1U8HqWjHgmk/8/Zh+3qscTRDKyQMy
 /dEnfmRQmvJ9eS0cWNfqAmaizW5YtyWZ4EQ7llRqAnHMPcMs2rCktLdOqSJqW35wLEVDxo
 6WPjExEC+Z55KVECsaFagaKW++NiZsLT5jTi80Ib9y3tcWKo1OqUqWxdmXTOhg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=foraDYiV
Subject: Re: [Buildroot] [PATCH v3 RESEND] python-pycrate: new package
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

On Tue, 8 Nov 2022 12:15:51 +0330
Nasser Afshin <afshin.nasser@gmail.com> wrote:

> > > From de6e28885836a6d9a5347a083a68055098508583 Mon Sep 17 00:00:00 2001
> > > From: Nasser Afshin <Afshin.Nasser@gmail.com>
> > > Date: Tue, 25 Oct 2022 16:06:53 +0330
> > > Subject: [PATCH v3] python-pycrate: new package
> > >
> > > Signed-off-by: Nasser Afshin <Afshin.Nasser@gmail.com>

Thanks for your contribution. However what you did here when resending
a new iteration really wasn't convenient to apply the patch. Next time
could you use "git send-email" to send the new iteration as a new-email.

Some more comments below.

> > > diff --git a/package/python-pycrate/python-pycrate.hash b/package/python-pycrate/python-pycrate.hash
> > > new file mode 100644
> > > index 0000000000..8ad33370b4
> > > --- /dev/null
> > > +++ b/package/python-pycrate/python-pycrate.hash
> > > @@ -0,0 +1,6 @@
> > > +# md5, sha256 from https://pypi.org/pypi/pycrate/json
> > > +md5  075622d5d573274cd4dbfe268ca52f7f  pycrate-0.5.5.tar.gz
> > > +sha256  59f09331890a389a6b98412f19f4fb021c5a75a35ab07bf5ba0d1e299a0967af  pycrate-0.5.5.tar.gz
> > > +# Locally computed
> > > +sha256 dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  license.txt

This did not match the expected formatting. "make check-package"
complains about formatting issues in the hash file.

> > > diff --git a/package/python-pycrate/python-pycrate.mk b/package/python-pycrate/python-pycrate.mk
> > > new file mode 100644
> > > index 0000000000..c0da152656
> > > --- /dev/null
> > > +++ b/package/python-pycrate/python-pycrate.mk
> > > @@ -0,0 +1,14 @@
> > > +################################################################################
> > > +#
> > > +# python-pycrate
> > > +#
> > > +################################################################################
> > > +
> > > +PYTHON_PYCRATE_VERSION = 0.5.5
> > > +PYTHON_PYCRATE_SOURCE = pycrate-$(PYTHON_PYCRATE_VERSION).tar.gz
> > > +PYTHON_PYCRATE_SITE = https://files.pythonhosted.org/packages/25/8f/b3d7e0b541aa04b2f0f7aa694a6946b572bfa2e2627cf1f12b5416d633df
> > > +PYTHON_PYCRATE_SETUP_TYPE = setuptools
> > > +PYTHON_PYCRATE_EXTRA_DOWNLOADS = https://raw.githubusercontent.com/P1sec/pycrate/master/license.txt

This was not good for three reasons:

(1) The license.txt was not listed in PYTHON_PYCRATE_LICENSE_FILES so
it was not taken into account

(2) The URL from which you download the file does not point to a stable
file: it's the file from the master branch, so it can change at any
time, breaking the hash check, but also potentially being inconsistent
with the license of version 0.5.5 that the package is using

(3) The license.txt was not copied into the source directory of the
package, making it unaccessible to the legal-info machinery.

With these issues fixed, the .mk file looks like this:

PYTHON_PYCRATE_VERSION = 0.5.5
PYTHON_PYCRATE_SOURCE = pycrate-$(PYTHON_PYCRATE_VERSION).tar.gz
PYTHON_PYCRATE_SITE = https://files.pythonhosted.org/packages/25/8f/b3d7e0b541aa04b2f0f7aa694a6946b572bfa2e2627cf1f12b5416d633df
PYTHON_PYCRATE_SETUP_TYPE = setuptools
PYTHON_PYCRATE_EXTRA_DOWNLOADS = https://raw.githubusercontent.com/P1sec/pycrate/$(PYTHON_PYCRATE_VERSION)/license.txt
PYTHON_PYCRATE_LICENSE = LGPL-2.1+
PYTHON_PYCRATE_LICENSE_FILES = license.txt

define PYTHON_PYCRATE_ADD_LICENSE_FILE
	cp $(PYTHON_PYCRATE_DL_DIR)/license.txt $(@D)
endef
PYTHON_PYCRATE_POST_EXTRACT_HOOKS += PYTHON_PYCRATE_ADD_LICENSE_FILE

$(eval $(python-package))

I've applied after fixing the different issues.

However, one thing that would be really good to add is a runtime test
in support/testing/ to make sure that the package is at least minimally
working at runtime. You can take a look at all the
support/testing/tests/package/test_python* files for examples.

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
