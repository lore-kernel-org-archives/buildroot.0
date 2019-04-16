From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 16 Apr 2019 22:13:15 +0200
Subject: [Buildroot] [PATCH] package/madplay: fix build failure due to
 old autotools macro
In-Reply-To: <20190416102125.124084-1-giulio.benetti@micronovasrl.com>
References: <20190416102125.124084-1-giulio.benetti@micronovasrl.com>
Message-ID: <20190416221315.74b4c9c9@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 16 Apr 2019 12:21:25 +0200
Giulio Benetti <giulio.benetti@micronovasrl.com> wrote:

> MKINSTALLDIRS is not automatically called by autotools when
> autoreconfigured.
> This leads to have install stage error:
> `/bin/sh @MKINSTALLDIRS@
> /home/dawncrow/buildroot-test/scripts/instance-0/output/target/usr/share
> /bin/sh: 0: Can't open @MKINSTALLDIRS@`
> because @MKINSTALLDIRS@ doesn't get substituted during autoreconf.
> 
> Add patch that explicitly calls AM_MKINSTALLDIRS macro to substitute
> every @MKINSTALLDIRS@ occurence in *.in Makefile.
> 
> Fixes:
> http://autobuild.buildroot.net/results/744/7447c03426556f787f20f7ab2d36f0cacc4af1bd/
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>

Why is this package suddenly failing to build ? madplay hasn't been
updated recently, so why do we have build failures and not before ?

Isn't the build failure related to the switch from gettext-gnu to
gettext-tiny ?

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
