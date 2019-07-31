From: Andreas Naumann <dev@andin.de>
Date: Wed, 31 Jul 2019 09:14:43 +0200
Subject: [Buildroot] [PATCH v1] package/qt5base: fix libtool la file
 dependency_libs entries
In-Reply-To: <20190730212522.29386-1-ps.report@gmx.net>
References: <20190730212522.29386-1-ps.report@gmx.net>
Message-ID: <736e2e98-63b1-15e1-6189-d04a64c627e6@andin.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,

Am 30.07.19 um 23:25 schrieb Peter Seiderer:
> Fixes [1]:
> 
>    libtool:   error: cannot find the library '' or unhandled argument '/.../host/riscv64-buildroot-linux-gnu/sysroot/usr/lib/libQt5Widgets.so'
> 
> Add upstream suggested patch ([2]) to  change la file dependency_libs entries
> to -L<path> -l<library> version.
> 

Upstream has also reacted on my comment in 76625, which lead me to do 
some more fiddling, whose result I posted there:
https://bugreports.qt.io/browse/QTBUG-76625

To sum it up, in my case it was enough to change the absolute so-file 
into the absolute la-file inside dependency_libs.


regards, Andreas


BTW: Since the libdir has an extra = inside the value, e.g. 
libdir='=/...', I get an ugly warning that the library was moved.
