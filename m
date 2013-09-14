From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 14 Sep 2013 19:00:42 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2013-09-13
In-Reply-To: <523481F4.7000304@googlemail.com>
References: <20130914063005.CC66352C101@lolut.humanoidz.org>
 <16A28366-18D6-4148-B7E5-1FB4C61CB473@layer-7.net>
 <20130914170316.52a4eec6@skate> <523481F4.7000304@googlemail.com>
Message-ID: <20130914190042.4b6f0833@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Carsten Schoenert,

On Sat, 14 Sep 2013 17:34:12 +0200, Carsten Schoenert wrote:

> In Debian we use sbuild (Perl), cowbuilder (ELF executable) / pbuilder
> (shell) to set up a clean basic chroot and after that clone this base
> chroot and build the *.deb packages inside. The core chroot is setted up
> by calling debootstrap for the target platform.
> 
> Maybe you want to look at it and can grap something?
> I just use the tools, Perl isn't my favorite language and pbuilder just
> works as expected, so don't ask me anything special. *g*
> 
> I personally use pbuilder, it's just a shell script with soem external
> calls, there should be something suitable I think.

Thanks for the suggestion. It happens that almost 10 years ago, I did a
bit of Debian packaging, and I was a user of pbuilder to isolate the
build process in a chroot.

It could indeed be useful for others to reproduce builds in a minimal
chroot, but for the autobuilder servers themselves it's not very
useful. pbuilder is mainly useful when you need to create a different
chroot everytime you want to build a package (the chroot should have
the build dependencies installed). While with Buildroot, the set of
core dependencies to be installed is always the same. So what happens
in my autobuilder machine is that I have one static chroot, in which all
the builds are done.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
