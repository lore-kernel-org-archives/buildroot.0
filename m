From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 7 Oct 2009 11:39:57 +0200
Subject: [Buildroot] [PATCH 02/23] qt: new targets qt-uninstall and
 qt-confclean
In-Reply-To: <1254907246-5650-3-git-send-email-mroth@nessie.de>
References: <1254907246-5650-1-git-send-email-mroth@nessie.de>
	<1254907246-5650-3-git-send-email-mroth@nessie.de>
Message-ID: <20091007113957.4b2a7c06@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Wed,  7 Oct 2009 11:20:25 +0200,
Michael Roth <mroth@nessie.de> a ?crit :

> 'qt-uninstall' removes Qt from the staging area and target filesystem
> while 'qt-confclean' removes the results from running configure in the
> Qt build directory. Use this after changes to the Qt configuration
> were made to re-configure, re-build and re-install Qt.

Concerning the qt-uninstall, I'm not sure we want to clutter all
packages with proper uninstallation procedure. I'm working on something
that would work for all packages, without any particular support from
the package .mk file.

However, I don't think this work will be ready and stabilized for the
2009.11 release. So should we include this stuff or keep the status
quo ? No strong opinion on this.

For the qt-confclean, ack, but we should document this somewhere, as
this is package-specific. Perhaps we should either:

 * Add a section in the documentation on package specific things

 * Add a README file in the package/<pkgname>/ directory that describes
   some package-specific stuff

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers and embedded Linux development,
consulting, training and support.
http://free-electrons.com
