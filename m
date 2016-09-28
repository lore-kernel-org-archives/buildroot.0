From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 28 Sep 2016 10:57:57 +0200
Subject: [Buildroot] [PATCH] qt5: Disable passing of -isystem flag in
 CXXFLAGS
In-Reply-To: <6467f1b7-7326-02f1-caf1-671099a34eac@mind.be>
References: <1474642729-40702-1-git-send-email-abrodkin@synopsys.com>
 <81ddd556-d7fd-2378-d8da-2f2d73091fa3@mind.be>
 <1474889395.4184.8.camel@synopsys.com>
 <6467f1b7-7326-02f1-caf1-671099a34eac@mind.be>
Message-ID: <20160928105757.4d65e0d4@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 28 Sep 2016 00:33:16 +0200, Arnout Vandecappelle wrote:

>  I mean that it's _our_ pkg-config that does the wrong thing.
> 
> ------ output/staging/usr/lib/pkgconfig/libpcre.pc --------
> # Package Information for pkg-config
> 
> prefix=/usr
> exec_prefix=/usr
> libdir=${exec_prefix}/lib
> includedir=${prefix}/include
> 
> Name: libpcre
> Description: PCRE - Perl compatible regular expressions C library with 8 bit
> character support
> Version: 8.39
> Libs: -L${libdir} -lpcre
> Libs.private:
> Cflags: -I${includedir}
> ------------------------------------------------------------
> 
> output/host/usr/bin/pkg-config --cflags libpcre
> -IXXX/output/host/usr/arm-buildroot-linux-musleabihf/sysroot/usr/include
> 
>  According to me, this should have returned empty.

So in other words, you're withdrawing your Reviewed-by on Alexey's
patch, and say that we should fix host-pkgconf instead, right ?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
