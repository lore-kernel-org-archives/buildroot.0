From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 16 Jun 2014 09:41:44 +0200
Subject: [Buildroot] [git commit] fmc: new package
In-Reply-To: <20140614170014.921B39CFE5@busybox.osuosl.org> (Thomas
 Petazzoni's message of "Sat, 14 Jun 2014 19:00:00 +0200")
References: <20140614170014.921B39CFE5@busybox.osuosl.org>
Message-ID: <878uoxcnd3.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > commit: http://git.buildroot.net/buildroot/commit/?id=da686994469806dcb7239dee8aa9b06de57820e0
 > branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>
 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 > ---
 >  package/Config.in     |    1 +
 >  package/fmc/Config.in |   19 +++++++++++++++++++
 >  package/fmc/fmc.mk    |   31 +++++++++++++++++++++++++++++++
 >  3 files changed, 51 insertions(+), 0 deletions(-)

 > diff --git a/package/Config.in b/package/Config.in
 > index 33f3c73..9627d50 100644
 > --- a/package/Config.in
 > +++ b/package/Config.in
 > @@ -922,6 +922,7 @@ endif
 >  	source "package/ebtables/Config.in"
 >  	source "package/ethtool/Config.in"
 >  	source "package/faifa/Config.in"
 > +	source "package/fmc/Config.in
 >  	source "package/foomatic-filters/Config.in"
 >  	source "package/fping/Config.in"
 >  	source "package/gesftpserver/Config.in"
 > diff --git a/package/fmc/Config.in b/package/fmc/Config.in
 > new file mode 100644
 > index 0000000..35de28e
 > --- /dev/null
 > +++ b/package/fmc/Config.in
 > @@ -0,0 +1,19 @@
 > +comment "fmc needs a toolchain w/ C++"
 > +	depends on !BR2_INSTALL_LIBSTDCPP
 > +
 > +config BR2_PACKAGE_FMC
 > +	bool "fmc"
 > +	depends on BR2_powerpc_e500mc
 > +	depends on BR2_INSTALL_LIBSTDCPP
 > +	select BR2_PACKAGE_TCLAP
 > +	select BR2_PACKAGE_LIBXML2
 > +	select BR2_PACKAGE_FMLIB

fmlib needs a (specific) linux kernel, so we have to propagate the
dependencies here. I'll fix it now.

-- 
Bye, Peter Korsgaard
