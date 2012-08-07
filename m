From: Matthew Weber <matt@thewebers.ws>
Date: Tue, 7 Aug 2012 09:40:39 -0500
Subject: [Buildroot] Prebuilt concept
Message-ID: <CAFt09wNhCtxZcG63uJ8iCuaLeSWEMZrFRd-VuoNw3cTPkFXGAg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

My problem is overall build time for recreating the large # of packages I'm
building.  When I perform a verification of the target rootfs for a
release, I really just need it to recreate the output/target folder and
don't need to do a complete rebuild.  Has anyone tried to trick buildroot
into just re-installing the target folder using all the existing (built)
packages?

I've done some checking and all I should have to do is remove the .root
stamp in output/build, all of the target install stamps in the packages,
and remove the output/target folder.

I see this being beneficial when you change package versions or remove
packages, you don't have to start from a make clean to get a fresh target
folder that doesn't have any artifacts left from those package changes.
Obviously the first fix should be fixing the packages uninstall methods so
they are clean, but the magnitude of that project has me looking at this
option instead.

-- 
Thanks,
Matt Weber
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120807/c36e381f/attachment.html>
