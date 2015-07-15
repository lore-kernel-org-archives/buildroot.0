From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Wed, 15 Jul 2015 18:08:41 +0000
Subject: [Buildroot] [arc-buildroot] [autobuild.buildroot.net] arc build
 results for 2015-07-12
In-Reply-To: <20150713063017.18FF71015E3@stock.ovh.net>
References: <20150713063017.18FF71015E3@stock.ovh.net>
Message-ID: <1436983720.3682.24.camel@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 2015-07-13 at 08:30 +0200, Thomas Petazzoni wrote:
> Those results are limited to the arc architecture.
> 
> Build statistics for 2015-07-12
> ===============================
> 
>         success : 5  
>        failures : 15 
>        timeouts : 0  
>           TOTAL : 20 
> 
> Classification of failures by reason
> ====================================
> 
>                   zeromq-4.0.5 | 5 
>                    tinc-1.0.24 | 3 
>              util-linux-2.26.2 | 2 
>              libselinux-2.1.13 | 1 
>                  rsyslog-8.9.0 | 1 
>                  cdrkit-1.1.11 | 1 
>                wvstreams-4.6.1 | 1 
>                   boost-1.58.0 | 1 
> 
> Detail of failures
> ===================
> 
>          arc |                  cdrkit-1.1.11 | NOK | 
> http://autobuild.buildroot.net/results/f3b2f25c93443a52f5916913f80f15e00a117eee/

That's something new:
------------------------------->8------------------------
/home/test/autobuild/instance-1/output/host/usr/arc-buildroot-linux
-uclibc/sysroot/usr/lib/libpthread.a(lowlevellock.os): In function `__lll_lock_wait_private':
lowlevellock.c:(.text+0x0): multiple definition of `__lll_lock_wait_private'
/home/test/autobuild/instance-1/output/host/usr/arc-buildroot-linux-uclibc/sysroot/usr/lib/libc.a(libc
-lowlevellock.os):libc-lowlevellock.c:(.text+0x0): first defined here
collect2: error: ld returned 1 exit status
------------------------------->8------------------------

Let me look at this one.

>          arc |                  rsyslog-8.9.0 | NOK | 
> http://autobuild.buildroot.net/results/e7ac306490ebaa21cc997911aafa2d959bb6b60b/

Fixed with http://git.buildroot.net/buildroot/commit/package/rsyslog?id=6a9095a39a72926e622285ba21d93dd48d580f0a

>          arc |                wvstreams-4.6.1 | NOK | 
> http://autobuild.buildroot.net/results/74c4208bfc026115c22b5f7c4a1859d93c6e4057/

Once again that strange TERM signal:
------------------------------->8------------------------
linking libwvutils.so...
collect2: error: ld terminated with signal 6 [Aborted]
wvrules.mk:179: recipe for target 'libwvutils.so' failed
make[1]: *** [libwvutils.so] Error 1
------------------------------->8------------------------

-Alexey
