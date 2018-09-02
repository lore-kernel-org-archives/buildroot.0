From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 2 Sep 2018 09:39:18 +0200
Subject: [Buildroot] [for-next: 1/2] package/make: add host variant
In-Reply-To: <0bf99c93-5726-9b67-cce0-d4f02549f83e@gmail.com>
References: <20180830203054.7373-1-romain.naour@gmail.com>
 <20180901145103.63ea583b@windsurf>
 <0bf99c93-5726-9b67-cce0-d4f02549f83e@gmail.com>
Message-ID: <20180902093918.3cd04d18@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 1 Sep 2018 21:20:36 +0200, Romain Naour wrote:

> From [1]:
> AC_CHECK_PROG_VER(MAKE, gnumake gmake make, --version,
>   [GNU Make[^0-9]*\([0-9][0-9.]*\)],
>   [3.79* | 3.[89]* | [4-9].* | [1-9][0-9]*], critic_missing="$critic_missing make")
> 
> On your host (Fedora) you have a symlink to make named gmake (gmake -> make)
> 
> You can verify that glibc is using gmake instead of make by looking at config.log.
> 
> configure:4672: checking for gnumake
> configure:4702: result: no
> configure:4672: checking for gmake
> configure:4688: found /usr/bin/gmake
> configure:4699: result: gmake
> configure:4714: checking version of gmake
> configure:4724: result: 4.2.1, ok

OK.

> We can verify that glibc build-system is really using gmake:
> ac_cv_prog_MAKE=gmake
> 
> So if we want glibc build system to use the make binary provided by Buildroot we
> must create gnumake and gmake symlink in $(HOST_DIR)/bin when installing host-make.

Or we can pass ac_cv_prog_MAKE=make. But OK, perhaps doing the symlinks
is better.

Thanks for the explanation!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
