From: Aras Vaichas <aras.vaichas@gmail.com>
Date: Thu, 7 Feb 2013 10:14:18 +0000
Subject: [Buildroot] makedevs and symbolic links
In-Reply-To: <20130206175711.51603415@skate>
References: <CAJkQPOn=Pi+NhbRvVG_gk9ccQDaUoUuPH3aEsos032kAv6Y23A@mail.gmail.com>
 <20130206172641.4c042f87@skate>
 <CAJkQPOmpY_aT1DhDpxe2rw_endLzFkhmOWAkrbt1CzeG+7c=0Q@mail.gmail.com>
 <20130206175711.51603415@skate>
Message-ID: <CAJkQPO=A+_7t-dbSP8VutAsen+MvG9J44qx3D6uxKt7C2mBQUg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 6 February 2013 16:57, Thomas Petazzoni <
thomas.petazzoni@free-electrons.com> wrote:

> The current design is really:
>
>  * We have a base skeleton in system/skeleton that generally never
>    needs to be modified. The base system/device_table.txt and
>    system/device_table_dev.txt take care of setting the appropriate
>    permissions/ownerships on the files part of the base skeleton.
>
>  * For each project, we encourage people to create a rootfs overlay in
>    board/<company>/<project>/rootfs-overlay/, where they can add their
>    specific configuration files, symbolic links and so on. And a
>    project-specific device table in
>    board/<company>/<project>/device_table.txt sets the appropriate
>    owernship for the files part of the rootfs-overlay.
>

Aaah, I don't have that version of Buildroot. I'm using 2012.11. I can see
from the mailing lists now that patches were added for the "rootfs-overlay".

I might have to leave that until it's in the stable release. I'm currently
documenting how to use Buildroot for my employer (a company with almost
zero Linux knowledge) on their hardware, so I'd rather stick to official
release versions for now. I can update my documentation later.

My current employer wants me to put my Buildroot configuration into their
version control system (MKS). So I am looking at ways that I can avoid
using empty directories and symbolic links to make it diff and MKS
friendly. I guess there's no getting around using multiple files and
scripts to achieve this.

Crazy idea: If only patch/diff handled empty directories, symlinks,
devices, permissions and ownerships. Then it could be done entirely in a
single file that would be 100% friendly in all cases on all operating
systems.

Thanks!

regards

Aras Vaichas
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130207/36b694d7/attachment-0001.html>
