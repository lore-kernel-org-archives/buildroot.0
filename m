From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 23 Dec 2010 09:54:03 +0100
Subject: [Buildroot] [PATCH 1/4] Add CMAKETARGETS infrastructure for
 CMake packages
In-Reply-To: <AANLkTinpJpLVjV7ogcT35GcX6RPfpG66k0hGQEkyfSko@mail.gmail.com>
References: <1292182155-29576-1-git-send-email-bjorn.forsman@gmail.com>
	<1292182155-29576-2-git-send-email-bjorn.forsman@gmail.com>
	<AANLkTinkazQ2EzvCE46nSYmAkGiEJ3Ti+oM6=7g+u0Y5@mail.gmail.com>
	<AANLkTi=tmgB5T23WvH112P1YgrO-w+xjwtiU9=D01J90@mail.gmail.com>
	<AANLkTi=frxyYAzAaApiwAfxairhSKe38qkBgvk633_eF@mail.gmail.com>
	<20101223084644.018fa724@surf>
	<AANLkTinpJpLVjV7ogcT35GcX6RPfpG66k0hGQEkyfSko@mail.gmail.com>
Message-ID: <20101223095403.21c714dd@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 23 Dec 2010 09:46:12 +0100
Bj?rn Forsman <bjorn.forsman@gmail.com> wrote:

> I actually chose to build in SRCDIR for the sake of consistency - autotools
> packages build in SRCDIR :-)

Oh, if CMake supports nicely the build-inside-source directory thing,
then we can just use it as we do for autotools packages.

I've been wondering whether we could build out-of-tree for autotools
based packages, in order to share the source code between target and
host package, and to ease the support of overriden packages, but I'm
pretty sure we'll it a lot of problems with out-of-tree build in
different packages, and it'll only work with autotools or cmake based
packages. So the safest is probably to keep the build-inside-source
mechanism we are currently doing.

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
