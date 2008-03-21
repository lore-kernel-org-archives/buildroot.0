From: Guillaume Dargaud <dargaud@lpsc.in2p3.fr>
Date: Fri, 21 Mar 2008 15:47:59 +0100
Subject: [Buildroot] Wrong compiling commands ?
References: <01b801c88b3c$b94aba00$ad289e86@LPSC0173W>
	<20080321103430.GA10140@mx.loc>
Message-ID: <02b201c88b62$91888bc0$ad289e86@LPSC0173W>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello all,
sorry if I ask a lot of newbie questions here, but 12 years since my last 
embedded work on totally different architectures (TI), I have a hard time 
getting back in the game.

The more I look at what is going on, the more I think things are just plain 
wrong. Look at the invocation to compile uClibc:

$ make ARCH=ppc
[...]
/usr/bin/make MAKE="/usr/bin/make -j1" -C 
/home/guinevere/buildroot/toolchain_build_ppc/uClibc-0.9.29 \
        PREFIX= \
        DEVEL_PREFIX=/ \
        RUNTIME_PREFIX=/ \
        HOSTCC="/usr/bin/gcc" \
        all
[...]
Finishing with a whole bunch of errors...
Shouldn't there be a CROSS=something in there ? And some path for PREFIX ?

Thanks
-- 
Guillaume Dargaud
http://www.gdargaud.net/
