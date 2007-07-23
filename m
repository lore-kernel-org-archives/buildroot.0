From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Mon, 23 Jul 2007 16:43:14 +0200
Subject: [Buildroot] package/linux/Makefile.in does not include
	'openswan' patches
In-Reply-To: <20070723142207.GA9324@aon.at>
References: <1185196286.21840.18.camel@elrond.sweden.atmel.com>
	<20070723132936.GB7902@aon.at> <20070723142207.GA9324@aon.at>
Message-ID: <20070723144314.GC9324@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Jul 23, 2007 at 04:22:07PM +0200, Bernhard Fischer wrote:
>On Mon, Jul 23, 2007 at 03:29:36PM +0200, Bernhard Fischer wrote:

>make: *** No rule to make target
>`/scratch/obj.i686/buildroot.mine/project_build_i386//linux-2.6.21.5/.patched',
>needed by
>`/scratch/obj.i686/buildroot.mine/project_build_i386//linux-2.6.21.5/.configured'.
>Stop.
>
>
>This is due to this PROJECT thing. Please revert immediately or fix ASAP.

By now i have reverted these incorrect hunks in svn.
>
>While i understand that it's possible that one thing or another can
>break in the course of changes, i ask you to be more careful.

I suggest you
ifneq ($(PROJECT_BUILD_DIR),)
fixup_after_ulf=O=$(PROJECT_BUILD_DIR)
endif
LINUX26_MAKE_FLAGS+=$(fixup_after_ulf)

but you were about to do the same anyway, weren't you..
