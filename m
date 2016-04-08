From: =?UTF-8?B?QmVub8OudA==?= Allard <benoit.allard@greenbone.net>
Date: Fri, 8 Apr 2016 09:45:12 +0200
Subject: [Buildroot] [PATCH 1/1] xorriso: Add host variant
In-Reply-To: <20160330211349.773d56f6@free-electrons.com>
References: <1458136515-6087-1-git-send-email-benoit.allard@greenbone.net>
 <20160330211349.773d56f6@free-electrons.com>
Message-ID: <20160408094512.0a0ed132@armant.core.local.os.greenbone.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 30 Mar 2016 21:13:49 +0200
Thomas Petazzoni <thomas.petazzoni@free-electrons.com> wrote:

> Hello,
> 
> On Wed, 16 Mar 2016 14:55:15 +0100, Beno?t Allard wrote:
> > Signed-off-by: Beno?t Allard <benoit.allard@greenbone.net>
> 
> Thanks, I've applied. But a few questions/comments below.

Great, thanks !

> 
> 
> > +	  xorriso copies file objects from POSIX compliant
> > +	  filesystems into Rock Ridge enhanced ISO 9660 filesystems
> > +	  and allows session-wise manipulation of such filesystems.
> > +	  It can load the management information of existing ISO
> > +	  images and it writes the session results to optical media
> > +	  or to filesystem objects.
> > +
> > +	  Vice versa xorriso is able to copy file objects out of
> > ISO
> > +	  9660 filesystems.
> > +
> > +	  https://www.gnu.org/software/xorriso
> 
> The Config.in help text for the target variant, in
> package/xorriso/Config.in, is completely different. Yours is
> copy/pasted from the xorriso home page, which looks good. So maybe it
> would be good to use the same for the target variant of xorriso.

I will submit a patch for that.

> 
> Another question is: can we use xorisso instead of cdrkit in
> fs/iso9660/ to build ISO images ?

The reason I need xorriso is that it can generates hybrid images out
of the box (Even EFI-hybrid ones !). The next steps are indeed to use
it for fs/iso9660/.

The issue with integrating hybrid EFI images though is that we need a
whole FAT EFI boot-filesystem (with initramfs, kernel and such) to
embed into the ISO image, which if integrated will blow up the
fs/iso9660 process a bit. How are the opinion on that ?

Regard,
Ben.

> 
> I don't have anything against cdrkit, but it uses CMake, and it takes
> ages to build.
> 
> Thanks!
> 
> Thomas

-------------- next part --------------
A non-text attachment was scrubbed...
Name: not available
Type: application/pgp-signature
Size: 473 bytes
Desc: OpenPGP digital signature
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20160408/92f7a87a/attachment.asc>
