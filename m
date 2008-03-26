From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Wed, 26 Mar 2008 19:09:26 +0100
Subject: [Buildroot] using of local dir
In-Reply-To: <47EA8F05.8090102@gmx.net>
References: <47EA8F05.8090102@gmx.net>
Message-ID: <20080326180926.GA404@mx.loc>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Mar 26, 2008 at 06:59:33PM +0100, Dittmann, Daniel wrote:
>Hello,
>
>in buildroot Makefile this includes the board specific config
>file from the local dir.
>
>-include $(TOPDIR)/local/$(BOARD)/$(BOARD).config
>
>Some lines later the LOCAL variable will be set:
>
>ifneq ($(BUILDROOT_LOCAL),)
>LOCAL:=$(BUILDROOT_LOCAL)
>else
>LOCAL:=local
>endif
>
>
>I think the LOCAL variable must be initialized before the include
>command and it have to use the LOCAL variable.
>
>Is this correct?

This would have been the correct thing, yes. svn blame Makefile;
Ah, alright, no surprise..

Apart from what you mention, i strikes me as broken not to allow for
BUILDROOT_LOCAL to point to anywhere but to limit it to the TOPDIR

*shrug* I'd rip it out in a whim either way
