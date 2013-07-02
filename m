From: =?ISO-8859-1?Q?Ciar=E1n?= Rehill <cir.vfi@gmail.com>
Date: Tue, 02 Jul 2013 12:49:48 +0100
Subject: [Buildroot] ldconfig - unknown machine 40
In-Reply-To: <CAPNngRMnWn3gAo3ut1GmoVJmCh2yiGu=2sUFWWXkTrL4M-NR6Q@mail.gmail.com>
References: <loom.20130628T172450-675@post.gmane.org>
 <CAPNngRMnWn3gAo3ut1GmoVJmCh2yiGu=2sUFWWXkTrL4M-NR6Q@mail.gmail.com>
Message-ID: <1372765788.4683.13.camel@dublxciaranr1.verifone.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


On Luan, 2013-07-01 at 19:25 -0300, Milton Soares Filho wrote:

Hello Milton,

> On 28 June 2013 13:55, Ciar?n Rehill <cir.vfi@gmail.com> wrote:
> >     /sbin/ldconfig: /lib/libnsl.so.1 is for unknown machine 40.
> > [...]
> > *** Firstly, anyone else seeing this?  Searching doesn't turn up much.
> 
> Me too! Trying to build a ST sh4 target using an external toolchain.
> My host machine has Ubuntu 13.04 x86-64 installed and ships ldconfig
> version 2.17.

Is it normal not to supply a cross-ldconfig with a toolchain release or
is there a standard policy on this?

> > *** Most importantly, any ideas on how to successfully use Buildroot on an
> > F18 machine for ARM (or any non-Intel arch, I suppose)?
> 
> Still have no idea on how to fix this issue, since my external
> toolchain is pre-compiled and does not ship cross-ldconfig within it.
> I have done a workaround using LD_LIBRARY_PATH on the target
> initialization scripts, but assuming it's a sub-optimal solution.

Is it possible to build the ldconfig from source without going through a
full toolchain build process, given that the majority of the components
already exist?  Maybe some essential parts are lost in the binary
distribution and there's still the need to use that intermediate stage
toolchain to generate this.  I saw some other traffic on the list
mentioning that stage may not be necessary any more though, but it may
not be relevant here.  Any toolchain experts want to chime in?
