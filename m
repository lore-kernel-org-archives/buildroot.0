From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 17 Sep 2009 07:43:42 +0200
Subject: [Buildroot] [PATCH 2/6] Remove the BOARD/LOCAL feature
In-Reply-To: <d6cda7730909161521k54dbdcfaud53cca89589dffe6@mail.gmail.com>
References: <1253135266-26880-1-git-send-email-thomas.petazzoni@free-electrons.com>
	<1253135266-26880-3-git-send-email-thomas.petazzoni@free-electrons.com>
	<d6cda7730909161500xbb81de5j195ce89fd2fd5db2@mail.gmail.com>
	<20090917000846.2eb5baca@surf>
	<d6cda7730909161521k54dbdcfaud53cca89589dffe6@mail.gmail.com>
Message-ID: <20090917074342.7ea13dd0@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Wed, 16 Sep 2009 19:21:54 -0300,
Thiago A. Corr?a <thiago.correa@gmail.com> a ?crit :

> Exporting a variable all the time is a bit anoying, but one could
> always create a script to do that.

Well, you can also do :

 make BUILDROOT_EXTERNAL_BOARDS=/path/to menuconfig
 make BUILDROOT_EXTERNAL_BOARDS=/path/to

but I find it even more annoying.

The issue is that it is not possible to store this information in the
configuration, since depending on this value we must change some
Config.in file, which has to be done *before* we run the configuration
system.

> Looks good. It would be nice to add BUILDROOT_EXTERNAL_BOARDS to the
> find command at the %_defconfig rule, so things like this would work:
> make mycustomboard_defconfig

Well, it's already done by the patch (and works). Since a symbolic link
to the BUILDROOT_EXTERNAL_BOARDS directory is added in target/device/,
I just added the -L option to find and it is able to find the defconfig
of the external boards. See the patch for the one-liner
implementation :-)

Sincerly,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers and embedded Linux development,
consulting, training and support.
http://free-electrons.com
