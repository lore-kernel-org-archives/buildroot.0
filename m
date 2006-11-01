From: Philippe Ney <philippe.ney@pardes.ws>
Date: Wed, 1 Nov 2006 22:23:26 +0100
Subject: [Buildroot] How to use a buildroot disk image.
In-Reply-To: <1d09f8b80611011236m74428fd7x3aeb6c31e3605118@mail.gmail.com>
References: <1d09f8b80611011236m74428fd7x3aeb6c31e3605118@mail.gmail.com>
Message-ID: <20061101222326.633f927f.philippe.ney@pardes.ws>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> I'm really sorry if I missed this in the documentation, but how do I
> install the file system image to an actual disk drive.  I have tried
> using dd to write it to the disk as super block and also just to the
> first partition, but this has not worked.  Thanks in advance.

Depends on the fs type you generated.

If you generate an ISO image, you could burn it on a cdrom or run it with
qemu. And if you generate an ext2 fs, you would access it through a loop
device for example.

Now, if you want to generate something like a firmware that contain a
full system, you will have to write your own installer (I guess).

Philippe
