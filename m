From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 22 Sep 2011 22:53:42 +0200
Subject: [Buildroot] User-enabled host packages?
In-Reply-To: <20110921153133.2d816865@skate>
References: <4E79E001.7010409@lucaceresoli.net> <20110921153133.2d816865@skate>
Message-ID: <201109222253.42536.arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


On Wednesday 21 September 2011 15:31:33, Thomas Petazzoni wrote:
> > So the big question is: do we want some host packages to be enabled
> > vie a user option?

 We already have one: BR2_PACKAGE_GDB_HOST.

 Other possible candidates are the installers for boot loaders (grub, 
syslinux), target image manipulation programs (parted, fdisk, e2fsprogs, 
uboot-tools), tools to communicate with the target (openocd, tftpd), and maybe 
even scripting languages for running test suites (expect, python).

 However, I'm not sure of the value of having these in the .config.  If I need 
them, it's anyway for use in build scripts that run on top of buildroot, and 
then I can just run a "make world host-e2fsprogs".  The paths to the host 
tools are anyway so long that even when you need them in your shell, typing an 
additional make host-xxx first is really no effort.


> > Where do we want these user options?
> > How about a newly created "Host tools" menu at top level?

 That would mean they don't sit in their package's Config.in.  Still, it would 
be the most logical place.  Anyway there normally is no impact on the 
package's makefile since the config option is taken care of by GENTARGETS.


> > Does anybody have additional examples in favor or against?

 I don't have anything against it.  But no real driving reason for it either.


> And also:
> 
> If we decide to show some host tools (but not all) in menuconfig, what
> is the boundary between host tools visible in menuconfig and those not
> visible in menuconfig ?

 Similar as for the boundary between when to have a configuration option for 
different versions of a package.  Depends on what users need.


 Can someone summarize the arguments that were used when this discussion took 
place a few years ago?


 Regards,
 Arnout
-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  31BB CF53 8660 6F88 345D  54CC A836 5879 20D7 CF43
