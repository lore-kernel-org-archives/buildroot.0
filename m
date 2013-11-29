From: Jeremy Rosen <jeremy.rosen@openwide.fr>
Date: Fri, 29 Nov 2013 09:00:19 +0100 (CET)
Subject: [Buildroot] [PATCH 2/5] package/rpi-firmware: add option to
 install firmware files in target/boot/
In-Reply-To: <20131128205515.GB3337@free.fr>
Message-ID: <1108197933.15379580.1385712019266.JavaMail.root@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



> > 
> > I don't understand the reasoning here. These files must be at the
> > root
> > of a specific FAT filesystem, so I fail to see why installing them
> > inside the root filesystem is of any help to achieve that.
> > 
> > Yes, I've seen that it's probably related to the proposed logic to
> > generate a bundled image in PATCH 5/5, but for the moment, my
> > feeling
> > is that if that logic requires *all* files to be present in the
> > root
> > filesystem to be later installed in a separate FAT/boot filesystem,
> > then the logic isn't really appropriate, and should be improved,
> > no?

If I may chip-in, I really like the logic of the proposed image builder...

Basically, you build the root filesystem the way it will look when all
sub-filesystems are mounted, you describe how they are mounted and 
the system builds the partitions accordingly.

I know that what I described is not exactly the logic behind the proposed
patch, but it is a logic I like a lot because it is very easy to understand
and explain. it could also allow us to automatically generate some fstab
lines at some point, which could be nice.
