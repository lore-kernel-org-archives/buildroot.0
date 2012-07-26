From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 26 Jul 2012 16:15:15 -0300
Subject: [Buildroot] [PATCH 2/3] ncurses: bump to 5.9
In-Reply-To: <1343328590-1803-2-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1343328590-1803-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1343328590-1803-2-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <50119743.3090505@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 07/26/12 15:49, Thomas Petazzoni wrote:

> Bumping to 5.9 has two nice side-effects:
> 
>  * It builds fine on noMMU architectures such as Blackfin, which will
>    fix build failures like
>    http://autobuild.buildroot.org/results/cf3e6a95c82b60d63da041293db576a8f21f9136/build-end.log.
> 
>  * It installs a pkg-config file, which will allow gpsd to find
>    ncurses properly, without the need to use ncurses5-config, which
>    means we can get rid of one of our gpsd patches. Thanks to Mike
>    Frysinger for pointing the new --enable-pc-files option.
> 
> After this bump, I build tested a large number of the ncurses reverse
> dependencies we have in Buildroot, and they all built fine.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Nack.
The version bump to 5.8 and 5.9 had issues in the past and still has.
It may compile just fine but it segfaults miserably in a target, chroot
or qemu image.
Simple test, i586 target with external toolchain, build less and see.
Regards.
