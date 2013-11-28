From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 28 Nov 2013 14:44:01 +0100
Subject: [Buildroot] [PATCH] apr: needs mmu
In-Reply-To: <1385557241-13292-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Wed, 27 Nov 2013 10:00:41 -0300")
References: <1385557241-13292-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87wqjs1w0u.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 > Uses fork() in apr_proc_fork() which is used by almost all the packages
 > that use apr (log4cxx, subversion).
 > apr-util doesn't use fork or apr_proc_fork but it's of no use alone.

 > Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

 > +++ b/package/log4cxx/Config.in
 > @@ -6,6 +6,7 @@ config BR2_PACKAGE_LOG4CXX
 >  	depends on !BR2_PREFER_STATIC_LIB
 >  	depends on BR2_INSTALL_LIBSTDCPP
 >  	depends on BR2_TOOLCHAIN_HAS_THREADS
 > +	depends on BR2_USE_MMU # apr
 >  	help
 >  	  Apache log4cxx is a logging framework for C++ patterned
 >  	  after Apache log4j.

The log4cxx comment should also only be displayed when
BR2_USE_MMU. Fixed that and committed, thanks.

-- 
Bye, Peter Korsgaard
