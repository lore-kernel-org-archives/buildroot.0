From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 21 Nov 2011 09:31:50 +0100
Subject: [Buildroot] need help making bootable image
In-Reply-To: <90A7D971-7584-4B45-8DCB-61BEE8AE3EC0@jakesullivan.com>
References: <FE2CFD94-31A4-4D5D-B6B0-634C6358BE93@jakesullivan.com>
 <20111120092655.5a603142@skate>
 <90A7D971-7584-4B45-8DCB-61BEE8AE3EC0@jakesullivan.com>
Message-ID: <20111121093150.17b188e6@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Le Sun, 20 Nov 2011 14:34:42 -0800,
Jacob Sullivan <mail@jakesullivan.com> a ?crit :

> > I don't understand why you're trying to mix an ISO image and an ext2
> > partition here. Why don't you simply make your ext2 image bootable ?
> > 
> > I have some script stuff that does that here (create partitions,
> > loopback mount them, install grub, etc.), I could extract it and
> > make it available if you're interested.
> 
> I tried to make the ext2 image bootable (that is the only thing I
> can't seem to make work).  I went down the iso path because that
> image would boot and had a version of grub that was the same as in
> the ext2 image.  I would love to have a copy of the scripts.

Basically, you have a version of Grub available in
output/staging/sbin/grub that you can use to install Grub.

I'll try to clean up the script, but it unfortunately won't be this
week as I'm busy with many other things.

> how should I install grub?  Since my dev machine has grub2, I thought
> booting from the ISO image would be a good workaround... I also
> thought that the whole idea of fakeroot was so that tools like
> buildroot could do these types of tasks...

fakeroot can do *some* things, but not everything.

> > Instead, use a custom post-build script (BR2_POST_BUILD_SCRIPT) that
> > tweaks the inittab.
> 
> Ah.  That is what I was looking for.  I would love sample post-build
> scripts if you have any.

There's one little sample script in the slides, do you more examples ?

> This was really useful, there should be a link to this from the
> buildroot doc or faq page.  In all my google searches for other
> buildroot problems, this didn't come up, but should have.

My intention was to make improvements to the Buildroot documentation by
integrating some aspects of those slides.

> No, I'll download those and search them.  My problem is from the
> search bar on this page: http://buildroot.uclibc.org/lists.html I get
> this strange error from google... " We're sorry...
> 
> ... but your computer or network may be sending automated queries. To
> protect our users, we can't process your request right now.
> 
> See Google Help for more information."

Ah, okay, I never used the search engine for the mailing list archives.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
