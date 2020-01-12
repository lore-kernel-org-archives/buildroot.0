From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 12 Jan 2020 21:10:16 +0100
Subject: [Buildroot] 32-bit host tools for ti-cgt-pru package
In-Reply-To: <CAK8F28m1MVtDtB+9DhhhQTgODneKB1WGW9Gy_FtPL2O7ikQb_w@mail.gmail.com>
References: <CAK8F28m1MVtDtB+9DhhhQTgODneKB1WGW9Gy_FtPL2O7ikQb_w@mail.gmail.com>
Message-ID: <20200112211016.59ffbef2@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Ash,

On Sun, 12 Jan 2020 15:00:21 -0500
Ash Charles <ashcharles@gmail.com> wrote:

> I maintain the ti-cgt-pru buildroot package and noticed recently that the
> build was failing during extraction.  For this package, the downloaded
> software is packaged in a installer (i.e. not coming from a git repo or a
> tar.gz...) -- execute the downloaded file with appropriate arguments and
> the software is extracted to the appropriate build directories.
> Unfortunately, it seems like the downloaded installer requires a host
> 32-bit glibc to actually execute (e.g. on a Fedora host, "dnf install
> glibc:i686" allowed the package to build successfully).
> 
> How might I fix-up this build breakage?
> 
> Thoughts:
> - a 64-bit version of the installer package is not available :(
> - it seems like overkill to add a system requirement for buildroot on
> glibc-32 for one random package
> - it is a while since I've worked with buildroot so please forgive me if
> I'm missing something obvious!

We do have an option named BR2_HOSTARCH_NEEDS_IA32_LIBS which packages
that are pre-built for x86-32 can depend on. When this option is
selected, Buildroot will refuse to start the build if the system is
x86-64 and doesn't have the 32-bit compat libraries. We already use it
in a few packages, and some external toolchains.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
