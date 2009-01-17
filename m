From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 17 Jan 2009 08:54:14 +0100
Subject: [Buildroot] svn commit: trunk/buildroot/package:
	multimedia/alsa-lib python
In-Reply-To: <20090117001907.6679477587@busybox.osuosl.org> (ulf@uclibc.org's
	message of "Sat\, 17 Jan 2009 00\:19\:07 +0000 \(UTC\)")
References: <20090117001907.6679477587@busybox.osuosl.org>
Message-ID: <87skni2wrd.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "ulf" == ulf  <ulf@uclibc.org> writes:

 ulf> Author: ulf
 ulf> Date: 2009-01-17 00:19:06 +0000 (Sat, 17 Jan 2009)
 ulf> New Revision: 24893

 ulf> Log:
 ulf> Make alsa-lib depend on libpython, if new BR2_PACKAGE_ALSA_LIB_PYTHON is selected

 ulf> Modified:
 ulf>    trunk/buildroot/package/multimedia/alsa-lib/Config.in
 ulf>    trunk/buildroot/package/multimedia/alsa-lib/alsa-lib.mk
 ulf>    trunk/buildroot/package/python/python.mk


 ulf> Changeset:
 ulf> Modified: trunk/buildroot/package/multimedia/alsa-lib/Config.in
 ulf> ===================================================================
 ulf> --- trunk/buildroot/package/multimedia/alsa-lib/Config.in	2009-01-16 22:45:31 UTC (rev 24892)
 ulf> +++ trunk/buildroot/package/multimedia/alsa-lib/Config.in	2009-01-17 00:19:06 UTC (rev 24893)
 ulf> @@ -5,3 +5,14 @@
 ulf>  	  functionality to the Linux operating system.
 
 ulf>  	  http://www.alsa-project.org/
 ulf> +
 ulf> +config BR2_PACKAGE_ALSA_LIB_PYTHON
 ulf> +	bool "Python support for alsa-lib"
 ulf> +	depends on BR2_PACKAGE_ALSA_LIB
 ulf> +	select BR2_PACKAGE_PYTHON

It would probably be goodt to add a 'default BR2_PACKAGE_PYTHON' line,
so it defaults to enabled if you have python support, and false
otherwise.

Alternatively it should depend on BR2_PACKAGE_PYTHON and just be
default y, as it's probably pretty unlikely someone wants python
support in alsa without having python enabled in the first place.

The 2nd option seems cleanest to me, what do you think?

-- 
Bye, Peter Korsgaard
