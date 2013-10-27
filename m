From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 27 Oct 2013 17:40:45 +0100
Subject: [Buildroot] RFC: make export-sysroot
In-Reply-To: <OF3447DAE1.89CC3270-ON86257C0E.004C5FFB@rockwellcollins.com>
References: <OF3447DAE1.89CC3270-ON86257C0E.004C5FFB@rockwellcollins.com>
Message-ID: <20131027174045.5f9115c2@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Matt,

On Thu, 24 Oct 2013 08:54:13 -0500, mlweber1 at rockwellcollins.com wrote:

> I'm curious to see if there would be any traction to add a 'make
> export-sysroot' option that functions like the WindRiver workbench
> sysroot export.  We've been manually doing something like this where
> we tar up the output/host folder to distribute to other users.  Since
> we can't maintain the original output/host location (ran into symlink
> errors if we moved the host folder after it was built), we also
> provide the original toolchain archive.  This results in the user
> needing to use the --sysroot when they build (seems like an ok
> approach so far).
> 
> Thoughts?  Maybe I'm missing an approach to actually make use of the
> generated host folder toolchain outside of its original buildroot
> path...  Which would then simplify this to just a archiving of the
> output/host into a tarball placed in the images folder.

In Buildroot, the contents of output/host are what we call the "SDK",
as it contains all the host tools (including the cross compiler) and
the target libraries and headers for application developers.

It is indeed part of the plans to provide a mechanism to generate a
tarball out of this, but I believe we thought it would be better to
make this SDK relocatable (i.e installable and usable in any location)
before providing a feature to tarball this SDK. We have items in the
TODO list at
http://elinux.org/Buildroot#Core_Buildroot_infrastructure (see "Make the
HOST-directory a relocatable SDK").

Contributions to solve items of this TODO list are welcome.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
