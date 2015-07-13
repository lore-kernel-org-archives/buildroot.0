From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Tue, 14 Jul 2015 00:20:27 +0200
Subject: [Buildroot] NFS Server on Buildroot Target
In-Reply-To: <CAMQcK5+eTg508+qHvP+_J_uB5L8vXHCKORvU=PmDpBXcZJ4swg@mail.gmail.com>
References: <CAMQcK5+eTg508+qHvP+_J_uB5L8vXHCKORvU=PmDpBXcZJ4swg@mail.gmail.com>
Message-ID: <CAGduivypjBF2P_8yqRi3JwzuCxyWUQgx9nfL-Td+-G+jSSFZYA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Ryan,
On Tue, Jul 14, 2015 at 12:03 AM, Ryan Barnett
<ryan.barnett@rockwellcollins.com> wrote:
> Hello,
>
> Today I attempted to get an NFS working on a embedded target and
> struggled with getting the 'nfs-utils' package to work to provided NFS
> server functionality. By selecting the 'nfs-utils' package, the NFS
> server functionally does NOT work by default. Before I even attempted
> this, I had the kernel configuration options selected for NFSD. It
> turned out that I needed to have the rpcbind package selected in order
> to make it work, however, this was after a couple hours of trying to
> debug this.
I submitted some patches for nfs-utils, which selects rcpbind and fix
the startup scripts.
I was able to start it and after creating an /etc/exports file was
successfull in mounting it.

Note that when you mount from your client, you may need to specify the
version of the protocol (2/3 as we don't build nfsv4).
If you need nfsv4, feel free to send patches, I did not do it as I
never had any real use of nfsv4 specifically.
>
> I have a few questions that I would like feedback on as I would like
> to propose a patch that will allow the nfs-util package to work by
> default.
>
> First, should the nfs-util package automatically 'select' on the
> kernel configuration options for NFSD?
It's a good idea, don't forget that people may build their kernel
externally from Buildroot and then nfsd won't work.

Do you want to work on that ?
>
> Other package do this so I would argue that it should.
>
> Second, in order to make the default startup configuration work,
> rpcbind is required. Should this be an added dependency since the goal
> of a package is to have it work by default?
Thas was done with the patches I sent previously, the current master
should work.
>
> Any suggestion or feedback would be appreciated.
>
> Thanks,
> -Ryan
>
> [Extra] Looks like someone posted something similar to the mailing
> list in January of 2013
>
> http://lists.busybox.net/pipermail/buildroot/2013-January/065498.html
>
> --
> Ryan Barnett / Sr Software Engineer
> Airborne Information Systems / Security Systems and Software
> MS 131-100, C Ave NE, Cedar Rapids, IA, 52498, USA
> ryan.barnett at rockwellcollins.com
> www.rockwellcollins.com
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
