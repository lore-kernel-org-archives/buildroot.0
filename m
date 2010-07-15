From: Quotient Remainder <quotientvremainder@gmail.com>
Date: Thu, 15 Jul 2010 12:09:48 +0100
Subject: [Buildroot] ncurses: build freezes without error with v5.7
In-Reply-To: <4C3E102D.50105@zacarias.com.ar>
References: <1279123755.7058.242.camel@cabbage.rehill.info>
	<4C3E102D.50105@zacarias.com.ar>
Message-ID: <1279192188.6184.2.camel@dubciaranr1.verifone.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Unfortunately it doesn't work, still stuck at the same place, though the
patch has changed the variable list passed.

        DESTDIR=/home/crehill/obair/buildroot.org/output/staging \
        	prefix=/usr \
        	exec_prefix=/usr \
        	bindir=/usr/bin \
        	top_srcdir=.. \
        	srcdir=. \
        	datadir=/usr/share \
        	ticdir=/usr/share/terminfo \
        	source=terminfo.tmp \
        	cross_compiling="yes" \
        	/bin/sh ./run_tic.sh
        ** Building terminfo database, please wait...
        Running tic to install /home/crehill/obair/buildroot.org/output/staging/usr/share/terminfo ...
        
        	You may see messages regarding extended capabilities, e.g., AX.
        	These are extended terminal capabilities which are compiled
        	using
        		tic -x
        	If you have ncurses 4.2 applications, you should read the INSTALL
        	document, and install the terminfo without the -x option.
        

On C?ad, 2010-07-14 at 16:29 -0300, Gustavo Zacarias wrote:
> On 07/14/2010 01:09 PM, Quotient Remainder wrote:
> 
> > The following appears when I try to build with ncurses enabled.  No
> > error is displayed but the tic command never returns.  "top" shows that
> > tic is using 100% of CPU time.  I've let it run for 20 minutes or more
> > and it doesn't progress any further.
> > BR is current: c0e307b848d8de23e6f10a179c4f240c023c8b82.
> > Toolchain is external, CodeSourcery ARM GNU/Linux 2009q3-67.
> 
> Try this patch from gentoo:
> http://sources.gentoo.org/cgi-bin/viewvc.cgi/gentoo-x86/sys-libs/ncurses/files/ncurses-5.7-tic-cross-detection.patch?revision=1.1
> Sounds a lot like your problem.
> Regards.
