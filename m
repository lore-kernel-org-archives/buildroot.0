From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 10 Jan 2014 23:00:45 +0100
Subject: [Buildroot] [PATCH] dtc: broken for static builds
In-Reply-To: <1389087873-40458-1-git-send-email-Vincent.Riera@imgtec.com>
 (Vicente Olivert Riera's message of "Tue, 7 Jan 2014 09:44:33 +0000")
References: <1389087873-40458-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <87mwj37b02.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Vicente" == Vicente Olivert Riera <Vincent.Riera@imgtec.com> writes:

 > dtc package has hardcoded shared lib link options in the Makefile, so it
 > will fail if you try to build it on a static lib environment.

 > Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
 > ---
 >  package/dtc/Config.in |    4 ++++
 >  1 files changed, 4 insertions(+), 0 deletions(-)

 > diff --git a/package/dtc/Config.in b/package/dtc/Config.in
 > index fac6ab2..aa9f2b1 100644
 > --- a/package/dtc/Config.in
 > +++ b/package/dtc/Config.in
 > @@ -1,5 +1,6 @@
 >  config BR2_PACKAGE_DTC
 >  	bool "dtc (libfdt)"
 > +	depends on !BR2_PREFER_STATIC_LIB
 >  	help
 >  	  The Device Tree Compiler, dtc, takes as input a device-tree in
 >  	  a given format and outputs a device-tree in another format.
 > @@ -9,6 +10,9 @@ config BR2_PACKAGE_DTC
 
 >  	  http://git.jdl.com/gitweb/?p=dtc.git  (no home page)
 
 > +comment "dtc needs a toolchain w/ dynamic library"
 > +	depends on BR2_PREFER_STATIC_LIB
 > +

Committed with the comment moved below the DTC_PROGRAMS suboption so
that one get indented correctly in menuconfig, thanks.

 >  if BR2_PACKAGE_DTC
 
 >  config BR2_PACKAGE_DTC_PROGRAMS
 > -- 
 > 1.7.1


 > _______________________________________________
 > buildroot mailing list
 > buildroot at busybox.net
 > http://lists.busybox.net/mailman/listinfo/buildroot


-- 
Bye, Peter Korsgaard
