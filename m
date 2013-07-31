From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Wed, 31 Jul 2013 17:11:28 +0200
Subject: [Buildroot] How to login as root without password
In-Reply-To: <CAHbR41Xzw1RsrR8ZykwvWjXyP_GKzQRWghTo0hjq2z=sPGsabQ@mail.gmail.com>
References: <CAHbR41VH17_qSe3T92b=n61_f1a_64jVXy5rNCKaexajmWzt9g@mail.gmail.com>
 <CAAXf6LXRYRvhWwE-TnM2fnGPMp+s+eEa3oUQtwdatMPxP=vAyA@mail.gmail.com>
 <CAHbR41WGQDmkVy4TguM7KEO9hf6NpND=wQ1CiUWMgUwhWQRkiQ@mail.gmail.com>
 <CAAXf6LVa_tJZG8CQw2zUUdyOvMd7TAs5yfdtUtjKG5bcGqhdZw@mail.gmail.com>
 <CAHbR41Xzw1RsrR8ZykwvWjXyP_GKzQRWghTo0hjq2z=sPGsabQ@mail.gmail.com>
Message-ID: <CAAXf6LW8nHEy_QB8ACZ69EzUrN6JRLD6GPxEvpdtSAmYGC_v2w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Jul 31, 2013 at 5:03 PM, zhou qiang <zhouqiang.search@gmail.com> wrote:
> Hi , Thomas
>
> We have an internal jffs2 image making process , which requires a pure
> target from buildroot ,
> and follow the steps as below :
>
> (1) extract rootfs.tar to designated target directory (rootfs) , this is
> done by post-script .
> (2) Adding functional script and application to rootfs .
> (3) make a new jffs2 image
> (4)burn this image to arm board
>
> Of course , if extract rootfs.tar as root , everything works pretty well ,
> busybox login as root .
> But in the server , there is no root permission .
>
> So the issue is how to login as root without "operation of extract
> rootfs.tar as root".
>

What is the input to step 4, an extracted directory, or just the image?

In general, when you want to add custom elements to the rootfs, you would do:
a. 'make' in buildroot
b. copy custom files to <buildroot>/output/target
c. 'make' in buildroot again, this will create a new image
d. burn image to board

Is there a reason why you do not do it this way?

Best regards,
Thomas
