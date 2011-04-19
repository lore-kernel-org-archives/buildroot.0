From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 19 Apr 2011 22:25:47 +0200
Subject: [Buildroot] which templates are used?
In-Reply-To: <4DA3976B.40807@gmail.com>
References: <4DA36046.2040606@michaelburghart.de>
	<4DA369FA.8050505@michaelburghart.de> <4DA3709E.7070005@daccii.it>
	<4DA3976B.40807@gmail.com>
Message-ID: <20110419222547.3c28192b@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 11 Apr 2011 17:06:03 -0700
Steve Calfee <stevecalfee@gmail.com> wrote:

>  BR2_ROOTFS_POST_BUILD_SCRIPT

That's also what I use. Instead of making modifications to
fs/skeleton/, or completely duplicating that skeleton, my post build
script :

 *) Copies some additional files (which I typically store and version
    control in board/<mycompany>/<myproduct>)

 *) Adjust some files from the skeleton. It does this in a way that
    allows to re-run make several times without screwing things. For
    example, if I need to add a new line at the end of a file
    (like /etc/fstab), I first test that this line hasn't already been
    added, in order to avoid duplicates.

This technique has several advantages :

 *) You don't change the default skeleton, which would mess things up
    next time you upgrade Buildroot ;

 *) You don't duplicate the entire default skeleton, which prevents you
    from taking advantages of new things in the skeleton if you upgrade
    Buildroot ;

 *) As the post build script is executed at every 'make' invocation,
    you don't have to 'make clean ; make' to see the effect of your post
    build script changes.

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
