From: Oded Hanson <OHanson@xsightsys.com>
Date: Mon, 3 Mar 2014 03:42:00 +0000
Subject: [Buildroot] Segmentation fault while trying to remote debug
 with GDB and GDBServer
In-Reply-To: <20140302210343.7b18de0b@skate>
References: <51ef4c3ec6f84eab802c23a14ecb48ae@DBXPR07MB142.eurprd07.prod.outlook.com>
 <20140302070650.GE3874@tarshish>
 <24eee2c96f804b55ae7767734d5a4f6e@DBXPR07MB142.eurprd07.prod.outlook.com>
 <20140302091205.GF3874@tarshish>
 <29f88dd2071c483bb7102687088ac6b3@DBXPR07MB142.eurprd07.prod.outlook.com>
 <20140302122406.GJ3874@tarshish>
 <99f27349e290444ba06497af087cb0d8@DBXPR07MB142.eurprd07.prod.outlook.com>
 <20140302171008.2014a1e0@skate>
 <46fdd2a8dee44bfcb0422d52ea94df7e@DBXPR07MB142.eurprd07.prod.outlook.com>
 <20140302194833.GK3874@tarshish>,<20140302210343.7b18de0b@skate>
Message-ID: <f8bc7d85f9f84d1289d542c969597fdd@DBXPR07MB142.eurprd07.prod.outlook.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas.

Sorry if I confused you.  I have seen no problem - the debugger problem has been solved.  I just wanted to make sure I am not experiencing (without even knowing,  since my host and target environment are the same)  similar issues during the compilation stages,  since I dont see any where where include paths are set.  But your and Baruch explanations regarding sysroot (never heard about this before,  where I come from,  I'm used to setting include and lib paths)  answer my question.

Thanks a lot for the support - much appreciated .

Oded

On Mar 2, 2014 10:03 PM, Thomas Petazzoni <thomas.petazzoni@free-electrons.com> wrote:
Dear Baruch Siach,

On Sun, 2 Mar 2014 21:48:33 +0200, Baruch Siach wrote:

> On Sun, Mar 02, 2014 at 04:49:03PM +0000, Oded Hanson wrote:
> > What about the include path when compiling from eclipse ? Any
> > chance its using my host include files ?
>
> This should not happen.

Indeed. Having the cross-compiler include host header files would be
horribly wrong.

> > I can see that its using the cross compiler for sure,  but don't
> > see where the include path is set.
>
> The cross gcc uses its sysroot as logical root directory for headers
> and libraries. Buildroot sets gcc sysroot to the staging directory.
> For the internal toolchain sysroot is defined at build time (see
> package/gcc/gcc.mk). For external toolchain sysroot is set on gcc
> command line by the external toolchain wrapper (see
> toolchain/toolchain-external/ext-toolchain-wrapper.c).

Correct. Unless there is a bug, the Eclipse plug-in simply calls the
Buildroot cross-compiler, and the Buildroot cross-compiler already
properly looks in the staging directory (which is its sysroot) for
headers and libraries. I remember testing the Eclipse plugin with
several libraries integrated in the toolchain sysroot, with success.

Oded, can you be more specific about the problems you have seen?

Thanks,

Thomas
--
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140303/ec9aa72c/attachment.html>
