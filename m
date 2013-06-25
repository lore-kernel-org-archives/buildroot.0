From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 25 Jun 2013 23:42:58 +0200
Subject: [Buildroot] [RFC v2 1/1] ti-gfx: add new package
In-Reply-To: <1372177754-13431-1-git-send-email-spenser@gillilanding.com>
References: <1372177754-13431-1-git-send-email-spenser@gillilanding.com>
Message-ID: <51CA0EE2.70301@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 25/06/13 18:29, Spenser Gilliland wrote:
> This is WIP of adding the TI Graphics SDK to Buildroot

  It's not really _the_ graphics SDK, since it only supports a subset of 
TI platforms (no OMAP1, OMAP2 or Davinci, and I'm not sure about OMAP5 
either).

>
> Current Status:
>     Kernel Drivers load without errror.
>     pvrsrvctl starts with no errors.
>     Some demos run, others do not.
>     gstreamer videotestsrc ! eglglessink does not work.
>
> TODO:
>     Install startup files for sgx core.
>     Create .pc files to simplify additional packaging.

  We don't usually create pc files if the package doesn't provide them. 
It's not really needed, because packages that use the library will anyway 
not use pkg-config to get the package info.

>     Hard Float Binaries

  Doesn't the package contain soft-float binary libraries? Then 
hard-float won't be possible, right?

>     Testing, lots of testing.
>
> Additional Info:
>     I've been using the 3.9.6-x3 tag of the kernel at
>     https://github.com/RobertCNelson/stable-kernel  by use of the
>     LINUX_OVERRIDE_SRCDIR option.
>
>     You must use a soft-float toolchain (ie Code Sourcery) as the binaries
>     provided by the Graphics SDK are soft-float. (hard float is on the TODO
>     list)
>
>     To load the driver manually use the following:
>        modprobe omaplfb
>        modprobe bufferclass-ti
>        pvrsrvctl --start --no-module
>
> Signed-off-by: Spenser Gilliland<spenser@gillilanding.com>

  Please keep a changelog of the history of your patch in the commit 
message, so we can keep track of which review comments you've already 
taken into account.

  In this particular case, I notice that Thomas repeats a lot of review 
comments that I've made a week ago, so writing "review comments from 
Arnout not taken into account" would have helped :-) Or maybe you missed 
those?

  Regards,
  Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
