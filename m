From: =?ISO-8859-15?B?Qmr2cm4=?= Kirchner <bjoern@am-soft.de>
Date: Sat, 26 Apr 2014 09:23:14 +0200
Subject: [Buildroot] How transfer what image(s) to target-CF?
In-Reply-To: <CAEzGmjALnnk=Mqj7pirEnTZ5qvAh_DY7jR6iHnZbQMt+HLL41w@mail.gmail.com>
References: <CAEzGmjA3wbjEFb6sQYov_rJFJuB8oJFx2Y6XOA7WWHce743=dg@mail.gmail.com>
 <5357DD2D.1030702@mind.be>
 <CAEzGmjCXKEQTEEbz7a9JfX80rVafF4XedTjfZDQYyVOypASgAA@mail.gmail.com>
 <535985BA.1020009@mind.be>
 <CAEzGmjC+Hob859rdVSD74BsX5R+mwkNRtwsA5Pet=rM+uY4hwQ@mail.gmail.com>
 <535AAF25.8090309@mind.be>
 <CAEzGmjALnnk=Mqj7pirEnTZ5qvAh_DY7jR6iHnZbQMt+HLL41w@mail.gmail.com>
Message-ID: <20140426092314.19527a1b@tux>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Fri, 25 Apr 2014 23:42:44 +0200
schrieb Lennart Ramberg <ramberg.lennart@gmail.com>:

> >  Ah sorry, grub2 has only been added a couple of weeks ago. But
> > grub-legacy should work fine as well.
> >
> >
> >
> Hm... my mbr on the target CF mentions LILO. Should I for grub-legacy
> do as follows?
> Use dd to copy (part of?) the 512 bytes
> from /media/lennart/5fcblablblabla620/boot/grub/stage1
> to /dev/sdX
> 
> And then copy the e2fs_stage1_5 with destination beginning at 512?
> 
> Or is there a safer trick to install grub here?
> 

I don't know if that is safer, but I used the target grub
build by buildroot to install itself to the CF card.
- Become root on your host system
- Execute </full/path/to/your/cfcard>/sbin/grub
At the grub prompt type:
grub> root (hdx,y)
grub> setup (hdx)
grub> quit
(where x is the "hard disk" and y is the partition in grub notation.
With <TAB> you can get a list of possible values for x and y.
You can search for possible disks with
grub> find /boot/grub/stage1
That lists all partitions which contain the named file. If your host
system does not use grub1, it should only be one partition.

When I build my buildroot system for an x86 based board I ran
into a problem. If grub1 was built with a gcc version newer than,
if I remember correctly, 4.5, the stage2 file was built corrupted.
I don't know if that was fixed in the meantime. I just copied the
stage2 file from a build made with a gcc 4.5 compiler. That worked
fine.


> Thanks and regards.
> Lennart

Hope this helps.

Bj?rn
