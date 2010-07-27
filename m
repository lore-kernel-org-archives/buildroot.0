From: Sergio Monteiro Basto <sergio@sergiomb.no-ip.org>
Date: Tue, 27 Jul 2010 04:15:46 +0100
Subject: [Buildroot] makedevs: line 49: regular file (...)
 buildroot/output/target/usr/share/udhcpc/default.script does not exist: No
 such file or directory
In-Reply-To: <1280154696.31502.11.camel@segulix>
References: <1280116089.28885.29.camel@segulix>
	<20100726082816.7a1bd8d1@surf> <1280151165.31502.6.camel@segulix>
	<20100726154939.6a80081d@surf>  <1280154696.31502.11.camel@segulix>
Message-ID: <1280200547.30894.34.camel@segulix>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 2010-07-26 at 15:31 +0100, Sergio Monteiro Basto wrote: 
> On Mon, 2010-07-26 at 15:49 +0200, Thomas Petazzoni wrote: 
> > Hello,
> > 
> > On Mon, 26 Jul 2010 14:32:45 +0100
> > Sergio Monteiro Basto <sergio@sergiomb.no-ip.org> wrote:
> > 
> > > > On Mon, 26 Jul 2010 04:48:09 +0100
> > > > Sergio Monteiro Basto <sergio@sergiomb.no-ip.org> wrote:
> > > > 
> > > > > I got this error too , with buildroot-2010.05.
> > > > 
> > > > Which error ?
> > > 
> > > Well error is in subject (Can't get Buildrooot to finish):
> > 
> > Aah, okay, I missed it.
> > 
> > > makedevs: line 49: regular file (...)
> > > buildroot/output/target/usr/share/udhcpc/default.script does not
> > > exist: No such file or directory
> > 
> > Can you post your Buildroot .config for us to reproduce the issue ?
> 
> ok .config in attach as emtec.config.without qt version 4 .
> 
> > 
> > > > > After read some threads in this mailing list is this some error , 
> > > > > to work around I done:
> > > > > cd output/target/usr/share
> > > > > ln -s ../../../../target/generic/target_skeleton/usr/share/udhcpc
> > > > > 
> > > > > and build rootfs , is this correct ? the target is a mips32r2 . 
> > > > 
> > > > Maybe, but as you haven't copy/pasted the error, it's hard to
> > > > say :-)
> > 
> > In fact, the work around is not correct. You're creating a symbolic
> > link from the target directory to the outside. While this symbolic may
> > work on the development system where Buildroot runs, it will miserably
> > fail on the target system.
> 
> oh no,
> 
> I successfully build and run bash on my emtec R100 !

Ok , first I move to git version of buildroot, which make xconfig works
and gives a great help.

I think with this main change: 
-# BR2_PROGRAM_INVOCATION is not set
+BR2_PROGRAM_INVOCATION=y

Give me the habitability to build libglib2-2.22.5 which give an error
like buildroot/output/build/libglib2-2.22.5/.stamp_configured] Error 1,
(I lost the error message). Which, let me think, that libglib2 also
needs depend on PROGRAM_INVOCATION in .config, like tar and coreutils.

And finally I had successfully made output/images/rootfs.ext2.lzma,
without tricky links and finish the building. 
Thanks,

BTW:
I still don't build a kernel image because seems that I don't have a
_defconfig for mipsel. What least I don't found one .

still can't build miniperl, with error:
ext/util/make_ext: line 122: ../../miniperl: No such file or directory

and mplayer gives the error: It seems nobody has ported MPlayer to your
OS or CPU type yet. (which is mipsel)

Thanks,
-- 
S?rgio M. B.
-------------- next part --------------
A non-text attachment was scrubbed...
Name: smime.p7s
Type: application/x-pkcs7-signature
Size: 3293 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20100727/acf8da27/attachment.bin>
