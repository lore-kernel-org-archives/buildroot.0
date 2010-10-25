From: Dennis Borgmann <dennis.borgmann@googlemail.com>
Date: Mon, 25 Oct 2010 15:36:07 +0200
Subject: [Buildroot] [BUILDROOT] /dev mounted additionally at /mnt
Message-ID: <4CC587C7.1050601@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello buildroot-list!

I am using buildroot-2010.08 on an at91sam9g20. Everything is really
nice, but if I boot my device, it mounts the whole root-filesystem under
'/mnt' , although its contents rather seem to be related to the
'/dev'-directory. See the output of 'mount',  'ls /mnt' and 'cat
/etc/fstab' at the end of this mail. The '/etc/fstab' does not contain a
hint about why this may be this way.

Any ideas?

Kind regards,
Dennis

[root /]# mount
rootfs on / type rootfs (rw)
/dev/root on / type ext2 (rw,relatime)
proc on /proc type proc (rw,relatime)
devpts on /dev/pts type devpts (rw,relatime,gid=5,mode=620,ptmxmode=000)
tmpfs on /tmp type tmpfs (rw,relatime)
sysfs on /sys type sysfs (rw,relatime)
/dev/root on /mnt type ext2 (rw,relatime)

[root /]# ls /mnt
admmidi0    dsp0        i2c-0       ptyp5       sdb6        ttySAC0
admmidi1    dsp1        i2c-1       ptyp6       sdb7        ttySAC1
admmidi2    dsp2        i2c-2       ptyp7       sdb8        ttySAC2
admmidi3    dsp3        i2c-3       ptyp8       sdb9        ttySAC3
adsp@       fb0         input/      ptyp9       sequencer   ttyUL0
adsp0       fb1         kmem        ram         sequencer2@ ttyUL1
adsp1       fb2         loop0       ram0        shm/        ttyUL2
adsp2       fb3         loop1       ram1        snd/        ttyUL3
adsp3       hda         mem         ram2        sndstat     ttymxc0
aloadC0     hda1        midi@       ram3        tty         ttymxc1
aloadC1     hda10       midi00      random      tty0        ttymxc2
aloadC2     hda11       midi01      rtc         tty1        ttyp0
aloadC3     hda12       midi02      sda         tty2        ttyp1
aloadSEQ    hda13       midi03      sda1        tty3        ttyp2
amidi@      hda14       mixer@      sda10       tty4        ttyp3
amidi0      hda2        mixer0      sda11       tty5        ttyp4
amidi1      hda3        mixer1      sda12       tty6        ttyp5
amidi2      hda4        mixer2      sda13       tty7        ttyp6
amidi3      hda5        mixer3      sda14       ttyAMA0     ttyp7
amixer0     hda6        mtd0        sda2        ttyAMA1     ttyp8
amixer1     hda7        mtd1        sda3        ttyAMA2     ttyp9
amixer2     hda8        mtd2        sda4        ttyAMA3     uba
amixer3     hda9        mtd3        sda5        ttyCPM0     uba1
audio@      hdb         mtdblock0   sda6        ttyCPM1     uba2
audio0      hdb1        mtdblock1   sda7        ttyCPM2     uba3
audio1      hdb10       mtdblock2   sda8        ttyCPM3     uba4
audio2      hdb11       mtdblock3   sda9        ttyP0       uba5
audio3      hdb12       music       sdb         ttyP1       ubb
console     hdb13       net/        sdb1        ttyP2       ubb1
dmfm0       hdb14       null        sdb10       ttyP3       ubb2
dmfm1       hdb2        psaux       sdb11       ttyPSC0     ubb3
dmfm2       hdb3        ptmx        sdb12       ttyPSC1     ubb4
dmfm3       hdb4        pts/        sdb13       ttyPSC2     ubb5
dmmidi0     hdb5        ptyp0       sdb14       ttyPSC3     urandom
dmmidi1     hdb6        ptyp1       sdb2        ttyS0       zero
dmmidi2     hdb7        ptyp2       sdb3        ttyS1
dmmidi3     hdb8        ptyp3       sdb4        ttyS2
dsp@        hdb9        ptyp4       sdb5        ttyS3

[root /]# cat /etc/fstab
# /etc/fstab: static file system information.
#
# <file system> <mount pt>      <type> 
<options>                               <dump> <pass>
/dev/root                       /                       ext2           
rw,noauto                               0               1
proc                            /proc           proc           
defaults                                        0               0
devpts                  /dev/pts                devpts 
defaults,gid=5,mode=620 0               0
tmpfs                   /tmp                    tmpfs  
defaults                                        0               0
sysfs                   /sys                    sysfs  
defaults                                        0               0
