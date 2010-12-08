From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 8 Dec 2010 20:26:06 +0100
Subject: [Buildroot] helper tool handling in build system
 (sed/install/...)
In-Reply-To: <201012080350.46424.vapier@gentoo.org>
References: <201012080350.46424.vapier@gentoo.org>
Message-ID: <20101208202606.59e45501@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 8 Dec 2010 03:50:45 -0500
Mike Frysinger <vapier@gentoo.org> wrote:

> i cant seem to figure out why we bother looking up the full path:
> 	SED:=$(shell which sed || type -p sed) -i -e

I don't know either.

> we dont build up host versions, nor do we have to worry about them being found 
> in the cross-compiled PATH since we arent adding that to the host PATH.  the 
> only things this which/type logic is doing is shortcutting the shell's 
> implicit PATH lookup -- which is pretty much useless since it isnt saving us 
> any forks.  if anything, it just adds shell overhead whenever someone does 
> `make` because of the usage of ":=".
> 
> further, it isnt like we're trying to be portable.  the sed's -i usage is 
> purely GNU and not POSIX compliant at all.  which makes me wonder why the -e 
> is even there since the default behavior of `sed` is to treat the first 
> argument as a script.  and then makes me wonder why we have $(SED) at all -- 
> there are plenty of places in the dist where people just go through `sed`.
> 
> so am i missing something or is this all purely vestigial ?

It was added in :

commit afc61c6e8e3f9d0065c2328d4a01227cfa71ba5d
Author: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
Date:   Thu Jun 28 10:47:05 2007 +0000

    - adjust infrastructure for new kconfig

For me, it's purely vestigial, so I wouldn't mind if we get rid of it.

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 198 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20101208/c0c3fd0e/attachment.pgp>
