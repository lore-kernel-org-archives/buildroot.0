From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 09 May 2014 15:42:08 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2014-05-08
In-Reply-To: <20140509071416.GQ3861@tarshish> (Baruch Siach's message of "Fri, 
 9 May 2014 10:14:16 +0300")
References: <20140509063010.6A8B2100DED@stock.ovh.net>
 <20140509071416.GQ3861@tarshish>
Message-ID: <87lhub9ihb.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > Hi Buildroot list,
 > On Fri, May 09, 2014 at 08:30:10AM +0200, Thomas Petazzoni wrote:
 >> microblazeel |               qdecoder-r12.0.5 | NOK | http://autobuild.buildroot.net/results/1b3c1a4e0e043c5ab8ef03807a095a312a19a587/
 >> arm |               qdecoder-r12.0.5 | NOK | http://autobuild.buildroot.net/results/e06b1665546e2f85ff26eb487db667abef633477/
 >> arm |               qdecoder-r12.0.5 | NOK | http://autobuild.buildroot.net/results/6910ef6cebeb2c4cabb0467f87dfc3ec4be359f9/
 >> arm |               qdecoder-r12.0.5 | NOK | http://autobuild.buildroot.net/results/ff9ea039c88457a222c6b0433e019f64817e18be/
 >> arm |               qdecoder-r12.0.5 | NOK | http://autobuild.buildroot.net/results/52c384def2adf5f1eace38866d0271aa5332beda/

 > The build log shows:

 > checking whether the C compiler works... no
 > configure: error: in `/home/test/test/3/output/build/qdecoder-r12.0.5':
 > configure: error: C compiler cannot create executables

 > But I can't reproduce it here. Thomas, Peter, what's in config.log?

It ends up using host paths:

configure:2428: /home/peko/source/buildroot-test/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabi-gcc -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -pipe -Os  -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE 
-D_FILE_OFFSET_BITS=64 -I/usr/include -I/usr/local/include -I./ -D_GNU_SOURCE  -L/usr/lib -L/usr/local/lib conftest.c  >&5
/home/peko/source/buildroot-test/output/host/usr/lib/gcc/arm-buildroot-linux-uclibcgnueabi/4.7.3/../../../../arm-buildroot-linux-uclibcgnueabi/bin/ld: skipping incompatible /usr/lib/libc.so when searching for -lc
/usr/lib/libc.a: could not read symbols: File format not recognized

Because I patched configure.ac, but forgot to set AUTORECONF = YES

Will fix now.

-- 
Bye, Peter Korsgaard
