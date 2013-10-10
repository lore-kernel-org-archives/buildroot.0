From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 10 Oct 2013 09:10:54 +0200
Subject: [Buildroot] iproute2 build error
In-Reply-To: <20131010043719.GU4875@tarshish>
References: <CALoHCLPE6SOyJM58kDXFyTxhKoCiJs4qQ1Gzk2Fsa_0-1ubViA@mail.gmail.com>
 <20131010043719.GU4875@tarshish>
Message-ID: <20131010091054.0526eb87@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Baruch Siach,

On Thu, 10 Oct 2013 07:37:19 +0300, Baruch Siach wrote:

> On Wed, Oct 09, 2013 at 03:49:45PM -0700, Eric Seifert wrote:
> > Hello, I was on buildroot-2012.08 and am trying to get up to date, so I am
> > using the git repo directly now with the latest changes. Previously
> > iproute2 was building successfully (v3.4.0), now I am getting this iproute2
> > build error (v3.11.0). I am building for PowerPC 8548/e500v2 (SPE). I am
> > using an external toolchain gcc4.3.2 that uses eglibc. Any help would be
> > great.
> 
> [...]
> 
> > libnetlink.c: In function 'rtnl_open_byproto':
> > libnetlink.c:46: error: 'SOCK_CLOEXEC' undeclared (first use in this
> > function)
> > libnetlink.c:46: error: (Each undeclared identifier is reported only once
> > libnetlink.c:46: error: for each function it appears in.)
> > make[2]: *** [libnetlink.o] Error 1
> 
> It seems that you toolchain is missing the definition of SOCK_CLOEXEC. What 
> version of eglibc are you using?

According to Eric, the toolchain is based on gcc 4.3.2, which is really
old, and one may assume that the kernel headers and C library used in
this toolchain are also quite old. Indeed, building the latest version
of some userspace programs is going to be problematic with very old
toolchains.

Eric, I would suggest to update your toolchain. I believe both
Buildroot and Crosstool-NG should be capable of generating toolchains
for your platform.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
