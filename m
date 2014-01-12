From: Bernd Kuhls <berndkuhls@hotmail.com>
Date: Sun, 12 Jan 2014 14:14:30 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2014-01-11
References: <20140112073009.34B81101069@stock.ovh.net>
Message-ID: <m2haqaxilq.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote
in news:20140112073009.34B81101069 at stock.ovh.net: 

>             libvncserver-0.9.9 | 1 

>        arm |             libvncserver-0.9.9 | NOK |
>        http://autobuild.buildroot.net/results/061715052ec56fa2f1e446ff7ea
>        70feac9d92174/ 

Hi,

I found the problem, buildroot/output/host/usr/powerpc-buildroot-linux-
gnu/sysroot/usr/lib/pkgconfig/gnutls.pc misses "-lrt" at "Libs:" letting 
libvncserver configure fail when

checking for getaddrinfo... yes

Without the forementioned addition this happens:

checking for getaddrinfo... no
checking for getaddrinfo in -lsocket... no
checking for getaddrinfo in -lws2_32... no

quoting config.log:
/home/test/buildroot/output/host/usr/powerpc-buildroot-linux-
gnu/sysroot/usr/lib/libgnutls.so: undefined reference to `clock_gettime'

I am unsure however if adding "-lrt" in gnutls.pc for all platforms is the 
solution.

Regards, Bernd
