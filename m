From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Fri, 11 Nov 2016 14:54:06 -0600
Subject: [Buildroot] [PATCH] fs/iso9660: md5 checksum boot dir files
In-Reply-To: <20161111212436.16bd7898@free-electrons.com>
References: <1478884419-22717-1-git-send-email-matthew.weber@rockwellcollins.com>
 <20161111212436.16bd7898@free-electrons.com>
Message-ID: <CANQCQpaZZ708bi1N3m2EqoT8+apV7wgLqE6CXNJ8q5Go3OGbLQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

On Fri, Nov 11, 2016 at 2:24 PM, Thomas Petazzoni <
thomas.petazzoni@free-electrons.com> wrote:

> Hello,
>
> On Fri, 11 Nov 2016 11:13:39 -0600, Matt Weber wrote:
> > From: Paresh Chaudhary <paresh.chaudhary@rockwellcollins.com>
> >
> > Generate md5 checksum for all files of boot directory
> > to allow runtime validation of boot images.
> >
> > Signed-off-by: Paresh Chaudhary <paresh.chaudhary@rockwellcollins.com>
> > Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>
>
> Why specifically for those images, and not all files of the filesystem?
>
>
We thought for a iso9600 formatted iso, this was a way to add a quick
integrity check capability to the images used for kernel/rootfs. Since the
bzimage and initrd are both present in this boot folder.  This allows a
product's install process to check the integrity of a disk after flashing
the iso to a bare drive (mount the new boot partition and run md5sum -c).
It also opens up the option for runtime verifying the images you booted
from if you add scripting in your rootfs.


-- 
Matthew L Weber / Pr Software Engineer
Airborne Information Systems / Security Systems and Software / Secure
Platforms
MS 131-100, C Ave NE, Cedar Rapids, IA, 52498, USA
www.rockwellcollins.com

Note: Any Export License Required Information and License Restricted Third
Party Intellectual Property (TPIP) content must be encrypted and sent to
matthew.weber at corp.rockwellcollins.com.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20161111/11879620/attachment.html>
