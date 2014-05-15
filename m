From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 15 May 2014 09:50:42 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2014-05-11
In-Reply-To: <CA+sos7-Ht2wOJC+2ToqnKazE2Bxhhffo7Ef38uRd+ZqPq+D2KA@mail.gmail.com>
References: <20140512063008.74E21100DB2@stock.ovh.net>
 <20140513094426.335d2361@free-electrons.com>
 <20140513075247.GZ4096@tarshish>
 <20140513100102.14163e6c@free-electrons.com>
 <20140514205653.GL4096@tarshish>
 <CA+sos7-Ht2wOJC+2ToqnKazE2Bxhhffo7Ef38uRd+ZqPq+D2KA@mail.gmail.com>
Message-ID: <20140515095042.14f7c07a@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Beno?t Th?baudeau,

On Wed, 14 May 2014 23:25:53 +0200, Beno?t Th?baudeau wrote:

> > Right. It just papers over the real problem which is building a target config
> > test using the host toolchain, and then running it. The patch at
> > http://patchwork.ozlabs.org/patch/348765/ is better, I believe.
> 
> The issue in my case was that the native toolchain used for the
> configure test implicitly #included a header file, which triggered a
> conflict of direct inclusion between the native and cross toolchains
> header files. Passing --sysroot forces the native toolchain to only
> use the header files from the cross toolchain, fixing this conflict.
> This directly addresses the issue without any assumption regarding the
> cross libc.

Right, but using target headers with the native toolchain is wrong, and
potentially also very fragile.

> http://patchwork.ozlabs.org/patch/348765/ works too, but it removes a
> configure test and it relies on the "all libc variants we support have
> the netinet/tcp.h header" assumption, which might become wrong in the
> future, which is why I didn't choose this solution.

How likely is that to happen? If it does, we will have very clear
build failures, so we will notice, no?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
