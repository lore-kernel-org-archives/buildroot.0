From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 15 Dec 2013 13:51:21 +0100
Subject: [Buildroot] [PATCHv2 35/36] python-pysnmp-apps: new package
In-Reply-To: <1386793631-14026-36-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Wed, 11 Dec 2013 21:27:10 +0100")
References: <1386793631-14026-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1386793631-14026-36-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87eh5ewa46.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > From: Ryan Barnett <ryanbarnett3@gmail.com>
 > Signed-off-by: Ryan Barnett <rjbarnet@rockwellcollins.com>
 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 > ---
 >  package/Config.in                                |  1 +
 >  package/python-pysnmp-apps/Config.in             | 14 ++++++++++++++
 >  package/python-pysnmp-apps/python-pysnmp-apps.mk | 16 ++++++++++++++++
 >  3 files changed, 31 insertions(+)
 >  create mode 100644 package/python-pysnmp-apps/Config.in
 >  create mode 100644 package/python-pysnmp-apps/python-pysnmp-apps.mk

 > diff --git a/package/Config.in b/package/Config.in
 > index e4848ed..8d1d00b 100644
 > --- a/package/Config.in
 > +++ b/package/Config.in
 > @@ -406,6 +406,7 @@ source "package/python-pygame/Config.in"
 >  source "package/python-pyparsing/Config.in"
 >  source "package/python-pyro/Config.in"
 >  source "package/python-pysnmp/Config.in"
 > +source "package/python-pysnmp-apps/Config.in"
 >  source "package/python-pyusb/Config.in"
 >  source "package/python-pyzmq/Config.in"
 >  source "package/python-serial/Config.in"
 > diff --git a/package/python-pysnmp-apps/Config.in b/package/python-pysnmp-apps/Config.in
 > new file mode 100644
 > index 0000000..06f0a2b
 > --- /dev/null
 > +++ b/package/python-pysnmp-apps/Config.in
 > @@ -0,0 +1,14 @@
 > +config BR2_PACKAGE_PYTHON_PYSNMP_APPS
 > +	bool "python-pysnmp-apps"
 > +	depends on BR2_PACKAGE_PYTHON
 > +	select BR2_PACKAGE_PYTHON_PYSNMP
 > +	depends on BR2_INSTALL_LIBSTDCPP # pysnmp -> pyasn
 > +	help
 > +
 > +	  A collection of command-line tools for SNMP management
 > +	  purposes built on top of the PySNMP package.

There shouldn't be an empty line before the help text.

Committed with that fixed, thanks.

-- 
Bye, Peter Korsgaard
