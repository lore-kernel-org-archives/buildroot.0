From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 29 Aug 2013 07:24:09 +0200
Subject: [Buildroot] wanna compile busybox and uclib with self modified
 code, please help
In-Reply-To: <BAY167-W54738C29151963CCC2605944B0@phx.gbl>
References: <BAY167-W75F3A55D10B8CCC0F96A74944A0@phx.gbl>,
 <521C5ABF.4000301@relinux.de>
 <BAY167-W23A3ABEDF04D72F595092D944A0@phx.gbl>,
 <521C70CE.4060101@relinux.de> <BAY167-W54738C29151963CCC2605944B0@phx.gbl>
Message-ID: <521EDAF9.1080609@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 08/28/13 04:36, hacklinux wrote:
> according to the guidelines i made attempt as follow:
>
> /home/wangk/buildroot-2012.11.1 is where buildroote preject locate in
> server machine, under this directory a local.mk was created the snapshot
> of the project is as follow:
>
> [root at buildroot-2012.11.1]# ls
> arch   boot     config         Config.in         configs  dl    fs
> local.mk  Makefile.legacy  package  system
> board  CHANGES  config_custom  Config.in.legacy  COPYING  docs  linux
> Makefile  output           support  toolchain
>
> and then variable LINUX_OVERRIDE_SRCDIR = /home/wangk/linux-2.6.39 was
> aslo added in the local.mk file. after this i made menuconfig and in
> /Build options -> location of a package override file i gave the location
> where local.mk locate and  the value is as follow:
>
> ($(TOPDIR)/local.mk) location of a package override file
>
> however, when i tried to rebuild the project an error was posted
> concerning linux kenel  that is :
>
> [root at buildroot-2012.11.1]# make
> --2013-08-28 11:25:08--
> http://www.kernel.org/pub//linux/kernel/v2.6//linux-2.6.39.tar.bz2
> Resolving www.kernel.org... failed: No address associated with hostname.
> wget: unable to resolve host address ?.ww.kernel.org?
> --2013-08-28 11:25:08--  http://sources.buildroot.net//linux-2.6.39.tar.bz2
> Resolving sources.buildroot.net... failed: No address associated with
> hostname.
> wget: unable to resolve host address ?.ources.buildroot.net?
> make: *** [/home/wangk/buildroot-2012.11.1/dl/linux-2.6.39.tar.bz2] Error 1
> [root at buildroot-2012.11.1]#
>
> very confused about this, is there anything wrong with i  configure?

  Perhaps you are using an internal toolchain? In that case buildroot 
also needs to install kernel headers (as part of the toolchain), and this 
is handled separately. So you should also add this to you local.mk:

LINUX_HEADERS_OVERRIDE_SRCDIR = /home/wangk/linux-2.6.39


  Regards,
  Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
