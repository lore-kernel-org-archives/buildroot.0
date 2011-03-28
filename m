From: Mike Frysinger <vapier@gentoo.org>
Date: Mon, 28 Mar 2011 03:36:46 -0400
Subject: [Buildroot] [PATCH] readline: link directly against ncurses
In-Reply-To: <20110324194745.268213ba@surf>
References: <1300923775-13739-1-git-send-email-vapier@gentoo.org>
	<20110324194745.268213ba@surf>
Message-ID: <AANLkTinDM3AY4iA5gipkrUHEc7EoMO6-VMLOb_NpsVkG@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Mar 24, 2011 at 2:47 PM, Thomas Petazzoni wrote:
> On Wed, 23 Mar 2011 19:42:55 -0400 Mike Frysinger wrote:
>> note: not really tested since external toolchain support is totally
>> broken
>
> Could you elaborate ?

i'm pretty sure i pointed this out around the time it broke.  if you
dont specify the full path, the stupid makefiles prepend garbage.

BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
BR2_TOOLCHAIN_EXTERNAL_PATH=""
BR2_TOOLCHAIN_EXTERNAL_CUSTOM_PREFIX="bfin-uclinux"
BR2_TOOLCHAIN_EXTERNAL_PREFIX="bfin-uclinux"

$ make ncurses
....
checking for bfin-linux-gcc... /bin/bfin-uclinux-gcc
--sysroot=/usr/local/src/buildroot/output/host/usr/bfin-unknown-linux-uclibc/sysroot
-mike
