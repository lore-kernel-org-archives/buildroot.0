From: Tim Barr <tbarr@multitech.com>
Date: Tue, 25 Mar 2008 16:43:08 -0500
Subject: [Buildroot] build problems
Message-ID: <1CD05B980C94AC408B37C82BBABAA3E60ACA8184@mtsexchange.dc.multitech.prv>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Well, I guess part of the problem is that there is no at91sam9260ek
directory in the target/device/atmel directory, even though there is a
at91sam9260ek target board selection in the buildroot .config file. The
two target directories available are at91sam9260dfc and at91sam9260pf. I
am not sure if the dfc means DataFlash card or chip, but the board could
use either I think. The card interface is CS_0 and the on-board chip is
CS_1. The board I have did not come with a DataFlash card so it has been
booting off of the on-board chip. So I assume I can use the dfc
defconfig but make sure the boot memory parameter in the config files is
set to CS_1. 

Also, when I run it right now and try to do a "make configured", I get
an error because it can't copy busybox-1.9.2.config. It looks like
busybox has been updated, but a new config file has not been put into
the target/device/atmel/at91sam9260dfc directory. So do I rename the
busybox-1.9.1.config file to busybox-1.9.2.config? Also, if I run "make
menuconfig" from the buildroot directory and look at the package
selection, busybox-1.9.x is selected. But the parameter 'busybox
configuration file to use' has '/package/busybox/busybox-1.6.0.config"
in it. Really confusing.

Some possibly good news, though. Using the at91sam9260dfc defconfig and
renaming the "busybox-1.9.1.config" file to "busybox-1.9.2.config" it
seems I finally completed a build. There are files in the binaries
directory of my project now. The linux kernel is 4mb so I assume it is
not a uImage, and I need to find where that setting is. Then I need to
see if it actually runs without panicking.

But, if I understand things correctly, the uboot and boot.bin files in
the binaries directory are for a EK board with a DataFlash card in the
SD slot, and would not work for the DataFlash chip on the board. I
wonder if I replaced the kernel and rfs files in the prebuilt binary
package I downloaded from Linux4Sam, I could get it to work? I will try
that when I get a chance.

Timothy Barr
Hardware Development Engineer
for Multi-Tech Systems, Inc.
tbarr at multitech.com 

-----Original Message-----
From: buildroot-bounces@uclibc.org [mailto:buildroot-bounces at uclibc.org]
On Behalf Of John Voltz
Sent: Monday, March 24, 2008 7:52 AM
To: Buildroot List
Subject: Re: [Buildroot] build problems


Timothy,

What type of problems are you having with buildroot? What's failing for
you?

John Voltz


On Mon, Mar 24, 2008 at 8:45 AM, Tim Barr <tbarr@multitech.com> wrote:

I have had a similar problem, Steve. I wonder if any of the maintainers
has tried running buildroot after a dirclean recently? Or cleared out
the download directory to see if any package download interfaces have
changed? I have been trying to get a successful buildroot process (for
an AT91SAM9260EK) to complete for over 3 months now with no luck
whatsoever. I ended up having to buy a Timesys linuxlink license in
order to move forward.

Timothy Barr
Hardware Development Engineer
for Multi-Tech Systems, Inc.
tbarr at multitech.com



> -----Original Message-----
> From: buildroot-bounces at uclibc.org
> [mailto:buildroot-bounces at uclibc.org] On Behalf Of Steve Calfee
> Sent: Sunday, March 23, 2008 10:51 AM
> To: buildroot at uclibc.org
> Subject: Re: [Buildroot] build problems
>
>
> Hi All,
>
> I used buildroot a couple of years ago successfully with a
> samsung 2410 soc.
>
> I am now trying to use it for a new project. My problem is I
> cannot get any build to work.
>
> Has anyone done a svn update and select a default config and
> have it build? I want to build an arm system, but first I
> would like some default config to build. I am using ubuntu
> feisty and think I have installed all the required tools. The
> mailing list seems to be quite active, but things seem to be
> in chaos. Can anyone tell me a starting place that is known to work?
>
> Thanks, Steve
>
