From: Zoran Djordjevic <djdjdjole@yahoo.com>
Date: Tue, 11 Sep 2012 06:43:00 -0700 (PDT)
Subject: [Buildroot] big root fs
In-Reply-To: <87bohczojh.fsf@macbook.be.48ers.dk>
References: <1347366592.32116.YahooMailNeo@web164601.mail.gq1.yahoo.com>
 <87bohczojh.fsf@macbook.be.48ers.dk>
Message-ID: <1347370980.97535.YahooMailNeo@web164601.mail.gq1.yahoo.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thank you Peter for your fast answer. Regarding X11, I tried and
didn't succeed with modular XOrg- so decide to try (successfuly)
TinyX. Then I think I should remove?(or comment) lines:
?
BR2_PACKAGE_XORG7=y
BR2_PACKAGE_XSERVER_XORG_SERVER=y
?
Am I right? And also,?in that case (directFB),?is it OK to?remove 
SDL ?
?
Regards
 

________________________________
 From: Peter Korsgaard <jacmet@uclibc.org>
To: Zoran Djordjevic <djdjdjole@yahoo.com> 
Cc: "buildroot at busybox.net" <buildroot@busybox.net> 
Sent: Tuesday, September 11, 2012 3:17 PM
Subject: Re: big root fs
  
>>>>> "Zoran" == Zoran Djordjevic <djdjdjole@yahoo.com> writes:

Zoran> Hello

Zoran> I built linux kernel using Buildroot, but included glibc support
Zoran> instead of uClibc. For that matter I was using Crosstool NG.
Zoran> I achieved the goal - compiled the GTK applications and they
Zoran> work on my target ARM board. All of that is by using NFS on my
Zoran> Ubuntu machine.? However the size of generated jffs2 is 52MB-
Zoran> which is huge for me.? Although I included GTK examples, and
Zoran> maybe few more properties I still wander if the size is related
Zoran> (only) to glibc matter.? I will try building with uClibc (only
Zoran> to detect difference in size), but at the moment it is important
Zoran> to me to use glibc, so what else can contribute to overal size
Zoran> of image, other than (maybe) glibc.? I attatched my .config if
Zoran> someone want to look at it and maybe find some memory eating
Zoran> matter. Also, can size of glibc be reduced, by throwing out some
Zoran> properties.

First of all, a defconfig file (which you create by running 'make
savedefconfig')? is quite a bit easier to read than the very verbose
.config.


Secondly, I see you have both directfb and X11:

BR2_PACKAGE_DIRECTFB=y
BR2_PACKAGE_DIRECTFB_TRACE=y
BR2_PACKAGE_DIRECTFB_XSERVER=y
BR2_PACKAGE_XORG7=y
BR2_PACKAGE_XSERVER_XORG_SERVER=y

You can most likely drop directfb. SDL is also relatively big. You also
have a number of unneeded X libraries.

-- 
Bye, Peter Korsgaard
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120911/95d7e943/attachment.html>
