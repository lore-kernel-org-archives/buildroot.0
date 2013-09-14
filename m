From: Carsten Schoenert <c.schoenert@gmail.com>
Date: Sat, 14 Sep 2013 17:34:12 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2013-09-13
In-Reply-To: <20130914170316.52a4eec6@skate>
References: <20130914063005.CC66352C101@lolut.humanoidz.org>
 <16A28366-18D6-4148-B7E5-1FB4C61CB473@layer-7.net>
 <20130914170316.52a4eec6@skate>
Message-ID: <523481F4.7000304@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

On 14.09.2013 17:03, Thomas Petazzoni wrote:
> Maybe I should be providing a script that downloads the complete
> chroot, and reproduce the build failure within the chroot, so that
> people can get the exact same behavior as the one in the autobuilder
> machine.

In Debian we use sbuild (Perl), cowbuilder (ELF executable) / pbuilder
(shell) to set up a clean basic chroot and after that clone this base
chroot and build the *.deb packages inside. The core chroot is setted up
by calling debootstrap for the target platform.

Maybe you want to look at it and can grap something?
I just use the tools, Perl isn't my favorite language and pbuilder just
works as expected, so don't ask me anything special. *g*

I personally use pbuilder, it's just a shell script with soem external
calls, there should be something suitable I think.

[1] http://packages.debian.org/wheezy/sbuild
[2] http://packages.debian.org/wheezy/cowbuilder
    http://packages.debian.org/wheezy/pbuilder

Regards
Carsten
