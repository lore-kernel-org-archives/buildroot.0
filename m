From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 17 Jul 2010 10:52:13 +0200
Subject: [Buildroot] [PATCH 5/5] sdl: fix build of other sdl components
In-Reply-To: <f800341385a920189716290cd4d766aaa030e808.1279271863.git.thomas.petazzoni@free-electrons.com>
	(Thomas Petazzoni's message of "Fri, 16 Jul 2010 11:18:11 +0200")
References: <cover.1279271862.git.thomas.petazzoni@free-electrons.com>
	<cover.1279271862.git.thomas.petazzoni@free-electrons.com>
	<f800341385a920189716290cd4d766aaa030e808.1279271863.git.thomas.petazzoni@free-electrons.com>
Message-ID: <8739vixzgi.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> The post installation hook of SDL was not being executed, due to an
 Thomas> incorrect usage of the infrastructure. Moreover, it did not patch
 Thomas> prefix/exec_prefix in sdl-config as is needed. In addition to that, we
 Thomas> remove the -Wl,-rpath option from sdl-config, since it is not needed.

Hmm, I don't think that's right - It all build fine for me without this
patch (is it for ext toolchain?), and now the libraries have a rpath to
the staging dir:

powerpc-linux-readelf -a libSDL_gfx.so.13.5.1|grep RPATH
 0x0000000f (RPATH)                      Library rpath: [/home/peko/source/buildroot/output/staging/usr/lib]

-- 
Bye, Peter Korsgaard
