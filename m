From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 15 Dec 2013 21:05:08 +0100
Subject: [Buildroot] [PATCH] Remove deprecated package netkitbase and
	netkittelnet
In-Reply-To: <1387135392-11445-1-git-send-email-arnaud.aujon@gmail.com>
 (Arnaud Aujon's message of "Sun, 15 Dec 2013 20:23:12 +0100")
References: <1387135392-11445-1-git-send-email-arnaud.aujon@gmail.com>
Message-ID: <87bo0hvq17.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnaud" == Arnaud Aujon <arnaud.aujon@gmail.com> writes:

 > Signed-off-by: Arnaud Aujon <arnaud.aujon@gmail.com>
 > ---
 >  Config.in.legacy                                 |  19 +++
 >  package/Config.in                                |   2 -
 >  package/netkitbase/Config.in                     |  13 --
 >  package/netkitbase/netkitbase-gcc4.patch         |  12 --
 >  package/netkitbase/netkitbase-remove-bcopy.patch |  31 ----
 >  package/netkitbase/netkitbase.mk                 |  35 -----
 >  package/netkittelnet/Config.in                   |  13 --
 >  package/netkittelnet/netkittelnet-bcopy.patch    |  57 -------
 >  package/netkittelnet/netkittelnet.mk             |  36 -----
 >  package/netkittelnet/netkittelnet.patch          | 182 -----------------------
 >  10 files changed, 19 insertions(+), 381 deletions(-)
 >  delete mode 100644 package/netkitbase/Config.in
 >  delete mode 100644 package/netkitbase/netkitbase-gcc4.patch
 >  delete mode 100644 package/netkitbase/netkitbase-remove-bcopy.patch
 >  delete mode 100644 package/netkitbase/netkitbase.mk
 >  delete mode 100644 package/netkittelnet/Config.in
 >  delete mode 100644 package/netkittelnet/netkittelnet-bcopy.patch
 >  delete mode 100644 package/netkittelnet/netkittelnet.mk
 >  delete mode 100644 package/netkittelnet/netkittelnet.patch

 > diff --git a/Config.in.legacy b/Config.in.legacy
 > index 09935f1..c1b420c 100644
 > --- a/Config.in.legacy
 > +++ b/Config.in.legacy
 > @@ -99,6 +99,25 @@ comment "----------------------------------------------------"
 >  endif
 
 >  ###############################################################################
 > +comment "Legacy options removed in 2014.02"
 > +
 > +config BR2_PACKAGE_NETKITBASE
 > +	bool "netkitbase has been removed"
 > +	select BR2_LEGACY
 > +	help
 > +	  The 'netkitbase' package has been removed since it
 > +	  has been deprecated since 2012.11. This package provided  'inetd' which 
 > +      is replaced by 'xinet' and 'ping' which is replaced by 'busybox' 
 > +      or 'fping'.
 > +
 > +config BR2_PACKAGE_NETKITTELNET
 > +    bool "netkittelnet has been removed"
 > +    select BR2_LEGACY
 > +    help
 > +	  The 'netkittelnet' package has been removed since it
 > +	  has been deprecated since 2012.11. 'busybox' provides a telnet client and
 > +      should be used instead.

The indentation / whitespace is a bit screwed up here. The config lines
should be indented with a <tab> and the help lines with
<tab><space><space>.

Committed with that fixed, thanks.

-- 
Bye, Peter Korsgaard
