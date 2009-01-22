From: Markus Heidelberg <markus.heidelberg@web.de>
Date: Thu, 22 Jan 2009 10:32:29 +0100
Subject: [Buildroot] svn commit:
	trunk/buildroot/package/multimedia/gst-plugins-good
In-Reply-To: <C13DBBE85AD6974B85C118C35890CA5F1AF3847E8E@EU1RDCRDC1WX029.exi.nxp.com>
References: <20090121133322.0FFA4770FC@busybox.osuosl.org>
	<200901221016.55678.markus.heidelberg@web.de>
	<C13DBBE85AD6974B85C118C35890CA5F1AF3847E8E@EU1RDCRDC1WX029.exi.nxp.com>
Message-ID: <200901221032.29723.markus.heidelberg@web.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Daniel James Laird, 22.01.2009:
> Cheers for the feedback, What I will do is:
> Move JPEG and PNG to top on Config.in

For consistency with bz2 and zlib from my patch, since they aren't
plugins, it would be nice to also remove the "PLUGIN_":

BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_JPEG -> BR2_PACKAGE_GST_PLUGINS_GOOD_JPEG
BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_PNG  -> BR2_PACKAGE_GST_PLUGINS_GOOD_PNG

> Disable ESD and OSS automatically in .mk file (as not yet available in
> buildroot)

Yes.

And don't forget the dependency for annodex. Since you enabled it per
default (which I'd sugest to change as well), it looks like you have
used it.

> I shall await your patch for the bzip2 etc stuff and then if you do
> not have direct access will test and apply.
> is this ok?

Sure.

Markus
