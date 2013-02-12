From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 12 Feb 2013 11:36:28 +0100
Subject: [Buildroot] Report from the Buildroot Developers Meeting
In-Reply-To: <511A19A8.4020307@relinux.de>
References: <20130209004253.207e0741@skate>
	<511A19A8.4020307@relinux.de>
Message-ID: <20130212113628.00ce121d@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Stephan Hoffmann,

On Tue, 12 Feb 2013 11:30:00 +0100, Stephan Hoffmann wrote:

> > What to do with systemd/udev/eudev: we try to use the udev from
> > systemd without systemd. Exactly how we don't know yet... There's a
> > risk that udev becomes unusable without systemd, but Leonard
> > Poettering promised this would not happen. After a quick look, it
> > turns out that you always end up building systemd, which requires
> > dbus, even if you need only udev. So it makes the systemd source
> > tarball a bit unpractical to build a system that uses udev only, and
> > doesn't need systemd. Probably an indication that we should have a
> > look at eudev? How would this interact with the systemd selection?
> > What about incompatibilities between udev and eudev? 
> What about using a different udev version with or without systemd?
> This would allow using a recent systemd version while systems without
> it could use the old udev or eudev, even as an option.

Because on the long term we can't rely on an old version of udev that
is no longer maintained or updated. So keeping the old udev version is
not an option.

> > Switching to ct-ng as the default toolchain backend has been in the
> > plans for several years. But since it's not the default backend it
> > isn't getting a lot of attention (example: for several months it was
> > broken, libraries were not copied to the target, and it took a lot
> > of time for somebody to notice). 
> Regarding the toolchain I want to say that I really like buildroot's
> ability to build a toolchain.
> 
> But I hate the fact that after every "make clean" the toolchain has to
> be rebuilt completely from scratch which takes precious time.
> 
> Of course there is the possibility to change the output directory,
> build the toolchain and then use it as an external toolchain, but
> this breaks the nice integration between buildroot and it's toolchain
> and is not really comfortable.
> 
> What about automating this process by splitting it up into building
> the toolchain and afterwards copying it to output/{host/staging} like
> it is done with external toolchains? "make clean" or maybe something
> new like "make almostclean" would not clean the toolchain build
> directory, so only the copy stage would be repeated. Another make
> target to clean everything including the toolchain would be needed,
> of course.

Why don't you build your external toolchain once, put it in a tarball,
and then point Buildroot to it? You have to do this only once, and you
can even put your toolchain tarball on a server so that others can use
it without having to rebuild the toolchain.

> > Autobuilder status: Thomas will move the info to a database, and has
> > some very basic webpages for accessing the database. He also dreams
> > about running some tests in qemu - but we already have enough
> > failures with the autobuilders as they are :-) 
> I'd really like to have access to the results. For example it would be
> interesting to see in which configuration a package fails and in which
> not. I could think of cooking a script or program that extracts such
> information on a package base.

Not sure to understand what you want to do exactly, but the results
have since a long time been publicly available at
http://autobuild.buildroot.org.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
