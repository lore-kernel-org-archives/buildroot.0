From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 14 Jan 2013 23:43:19 +0100
Subject: [Buildroot] Fw: [yocto] [ANOUNCEMENT] bmaptool
Message-ID: <20130114234319.358c5eda@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

This might be interesting for the whole "generating images" discussion.

Best regards,

Thomas

----- Message Transf?r? -----

Date: Mon, 14 Jan 2013 14:46:33 +0200
De: Artem Bityutskiy <dedekind1@gmail.com>
?: yocto at yoctoproject.org
Sujet: [yocto] [ANOUNCEMENT] bmaptool


Hi Yocto people,

I would like to announce the bmap-tools project here, because I think it
may be very useful for Yocto and some of the people who are using Yocto.

The bmap-tools project is about disk images, like direct HDD images, or
Virtual-machine images like vdmk or qcow2, etc. The project uses simple
ideas in a clever way to copy/flash these kind of images quickly.

Please, read all the details in the project wiki page:
https://source.tizen.org/documentation/reference/bmaptool

The project was created for Tizen IVI, but it is generic and is not
bounded to Tizen in any way.

I do not want to duplicate the bmap-tools documentation here, but
instead, let me just describe how we use it in Tizen IVI.

1. We produce raw images of 4GB in size.
2. Images have 3 partitions inside.
3. Images are rather sparse, we have only 1.2GB of data inside (total)
4. We publish compressed images, they take 300MiB
5. We also publish bmap file for the image, e.g., see the ".bmap" file
   here:
http://download.tizen.org/snapshots/2.0alpha/ivi/tizen-2.0_20130111.3/images/ivi-2.0-alpha/

Now the key point: when users flash the 4GiB images using bmaptool, they
actually copy only 1.1GiB of data. E.g, when flashing to slow USB
sticks, it reducing writing time from 20Min to 4Min.

The other key point here: if we or others decide to produce 64GiB or
1TiB images instead, with the same amount of data (1.2GiB), the flashing
time will be almost the same.

The third key point here: images are compressed, and rather small, which
saves space and network traffic. When/if we make images 64GiB or 1TiB,
their .bz2 files will still be almost as small, because zeroes compress
very well.

If you think about a production factory case, you may see a lot of
benefits of using bmap.

Anyway, for the Yocto project, it would probably be nice if in the
window where you select the type of image to generate and its size,
there was a "generate bmap" check-box (on by default :-)).

Comments, questions?

Thanks,
Artem.

-- 
Best Regards,
Artem Bityutskiy


-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
-------------- next part --------------
_______________________________________________
yocto mailing list
yocto at yoctoproject.org
https://lists.yoctoproject.org/listinfo/yocto
