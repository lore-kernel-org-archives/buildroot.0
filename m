From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Tue, 30 Jul 2013 16:02:58 +0200
Subject: [Buildroot] How to login as root without password
In-Reply-To: <CAHbR41WGQDmkVy4TguM7KEO9hf6NpND=wQ1CiUWMgUwhWQRkiQ@mail.gmail.com>
References: <CAHbR41VH17_qSe3T92b=n61_f1a_64jVXy5rNCKaexajmWzt9g@mail.gmail.com>
 <CAAXf6LXRYRvhWwE-TnM2fnGPMp+s+eEa3oUQtwdatMPxP=vAyA@mail.gmail.com>
 <CAHbR41WGQDmkVy4TguM7KEO9hf6NpND=wQ1CiUWMgUwhWQRkiQ@mail.gmail.com>
Message-ID: <CAAXf6LVa_tJZG8CQw2zUUdyOvMd7TAs5yfdtUtjKG5bcGqhdZw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Jul 30, 2013 at 3:40 PM, zhou qiang <zhouqiang.search@gmail.com> wrote:
> Hi , Thomas
>
> Thank you for your reply .
>
> Yes , I am using busybox .
>
> And if using "sudo" instead of "fakeroot"  to extract root filesystem .
> then burn to the board , It login as root ,even execute "chown -R user:user
> rootfs" .
> before burning .
>
> But I can not give sudo permission to other users on ther server.

What exactly does the burning step imply? How exactly are you putting
the rootfs on target?
You should normally not extract the rootfs and make modifications to
it after it has been packaged. Any change you want to make to the
rootfs, for example to change /etc/inittab, should be done before the
image is created.
The following section in the manual describes different ways to
accomplish that:
http://buildroot.uclibc.org/downloads/manual/manual.html#rootfs-custom
A post-build script is a convenient solution for this type of change.

Best regards,
Thomas
