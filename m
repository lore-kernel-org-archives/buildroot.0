From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Thu, 20 Sep 2007 18:00:31 +0200
Subject: [Buildroot] svn commit: trunk/buildroot/target/linux
In-Reply-To: <1190309597.15810.13.camel@elrond.sweden.atmel.com>
References: <20070918171058.7CCA9A495E@busybox.net>
	<1190149731.4516.15.camel@aeglos.sweden.atmel.com>
	<20070919080338.GB11856@aon.at>
	<1190238418.7740.2.camel@elrond.sweden.atmel.com>
	<20070919211843.GT20058@aon.at>
	<1190309597.15810.13.camel@elrond.sweden.atmel.com>
Message-ID: <20070920160031.GB8635@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Sep 20, 2007 at 07:33:17PM +0200, Ulf Samuelsson wrote:
>ons 2007-09-19 klockan 23:18 +0200 skrev Bernhard Fischer:

>How about a patch which puts the "klips" patches on the
>buildroot.uclibc.org server?
>(http://buildroot.uclibc.org/downloads/buildroot-sources/)
>
>
>Then we can get rid of it in the trunk.
>Every single BSP for a linux kernel version will otherwise
>add 1,8 MB openswan patch to the trunk.
>Even one of them is too much IMO.

One of them is ok (we can bzip2 it, too), for the current, stable
version (2.6.22.6, currently). YMMV

If you are so concerned about the size of the sources, i'd start wiping
out all those superfluous files from target/ATMEL/.../init.d/* , if i
were you. These should come from the respective packages and not reside
in the skeleton, but again, this may be just me, dunno.
>
>The other patches are really minimal.

They are, but a compressed klips patch is "just" 330k. If you insist, we
can of course host it in the download area and provide a patch to the
patch in the package-dir, but patching patches isn't exactly readable
(at least for me). Ultimatively, i don't have a strong opinion on this
one either way.

cheers,
