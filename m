From: Ryan Barnett <ryan.barnett@rockwellcollins.com>
Date: Mon, 13 Jul 2015 17:03:34 -0500
Subject: [Buildroot] NFS Server on Buildroot Target
Message-ID: <CAMQcK5+eTg508+qHvP+_J_uB5L8vXHCKORvU=PmDpBXcZJ4swg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Today I attempted to get an NFS working on a embedded target and
struggled with getting the 'nfs-utils' package to work to provided NFS
server functionality. By selecting the 'nfs-utils' package, the NFS
server functionally does NOT work by default. Before I even attempted
this, I had the kernel configuration options selected for NFSD. It
turned out that I needed to have the rpcbind package selected in order
to make it work, however, this was after a couple hours of trying to
debug this.

I have a few questions that I would like feedback on as I would like
to propose a patch that will allow the nfs-util package to work by
default.

First, should the nfs-util package automatically 'select' on the
kernel configuration options for NFSD?

Other package do this so I would argue that it should.

Second, in order to make the default startup configuration work,
rpcbind is required. Should this be an added dependency since the goal
of a package is to have it work by default?

Any suggestion or feedback would be appreciated.

Thanks,
-Ryan

[Extra] Looks like someone posted something similar to the mailing
list in January of 2013

http://lists.busybox.net/pipermail/buildroot/2013-January/065498.html

-- 
Ryan Barnett / Sr Software Engineer
Airborne Information Systems / Security Systems and Software
MS 131-100, C Ave NE, Cedar Rapids, IA, 52498, USA
ryan.barnett at rockwellcollins.com
www.rockwellcollins.com
