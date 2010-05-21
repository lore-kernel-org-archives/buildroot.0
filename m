From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 21 May 2010 09:02:06 +0200
Subject: [Buildroot] libglib2 build
In-Reply-To: <FEB4C28CC3154F1885B80CEB507D4F51@apexjs> (Sagaert Johan's
	message of "Fri, 21 May 2010 00:57:20 +0200")
References: <FEB4C28CC3154F1885B80CEB507D4F51@apexjs>
Message-ID: <87vdahvitt.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Sagaert" == Sagaert Johan <sagaert.johan@skynet.be> writes:

 Sagaert> Hi Peter
 Sagaert> (should i post to mailinglist ?)

Yes, please - Other people than me might be able to help, or learn from
the solution.
 
 Sagaert> tried again...
 
 Sagaert> snip........
 
 Sagaert> checking wspiapi.h presence... no
 Sagaert> checking for wspiapi.h... no
 Sagaert> checking for strndup... yes
 Sagaert> checking for setresuid... yes
 Sagaert> checking for setreuid... yes
 Sagaert> checking sys/prctl.h usability... yes
 Sagaert> checking sys/prctl.h presence... yes
 Sagaert> checking for sys/prctl.h... yes
 Sagaert> checking arpa/nameser_compat.h usability... yes
 Sagaert> checking arpa/nameser_compat.h presence... yes
 Sagaert> checking for arpa/nameser_compat.h... yes
 Sagaert> checking for res_query... no
 Sagaert> checking for res_query in -lresolv... no
 Sagaert> checking for res_query in -lresolv (alternate version)... no
 Sagaert> checking for res_query in -lbind... no
 Sagaert> configure: error: res_query not found
 Sagaert> make: *** [/home/johan/buildroot/output/build/libglib2-2.22.5
 Sagaert> /.stamp_configured] Error 1
 
 
 Sagaert> i wonder where res_query is defined , i guess it is not build into uclibc
 
Normally it is:

./staging/usr/bin/x86_64-linux-nm -D target/lib/libuClibc-0.9.31.so|grep res_query
000000000002ff08 T __res_query
000000000002ffbf T __res_querydomain

Could you either have a look yourself in
/home/johan/buildroot/output/build/libglib2-2.22.5/config.log or put it
online somewhere so we can see what fails in the res_query detection?

-- 
Bye, Peter Korsgaard
