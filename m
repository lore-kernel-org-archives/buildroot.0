From: Stephan Hoffmann <sho@relinux.de>
Date: Wed, 28 Aug 2013 08:54:11 +0200
Subject: [Buildroot] wanna compile busybox and uclib with self modified
 code, please help
In-Reply-To: <BAY167-W54738C29151963CCC2605944B0@phx.gbl>
References: <BAY167-W75F3A55D10B8CCC0F96A74944A0@phx.gbl>,
 <521C5ABF.4000301@relinux.de>
 <BAY167-W23A3ABEDF04D72F595092D944A0@phx.gbl>,
 <521C70CE.4060101@relinux.de> <BAY167-W54738C29151963CCC2605944B0@phx.gbl>
Message-ID: <521D9E93.8050006@relinux.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am 28.08.2013 04:36, schrieb hacklinux:
> according to the guidelines i made attempt as follow:
>
> /home/wangk/buildroot-2012.11.1 is where buildroote preject locate in
> server machine, under this directory a local.mk was created the
> snapshot of the project is as follow:
>
> [root at buildroot-2012.11.1]# ls
> arch   boot     config         Config.in         configs  dl    fs    
> local.mk  Makefile.legacy  package  system
> board  CHANGES  config_custom  Config.in.legacy  COPYING  docs  linux 
> Makefile  output           support  toolchain
>
> and then variable LINUX_OVERRIDE_SRCDIR = /home/wangk/linux-2.6.39 was
> aslo added in the local.mk file.
This sounds right to me.
> after this i made menuconfig and in /Build options -> location of a
> package override file i gave the location where local.mk locate and 
> the value is as follow:
>
> ($(TOPDIR)/local.mk) location of a package override file
> /
/I am not sure about this. In my .config there it is:

BR2_PACKAGE_OVERRIDE_FILE="$(TOPDIR)/local.mk"

Maybe the paranthesis break it.
/
> /
> however, when i tried to rebuild the project an error was posted
> concerning linux kenel  that is :
>
> [root at buildroot-2012.11.1]# make
> --2013-08-28 11:25:08-- 
> http://www.kernel.org/pub//linux/kernel/v2.6//linux-2.6.39.tar.bz2
> Resolving www.kernel.org... failed: No address associated with hostname.
> wget: unable to resolve host address ?.ww.kernel.org?
> --2013-08-28 11:25:08-- 
> http://sources.buildroot.net//linux-2.6.39.tar.bz2
> Resolving sources.buildroot.net... failed: No address associated with
> hostname.
> wget: unable to resolve host address ?.ources.buildroot.net?
> make: *** [/home/wangk/buildroot-2012.11.1/dl/linux-2.6.39.tar.bz2]
> Error 1
> [root at buildroot-2012.11.1]#
> /
/Obviously it tries to load the kernel from the internet, but does not
have a connection./


> /
> very confused about this, is there anything wrong with i  configure?
>
> By the way ,  within the article variable concerning linux source
> override is given, what about variables concerning busybox and uClib ?
> /
You can substitute LINUX by any packet name you want. Isn't that written
in the manual?

Regards

Stephan
> /
> is there any  way to rebuild only part of  buildroote project, i mean,
> for example just rebuild kerenl  or  busybox, uClib etc . thx.
>
> Best regards
> wang
>
>
> /
> ------------------------------------------------------------------------
> Date: Tue, 27 Aug 2013 11:26:38 +0200
> From: sho at relinux.de
> To: pipiliu_wangk at hotmail.com
> CC: buildroot at busybox.net; thomas.petazzoni at free-electrons.com
> Subject: Re: [Buildroot] wanna compile busybox and uclib with self
> modified code, please help
>
> Am 27.08.2013 10:32, schrieb hacklinux:
>
>     i see two more parameters should be given somewhere in the
>     buildroot project, however where should i put these two
>     paremeters, please give me some advice, thx.
>
>     MYPKG_SITE = /opt/software/something-special/
>     MYPKG_SITE_METHOD = local
>
> This is when you modify the mypkg.mk file, what you probably do not
> want to do.
>
> Just read the next chapter.
>
>
>
>     > Date: Tue, 27 Aug 2013 09:52:31 +0200
>     > From: sho at relinux.de <mailto:sho@relinux.de>
>     > To: buildroot at busybox.net <mailto:buildroot@busybox.net>
>     > Subject: Re: [Buildroot] wanna compile busybox and uclib with
>     self modified code, please help
>     >
>     > Am 27.08.2013 09:42, schrieb hacklinux:
>     > > Hi thomas,
>     > >
>     > > i have a question concerning buildroot compiling wanna u help
>     . the gz
>     > > pacakge version which i used is buildroot-2012.11.1.tar.gz, i
>     know how
>     > > to build kernel, busybox, initrd following guildlines posted
>     on web
>     > > that puts all sort of items under dl directory and just make it.
>     > > however, i wanna compile the busybox and uclib with some
>     modification
>     > > made by myself, i made several attemps but all failed, can u
>     give me
>     > > some advice on how to do this, wanna hear from u, sincely
>     thank u indeed .
>     > Hello William,
>     >
>     > you might want to look at
>     > http://free-electrons.com/blog/buildroot-2011-11/ , especially the
>     > source directory override mechanism.
>     >
>     > Regards
>     >
>     > Stephan
>     > >
>     > > william wang
>     > >
>     > >
>     > > _______________________________________________
>     > > buildroot mailing list
>     > > buildroot at busybox.net <mailto:buildroot@busybox.net>
>     > > http://lists.busybox.net/mailman/listinfo/buildroot
>     >
>     >
>     > --
>     > reLinux - Stephan Hoffmann
>     > Am Schmidtgrund 124 50765 K?ln
>     > Tel. +49.221.95595-19 Fax: -64
>     > www.reLinux.de <http://www.reLinux.de> sho at reLinux.de
>     <mailto:sho@reLinux.de>
>     >
>     > _______________________________________________
>     > buildroot mailing list
>     > buildroot at busybox.net <mailto:buildroot@busybox.net>
>     > http://lists.busybox.net/mailman/listinfo/buildroot
>
>
>
> -- 
> reLinux     -    Stephan Hoffmann
> Am Schmidtgrund 124    50765 K?ln
> Tel. +49.221.95595-19    Fax: -64
> www.reLinux.de <http://www.reLinux.de>     sho at reLinux.de <mailto:sho@reLinux.de>
>

-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130828/6847e23f/attachment.html>
