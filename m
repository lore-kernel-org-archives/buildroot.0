From: Ma Andrew <andrewma83@hotmail.com>
Date: Fri, 4 Apr 2008 10:37:04 -0700
Subject: [Buildroot] Error when compiling Buildroot to create
	.iso	(cannot stat /.../i386-linux-2.6.24-20
In-Reply-To: <1207290397.2660.1.camel@nigel-x60>
References: <326f33790804031358n63fd21bs5ee753b194d3a89b@mail.gmail.com>
	<BLU136-W8787D45D6697B1F3539C3C3F70@phx.gbl>
	<326f33790804031513n230462e5hb65b1705dafabace@mail.gmail.com>
	<BLU136-W3608C3619B673FB8C4FC10C3F70@phx.gbl>
	<326f33790804031646w6a11671fgba1f50aba995f450@mail.gmail.com>
	<BLU136-W408F3BBAFC783BCAF49646C3F70@phx.gbl>
	<326f33790804031722y751e20fbp90953425cc54b247@mail.gmail.com>
	<BLU136-W23D741198BD0E52C39F5A9C3F60@phx.gbl>
	<1207284485.3964.26.camel@nigel-x60>
	<BLU136-W53B177A876BAF0750E74CCC3F60@phx.gbl> 
	<1207290397.2660.1.camel@nigel-x60>
Message-ID: <BLU136-W21E3A39DEBF591626D9C7CC3F60@phx.gbl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Thanks Nigel.  I checkout a new copy of buildroot:

Path: .
URL: svn://uclibc.org/trunk/buildroot
Repository Root: svn://uclibc.org
Repository UUID: xxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
Revision: 21636
Node Kind: directory
Schedule: normal
Last Changed Author: jacmet
Last Changed Rev: 21636
Last Changed Date: 2008-04-04 07:16:06 -0700 

It turns out the problem that Arun mentioned is gone.  It compiles with "minimal skeleton target".  As a side note, there is a new problem on stage on mkisofs.

(hide out part of my directory information)
buildroot/build_i686/cdrtools-2.01/mkisofs/OBJ/i686-linux-cc/mkisofs: No such file or directory
make: *** [buildroot/binaries/uclibc/rootfs.i686.iso] Error 127

It seems the output directory is on "athlon-linux-cc" instead of "i686-linux-cc", which buildroot script is looking for.  I haven't got time to dig deep and see what goes wrong.  Simplest way to make a sym link for i686-linux-cc to athlon-linux-cc .

Thanks
--Andrew


----------------------------------------
> Subject: RE: [Buildroot] Error when compiling Buildroot to create .iso	(cannot stat /.../i386-linux-2.6.24-20
> From: nkukard at lbsd.net
> To: andrewma83 at hotmail.com
> CC: reddyac at gmail.com; buildroot at uclibc.org
> Date: Fri, 4 Apr 2008 06:26:37 +0000
> 
> 
> On Thu, 2008-04-03 at 22:36 -0700, Ma Andrew wrote:
>> Hello Nigel,
>> 
>> I didn't have a chance to compile from a fresh checkout copy, and only do a "svn update" when I see your email.  The copy that I compiled is checked out from yesterday.  The revision that I am in is 21630.  I am still suffering from the same problem if the sym link is removed.
> 
> Nuke all the files in the destination dir, if the symlink is there its
> not going to copy over the dereferenced file in any case.
> 
> So nuke all the files, and rebuild.
> 
> -N

_________________________________________________________________
?? Windows Live Messenger 8.5 ??????????????????????????? ????
http://get.live.com/zh-cht-tw/betas/messenger_betas
