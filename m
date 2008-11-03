From: Markus Heidelberg <markus.heidelberg@web.de>
Date: Tue, 4 Nov 2008 00:51:39 +0100
Subject: [Buildroot] External toolchain support improvements
In-Reply-To: <BD79186B4FD85F4B8E60E381CAEE1909C91465@mi8nycmail19.Mi8.com>
References: <20081030094501.66983ff9@surf> <20081103093110.13e43438@surf>
	<BD79186B4FD85F4B8E60E381CAEE1909C91465@mi8nycmail19.Mi8.com>
Message-ID: <200811040051.40880.markus.heidelberg@web.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

hartleys, 03.11.2008:
> BTW, something is now broken with svn revision 23911 using an external
> toolchain.
> 
> I just did a "svn up; make menuconfig; make" and I get the following
> errors right when the build starts.
> 
> wget --passive-ftp -nd   -P /home/bigguiness/buildroot/dl
> "http://www.kernel.org/pub/"/linux/kernel/v2.6//linux-...tar.bz2
> --08:47:11--
> http://www.kernel.org/pub//linux/kernel/v2.6//linux-...tar.bz2
>            => `/home/bigguiness/buildroot/dl/linux-...tar.bz2'
> Resolving www.kernel.org... 204.152.191.5, 204.152.191.37
> Connecting to www.kernel.org|204.152.191.5|:80... connected.
> HTTP request sent, awaiting response... 404 Not Found
> 08:47:11 ERROR 404: Not Found.
> 
> make: *** [/home/bigguiness/buildroot/dl/linux-...tar.bz2] Error 1
> 
> 
> I can't figure out what .mk is trying to download "linux-...tar.bz2".
> Any ideas?

Some odd configuration?
grep WGET target/linux/Makefile.in*
Find out which one is used and backtrace the variable. Probably some kernel
version number variables are empty resulting in .. instead of 2.6.25

Markus
