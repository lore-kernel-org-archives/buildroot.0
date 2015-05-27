From: Laurent Joli <l.joli@expemb.com>
Date: Wed, 27 May 2015 10:35:26 +0200
Subject: [Buildroot] sky2 not created
In-Reply-To: <20150527103020.0aec65d2@free-electrons.com>
References: <CAJtzDg-NoVNk_W8CnV0y0sY+dhZNCKTu66tfePnyUoDNj+bTeg@mail.gmail.com>
 <20150527094643.0dcb2107@free-electrons.com>
 <CAJtzDg9LiZjeTJcRXp=Eng8kfynfDjdYrtKD=kVJ=GJjuGobWg@mail.gmail.com>
 <20150527101333.1c2f6137@free-electrons.com>
 <CAJtzDg9TN7oH0owqeRu32p_=u=gtrjbwcAVjWabsO6=R+VT7tA@mail.gmail.com>
 <20150527103020.0aec65d2@free-electrons.com>
Message-ID: <CAJtzDg8wS89HmskSNaB60NkOZgg-WQoYGmQtmJGVa3zJHDuBCA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Humm, yes that is right. I have this :

.-(/media/ljoli/disk_one/buildroot/buildroot-2015.05-rc3/output/build/linux-9bafbcba67f7bb2a48a5e05998cecb1165aa444f)----------------------------------------------------------------------------------------------------(ljoli at ljoli-MS-7823
)-
`--> grep SKY2 .config
CONFIG_SKY2=y
CONFIG_SKY2_DEBUG=y

Cheers,

| *Laurent JOLI | *l.joli at expemb.com |
|EXPEMB|L?expertise au service de l?embarqu? ? Embedded Expert|
P Merci de penser ? notre plan?te avant d?imprimer cet email - Please
consider the environment before printing this mail
Ce courriel (incluant ses ?ventuelles pi?ces jointes) peut contenir des
informations confidentielles et/ou prot?g?es ou dont la diffusion est
restreinte. Si vous avez re?u ce courriel par erreur, vous ne devez ni le
copier, ni l?utiliser, ni en divulguer le contenu ? quiconque. Merci d?en
avertir imm?diatement l?exp?diteur et d'effacer ce courriel de votre
syst?me. La soci?t? d?cline toute responsabilit? en cas de corruption par
virus, d?alt?ration ou de falsification de ce courriel lors de sa
transmission par voie ?lectronique.
This email (including any attachments) may contain confidential and/or
privileged information or information otherwise protected from disclosure.
If you are not the intended recipient, please notify the sender
immediately, do not copy this message or any attachments and do not use it
for any purpose or disclose its content to any person, but delete this
message and any attachments from your system. Company disclaims any and all
liability if this email transmission was virus corrupted, altered or
falsified.


2015-05-27 10:30 GMT+02:00 Thomas Petazzoni <
thomas.petazzoni@free-electrons.com>:

> Dear Laurent Joli,
>
> On Wed, 27 May 2015 10:17:50 +0200, Laurent Joli wrote:
>
> > `--> ls -chl  output/build/
> > total 128K
> > drwxrwxr-x  4 ljoli ljoli 4,0K mai   22 17:57 buildroot-config
> > -rw-rw-r--  1 ljoli ljoli  16K mai   26 18:11 build-time.log
> > drwxrwxr-x 34 ljoli ljoli 4,0K mai   22 18:13 busybox-1.23.2
> > drwxrwxr-x  9 ljoli ljoli 4,0K mai   22 18:14 host-autoconf-2.69
> > drwxrwxr-x 11 ljoli ljoli 4,0K mai   22 18:15 host-automake-1.15
> > drwxrwxr-x 17 ljoli ljoli 4,0K mai   22 18:05 host-binutils-2.24
> > drwxrwxr-x 18 ljoli ljoli 4,0K mai   22 18:14 host-e2fsprogs-1.42.12
> > drwxrwxr-x  8 ljoli ljoli 4,0K mai   22 18:17 host-fakeroot-1.18.4
> > drwxrwxr-x 34 ljoli ljoli 4,0K mai   22 18:13 host-gcc-final-4.8.4
> > drwxrwxr-x 34 ljoli ljoli 4,0K mai   22 18:09 host-gcc-initial-4.8.4
> > drwxrwxr-x  3 ljoli ljoli 4,0K mai   22 18:14 host-genext2fs-1.4.1
> > drwxrwxr-x 16 ljoli ljoli 4,0K mai   22 18:06 host-gmp-6.0.0a
> > drwxrwxr-x 11 ljoli ljoli 4,0K mai   22 18:15 host-kmod-20
> > drwxrwxr-x  7 ljoli ljoli 4,0K mai   22 18:14 host-libtool-2.4.6
> > drwxrwxr-x 14 ljoli ljoli 4,0K mai   22 18:15 host-lzo-2.08
> > drwxrwxr-x  6 ljoli ljoli 4,0K mai   22 18:15 host-lzop-1.03
> > drwxrwxr-x 10 ljoli ljoli 4,0K mai   22 18:06 host-m4-1.4.17
> > drwxrwxr-x  2 ljoli ljoli 4,0K mai   22 18:17
> > host-makedevs-buildroot-2015.05-rc3
> > drwxrwxr-x  2 ljoli ljoli 4,0K mai   22 18:14 host-mke2img-undefined
> > drwxrwxr-x  6 ljoli ljoli 4,0K mai   22 18:06 host-mpc-1.0.3
> > drwxrwxr-x 10 ljoli ljoli 4,0K mai   22 18:06 host-mpfr-3.1.2
> > drwxrwxr-x  4 ljoli ljoli 4,0K mai   22 18:13 host-pkgconf-0.8.9
> > drwxrwxr-x 21 ljoli ljoli 4,0K mai   22 18:14 host-uboot-tools-2015.04
> > drwxrwxr-x 24 ljoli ljoli 4,0K mai   27 10:05
> > linux-9bafbcba67f7bb2a48a5e05998cecb1165aa444f
> > drwxrwxr-x 23 ljoli ljoli 4,0K mai   22 18:10 linux-headers-3.10.17
> > drwxrwxr-x  2 ljoli ljoli 4,0K mai   22 18:13 toolchain-buildroot-virtual
> > drwxrwxr-x  2 ljoli ljoli 4,0K mai   22 18:13 toolchain-virtual
> > drwxrwxr-x 21 ljoli ljoli 4,0K mai   22 18:14
> > uboot-6388c474189b42c07bb865dd604c74483da099f3
> > drwxrwxr-x 19 ljoli ljoli 4,0K mai   22 18:10 uclibc-0.9.33.2
> > -rw-rw-r--  1 ljoli ljoli    0 mai   26 18:11 _users_table.txt
>
> Ok, your directory is named
> linux-9bafbcba67f7bb2a48a5e05998cecb1165aa444f, not linux-3.10.17. So
> just check the .config file in this directory.
>
> Best regards,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20150527/e032b7a4/attachment.html>
