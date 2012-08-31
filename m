From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 31 Aug 2012 21:46:13 +0200
Subject: [Buildroot] Incorrect spelling in buildroot trunk?
In-Reply-To: <SNT126-W377EE102E2EF4FBB08DBA2C9A60@phx.gbl> (R. Zhong's message
 of "Fri, 31 Aug 2012 11:42:11 -0700")
References: <SNT126-W377EE102E2EF4FBB08DBA2C9A60@phx.gbl>
Message-ID: <87bohqq1yy.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "R" == R Zhong <rzhong@hotmail.com> writes:

 R> Hi, I think SYSDROOT_DIR should be SYSROOT_DIR in toolchain/helpers.mk
 R> check_glibc = \
 R>         SYSROOT_DIR="$(strip $1)"; \
 R>         if test `find $${SYSDROOT_DIR}/lib/ -maxdepth 1 -name 'ld-linux*.so.*' -o -name 'ld.so.*' | wc -l` -eq 0 ; then \
 R>                 echo "Incorrect selection of the C library"; \
 R>                 exit -1; \
 R>         fi; \

You're right. I've fixed it in git now, thanks.

-- 
Bye, Peter Korsgaard
