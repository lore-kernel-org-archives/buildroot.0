From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 19 Nov 2010 16:42:57 +0100
Subject: [Buildroot] [PATCH] Prohibit config cache for host-libtool
In-Reply-To: <1288660697-7641-1-git-send-email-m-starostik@versanet.de> (Malte
	Starostik's message of "Tue, 2 Nov 2010 02:18:17 +0100, Tue,
	02 Nov 2010 02:18:18 +0100")
References: <1288660697-7641-1-git-send-email-m-starostik@versanet.de>
Message-ID: <87mxp5720u.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Malte" == Malte Starostik <m-starostik@versanet.de> writes:

 Malte> Fixes this one when building from scratch:
 Malte> libtool: link: (cd libltdl/.libs && /usr/bin/gcc -O2
 Malte> 		 -I/home/malte/devel/buildroot/output/host/include
 Malte> 		 -I/home/malte/devel/buildroot/output/host/usr/include
 Malte> 		 -c -fno-builtin  -fPIC -DPIC "libltdlS.c")
 Malte> libltdlS.c:26: error: 'lt_ptr' undeclared here (not in a function)
 Malte> libltdlS.c:26: error: expected '}' before numeric constant
 Malte> make[3]: *** [libltdl/libltdl.la] Fehler 1

 Malte> Signed-off-by: Malte Starostik <m-starostik@versanet.de>

Thanks, but we have in the mean time completely removed the (dangerous)
shared config cache.

-- 
Bye, Peter Korsgaard
