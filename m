From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 22 May 2011 15:55:19 +0200
Subject: [Buildroot] [PATCH 1/1] fakeroot: disallow selection for the
	target
In-Reply-To: <81ea6d1172647df1fd579b6386faf965c4bd3026.1306065364.git.thomas.petazzoni@free-electrons.com>
	(Thomas Petazzoni's message of "Sun, 22 May 2011 13:56:08 +0200")
References: <cover.1306065364.git.thomas.petazzoni@free-electrons.com>
	<cover.1306065364.git.thomas.petazzoni@free-electrons.com>
	<81ea6d1172647df1fd579b6386faf965c4bd3026.1306065364.git.thomas.petazzoni@free-electrons.com>
Message-ID: <87zkme3kmw.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> fakeroot for the target fails to build against glibc, due to largefile
 Thomas> related problems :

 Thomas> libtool: link: /home/test/outputs/test-503/host/usr/bin/powerpc-linux-gnu-gcc -pipe -Os -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -o faked faked.o  ./.libs/libcommunicate.a -ldl
 Thomas> {standard input}: Assembler messages:
 Thomas> {standard input}:2592: Error: symbol `__fxstatat64' is already defined
 Thomas> {standard input}:2627: Error: symbol `__fxstat64' is already defined
 Thomas> {standard input}:2663: Error: symbol `__xstat64' is already defined
 Thomas> {standard input}:2698: Error: symbol `__lxstat64' is already defined
 Thomas> make[3]: *** [libfakeroot.lo] Error 1

 Thomas> As fakeroot for the target is not really needed, and was only added
 Thomas> when we packaged fakeroot for the host, just make fakeroot not
 Thomas> selectable for the target.

 Thomas> We have to keet the AUTOTARGETS call for fakeroot on the target,

s/keet/keep/. I've fixed that up locally - Committed, thanks.

-- 
Bye, Peter Korsgaard
