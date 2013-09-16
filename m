From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 16 Sep 2013 20:07:48 +0200
Subject: [Buildroot] [PATCH 1/3] support for cubieboard2 added
In-Reply-To: <1379328727-2577-2-git-send-email-carlos@crqgestion.es>
References: <1379328727-2577-1-git-send-email-carlos@crqgestion.es>
 <1379328727-2577-2-git-send-email-carlos@crqgestion.es>
Message-ID: <20130916200748.267bb602@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Carlos Quijano,

Generally looks good, except:

On Mon, 16 Sep 2013 12:52:05 +0200, Carlos Quijano wrote:
> 
> Signed-off-by: Carlos Quijano <carlos@crqgestion.es>
> ---
>  board/cubietech/cubieboard2/boot.cmd               |    4 +
>  .../cubieboard2/cubieboard2_kernel.config          | 3158 ++++++++++++++++++++

The kernel configuration should be a minimal defconfig, generated with
'make ARCH=arm savedefconfig'. See the size of the kernel configuration
files for the other platforms.

Also, the file should be named just kernel.config, or linux.config, or
linux-<version>.config. Having the name of the board in the filename is
useless since it's already in a directory named after the board.

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
