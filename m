From: Michael S. Zick <minimod@morethan.org>
Date: Sat, 28 Nov 2009 09:35:54 -0600
Subject: [Buildroot] BB update Was:  Build jobbing
In-Reply-To: <200911280813.12919.minimod@morethan.org>
References: <200911271522.58858.minimod@morethan.org>
	<87tywe4ube.fsf@macbook.be.48ers.dk>
	<200911280813.12919.minimod@morethan.org>
Message-ID: <200911280935.57255.minimod@morethan.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat November 28 2009, Michael S. Zick wrote:
> On Sat November 28 2009, Peter Korsgaard wrote:
> > >>>>> "Michael" == Michael S Zick <minimod@morethan.org> writes:
> > 
> > Hi,
> > 
> >  Michael> nand_{erase,lock,unlock) in BB-1.15.2 does not build.
> > 
> > I take it that you mean flash_eraseall / flash_unlock / flash_lock?
> > 
> > It works for me after 4e385ee7 - Could you update and try again?
> > 

The build didn't get far enough to find out, it looks like it broke
on the recent scsi commit:

In file included from miscutils/eject.c:20:
/Builds/BLDRT/br-head/output/toolchain/linux/include/scsi/scsi.h:145: error: expected specifier-qualifier-list before ?u8?
/Builds/BLDRT/br-head/output/toolchain/linux/include/scsi/scsi.h: In function ?scsi_varlen_cdb_length?:
/Builds/BLDRT/br-head/output/toolchain/linux/include/scsi/scsi.h:156: error: ?struct scsi_varlen_cdb_hdr? has no member named ?additional_cdb_length?
make[2]: *** [miscutils/eject.o] Error 1
make[1]: *** [miscutils] Error 2
make[1]: *** Waiting for unfinished jobs....
