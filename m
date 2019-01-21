From: Peter Seiderer <ps.report@gmx.net>
Date: Mon, 21 Jan 2019 21:45:44 +0100
Subject: [Buildroot] Enable mount SquashFS
In-Reply-To: <CAOqJNTfN9Ux1x_q3hXd6utAqtVCasUyx5yA1d2MqvMFg2_bMKg@mail.gmail.com>
References: <CAOqJNTc0j8hKGbugSyOqMKKymn8yB3UBSkvamLe9-cnK572UvA@mail.gmail.com>
 <20190118203223.02765998@gmx.net>
 <CAOqJNTfN9Ux1x_q3hXd6utAqtVCasUyx5yA1d2MqvMFg2_bMKg@mail.gmail.com>
Message-ID: <20190121214544.5e615f30@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello ??????,

please keep buildroot at busybox.net in CC....

On Mon, 21 Jan 2019 12:21:55 +0200, ?????? ????? <sergei.sakhno@gmail.com> wrote:

> Thks. I missed this this parametr.
> Can you help me with mount squashfs image in minimal image of linux,
> created in buildroot?
> When i try mount squashfs image as root (mount -t squashfs -o
> ro,loop,sizelimit=14319616 /home/update-last.raucb /run/rauc/bundle), i get
> error:
> 
> > mount: /run/rauc/bundle: mount failed: Operation not permitted.
> > Failed mounting bundle: failed to run mount: Child process exited with
> > code 1
> > installing /home/update-last.raucb: Failed mounting bundle: failed to run
> > mount: Child process exited with code 1
> >  
> EXT4 partition on real storage device mounted successfully.

Not much info....why mount to /run/rauc/bundle and not just /mnt ? Why option sizelimit?
Where does the 'installing' error message come from? How is the squashfs image update-last.raucb
created (never worked with rauc (yet))? Loop mounting enabled in the kernel?
Do you run your commands as root user? Which are the file permissions of the squashfs image file?

Regards,
Peter

> 
> 
> ??, 18 ???. 2019 ?. ? 21:32, Peter Seiderer <ps.report@gmx.net>:
> 
> > Hello ??????,
> >
> > On Fri, 18 Jan 2019 20:27:41 +0200, ?????? ????? <sergei.sakhno@gmail.com>
> > wrote:
> >  
> > > Good evening everyone. How to enable the ability to mount SquashFS? In  
> > the  
> > > menuconfig of busybox downloaded from the busybox site there is an item
> > > [SquashFS filesystem] in the [Filesystem / Volume identification]  
> > section,  
> > > but in the menuconfig of busybox unpacked buildroot it is not.  
> >
> > Busybox CONFIG_FEATURE_VOLUMEID_SQUASHFS depends on VOLUMEID &&
> > FEATURE_BLKID_TYPE,
> > VOLUMEID is already enabled, FEATURE_BLKID_TYPE is Linux System Utilities  
> > -->  
> > blkid --> Print Filesystem type
> >
> > More important is enabled squashfs support in the linux kernel...
> >
> > Regards,
> > Peter
> >
> >  
