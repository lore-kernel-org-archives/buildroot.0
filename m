From: Lennart Ramberg <ramberg.lennart@gmail.com>
Date: Thu, 24 Apr 2014 12:07:44 +0200
Subject: [Buildroot] How transfer what image(s) to target-CF?
In-Reply-To: <5357DD2D.1030702@mind.be>
References: <CAEzGmjA3wbjEFb6sQYov_rJFJuB8oJFx2Y6XOA7WWHce743=dg@mail.gmail.com>
 <5357DD2D.1030702@mind.be>
Message-ID: <CAEzGmjCXKEQTEEbz7a9JfX80rVafF4XedTjfZDQYyVOypASgAA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thanks Arnout,

Now, please, for the 'how'-part, that 'put':

How exactly would I here use commands like dd and/or cpio, and in what
order?
Assume the target CF is mounted as /dev/sdX on the host.

To complicate matters :-) I aim at ext3.

Regards
Lennart


On Wed, Apr 23, 2014 at 5:33 PM, Arnout Vandecappelle <arnout@mind.be>wrote:

> On 23/04/14 15:42, Lennart Ramberg wrote:
> > Hello,
> >
> > New and experimenting, I want my target Linux system to reside on a
> > Compact Flash,
> > such that I can pull it from the host (Buildroot) computer and
> > then insert it in my x86 target as an IDE-drive and boot.
> >
> > What file(s) should I have in host .../output/images/  and how do I put
> > it(them) in the CF?
> > I have USB on my host and a USB-CF-adapter and a formatted CF.
>
>  The simplest is probably to use cpio as your rootfs, syslinux as the
> bootloader, bzImage as the kernel, and put that on a FAT filesystem.
>
>
>  Regards,
>  Arnout
>
> --
> Arnout Vandecappelle                          arnout at mind be
> Senior Embedded Software Architect            +32-16-286500
> Essensium/Mind                                http://www.mind.be
> G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
> LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
> GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140424/e1c285f4/attachment.html>
