From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 1 Mar 2013 10:24:00 +0100
Subject: [Buildroot] [PATCH v3 1/1] openpgm: new package
In-Reply-To: <51304ECC.2020301@gmail.com>
References: <1360749821-19238-1-git-send-email-alexander.lukichev@gmail.com>
 <51304ECC.2020301@gmail.com>
Message-ID: <20130301102400.30a0b4dd@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Alexander Lukichev,

On Fri, 01 Mar 2013 08:46:36 +0200, Alexander Lukichev wrote:

>   I won't do it again but would like to inquire once more about the
> patch. Is it lost/ignored/useless? Maybe it could be improved?

No, it has not been lost. Patches are never lost, because they are
automatically recorded in our Patchwork system, see
http://patchwork.ozlabs.org/project/buildroot/list/. Your patch is
still listed in http://patchwork.ozlabs.org/patch/220105/.

February was the month of the -rc releases, so Peter has been mainly
focused on fixing things and merging fixes. He did merge a few things
in the "next" branch, but not much. Now that 2013.02 has been released,
the "master" branch has reopened to new developments and new packages,
and I expect that Peter will therefore restart merging things more
aggresively.

>   The reason for the patch was to add support for PGM/EPGM protocol
> in zeromq 2.2.0 library, which is already present in Buildroot.

Could you send the patch that makes the ZeroMQ change to use the
openpgm package?

>   On the other hand, support for PGM/EPGM in zeromq can be added
> when it is built also with --with-system-pgm configure option, which
> allows for entirely independent build and installation of openpgm.
> This approach allows to solve openpgm's cross build issues without
> tweaking zeromq. It seemed a cleaner approach, which was taken in
> this patch.

I completely agree with your approach.

>   After this patch is applied, in order to add support for PGM/EPGM
> in zeromq, you have to pass --with-system-pgm option to configure,
> and add a dependency on openpgm package in packages/zeromq/zeromq.mk,
> the patch for which I planned to send if this patch was accepted.

Could you send both patches in a small series of two patches? You don't
need to wait for the first patch to be merged to show the second patch.
Most people do series of patches when they need multiple related things
to be merged (see for example the 30 patches series I sent regarding
Qt5).

>   I have build-tested the patch in several architectures and toolchain
> combinations, and run-tested the built library in x86 (eglibc,
> uClibc 0.9.33) and ARM (uClibc 0.9.33).

Great, thanks for all your testing.

For sure your patch will get merged.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
