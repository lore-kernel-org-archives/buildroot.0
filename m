From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Mon, 23 Jul 2007 15:29:36 +0200
Subject: [Buildroot] package/linux/Makefile.in does not include
	'openswan' patches
In-Reply-To: <1185196286.21840.18.camel@elrond.sweden.atmel.com>
References: <1185196286.21840.18.camel@elrond.sweden.atmel.com>
Message-ID: <20070723132936.GB7902@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Jul 23, 2007 at 03:11:26PM +0200, Ulf Samuelsson wrote:
>The Kernel Headers buildscript applies the openswan patches 
>on top of the kernel headers, but the target/linux/Makefile.in does not.

The headers (which used the very same sourcedir, dunno if it still does
with your toolchain/linux* stuff) have to be patched. To achieve this,
we patch the source before installing the headers.
>
>Isn't this a bug?

I don't understand? You can't apply patches twice, if you mean to
suggests this (you most likely don't, i assume).
