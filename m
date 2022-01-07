Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE1D3C433EF
	for <buildroot@archiver.kernel.org>; Fri,  7 Jan 2022 20:57:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6835E60AF1;
	Fri,  7 Jan 2022 20:57:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cjVzgWro91rN; Fri,  7 Jan 2022 20:57:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A904B60AEB;
	Fri,  7 Jan 2022 20:57:41 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B76F01BF5DA
 for <buildroot@lists.busybox.net>; Fri,  7 Jan 2022 20:57:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9C9EC40019
 for <buildroot@lists.busybox.net>; Fri,  7 Jan 2022 20:57:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rVWdPxw1vSNz for <buildroot@lists.busybox.net>;
 Fri,  7 Jan 2022 20:57:38 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 06A5640010
 for <buildroot@buildroot.org>; Fri,  7 Jan 2022 20:57:37 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (unknown [IPv6:2001:4b98:dc4:8::222])
 by mslow1.mail.gandi.net (Postfix) with ESMTP id E79FDCD8EB
 for <buildroot@buildroot.org>; Fri,  7 Jan 2022 20:50:40 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id EB0E540003;
 Fri,  7 Jan 2022 20:50:35 +0000 (UTC)
Received: from peko by dell.home with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1n5wC3-00083t-27; Fri, 07 Jan 2022 21:50:35 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Uladzimir Bely <wiselord1983@gmail.com>
References: <20220105231543.22467-1-wiselord1983@gmail.com>
Date: Fri, 07 Jan 2022 21:50:35 +0100
In-Reply-To: <20220105231543.22467-1-wiselord1983@gmail.com> (Uladzimir Bely's
 message of "Thu, 6 Jan 2022 02:15:43 +0300")
Message-ID: <87ee5jl17o.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/python-mpd2: new package
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

>>>>> "Uladzimir" == Uladzimir Bely <wiselord1983@gmail.com> writes:

 > A client interface for the Music Player Daemon.
 > Signed-off-by: Uladzimir Bely <wiselord1983@gmail.com>
 > ---
 >  package/Config.in                    |  1 +
 >  package/python-mpd2/Config.in        |  8 ++++++++
 >  package/python-mpd2/python-mpd2.hash |  5 +++++
 >  package/python-mpd2/python-mpd2.mk   | 13 +++++++++++++
 >  4 files changed, 27 insertions(+)
 >  create mode 100644 package/python-mpd2/Config.in
 >  create mode 100644 package/python-mpd2/python-mpd2.hash
 >  create mode 100644 package/python-mpd2/python-mpd2.mk

 > diff --git a/package/Config.in b/package/Config.in
 > index 7148639735..b9dc9b49e7 100644
 > --- a/package/Config.in
 > +++ b/package/Config.in
 > @@ -1091,6 +1091,7 @@ menu "External python modules"
 >  	source "package/python-mistune/Config.in"
 >  	source "package/python-modbus-tk/Config.in"
 >  	source "package/python-more-itertools/Config.in"
 > +	source "package/python-mpd2/Config.in"
 >  	source "package/python-msgfy/Config.in"
 >  	source "package/python-msgpack/Config.in"
 >  	source "package/python-multidict/Config.in"
 > diff --git a/package/python-mpd2/Config.in b/package/python-mpd2/Config.in
 > new file mode 100644
 > index 0000000000..015ca47610
 > --- /dev/null
 > +++ b/package/python-mpd2/Config.in
 > @@ -0,0 +1,8 @@
 > +config BR2_PACKAGE_PYTHON_MPD2
 > +	bool "python-mpd2"
 > +	depends on BR2_PACKAGE_PYTHON3
 > +	select BR2_PACKAGE_MPD # runtime

This assumes that the MPD daemon must be running on the same machine as
the client, which is probably not always the case, so I have removed
this.

 > +++ b/package/python-mpd2/python-mpd2.mk
 > @@ -0,0 +1,13 @@
 > +################################################################################
 > +#
 > +# python-mpd2
 > +#
 > +################################################################################
 > +
 > +PYTHON_MPD2_VERSION = 3.0.4
 > +PYTHON_MPD2_SITE = https://files.pythonhosted.org/packages/ad/92/bec26455a3a6d6146bcf2a974f5c3509d451306413b386fc12b037d9e3b0
 > +PYTHON_MPD2_SETUP_TYPE = setuptools
 > +PYTHON_MPD2_LICENSE = GNU Library or Lesser General Public License (LGPL)

We can be more specific than that. The license is actually version 3 (or
later) of the LGPL, which is encoded as LGPL-3.0+

I also took the liberty to add an entry in DEVELOPERS for this
package. Committed with these minor fixes, thanks!

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
