From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 22 Mar 2013 14:34:34 +0100
Subject: [Buildroot] Understanding the automake beast better
In-Reply-To: <CALdGskLvjBdSL+QbXaPrq_03poVKR=wG_RhOFbyMsB4NGHte2w@mail.gmail.com>
References: <CALdGskKtui_YbLOmjxF8nMKFL0AeJJVE9FsTDgTSFALiWxYm+g@mail.gmail.com>
 <CALdGskLvjBdSL+QbXaPrq_03poVKR=wG_RhOFbyMsB4NGHte2w@mail.gmail.com>
Message-ID: <20130322143434.0766b0e3@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Olivier Schonken,

On Fri, 22 Mar 2013 15:19:58 +0200, Olivier Schonken wrote:

> I'm currently working on gutenprint(fornerly gimp-print) for buildroot.  I
> can get the drivers and filters to build by splitting the build process
> into a host and target component, and copying files generated for the host
> part during build time to the target. (xml files - thus not architecture
> dependant)
> This seems like a sub-optimal solution to me.
> 
> Question: Is there an elegant way to force automake to add an auxiliary
> compiler to the make process, and use this for certain
> parts of the package that need to be run during build time (editing
> Makefile.ac files etc.)?  For example.  The drivers are being compiled for
> an arm processor, but to be able to run the
> program that generates ppd files, that program has to be compiled for the
> host architecture and not the target architecture.  It seems that automake
> configures the compiler in the package root directory, and then building
> the programs in subdirectories according to a list, I just can't figure
> out how to tell it to compile the subdirectories with a different compiler
> such as the host machine compiler.
> 
> I know cross-compiling is not an exact science, but maybe someone has run
> into the same issues before, and can shed a little more light on it for me.

The more or less standard way of doing that is to use the CC_FOR_BUILD,
CFLAGS_FOR_BUILD, CXX_FOR_BUILD variables, that point to the native
compiler. See for example
http://git.buildroot.net/buildroot/tree/package/fontconfig/fontconfig-2.6.0-use_for_build.patch.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
