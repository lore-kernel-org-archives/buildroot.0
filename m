From: Craig Swank <craigswank@fastmail.fm>
Date: Fri, 01 Jan 2016 10:42:53 -0800
Subject: [Buildroot] updating the beaglebone black defconfig
In-Reply-To: <n64f1h$ecf$1@ger.gmane.org>
References: <n6183t$ket$1@ger.gmane.org>
 <1451505684.3162125.479430882.4C107C58@webmail.messagingengine.com>
 <n64f1h$ecf$1@ger.gmane.org>
Message-ID: <1451673773.1276150.480601242.5781ACEF@webmail.messagingengine.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Even when I load the module before the overlay the 1 wire device doesn?t
appear on the filesystem where it should.  The dtc used to compile it is
from Robert Nelson and I?ve used the compiled dtbo on a debian system
and it works, so dtc is definitely not the problem.  

The kernel isn?t the problem either because Nelson was able to use the
same tag of beagleboard/linux and the same overlay I?m using.

Perhaps it has something to do with the boot environment somehow.  I?m
no expert in this, but it seems the debian based installs that work use
initramfs when they boot.  That is the major difference I can see
between the working and non working cases.



On Thu, Dec 31, 2015, at 03:51 PM, Chris LaRocque wrote:
> Craig Swank wrote:
> 
> > Hi Chris,
> > Have you been able to confirm overlays (and the device-tree) work with
> > buildroot and beagleboard/linux?
> > 
> > When 'echo BB-W1-P9.12 > /sys/devices/platform/bone_capemgr/slots' the
> > w1-gpio module should get loaded and it doesn't.  My overlay works as
> > expected on a Robert Nelson debian beagle bone, so the overlay is not
> > the problem.  He also confirmed that his overlay works with
> > beagleboard/linux, so the kernel isn't the problem either.
> > 
> > I'm just curious if you've tried a custom overlay yourself and had
> > success.
> > 
> > Craig
> > 
> > 
> > On Wed, Dec 30, 2015, at 10:34 AM, Chris LaRocque wrote:
> >> Hello
> >> 
> >> I'm working to update the beaglebone defconfig to kernel 4.1.13 ti 36
> >> branch
> >> (github.com/beagleboard/linux).
> >> 
> >> The build works but I want to incorporate a patched version of DTC
> >> (github.com/pantoniou/dtc/tree/dt-overlays5) to support the cape manager
> >> and
> >> device tree overlay changes. At this pont I'd appreciate some guidance.
> >> 
> >> My first thought was to simply patch the buildroot dtc package files to
> >> pull
> >> from the new location. This looks to be the most direct, probably only
> >> requiring that place the file in board/beaglebone/patches/dtc?
> >> 
> >> Second, try to dynamically create a patch for the mainline dtc to the
> >> bb.org
> >> fork. Haven't thought this through yet. A pointer or two would be
> >> appreciated. I thought to use 'git diff'?
> >> 
> >> Regards
> >> 
> >> Chris
> >> 
> >> _______________________________________________
> >> buildroot mailing list
> >> buildroot at busybox.net
> >> http://lists.busybox.net/mailman/listinfo/buildroot
> > 
> > 
> Hi Craig
> 
> Yes, I've built overlays and they work. I've not tried having the driver 
> auto load though. I always ensured the driver I needed was loaded before
> I 
> pushed the overlay to cape manager. FYI You need a patched version of DTC 
> for the 4.1 kernel. I've got the patch ready for buildroot review and I 
> should be able to push it up in an hour or so.
> 
> 
> C
> 
> 
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot


-- 
  Craig Swank
  craigswank at fastmail.fm
