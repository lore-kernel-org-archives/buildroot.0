From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 13 May 2015 10:05:11 +0200
Subject: [Buildroot] [PATCH] lxc: mark as not available in
	BR2_STATIC_LIBS configs
In-Reply-To: <1431465681-12071-1-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Tue, 12 May 2015 23:21:21 +0200")
References: <1431465681-12071-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87k2wcgax4.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > Even though lxc uses the autotools, it does not use libtool to build
 > its libraries, and does it manually. It forces building a shared
 > library. So let's comply with this decision, and mark lxc as not
 > available in BR2_STATIC_LIBS configurations.

 > Fixes:

 >   http://autobuild.buildroot.org/results/588/588dc28315a9114374f148bbc64c4ec3d7b4e295/

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>


Committed, thanks.

> ---
 >  package/lxc/Config.in | 7 +++++--
 >  1 file changed, 5 insertions(+), 2 deletions(-)

 > diff --git a/package/lxc/Config.in b/package/lxc/Config.in
 > index 10a668d..ffd9b4a 100644
 > --- a/package/lxc/Config.in
 > +++ b/package/lxc/Config.in
 > @@ -3,6 +3,8 @@ config BR2_PACKAGE_LXC
 >  	select BR2_PACKAGE_LIBCAP
 >  	depends on BR2_TOOLCHAIN_HAS_THREADS
 >  	depends on BR2_USE_MMU # fork()
 > +	# build system forcefully builds a shared library
 > +	depends on !BR2_STATIC_LIBS
 >  	# the toolchain doesn't support setns syscall
 >  	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII201305
 >  	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII201405
 > @@ -14,9 +16,10 @@ config BR2_PACKAGE_LXC
 
 >  	  https://linuxcontainers.org/
 
 > -comment "lxc needs a toolchain w/ threads, headers >= 3.0"
 > +comment "lxc needs a toolchain w/ threads, headers >= 3.0, dynamic library"
 >  	depends on BR2_USE_MMU
 >  	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII201305
 >  	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII201405
 >  	depends on !BR2_TOOLCHAIN_HAS_THREADS \
 > -		|| !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0
 > +		|| !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0 \
 > +		|| BR2_STATIC_LIBS
 > -- 
 > 2.1.0

 > _______________________________________________
 > buildroot mailing list
 > buildroot at busybox.net
 > http://lists.busybox.net/mailman/listinfo/buildroot


-- 
Bye, Peter Korsgaard
