From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 30 Jan 2009 11:56:26 +0100
Subject: [Buildroot] svn commit: trunk/buildroot/package/qte
In-Reply-To: <20090130105001.98CDB765E9@busybox.osuosl.org>
	(laird@uclibc.org's message of "Fri\,
	30 Jan 2009 10\:50\:01 +0000 \(UTC\)")
References: <20090130105001.98CDB765E9@busybox.osuosl.org>
Message-ID: <871vulnjtx.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "laird" == laird  <laird@uclibc.org> writes:

 laird> Author: laird
 laird> Date: 2009-01-30 10:49:59 +0000 (Fri, 30 Jan 2009)
 laird> New Revision: 25162

 laird> Log:
 laird> qte.mk: Use depends on for toolchain features 

 laird> Buildroot is adopting depends on for toolchain features and
 laird> select for packages. Make this change in this file.
 
 laird> Signed-off-by: Daniel Laird <daniel.j.laird@nxp.com>

 laird> @@ -2,7 +2,7 @@
 laird>  	bool "Qt/E"
 laird>  	depends on BR2_DEPRECATED
 laird>  	depends on BR2_INSTALL_LIBSTDCPP
 laird> -	select BR2_PTHREADS_NATIVE
 laird> +	depends on BR2_PTHREADS_NATIVE
 laird>  	select BR2_PACKAGE_JPEG
 laird>  	select BR2_PACKAGE_LIBPNG
 laird>  	help

You forgot to update comment so people can know how to enable it:

comment "Qt/E requires a toolchain with C++ support enabled"
        depends on !BR2_INSTALL_LIBSTDCPP
        depends on BR2_DEPRECATED

That one should depend on !BR2_PTHREADS_NATIVE and the text should get
updated.

-- 
Bye, Peter Korsgaard
