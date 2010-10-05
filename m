From: Martin Banky <Martin.Banky@gmail.com>
Date: Tue, 5 Oct 2010 11:38:47 -0700
Subject: [Buildroot] [PATCH 01/10] input-tools: convert to gentargets
In-Reply-To: <20101005111715.6559e7d2@surf>
References: <1286266963-23413-1-git-send-email-Martin.Banky@gmail.com>
	<20101005111715.6559e7d2@surf>
Message-ID: <AANLkTin3Q3uafh2GjjCuGhg3fMRfb_c1fuKQ96WpkXGx@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,
     I got the Debian patch routine from the cvs package, when I was
converting it. I just figured that there was some type of formatting issue
in the debian patches that needed to be addressed. If I read it correctly,
it looks like it strips any prefix from the name of the package to patch. I
must confess, I'm not very good with sed. Is this something that doesn't
need to be done? If so, just let me know, and I'll change the packages that
are affected.
     As to the *_TOOLS_BUILD_CMDS issue, until now, I thought that the hooks
were only available for the autotargets packages. I just re-read that
section in the Usage and documentation page, and it looks like you can use
the hooks in a gentargets package. I'll try it out, and change the packages
that have that issue.

Martin

On Tue, Oct 5, 2010 at 2:17 AM, Thomas Petazzoni <
thomas.petazzoni@free-electrons.com> wrote:

> Hello,
>
> Thanks Martin for doing all this conversion work, this is much
> appreciated!
>
> On Tue,  5 Oct 2010 01:22:34 -0700
> Martin Banky <martin.banky@gmail.com> wrote:
>
> > +define INPUT_TOOLS_DEBIAN_PATCHES
> > +     if [ -d $(@D)/debian/patches ]; then \
> > +             (cd $(@D)/debian/patches && for i in *; \
> > +              do $(SED) 's,^\+\+\+
> .*joystick-$(INPUT_TOOLS_VERSION)/,+++ joystick-$(INPUT_TOOLS_VERSION)/,'
> $$i; \
>
> I have seen this in several of your patches, but I don't understand why
> it is here. There are several other packages that do apply the debian
> patches, but such a sed step is not needed.
>
> > +define INPUT_TOOLS_BUILD_CMDS
> > +     $(INPUT_TOOLS_DEBIAN_PATCHES)
>
> Even though it doesn't technically make any difference, I'd prefer to
> have this as a post-patch hook.
>
> Thanks!
>
> Thomas
> --
> Thomas Petazzoni, Free Electrons
> Kernel, drivers, real-time and embedded Linux
> development, consulting, training and support.
> http://free-electrons.com
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20101005/a61967bb/attachment.html>
