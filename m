From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 31 Jul 2013 17:17:45 +0200
Subject: [Buildroot] How to login as root without password
In-Reply-To: <CAHbR41Xzw1RsrR8ZykwvWjXyP_GKzQRWghTo0hjq2z=sPGsabQ@mail.gmail.com>
References: <CAHbR41VH17_qSe3T92b=n61_f1a_64jVXy5rNCKaexajmWzt9g@mail.gmail.com>
 <CAAXf6LXRYRvhWwE-TnM2fnGPMp+s+eEa3oUQtwdatMPxP=vAyA@mail.gmail.com>
 <CAHbR41WGQDmkVy4TguM7KEO9hf6NpND=wQ1CiUWMgUwhWQRkiQ@mail.gmail.com>
 <CAAXf6LVa_tJZG8CQw2zUUdyOvMd7TAs5yfdtUtjKG5bcGqhdZw@mail.gmail.com>
 <CAHbR41Xzw1RsrR8ZykwvWjXyP_GKzQRWghTo0hjq2z=sPGsabQ@mail.gmail.com>
Message-ID: <20130731171745.14ab06ab@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear zhou qiang,

On Wed, 31 Jul 2013 23:03:18 +0800, zhou qiang wrote:

> Of course , if extract rootfs.tar as root , everything works pretty well ,
> busybox login as root .
> But in the server , there is no root permission .
> 
> So the issue is how to login as root without "operation of extract
> rootfs.tar as root".

As Thomas De Schampheleire suggested, you should write a Buildroot
post-build script that copies your application into the root
filesystem, and let Buildroot do the fakeroot game to finally generate
your ready-to-use JFFS2 image.

Another option is to use fakeroot manually outside of Buildroot, but
beware that you have to execute *all* the commands manipulating the
root filesystem under a *single* fakeroot session. Since you apparently
don't fully understand the implications of fakeroot, I'd really suggest
you to use a Buildroot post-build script instead.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
