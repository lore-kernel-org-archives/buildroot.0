From: Lionel Landwerlin <llandwerlin@gmail.com>
Date: Sat, 06 Nov 2010 17:44:27 +0100
Subject: [Buildroot] Results of random configuration builds
In-Reply-To: <20101106170620.1134224b@surf>
References: <20101106134454.7769d258@surf>
	<1289052342.3280.19.camel@coalu.atr>  <20101106170620.1134224b@surf>
Message-ID: <1289061867.3280.21.camel@coalu.atr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le samedi 06 novembre 2010 ? 17:06 +0100, Thomas Petazzoni a ?crit :
> Hello,
> 
> On Sat, 06 Nov 2010 15:05:42 +0100
> Lionel Landwerlin <llandwerlin@gmail.com> wrote:
> 
> > It seems you've strange toolchains :)
> > It seems the glib breakage is due to a compiler not supporting builtin
> > atomic operations, which is strange for x86.
> > I'm not able to reproduce with internal or external glibc/sh4
> > toolchains.
> 
> I was building for i386, and on i386 the
> __sync_bool_compare_and_swap_4() is not available.
> 
> > Can test with the attached patch to apply on glib2 ?
> 
> I confirm it fixes the problem on i386 toolchains. I haven't tested
> with my sh4 toolchain, but since the problem is the same, I suspect it
> also fixed the problem.
> 
> Thanks!

I just found it has been reported on the glib bugzilla :

https://bugzilla.gnome.org/show_bug.cgi?id=631353

Regards,

--
Lionel Landwerlin
