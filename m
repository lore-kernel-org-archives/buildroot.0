From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 20 Mar 2017 23:56:31 +0100
Subject: [Buildroot] [PATCH v2 2/3] package/ghostscript: new package
In-Reply-To: <20161218205630.17019-2-bernd.kuhls@t-online.de>
References: <20161218205630.17019-1-bernd.kuhls@t-online.de>
 <20161218205630.17019-2-bernd.kuhls@t-online.de>
Message-ID: <20170320235631.0c9daffd@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 18 Dec 2016 21:56:29 +0100, Bernd Kuhls wrote:
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
> v2: Current git HEAD contains patches to simplify cross compiling,
>     committed after the release of ghostscript 9.20. Therefore this
>     commit now uses current git HEAD and shall be bumped to 9.21 once
>     it is released. (Thomas)
>     Currently I am unable to register on bugs.ghostscript.com to send
>     0002-configaux.patch upstream but I will do so later.

Applied to master, after doing the following changes:

    [Thomas:
     - switch to version 9.21 now that it has been released
     - add a hash file
     - switch to Git formatted patches
     - use $(HOSTCC) instead of hardcoding "gcc", and use $(HOST_CFLAGS) and
       $(HOST_LDFLAGS) instead of hardcoding -L$(HOST_DIR)/usr/lib
       -I$(HOST_DIR)/usr/include
     - add entry to DEVELOPERS file.]

The one thing that would be really nice to do in your submissions in a
more systematic fashion is to use Git to format the patches on packages
that use Git as their version control system.

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
