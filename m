From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 23 Sep 2011 09:49:14 +0200
Subject: [Buildroot] [PATCH] barebox: add support for custom version,
 tarball, git and patch dir
In-Reply-To: <201109222145.19265.arnout@mind.be>
References: <1316290988-25108-1-git-send-email-plagnioj@jcrosoft.com>
 <201109221920.37170.arnout@mind.be> <20110922205759.01de08f3@skate>
 <201109222145.19265.arnout@mind.be>
Message-ID: <20110923094914.5c13b978@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Thu, 22 Sep 2011 21:45:19 +0200,
Arnout Vandecappelle <arnout@mind.be> a ?crit :

>  Since I have a separate branch or even repository per project, yes I put them 
> directly into the package directories.  But I realize this is not necessarily 
> the best way to work.

I don't think there "a best way" to work, but I think that for highly
hardware-dependent packages such as bootloaders and kernel, it makes
sense to offer some options to apply additional patches.

Note that this option not only supports a local directory, but also the
URL of a patch, or the URL of a tarball containing patches. This can be
very useful for hardware manufacturers who want to ship a Buildroot
environment with a proper configuration. They can just do a config that
says:

 * Use Linux 3.0
 * Use Linux patches available at
   http://foobar.com/linux-3.0-my-patches.tar.bz2
 * Use U-Boot 2011.09
 * Use U-Boot patches available at
   http://foobar.com/u-boot-2001.09-my-patches.tar.bz2

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
