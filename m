From: ANDY KENNEDY <ANDY.KENNEDY@adtran.com>
Date: Wed, 13 Apr 2011 12:52:22 -0500
Subject: [Buildroot] mysql Server
In-Reply-To: <4DA5E1E4.3030105@michaelburghart.de>
References: <4DA5DBCF.4020408@michaelburghart.de><9AC3F0E75060224C8BBC5BA2DDC8853A1FA8E805@EXV1.corp.adtran.com>
	<4DA5E1E4.3030105@michaelburghart.de>
Message-ID: <9AC3F0E75060224C8BBC5BA2DDC8853A1FA8E80C@EXV1.corp.adtran.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
> 
> Am 13.04.2011 19:38, schrieb ANDY KENNEDY:
> 
> > Obviously I was wrong.. Anything else I need to take into
> > consideration?!
> >
> >> It has to be inserted into the Config.in file under packages.
> 
> thats exactly what I did:
> 
> config BR2_PACKAGE_MYSQL_SERVER
>         bool "mySQL Server"
>         help
>           mySQL Server
> 
> just a very basic thing.. No way.. :( does not work

You created a Config.in under package/mysql.  You then have to add that
file reference to package/Config.in.

Something like this:


menu "Debugging, profiling and benchmark"
source "package/dhrystone/Config.in"
source "package/dmalloc/Config.in"
source "package/kexec/Config.in"
source "package/lmbench/Config.in"
source "package/lsof/Config.in"
source "package/ltp-testsuite/Config.in"
source "package/ltrace/Config.in"
source "package/memstat/Config.in"
source "package/netperf/Config.in"
source "package/oprofile/Config.in"
source "package/strace/Config.in"
source "package/whetstone/Config.in"
source "package/valgrind/Config.in"
endmenu


Andy
