From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 16 Jun 2014 09:47:20 +0200
Subject: [Buildroot] [git commit] fmlib: new package
In-Reply-To: <20140614170014.8268A9CFE5@busybox.osuosl.org> (Thomas
 Petazzoni's message of "Sat, 14 Jun 2014 18:55:18 +0200")
References: <20140614170014.8268A9CFE5@busybox.osuosl.org>
Message-ID: <874mzlcn3r.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > commit: http://git.buildroot.net/buildroot/commit/?id=68d35f7d92d40f8d470751269e6ee9e398b15a1e
 > branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>
 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 > ---
 >  package/Config.in       |    1 +
 >  package/fmlib/Config.in |   14 ++++++++++++++
 >  package/fmlib/fmlib.mk  |   36 ++++++++++++++++++++++++++++++++++++
 >  3 files changed, 51 insertions(+), 0 deletions(-)

 > diff --git a/package/Config.in b/package/Config.in
 > index 88705f8..b29763c 100644
 > --- a/package/Config.in
 > +++ b/package/Config.in
 > @@ -718,6 +718,7 @@ menu "Networking"
 >  	source "package/cppzmq/Config.in"
 >  	source "package/czmq/Config.in"
 >  	source "package/filemq/Config.in"
 > +	source "package/fmlib/Config.in"
 >  	source "package/glib-networking/Config.in"
 >  	source "package/libcgi/Config.in"
 >  	source "package/libcgicc/Config.in"
 > diff --git a/package/fmlib/Config.in b/package/fmlib/Config.in
 > new file mode 100644
 > index 0000000..f9b09c6
 > --- /dev/null
 > +++ b/package/fmlib/Config.in
 > @@ -0,0 +1,14 @@
 > +comment "fmlib needs a Linux kernel to be built"
 > +	depends on !BR2_LINUX_KERNEL

This should only be visible if BR2_powerpc_e500mc. Will fix now (and for
fmc as well).

 > +
 > +config BR2_PACKAGE_FMLIB
 > +	bool "fmlib"
 > +	depends on BR2_powerpc_e500mc
 > +	depends on BR2_LINUX_KERNEL

-- 
Bye, Peter Korsgaard
